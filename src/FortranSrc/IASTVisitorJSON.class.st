Class {
	#name : #IASTVisitorJSON,
	#superclass : #Object,
	#instVars : [
		'f77sourcefile',
		'model'
	],
	#category : #'FortranSrc-Visitor'
}

{ #category : #visiting }
IASTVisitorJSON >> accept: aNode [
	aNode isAssociation ifTrue: [ ^self visitJSONNode: aNode key value: aNode value ].
	aNode isDictionary  ifTrue: [ ^self visitJSONDictionary: aNode ].
	aNode isArray  ifTrue: [ ^self visitJSONArray: aNode ].
]

{ #category : #visiting }
IASTVisitorJSON >> doesNotUnderstand: message [
	(message selector beginsWith: 'visit') ifTrue:  [ |code|
		code := message selector asString , ' aNode
	self flag: #TODO.
	self shouldBeImplemented'.
		IASTVisitorJSON compile: code  classified: 'visiting'
	]. 
]

{ #category : #accessing }
IASTVisitorJSON >> f77sourcefile [

	^ f77sourcefile
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

{ #category : #visiting }
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
IASTVisitorJSON >> model: anObject [

	model := anObject
]

{ #category : #'as yet unclassified' }
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
	
	^rhsNodes isCollection 
	ifTrue:  [ { lhsNode } , rhsNodes ]
	ifFalse: [ { lhsNode . rhsNodes } ]

]

{ #category : #visiting }
IASTVisitorJSON >> visitBase_type: aTypeNode [
	^aTypeNode at: 'base_type'
]

{ #category : #visiting }
IASTVisitorJSON >> visitBinary: aBinaryExpressionNode [
		^{ self accept: (aBinaryExpressionNode at: 'left') .
		   self accept: (aBinaryExpressionNode at: 'right') }
		reject: #isNil
]

{ #category : #visiting }
IASTVisitorJSON >> visitBlock_data: aBlockDataNode [
	^self makeProgramUnitNode: IASTBlockData with: aBlockDataNode
]

{ #category : #visiting }
IASTVisitorJSON >> visitBlocks: aJSONArray [
		^(self visitJSONArray: aJSONArray) flattened
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
	astNode arguments: (arguments collect: [:arg | self accept: (arg at: 'expr')] thenReject: [:arg | arg isNil]).
	^{ astNode }

]

{ #category : #visiting }
IASTVisitorJSON >> visitComment: aCommentNode [
	^IASTComment new
		text: (aCommentNode at: 'comment') ;
		sourceAnchor: (self visitSpanOf: aCommentNode) ;
		yourself
]

{ #category : #visiting }
IASTVisitorJSON >> visitCommon: aCommonNode [
	self flag: #TODO.
	self shouldBeImplemented
]

{ #category : #visiting }
IASTVisitorJSON >> visitData: aDataNode [
	self flag: #TODO.
	self shouldBeImplemented
]

{ #category : #visiting }
IASTVisitorJSON >> visitDeclaration: aDeclarationNode [
	| typeSpec |

	typeSpec := self visitBase_type: (aDeclarationNode at: 'type').

	^((aDeclarationNode at: 'declarators') at: 'list') collect: [ :declarator |
		IASTVariable new
			entityName: (self valueNodeContent: (declarator at: 'variable')) ;
			sourceAnchor: (self visitSpanOf: declarator) ;
			typeSpec: typeSpec ;
			yourself
	].
	
]

{ #category : #visiting }
IASTVisitorJSON >> visitExpr: anExprNode [
	^self accept: (anExprNode at: 'contents')
]

{ #category : #visiting }
IASTVisitorJSON >> visitFunction: aFunctionNode [
	^(self isESOPEFunction: (aFunctionNode at: 'name'))
		ifTrue:  [ self visitFunctionESOPE: aFunctionNode ]
		ifFalse: [ self visitFunctionFortran: aFunctionNode ].

]

{ #category : #visiting }
IASTVisitorJSON >> visitFunctionESOPE: aFunctionNode [
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
IASTVisitorJSON >> visitFunctionFortran: aFunctionNode [
	^(self makeProgramUnitNode: IASTFunction with: aFunctionNode)
		returnType: (self visitBase_type: (aFunctionNode at: 'type')) ;
		parameters: (self visitArguments: (aFunctionNode at: 'arguments')) ;
		yourself
]

{ #category : #visiting }
IASTVisitorJSON >> visitFunction_call: aFunctionCallNode [
	^(self visitCall: aFunctionCallNode) anyOne
]

{ #category : #visiting }
IASTVisitorJSON >> visitJSONArray: aNode [
	^aNode collect: [ :each | self accept: each ]
]

{ #category : #visiting }
IASTVisitorJSON >> visitJSONDictionary: jsonDictionary [
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
	selector := 'visit' , key capitalized , ':'.
	^self perform: selector asSymbol with: aValue 
]

{ #category : #visiting }
IASTVisitorJSON >> visitMain: aMainProgramNode [
	^self makeProgramUnitNode: IASTMainProgram with: aMainProgramNode
]

{ #category : #visiting }
IASTVisitorJSON >> visitMeta: aNode [
		self visitJSONDictionary: aNode
]

{ #category : #visiting }
IASTVisitorJSON >> visitMiFilename: aString [
	f77sourcefile := aString
]

{ #category : #visiting }
IASTVisitorJSON >> visitMiVersion: aNode [
		
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
	| one two three four colon dash aSpanString |
	aSpanString := aNode at: 'span'.

	colon := aSpanString indexOf: $:.
	one := aSpanString copyFrom: 2 to: colon-1.
	
	dash := aSpanString indexOf: $-.
	two := aSpanString copyFrom: colon+1 to: dash-1.
	
	colon := aSpanString indexOf: $: startingAt: dash.
	three := aSpanString copyFrom: dash+1 to: colon-1.
	
	four := aSpanString copyFrom: colon+1 to: aSpanString size-1.
	
	^ IASTIndexedFileAnchor new
		  startLine: one asInteger ;
		  startColumn: two asInteger ;
		  endLine: three asInteger;
		  endColumn: four asInteger + 1;
		  fileName: f77sourcefile;
		  yourself
]

{ #category : #visiting }
IASTVisitorJSON >> visitStatement: aStatementNode [
	^self accept: (aStatementNode at: 'statement')
]

{ #category : #visiting }
IASTVisitorJSON >> visitSubroutine: aSubroutineNode [
	^(self makeProgramUnitNode: IASTSubroutine with: aSubroutineNode)
		parameters: (self visitArguments: (aSubroutineNode at: 'arguments')) ;
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
