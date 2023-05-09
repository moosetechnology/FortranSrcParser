Class {
	#name : #FortranAbstractJsonVisitor,
	#superclass : #Object,
	#category : #'FortranSrc-Visitor'
}

{ #category : #testing }
FortranAbstractJsonVisitor >> isTaggedStatement: aStatementNode [
	^(aStatementNode at: 'statement') includesKey: 'tag'
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitArgument: anArgumentNode [
	"ignore other members for now"

	^self visitJsonMap: anArgumentNode keys: #(span expr)
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitArguments: anArgumentList [
	anArgumentList ifNil: [ ^#() ].
	^(anArgumentList at: 'list') collect: [ :each | self visitArgument: each]
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitAssign_expression: anAssignExpressionNode [
	^self visitJsonMap: anAssignExpressionNode keys: #(target expression)

]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitAssign_expressionStatement: anAssignExpressionNode [
	"assign_expression and assign_expressionStatement are the same"

	^self visitAssign_expression: anAssignExpressionNode

]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitAttributes: aNode [
	^nil
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitBase_type: aString [
	^aString
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitBinary: aBinaryExpressionNode [
	^self visitJsonMap: aBinaryExpressionNode keys: #( span left op right)
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitBlockDataBlocks: aBlockDataBlockList [
	"a BlockData contains a list of 'statement' which are tagged 'common' "
	^aBlockDataBlockList collect: [ :each | self visitJsonElement: each ]
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitBlock_data: aBlockDataNode [
	^(self visitJsonMap: aBlockDataNode keys:  #(span name))
	 ,
	 { self visitBlockDataBlocks: (aBlockDataNode at: 'blocks') }
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitBlocks: aBlockList [
	^self visitJsonArray: aBlockList
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitBody: aNode [
	^self visitJsonElement: aNode
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitCallStatement: aCallStatementNode [

	^self visitJsonMap: aCallStatementNode keys: #(span function arguments)
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitComment: aCommentNode [
	"cannot call visitJsonMap: because contains a key 'comment' that would recursively loop on this method"

	^{self visitSpan: (aCommentNode at: 'span') .
	 aCommentNode at: 'comment'}
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitCommonGroup: aCommonGroupNode [
	^{ self visitSpan: (aCommonGroupNode at: 'span') .
	 self visitCommonGroupName: (aCommonGroupNode at: 'name') .
	 self visitCommonGroupVars: (aCommonGroupNode at: 'vars' at: 'list') }
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitCommonGroupName: aCommonGroupNameNode [
	^{ self visitSpan: (aCommonGroupNameNode at: 'span') .
	 aCommonGroupNameNode at: 'value' at: 'contents' }
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitCommonGroupVars: aCommonGroupVarList [
	^aCommonGroupVarList collect: [ :each | self visitDeclarator: each ]
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitCommonStatement: aCommonStatementNode [
	^self visitJsonMap: aCommonStatementNode keys: #(span common_groups)
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitCommon_groups: aCommonGroupsNode [
	^(aCommonGroupsNode at: 'list') collect: [ :each | self visitCommonGroup: each ]
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitDeclarationStatement: aDeclarationStatementNode [
	"tagged element 'declaration'"

	^self visitJsonMap: aDeclarationStatementNode keys: #(span type attributes declarators)
	
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitDeclarator: aDeclaratorNode [
	"visit method for the last two have special names
	 - 'type' contains a string which is not compatible with #visitType:
	 - 'variable' contains an object with a key 'variable' that would create recursive loop"

	^(self visitJsonMap: aDeclaratorNode keys: #(span initial length))
	 ,
	{ self visitDeclaratorType: (aDeclaratorNode at: 'type') .
	 self visitDeclaratorVariable: (aDeclaratorNode at: 'variable') }
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitDeclaratorType: aString [
	^aString 
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitDeclaratorVariable: aDeclaratorVariableNode [
	"vist span and value content"
	^{self visitSpan: (aDeclaratorVariableNode at: 'span') .
	 self visitDeclaratorVariableContent: (aDeclaratorVariableNode at: 'value' at: 'contents') }
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitDeclaratorVariableContent: aString [
	^aString
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitDeclarators: aDeclaratorsList [
	"visit span and list of declarators"

	^{self visitSpan: (aDeclaratorsList at: 'span') .
	 (aDeclaratorsList at: 'list') collect: [:decl | self visitDeclarator: decl ] }
	
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitDo: aDoNode [
	^self visitJsonMap: aDoNode keys: #(span do_spec body)
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitDo_spec: aDoSpecNode [
	^self visitJsonMap: aDoSpecNode keys: #(span initial limit increment)
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitExpr: anExprNode [
	^self visitJsonElement: (anExprNode at: 'contents')
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitExpression: aExpressionNode [
	^self visitJsonElement: aExpressionNode
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitFormat: aFormatNode [
	^nil
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitFunction: aFunctionNode [
	^(aFunctionNode includesKey: 'blocks')
	 ifTrue: [ self visitFunctionWithBlocks: aFunctionNode ]
	 ifFalse: [ self visitFunctionAsValue: aFunctionNode ]

]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitFunctionAsValue: aFunctionNode [
	^{self visitSpan: (aFunctionNode at: 'span') .
	 self visitFunctionCalledName: (aFunctionNode at: 'value' at: 'contents') }
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitFunctionCalledName: aString [
	^aString
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitFunctionStatement: aFunctionStatementNode [
	"'name' is an object, not a string so, cannot call #visitName: on it"
	^{ self visitSpan: (aFunctionStatementNode at: 'span') .
	 self visitJsonElement: (aFunctionStatementNode at: 'name') .
	 self visitArguments: (aFunctionStatementNode at: 'arguments') .
	 self visitBody: (aFunctionStatementNode at: 'body') }
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitFunctionWithBlocks: aFunctionNode [
	^self visitJsonMap: aFunctionNode keys: #(span name type arguments blocks) "result subprograms"
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitFunction_call: aFunctionCallNode [

	^self visitCallStatement: aFunctionCallNode
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitIf: aIfNode [
	^self visitJsonMap: aIfNode keys: #(span conditions blocks)
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitImplicitStatement: anImpliciteStatementNode [
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitIncrement: anIncrementNode [
	^self visitJsonElement: anIncrementNode
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitInitial: anInitialNode [
	^self visitJsonElement: anInitialNode
]

{ #category : #'visiting - reflectivity' }
FortranAbstractJsonVisitor >> visitJsonArray: aNode [
	^aNode collect: [ :each | self visitJsonElement: each ]
]

{ #category : #'visiting - reflectivity' }
FortranAbstractJsonVisitor >> visitJsonElement: aNode [
	aNode ifNil: [ ^nil ].
	aNode isDictionary  ifTrue: [ ^self visitJsonMap: aNode ].
	aNode isArray  ifTrue: [ ^self visitJsonArray: aNode ].
]

{ #category : #'visiting - reflectivity' }
FortranAbstractJsonVisitor >> visitJsonMap: jsonDictionary [
	"If dicionary contains key 'tag', performs a visit of the whole node for this tag,
	otherwise, perform a visit of each value for their key
	'anno' key always ignored"

	jsonDictionary removeKey: 'anno' ifAbsent: [ "nothing" ].

	^(jsonDictionary includesKey: 'tag')
	 ifTrue: [ self visitJsonTaggedElement: jsonDictionary ]
	 ifFalse: [ jsonDictionary associations
		collect: [ :assoc | self visitJsonNode: assoc key value: assoc value ]
	 ]

]

{ #category : #'visiting - reflectivity' }
FortranAbstractJsonVisitor >> visitJsonMap: jsonDictionary keys: aCollection [
	"visit only the keys listed in aCollection in the jsonDictionary"

	^aCollection collect: [ :key | self visitJsonNode: key value: (jsonDictionary at: key) ]

]

{ #category : #'visiting - reflectivity' }
FortranAbstractJsonVisitor >> visitJsonNode: key value: aValue [
	| selector |
	selector := 'visit' , key capitalized , ':'.
	^self perform: selector asSymbol with: aValue 
]

{ #category : #'visiting - reflectivity' }
FortranAbstractJsonVisitor >> visitJsonTaggedElement: jsonDictionary [
	"similar to #visitJsonNode: , but removes first the 'tag' key from the JsonDisctionary
	 so that it is not visited again"
	| key |
	key := jsonDictionary removeKey: 'tag'.
	^self visitJsonNode: key value: jsonDictionary
]

{ #category : #'visiting - reflectivity' }
FortranAbstractJsonVisitor >> visitJsonTaggedStatement: aStatementNode [
	"a statementNode containing a tagged element
	 Similar to #visitJsonTaggedElement: on the tagged element, but adds 'Statement' to the selector"
	| key value |
	value := (aStatementNode at: 'statement').
	key := value removeKey: 'tag'.
	^self visitJsonNode: key , 'Statement' value: value
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitLabel: aNode [
	^nil
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitLength: aNode [
	^nil
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitLimit: aLimitNode [
	^self visitJsonElement: aLimitNode
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitList: aListNode [
	^self visitJsonElement: aListNode
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitMain: aProgramNode [
	^self visitJsonMap: aProgramNode keys: #(span name blocks subprograms)
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitMeta: aMetaNode [
	^self visitJsonMap: aMetaNode keys: #(miVersion miFilename)
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitMiFilename: aString [
	^aString
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitMiVersion: aString [
	^aString
		
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitName: aString [
	^aString
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitProgramFile: aProgramFileNode [
	^self visitJsonElement: aProgramFileNode
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitProgram_units: aNode [
	^self visitJsonArray: aNode
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitSelector: anObject [
	^nil
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitSpan: aSpanString [
	"converts aSpanString (1:2)-(3:4) into two points {1@2 . 3@4}"

	| one two three four colon dash |
	colon := aSpanString indexOf: $:.
	one := aSpanString copyFrom: 2 to: colon-1.
	
	dash := aSpanString indexOf: $-.
	two := aSpanString copyFrom: colon+1 to: dash-2.
	
	colon := aSpanString indexOf: $: startingAt: dash.
	three := aSpanString copyFrom: dash+2 to: colon-1.
	
	four := aSpanString copyFrom: colon+1 to: aSpanString size-1.
	
	^ {one asInteger @ two asInteger .
		three asInteger @ (four asInteger + 1) }
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitStatement: aStatementNode [
	^(self visitJsonMap: aStatementNode keys: #(span label))
	 ,
		((self isTaggedStatement: aStatementNode)
			ifTrue: [ self visitJsonTaggedStatement: aStatementNode ]
			ifFalse: [ self visitJsonElement: (aStatementNode at: 'statement') ])
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitSubprograms: aNode [
	^nil
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitSubroutine: aSubroutineNode [
	^self visitJsonMap: aSubroutineNode keys: #(span name arguments blocks)
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitTarget: aTargetNode [
	^self visitJsonElement: aTargetNode
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitType: aTypeNode [
	^self visitJsonElement: aTypeNode
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitUnary: aUnaryNode [
	^self visitJsonElement: (aUnaryNode at: 'expression')
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitWriteStatement: aWriteStatementNode [
	^self visitJsonMap: aWriteStatementNode keys: #(span format arguments)
]
