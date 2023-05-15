Class {
	#name : #JsonToIASTVisitor,
	#superclass : #FortranAbstractJsonVisitor,
	#instVars : [
		'f77sourcefile',
		'model'
	],
	#category : #'FortranSrc-Visitor'
}

{ #category : #'private - parsing' }
JsonToIASTVisitor >> astJSON: sourceCode [
	FortranProjectImporter new
		astJSON: sourceCode
]

{ #category : #accessing }
JsonToIASTVisitor >> f77sourcefile [
	^f77sourcefile
]

{ #category : #'private - parsing' }
JsonToIASTVisitor >> fortranSrcPath [

	^ 'fortran-src-extras'
]

{ #category : #initialization }
JsonToIASTVisitor >> initialize [
	super initialize.
	model := OrderedCollection new.
]

{ #category : #testing }
JsonToIASTVisitor >> isESOPEFunction: aString [
	aString isString ifFalse: [ ^false ].

	^#(esoat esoar esosl) includes: aString
]

{ #category : #'private - utilities' }
JsonToIASTVisitor >> makeIndexedAnchor: aPointPair [
	^IASTIndexedFileAnchor new
		  startLine: aPointPair first x ;
		  startColumn: aPointPair first y ;
		  endLine: aPointPair second x ;
		  endColumn: aPointPair second y ;
		  fileName: f77sourcefile;
		  yourself
]

{ #category : #accessing }
JsonToIASTVisitor >> model [
	^ model
]

{ #category : #accessing }
JsonToIASTVisitor >> model: aCollection [
	model := aCollection
]

{ #category : #visiting }
JsonToIASTVisitor >> visitArgument: anArgumentNode [
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
JsonToIASTVisitor >> visitArguments: anArgumentList [
	^(super visitArguments: anArgumentList)
		reject: #isNil
]

{ #category : #visiting }
JsonToIASTVisitor >> visitAssign_expression: anAssignExpressionNode [
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
JsonToIASTVisitor >> visitBinary: aBinaryExpressionNode [
	| data |
	data := super visitBinary: aBinaryExpressionNode.
	^{ data second . data fourth }
		reject: #isNil
]

{ #category : #visiting }
JsonToIASTVisitor >> visitBlock_data: aBlockDataNode [
	| data |
	data := super visitBlock_data: aBlockDataNode.
	^IASTBlockData new
		sourceAnchor: data first ;
		entityName: data second ;
		body: data third ;
		yourself
]

{ #category : #visiting }
JsonToIASTVisitor >> visitCallStatement: aCallNode [
	| astNode data |
	
	data := super visitCallStatement: aCallNode.

	astNode := (self isESOPEFunction: data second)
		ifTrue:  [ IASTVarEso newFrom: data second ]
		ifFalse: [ IASTInvocation new entityName: data second ; yourself ].

	^{ astNode
			sourceAnchor: (self makeIndexedAnchor: data first) ;
			arguments: data third ;
			yourself }

]

{ #category : #'private - parsing' }
JsonToIASTVisitor >> visitCode: aString [
	self astJSON: aString.
	^'./fortran77.f.json' asFileReference readStreamDo: [ :st |
			self visitProgramFile: (NeoJSONReader fromString: st contents) ]
]

{ #category : #visiting }
JsonToIASTVisitor >> visitComment: aCommentNode [
	| data |
	data := super visitComment: aCommentNode.
	^IASTComment new
		sourceAnchor: (self makeIndexedAnchor: data first) ;
		text: data second ;
		yourself
]

{ #category : #visiting }
JsonToIASTVisitor >> visitCommonGroup: aCommonGroupNode [
	| data |
	data := self visitCommonGroupName: (aCommonGroupNode at: 'name').
	^IASTVariable new
		sourceAnchor: (self makeIndexedAnchor: data first) ;
		entityName: (data second) ;
		yourself
]

{ #category : #visiting }
JsonToIASTVisitor >> visitCommonStatement: aCommonStatementNode [
	^self visitCommon_groups: (aCommonStatementNode at: 'common_groups')
]

{ #category : #visiting }
JsonToIASTVisitor >> visitData: aDataNode [
	self flag: #TODO.
	self shouldBeImplemented
]

{ #category : #visiting }
JsonToIASTVisitor >> visitDeclarationStatement: aDeclarationStatementNode [
	| data |

	data := super visitDeclarationStatement: aDeclarationStatementNode.
	data fourth do: [ :iastVar | iastVar typeSpec: data second ].
	^data fourth
	
]

{ #category : #visiting }
JsonToIASTVisitor >> visitDeclarator: aDeclaratorNode [
	^self visitDeclaratorVariable: (aDeclaratorNode at: 'variable')
]

{ #category : #visiting }
JsonToIASTVisitor >> visitDeclaratorVariable: aDeclaratorVariableNode [
	| data |
	data := super visitDeclaratorVariable: aDeclaratorVariableNode.
	^IASTVariable new
		sourceAnchor: (self makeIndexedAnchor: data first) ;
		entityName: data second ;
		yourself
	
	
]

{ #category : #visiting }
JsonToIASTVisitor >> visitDeclarators: aDeclaratorsList [
	^(super visitDeclarators: aDeclaratorsList) second
]

{ #category : #visiting }
JsonToIASTVisitor >> visitDo: aDoNode [
	| data |
	data := (super visitDo: aDoNode).
	^data second , data third
	 
]

{ #category : #visiting }
JsonToIASTVisitor >> visitDo_spec: aDoSpecNode [
	| data |
	data := (super visitDo_spec: aDoSpecNode).
	^data allButFirst flattened reject: #isNil
	 
]

{ #category : #visiting }
JsonToIASTVisitor >> visitFunctionAsValue: aFunctionNode [
	^(super visitFunctionAsValue: aFunctionNode)
		second

]

{ #category : #visiting }
JsonToIASTVisitor >> visitFunctionStatement: aFunctionNode [
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
JsonToIASTVisitor >> visitFunctionWithBlocks: aFunctionNode [
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
JsonToIASTVisitor >> visitIf: aIfNode [
	| data |
	data := super visitIf: aIfNode.

	^(data allButFirst: 2) flattened reject: #isNil
]

{ #category : #visiting }
JsonToIASTVisitor >> visitInteger: anIntegerNode [
	^nil
]

{ #category : #visiting }
JsonToIASTVisitor >> visitMain: aMainProgramNode [
 	| data |
	data := super visitMain: aMainProgramNode.

	^IASTMainProgram new
		sourceAnchor: (self makeIndexedAnchor: data first) ;
		entityName: data second ;
		body: data third ;
		yourself

]

{ #category : #visiting }
JsonToIASTVisitor >> visitMiFilename: aString [
	f77sourcefile := aString
]

{ #category : #visiting }
JsonToIASTVisitor >> visitProgramFile: aProgramFileNode [
	| programFile data |
	data := super visitProgramFile: aProgramFileNode.

	programFile := IASTProgramFile new
		filename: self f77sourcefile ;
		progUnits: data second ;
		yourself.
	self model add: programFile.
	^ programFile
		
]

{ #category : #visiting }
JsonToIASTVisitor >> visitReal: aRealNode [
	^nil
]

{ #category : #visiting }
JsonToIASTVisitor >> visitSpanOf: aNode [
	^self makeIndexedAnchor: (self visitSpan: (aNode at: 'span'))
]

{ #category : #visiting }
JsonToIASTVisitor >> visitStatement: aStatementNode [
	"not interested in 'span' and 'label'
	so overwrite completely the super method"
	^(self isTaggedStatement: aStatementNode)
			ifTrue: [ self visitJsonTaggedStatement: aStatementNode ]
			ifFalse: [ self visitJsonElement: (aStatementNode at: 'statement') ]
]

{ #category : #visiting }
JsonToIASTVisitor >> visitSubroutine: aSubroutineNode [
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
JsonToIASTVisitor >> visitType: aTypeNode [
	| data |
	data := (super visitType: aTypeNode) reject: #isNil.

	^IASTTypeRef new
		sourceAnchor: (self makeIndexedAnchor: data first) ;
		entityName: (data second) ;
		yourself
]

{ #category : #visiting }
JsonToIASTVisitor >> visitUnary: aUnaryNode [
	| data |
	data := super visitUnary: aUnaryNode.

	^data third ifNil: [ nil ] ifNotNil: #yourself
]

{ #category : #visiting }
JsonToIASTVisitor >> visitValue: aValueNode [
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
JsonToIASTVisitor >> visitVariable: aVariableNode [
	| data |
	data := super visitVariable: aVariableNode.

	^IASTVarAccess new
		isWrite: false ;
		entityName: data ;
		yourself
]

{ #category : #visiting }
JsonToIASTVisitor >> visitWriteStatement: aWriteStatementNode [
	| data |
	data := super visitWriteStatement: aWriteStatementNode.
	self flag: #FIXME. "Write is not an invocation"

	^{ IASTInvocation new
		sourceAnchor: (self makeIndexedAnchor: data first) ;
		entityName: 'write' ;
		arguments: data third ;
		yourself }
]
