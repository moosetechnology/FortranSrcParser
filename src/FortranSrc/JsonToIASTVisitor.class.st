"
A visitor for JSON output of camfor/fortran-src to build an intermediary representation
"
Class {
	#name : #JsonToIASTVisitor,
	#superclass : #FortranAbstractJsonVisitor,
	#instVars : [
		'f77sourcefile',
		'model',
		'entityStack'
	],
	#category : #'FortranSrc-Visitor'
}

{ #category : #'private - parsing' }
JsonToIASTVisitor >> astJSON: sourceCode [
	FortranProjectImporter new
		astJSON: sourceCode
]

{ #category : #accessing }
JsonToIASTVisitor >> currentEsopeSegment [
	^entityStack top isEsopeSegment
		ifTrue: [ entityStack top ]
		ifFalse: [ nil ]
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
	entityStack := Stack new
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

{ #category : #'visiting expression' }
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

{ #category : #'visiting expression' }
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

{ #category : #'visiting statement' }
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

{ #category : #visiting }
JsonToIASTVisitor >> visitCode: aString [
	self astJSON: aString.
	^'./fortran77.f.json' asFileReference readStreamDo: [ :st |
			self visitProgramFile: (NeoJSONReader fromString: st contents) ]
]

{ #category : #'visiting statement' }
JsonToIASTVisitor >> visitCommonGroup: aCommonGroupNode [
	| data |
	data := self visitCommonGroupName: (aCommonGroupNode at: 'name').
	^IASTVariable new
		sourceAnchor: (self makeIndexedAnchor: data first) ;
		entityName: (data second) ;
		yourself
]

{ #category : #'visiting statement' }
JsonToIASTVisitor >> visitCommonStatement: aCommonStatementNode [
	^self visitCommon_groups: (aCommonStatementNode at: 'common_groups')
]

{ #category : #visiting }
JsonToIASTVisitor >> visitData: aDataNode [
	self flag: #TODO.
	self shouldBeImplemented
]

{ #category : #'visiting statement' }
JsonToIASTVisitor >> visitDeclarationStatement: aDeclarationStatementNode [
	| data |

	data := super visitDeclarationStatement: aDeclarationStatementNode.
	data fourth do: [ :iastVar | iastVar typeSpec: data second ].
	
	^entityStack
		ifNotEmpty: [
			entityStack top addAllDeclarations: data fourth.
			nil
		]
		ifEmpty: [ nil ]

]

{ #category : #'visiting statement' }
JsonToIASTVisitor >> visitDeclarator: aDeclaratorNode [
	^self visitDeclaratorVariable: (aDeclaratorNode at: 'variable')
]

{ #category : #'visiting statement' }
JsonToIASTVisitor >> visitDeclaratorVariable: aDeclaratorVariableNode [
	| data |
	data := super visitDeclaratorVariable: aDeclaratorVariableNode.

	^IASTVariable new
		sourceAnchor: (self makeIndexedAnchor: data first) ;
		entityName: data second ;
		yourself
	
	
]

{ #category : #'visiting statement' }
JsonToIASTVisitor >> visitDeclarators: aDeclaratorsList [
	^(super visitDeclarators: aDeclaratorsList) second
]

{ #category : #'visiting statement' }
JsonToIASTVisitor >> visitDo: aDoNode [
	| data |
	data := (super visitDo: aDoNode).
	^data second , data third
	 
]

{ #category : #'visiting statement' }
JsonToIASTVisitor >> visitDo_spec: aDoSpecNode [
	| data |
	data := (super visitDo_spec: aDoSpecNode).
	^data allButFirst flattened reject: #isNil
	 
]

{ #category : #'visiting esope' }
JsonToIASTVisitor >> visitEsopeEndsegmentComment: anEsopeCommentNode [
	"updates end of current Esope segment"
	| span |
	span := (super visitEsopeEndsegmentComment: anEsopeCommentNode) first.

	entityStack pop sourceAnchor
		endLine: (span second x) ;
		endColumn: (span second y).
	^nil
]

{ #category : #'visiting esope' }
JsonToIASTVisitor >> visitEsopeSegmentComment: anEsopeCommentNode [
	"Source anchor for the segment is wrong,
	 endLine/endColumn will be updated in #visitEsopeEndsegmentComment:"
	| data seg |
	data := super visitEsopeSegmentComment: anEsopeCommentNode.
	seg := IASTEsopeSegment new
		sourceAnchor: (self makeIndexedAnchor: data first) ;
		entityName: data third ;
		declarations: (OrderedCollection new: 5) ;
		yourself.

	entityStack push: seg.
	^seg
]

{ #category : #'visiting statement' }
JsonToIASTVisitor >> visitFortranComment: aFortranCommentNode [
	| data |
	data := super visitFortranComment: aFortranCommentNode.
	^IASTComment new
		sourceAnchor: (self makeIndexedAnchor: data first) ;
		text: data second ;
		yourself
]

{ #category : #'visiting expression' }
JsonToIASTVisitor >> visitFunctionAsValue: aFunctionNode [
	^(super visitFunctionAsValue: aFunctionNode)
		second

]

{ #category : #'visiting statement' }
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

{ #category : #'visiting statement' }
JsonToIASTVisitor >> visitIf: aIfNode [
	| data |
	data := super visitIf: aIfNode.

	^(data allButFirst: 2) flattened reject: #isNil
]

{ #category : #'visiting expression' }
JsonToIASTVisitor >> visitInteger: anIntegerNode [
	^nil
]

{ #category : #'visiting reflectivity' }
JsonToIASTVisitor >> visitJsonArray: aNode [
	^(super visitJsonArray: aNode)
		reject: #isNil
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

{ #category : #'visiting expression' }
JsonToIASTVisitor >> visitReal: aRealNode [
	^nil
]

{ #category : #visiting }
JsonToIASTVisitor >> visitSpanOf: aNode [
	^self makeIndexedAnchor: (self visitSpan: (aNode at: 'span'))
]

{ #category : #'visiting statement' }
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

{ #category : #'visiting expression' }
JsonToIASTVisitor >> visitUnary: aUnaryNode [
	| data |
	data := super visitUnary: aUnaryNode.

	^data third ifNil: [ nil ] ifNotNil: #yourself
]

{ #category : #'visiting expression' }
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

{ #category : #'visiting expression' }
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
