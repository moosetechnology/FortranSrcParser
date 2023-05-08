Class {
	#name : #IASTVisitorJSON,
	#superclass : #FortranAbstractJsonVisitor,
	#instVars : [
		'f77sourcefile',
		'model'
	],
	#category : #'FortranSrc-Visitor'
}

{ #category : #'reflective operations' }
IASTVisitorJSON >> accept: aNode [
	aNode ifNil: [ ^nil ].
	aNode isAssociation ifTrue: [ ^self visitJSONNode: aNode key value: aNode value ].
	aNode isDictionary  ifTrue: [ ^self visitJSONDictionary: aNode ].
	aNode isArray  ifTrue: [ ^self visitJSONArray: aNode ].
]

{ #category : #'private - parsing' }
IASTVisitorJSON >> astJSON: sourceCode [

	| filename option |
	option := 'serialize -t json -v77l encode'.
	"option := ''."
	filename := './fortran77.f'.
	filename asFileReference writeStreamDo: [ :stream | 
		stream truncate.
		stream
		<< (sourceCode copy replaceAll: Character cr with: Character lf) ].

	LibC runCommand: ('{1} {2} "{3}" > "{3}.ast" 2> "{3}.err"' format: { 
				 self fortranSrcPath.
				 option.
				 filename. })
]

{ #category : #'reflective operations' }
IASTVisitorJSON >> doesNotUnderstand: message [

	| code |
	(message selector beginsWith: 'visit') ifFalse: [ ^ self ].
	code := message selector asString , ' aNode
	self flag: #TODO.
	self shouldBeImplemented'.
	self class compile: code classified: 'visiting'
]

{ #category : #accessing }
IASTVisitorJSON >> f77sourcefile [
	^f77sourcefile
]

{ #category : #'private - parsing' }
IASTVisitorJSON >> fortranSrcPath [

	^ '/home/anquetil/.cabal/bin/fortran-src-extras'
]

{ #category : #initialization }
IASTVisitorJSON >> initialize [
	super initialize.
	model := OrderedCollection new.
]

{ #category : #testing }
IASTVisitorJSON >> isESOPEFunction: aNode [
	aNode isString ifTrue: [ ^false ].

	^#(esoat esoar esosl) includes: (self valueNodeContent: aNode)
]

{ #category : #'private - utilities' }
IASTVisitorJSON >> makeIndexedAnchor: aPointPair [
	^IASTIndexedFileAnchor new
		  startLine: aPointPair first x ;
		  startColumn: aPointPair first y ;
		  endLine: aPointPair second x ;
		  endColumn: aPointPair second y ;
		  fileName: f77sourcefile;
		  yourself
]

{ #category : #'private - utilities' }
IASTVisitorJSON >> makeProgramUnitNode: aIASTClass with: aProgramUnitNode [
	^aIASTClass new
		entityName: (aProgramUnitNode at: 'name') ;
		sourceAnchor: (self visitSpanOf: aProgramUnitNode) ;
		body: (self visitBlocks: (aProgramUnitNode at: 'blocks')) ;
		yourself

]

{ #category : #accessing }
IASTVisitorJSON >> model [
	^ model
]

{ #category : #accessing }
IASTVisitorJSON >> model: aCollection [
	model := aCollection
]

{ #category : #'private - utilities' }
IASTVisitorJSON >> valueNodeContent: aValueNode [
	^((aValueNode at: 'value') at: 'contents')
]

{ #category : #testing }
IASTVisitorJSON >> valueNodeIsVariable: aValueNode [
	^((aValueNode at: 'value') at: 'tag') = 'variable'
]

{ #category : #visiting }
IASTVisitorJSON >> visitArguments: anArgumentsNode [
	anArgumentsNode ifNil: [ ^#() ].
	^(self visitJSONArray: (anArgumentsNode at: 'list')) collect: [ :varAcces |
		IASTParameter new
			entityName: varAcces entityName ;
			sourceAnchor: varAcces sourceAnchor ;
			yourself
	]
]

{ #category : #visiting }
IASTVisitorJSON >> visitAssign_expression: anAssignExpressionNode [
	| lhsNode rhsNodes |
	lhsNode := self accept: (anAssignExpressionNode at: 'target').
	lhsNode isWrite: true.
	
	rhsNodes := self accept: (anAssignExpressionNode at: 'expression').

	^(rhsNodes isCollection 
		ifTrue:  [ { lhsNode } , rhsNodes ]
		ifFalse: [ { lhsNode . rhsNodes } ]
	 ) reject: #isNil

]

{ #category : #visiting }
IASTVisitorJSON >> visitBinary: aBinaryExpressionNode [
	^{ 
		self accept: (aBinaryExpressionNode at: 'left') .
		self accept: (aBinaryExpressionNode at: 'right') 
	 } reject: #isNil
]

{ #category : #visiting }
IASTVisitorJSON >> visitBlock_data: aBlockDataNode [
	| data |
	data := super visitBlock_data: aBlockDataNode.
	^IASTBlockData new
		sourceAnchor: data first ;
		entityName: data second ;
		body: data third ;
		yourself
]

{ #category : #visiting }
IASTVisitorJSON >> visitCall: aCallNode [
	"used for call statements (and cannot be an ESOPE function),
	 and Function_call statement (and can be an ESOPE function)"
	| astNode arguments |
	
	astNode := (self isESOPEFunction: (aCallNode at: 'function'))
		ifTrue:  [ IASTVarEso newFrom: (self valueNodeContent: (aCallNode at: 'function')) ]
		ifFalse: [ IASTInvocation new
			entityName:  (self valueNodeContent: (aCallNode at: 'function')) ;
			yourself.
		].

	astNode sourceAnchor: (self visitSpanOf: aCallNode).
	arguments := (aCallNode at: 'arguments') at: 'list'.
	astNode arguments: (arguments collect: [:arg | self accept: (arg at: 'expr')] thenReject: #isNil).
	^{ astNode }

]

{ #category : #'private - parsing' }
IASTVisitorJSON >> visitCode: aString [
	self astJSON: aString.
	^'./fortran77.f.ast' asFileReference readStreamDo: [ :st |
			self visitProgramFile: (NeoJSONReader fromString: st contents) ]
]

{ #category : #visiting }
IASTVisitorJSON >> visitComment: aCommentNode [
	| data |
	data := super visitComment: aCommentNode.
	^IASTComment new
		sourceAnchor: (self makeIndexedAnchor: data first) ;
		text: data second ;
		yourself
]

{ #category : #visiting }
IASTVisitorJSON >> visitCommon: aNode [
	self flag: #TODO.
	self shouldBeImplemented
]

{ #category : #visiting }
IASTVisitorJSON >> visitCommonGroup: aCommonGroupNode [
	| data |
	data := self visitCommonGroupName: (aCommonGroupNode at: 'name').
	^IASTVariable new
		sourceAnchor: (self makeIndexedAnchor: data first) ;
		entityName: (data second) ;
		yourself
]

{ #category : #visiting }
IASTVisitorJSON >> visitCommonStatement: aCommonStatementNode [
	^self visitCommon_groups: (aCommonStatementNode at: 'common_groups')
]

{ #category : #visiting }
IASTVisitorJSON >> visitData: aDataNode [
	self flag: #TODO.
	self shouldBeImplemented
]

{ #category : #visiting }
IASTVisitorJSON >> visitDeclarationStatement: aDeclarationStatementNode [
	| data |

	data := super visitDeclarationStatement: aDeclarationStatementNode.
	data fourth do: [ :iastVar | iastVar typeSpec: data second ].
	^data fourth
	
]

{ #category : #visiting }
IASTVisitorJSON >> visitDeclarator: aDeclaratorNode [
	^self visitDeclaratorVariable: (aDeclaratorNode at: 'variable')
]

{ #category : #visiting }
IASTVisitorJSON >> visitDeclaratorVariable: aDeclaratorVariableNode [
	| data |
	data := super visitDeclaratorVariable: aDeclaratorVariableNode.
	^IASTVariable new
		sourceAnchor: (self makeIndexedAnchor: data first) ;
		entityName: data second ;
		yourself
	
	
]

{ #category : #visiting }
IASTVisitorJSON >> visitDeclarators: aDeclaratorsList [
	^(super visitDeclarators: aDeclaratorsList) second
]

{ #category : #visiting }
IASTVisitorJSON >> visitDo: aDoNode [
	^{ 
		self accept: ((aDoNode at: 'do_spec') at: 'initial' ).
		self accept: ((aDoNode at: 'do_spec') at: 'limit' ).
		self accept: ((aDoNode at: 'do_spec') at: 'increment' ).
		self accept: (aDoNode at: 'body')
	 } reject: #isNil.
]

{ #category : #visiting }
IASTVisitorJSON >> visitExpr: anExprNode [
	^self accept: (anExprNode at: 'contents')
]

{ #category : #visiting }
IASTVisitorJSON >> visitFunctionWithBlocks: aFunctionNode [
	^(self makeProgramUnitNode: IASTFunction with: aFunctionNode)
		returnType: (self visitType: (aFunctionNode at: 'type')) ;
		parameters: (self visitArguments: (aFunctionNode at: 'arguments')) ;
		yourself
]

{ #category : #visiting }
IASTVisitorJSON >> visitFunctionWithBody: aFunctionNode [
	| astRhsNode astLhsNode arguments |

	astLhsNode := IASTVarEso newFrom: (self valueNodeContent: (aFunctionNode at: 'name')).
	astLhsNode sourceAnchor: (self visitSpanOf: aFunctionNode).
	astLhsNode isWrite: true.

	arguments := (aFunctionNode at: 'arguments') at: 'list'.
	astLhsNode entities: (arguments collect: [:arg | self accept: arg] thenReject: #isNil).

	astRhsNode := self accept: (aFunctionNode at: 'body').

	^astRhsNode ifNil: [ { astLhsNode } ] ifNotNil: [ { astLhsNode . astRhsNode } ]
]

{ #category : #visiting }
IASTVisitorJSON >> visitFunction_call: aFunctionCallNode [
	^(self visitCall: aFunctionCallNode) anyOne
]

{ #category : #visiting }
IASTVisitorJSON >> visitIf: aIfNode [
	^{
		self accept: (aIfNode at: 'conditions').
		self accept: (aIfNode at: 'blocks') 
	 } reject: #isNil
]

{ #category : #visiting }
IASTVisitorJSON >> visitJSONArray: aNode [
self flag: #REMOVE.
	^aNode collect: [ :each | self accept: each ]
]

{ #category : #visiting }
IASTVisitorJSON >> visitJSONDictionary: jsonDictionary [
self flag: #REMOVE.
	^jsonDictionary
		at: 'tag'
		ifPresent: [ :key | self visitJSONNode: key value: jsonDictionary ]
		ifAbsent: [ 	jsonDictionary keysAndValuesDo: [ :key :value |
			self visitJSONNode: key value: value ]
		]

]

{ #category : #visiting }
IASTVisitorJSON >> visitJSONNode: key value: aValue [
	| selector |
self flag: #REMOVE.
	selector := 'visit' , key capitalized , ':'.
	^self perform: selector asSymbol with: aValue 
]

{ #category : #visiting }
IASTVisitorJSON >> visitList: aNode [
	self flag: #TODO.
	self shouldBeImplemented
]

{ #category : #visiting }
IASTVisitorJSON >> visitMain: aMainProgramNode [
	^self makeProgramUnitNode: IASTMainProgram with: aMainProgramNode
]

{ #category : #visiting }
IASTVisitorJSON >> visitMiFilename: aString [
	f77sourcefile := aString
]

{ #category : #visiting }
IASTVisitorJSON >> visitProgramFile: aProgramFileNode [
	| programFile |
	self visitMeta: (aProgramFileNode at: 'meta').
	programFile := IASTProgramFile new
		filename: self f77sourcefile ;
		progUnits: (self visitProgram_units: (aProgramFileNode at: 'program_units')) ;
		yourself.
	self model add: programFile.
	^ programFile
		
]

{ #category : #visiting }
IASTVisitorJSON >> visitProgram_units: aNode [
	^self visitJSONArray: aNode
]

{ #category : #visiting }
IASTVisitorJSON >> visitSpanOf: aNode [
	^self makeIndexedAnchor: (self visitSpan: (aNode at: 'span'))
]

{ #category : #visiting }
IASTVisitorJSON >> visitStatement: aStatementNode [
	^(super visitStatement: aStatementNode) third
]

{ #category : #visiting }
IASTVisitorJSON >> visitSubroutine: aSubroutineNode [
	^(self makeProgramUnitNode: IASTSubroutine with: aSubroutineNode)
		parameters: (self visitArguments: (aSubroutineNode at: 'arguments')) ;
		yourself

]

{ #category : #visiting }
IASTVisitorJSON >> visitType: aTypeNode [
	| data |
	data := (super visitType: aTypeNode) reject: #isNil.

	^IASTTypeRef new
		sourceAnchor: (self makeIndexedAnchor: data first) ;
		entityName: (data second) ;
		yourself
]

{ #category : #visiting }
IASTVisitorJSON >> visitUnary: aUnaryNode [
	^{ self accept: (aUnaryNode at: 'expression') } reject: #isNil
]

{ #category : #visiting }
IASTVisitorJSON >> visitValue: aValueNode [
	^(self valueNodeIsVariable: aValueNode)
		ifTrue: [ IASTVarAccess new
			isWrite: false ;
			entityName: (self valueNodeContent: aValueNode) ;
			sourceAnchor: (self visitSpanOf: aValueNode) ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
IASTVisitorJSON >> visitWrite: aWriteNode [
	self flag: #TODO. "take care of 'format' also"
	^self accept: ((aWriteNode at: 'arguments') at: 'list')
]
