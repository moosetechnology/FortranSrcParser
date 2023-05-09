Class {
	#name : #IASTVisitorJSON,
	#superclass : #FortranAbstractJsonVisitor,
	#instVars : [
		'f77sourcefile',
		'model'
	],
	#category : #'FortranSrc-Visitor'
}

{ #category : #'private - parsing' }
IASTVisitorJSON >> astJSON: sourceCode [
	FortranProjectImporter new
		astJSON: sourceCode
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
IASTVisitorJSON >> isESOPEFunction: aString [
	aString isString ifFalse: [ ^false ].

	^#(esoat esoar esosl) includes: aString
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

{ #category : #accessing }
IASTVisitorJSON >> model [
	^ model
]

{ #category : #accessing }
IASTVisitorJSON >> model: aCollection [
	model := aCollection
]

{ #category : #visiting }
IASTVisitorJSON >> visitArgument: anArgumentNode [
	"used for argument in subprogram calls and parameter in subprogram definition"

	| data arg |
	data := super visitArgument: anArgumentNode.
	data isCollection ifFalse: [ ^data ].
	data ifEmpty: [ ^nil ].
 
	arg := (data size = 1) ifTrue: [ data first ] ifFalse: [ data second ].
	arg ifNil: [ ^nil ].

	(arg class = IASTVarAccess)
		ifTrue: [ arg := IASTParameter new
			entityName: arg entityName ;
			sourceAnchor: arg sourceAnchor ;
			yourself ].

	^arg
]

{ #category : #visiting }
IASTVisitorJSON >> visitArguments: anArgumentList [
	^(super visitArguments: anArgumentList)
		reject: #isNil
]

{ #category : #visiting }
IASTVisitorJSON >> visitAssign_expression: anAssignExpressionNode [
	| data |
	data := super visitAssign_expression: anAssignExpressionNode.

	data first isWrite: true.
	^(data second isCollection 
		ifTrue:  [ { data first } , data second ]
		ifFalse: [ { data first . data second } ]
	 )
	 reject: #isNil.

]

{ #category : #visiting }
IASTVisitorJSON >> visitBinary: aBinaryExpressionNode [
	| data |
	data := super visitBinary: aBinaryExpressionNode.
	^{ data second . data fourth }
		reject: #isNil
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
IASTVisitorJSON >> visitCallStatement: aCallNode [
	| astNode data |
	
	data := super visitCallStatement: aCallNode.

	astNode := (self isESOPEFunction: data second entityName)
		ifTrue:  [ IASTVarEso newFrom: data second entityName ]
		ifFalse: [ data second ].

	^{ astNode
			sourceAnchor: (self makeIndexedAnchor: data first) ;
			arguments: data third ;
			yourself }

]

{ #category : #'private - parsing' }
IASTVisitorJSON >> visitCode: aString [
	self astJSON: aString.
	^'./fortran77.f.json' asFileReference readStreamDo: [ :st |
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
	| data |
	data := (super visitDo: aDoNode).
	^data second , data third
	 
]

{ #category : #visiting }
IASTVisitorJSON >> visitDo_spec: aDoSpecNode [
	| data |
	data := (super visitDo_spec: aDoSpecNode).
	^data allButFirst flattened reject: #isNil
	 
]

{ #category : #visiting }
IASTVisitorJSON >> visitFunctionAsValue: aFunctionNode [
	| data |

	data := super visitFunctionAsValue: aFunctionNode.
	^IASTInvocation new
		entityName:  data second ;
		yourself
]

{ #category : #visiting }
IASTVisitorJSON >> visitFunctionStatement: aFunctionNode [
	"for now assuming this is an ESOat/ar/sl function"
	| data esoFct |
	data := super visitFunctionStatement: aFunctionNode.
	
	esoFct := (IASTVarEso newFrom: data second entityName)
		sourceAnchor: (self makeIndexedAnchor: data first) ;
		isWrite: true ;
		entities: (data third reject: #isNil) ;
		yourself.

	^data fourth
		ifNil: [ { esoFct } ]
		ifNotNil: [ { esoFct . data fourth } ]
]

{ #category : #visiting }
IASTVisitorJSON >> visitFunctionWithBlocks: aFunctionNode [
	| data |
	data := super visitFunctionWithBlocks: aFunctionNode.
	^IASTFunction new
		sourceAnchor: (self makeIndexedAnchor: data first) ;
		entityName: data second ;
		returnType: data third ;
		parameters: data fourth ;
		body: data fifth ;
		yourself

]

{ #category : #visiting }
IASTVisitorJSON >> visitIf: aIfNode [
	| data |
	data := super visitIf: aIfNode.

	^(data allButFirst: 2) flattened reject: #isNil
]

{ #category : #visiting }
IASTVisitorJSON >> visitInteger: anIntegerNode [
	^nil
]

{ #category : #visiting }
IASTVisitorJSON >> visitMain: aMainProgramNode [
 	| data |
	data := super visitMain: aMainProgramNode.

	^IASTMainProgram new
		sourceAnchor: (self makeIndexedAnchor: data first) ;
		entityName: data second ;
		body: data third ;
		yourself

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
IASTVisitorJSON >> visitReal: aRealNode [
	^nil
]

{ #category : #visiting }
IASTVisitorJSON >> visitSpanOf: aNode [
	^self makeIndexedAnchor: (self visitSpan: (aNode at: 'span'))
]

{ #category : #visiting }
IASTVisitorJSON >> visitStatement: aStatementNode [
	^(super visitStatement: aStatementNode) allButFirst: 2
]

{ #category : #visiting }
IASTVisitorJSON >> visitSubroutine: aSubroutineNode [
	| data |
	data := super visitSubroutine: aSubroutineNode.

	^IASTSubroutine new
		sourceAnchor: (self makeIndexedAnchor: data first) ;
		entityName: data second ;
		parameters: data third ;
		body: data fourth ;
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
	| data |
	data := super visitUnary: aUnaryNode.

	^data third ifNil: [ nil ] ifNotNil: #yourself
]

{ #category : #visiting }
IASTVisitorJSON >> visitValue: aValueNode [
	| data |

	data := super visitValue: aValueNode.

	^data second
		ifNil: [ nil ]
		ifNotNil: [ :var |
			var
				sourceAnchor: (self makeIndexedAnchor: data first) ;
				yourself ]
]

{ #category : #visiting }
IASTVisitorJSON >> visitVariable: aVariableNode [
	| data |
	data := super visitVariable: aVariableNode.

	^IASTVarAccess new
		isWrite: false ;
		entityName: data ;
		yourself
]

{ #category : #visiting }
IASTVisitorJSON >> visitWriteStatement: aWriteStatementNode [
	| data |
	data := super visitWriteStatement: aWriteStatementNode.

	^{ IASTInvocation new
		sourceAnchor: (self makeIndexedAnchor: data first) ;
		entityName: 'write' ;
		arguments: data third ;
		yourself }
]
