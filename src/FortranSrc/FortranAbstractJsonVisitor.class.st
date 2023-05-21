"
An abstrat visitor for the JSON output of camfor/fortran-src
Defines all the needed `#visitXYZ:` methods and go to the JSON tree
"
Class {
	#name : #FortranAbstractJsonVisitor,
	#superclass : #Object,
	#category : #'FortranSrc-Visitor'
}

{ #category : #'private - helpers' }
FortranAbstractJsonVisitor >> esopeCommand: anEsopeCommentString [
	"first word after cESO marker is the 'command', after come the 'argument'"

	| i inWord indices |
	indices := OrderedCollection new: 6.
	i := 1.
	inWord := false.

	anEsopeCommentString do: [ :char |
		"for now, treat . as a letter: lb.pstr"
		(char isLetter or: [ char = $. ])
		ifTrue: [
			inWord ifFalse:[ "begining of a word"
				indices add: i.
				inWord := true
			]
		]
		ifFalse: [
			inWord ifTrue: [ "end of a word"
				indices add: i - 1.
				inWord := false
			]
		].
		i := i+1
	].
	indices add: i-1.

	^(indices size > 4)
		ifTrue: [
			{ (anEsopeCommentString copyFrom: indices third to: indices fourth) .
			  (anEsopeCommentString copyFrom: indices fifth to: indices sixth) }
		]
		ifFalse: [ { anEsopeCommentString copyFrom: indices third to: indices fourth } ]
]

{ #category : #testing }
FortranAbstractJsonVisitor >> isEsopeComment: aCommentString [
	^aCommentString asLowercase beginsWith: 'eso' 
]

{ #category : #testing }
FortranAbstractJsonVisitor >> isTaggedStatement: aStatementNode [
	^(aStatementNode at: 'statement') includesKey: 'tag'
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitAddition: anAdditionOperatorNode [
	^'addition'
]

{ #category : #'visiting prog-unit' }
FortranAbstractJsonVisitor >> visitArgument: anArgumentNode [
	"used for argument in subprogram calls and parameter in subprogram definition
	 So can take many different forms :-("

	^(anArgumentNode includesKey: 'tag')
		ifTrue: [ self visitJsonTaggedElement: anArgumentNode ]
		ifFalse: [ self visitJsonMap: anArgumentNode keys: #(span expr) ]
]

{ #category : #'visiting prog-unit' }
FortranAbstractJsonVisitor >> visitArguments: anArgumentList [
	anArgumentList ifNil: [ ^#() ].
	^(anArgumentList at: 'list') collect: [ :each | self visitArgument: each]
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitAssign_expression: anAssignExpressionNode [
	^self visitJsonMap: anAssignExpressionNode keys: #(target expression)

]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitAssign_expressionStatement: anAssignExpressionNode [
	"assign_expression and assign_expressionStatement are the same"

	^self visitAssign_expression: anAssignExpressionNode

]

{ #category : #'visiting prog-unit' }
FortranAbstractJsonVisitor >> visitAttributes: aNode [

	^nil
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitBase_type: aString [
	"to offer the possibility to handle each baseType differently, we create #visitXYZBaseType: methods"

	^self visitJsonNode: (aString , 'BaseType') value: aString

]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitBinary: aBinaryExpressionNode [
	^self visitJsonMap: aBinaryExpressionNode keys: #( span left op right)
]

{ #category : #'visiting prog-unit' }
FortranAbstractJsonVisitor >> visitBlockDataBlocks: aBlockDataBlockList [
	"a BlockData contains a list of 'statement' which are tagged 'common' "
	^aBlockDataBlockList collect: [ :each | self visitJsonElement: each ]
]

{ #category : #'visiting prog-unit' }
FortranAbstractJsonVisitor >> visitBlock_data: aBlockDataNode [
	^(self visitJsonMap: aBlockDataNode keys:  #(span name))
	 ,
	 { self visitBlockDataBlocks: (aBlockDataNode at: 'blocks') }
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitBlocks: aBlockList [
	aBlockList ifNil: [ ^#() ].
	^self visitJsonArray: aBlockList
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitBody: aNode [
	^self visitJsonElement: aNode
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitCallStatement: aCallStatementNode [

	^self visitJsonMap: aCallStatementNode keys: #(span function arguments)
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitCharacterBaseType: aString [
	^aString

]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitComment: aCommentNode [
	"Separates comments that are genuine fortran comments and the one that contain Esope commands"
	| content |
	content := aCommentNode at: 'comment'.

	^(self isEsopeComment: content)
		ifTrue: [  self visitEsopeComment: aCommentNode ]
		ifFalse: [ self visitFortranComment: aCommentNode ]
	
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitCommonGroup: aCommonGroupNode [
	^{ self visitSpan: (aCommonGroupNode at: 'span') .
	 self visitCommonGroupName: (aCommonGroupNode at: 'name') .
	 self visitCommonGroupVars: (aCommonGroupNode at: 'vars' at: 'list') }
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitCommonGroupName: aCommonGroupNameNode [
	^{ self visitSpan: (aCommonGroupNameNode at: 'span') .
	 aCommonGroupNameNode at: 'value' at: 'contents' }
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitCommonGroupVars: aCommonGroupVarList [
	^aCommonGroupVarList collect: [ :each | self visitDeclarator: each ]
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitCommonStatement: aCommonStatementNode [
	^self visitJsonMap: aCommonStatementNode keys: #(span common_groups)
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitCommon_groups: aCommonGroupsNode [
	^(aCommonGroupsNode at: 'list') collect: [ :each | self visitCommonGroup: each ]
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitConditions: aConditionList [
	^aConditionList collect: [ :aCondition |
		{ self visitIfCondition: aCondition first .
	     self visitThenPart: aCondition second } ]
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitDeclarationStatement: aDeclarationStatementNode [
	"tagged element 'declaration'"

	^self visitJsonMap: aDeclarationStatementNode keys: #(span type attributes declarators)
	
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitDeclarator: aDeclaratorNode [
	"visit method for the last two have special names
	 - 'type' contains a string which is not compatible with #visitType:
	 - 'variable' contains an object with a key 'variable' that would create recursive loop"

	^(self visitJsonMap: aDeclaratorNode keys: #(span initial length))
	 ,
	{ self visitDeclaratorType: (aDeclaratorNode at: 'type') .
	 self visitDeclaratorVariable: (aDeclaratorNode at: 'variable') }
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitDeclaratorType: aString [
	^aString 
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitDeclaratorVariable: aDeclaratorVariableNode [
	"vist span and value content"
	^{self visitSpan: (aDeclaratorVariableNode at: 'span') .
	 self visitDeclaratorVariableContent: (aDeclaratorVariableNode at: 'value' at: 'contents') }
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitDeclaratorVariableContent: aString [
	^aString
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitDeclarators: aDeclaratorsList [
	"visit span and list of declarators"

	^{self visitSpan: (aDeclaratorsList at: 'span') .
	 (aDeclaratorsList at: 'list') collect: [:decl | self visitDeclarator: decl ] }
	
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitDivision: aDivisionOperatorNode [
	^'division'
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitDo: aDoNode [
	^self visitJsonMap: aDoNode keys: #(span do_spec body)
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitDo_spec: aDoSpecNode [
	^self visitJsonMap: aDoSpecNode keys: #(span initial limit increment)
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitEq: anEqualtoOperatorNode [
	^'eq'
]

{ #category : #'visiting reflectivity' }
FortranAbstractJsonVisitor >> visitEsopeComment: anEsopeCommentNode [
	| key esopeCommand |
	esopeCommand := self esopeCommand: (anEsopeCommentNode at: 'comment').
	key := 'Esope' ,
		(esopeCommand first asLowercase capitalized) ,
		'Comment'.
	^self visitJsonNode: key value: anEsopeCommentNode
]

{ #category : #'visiting esope' }
FortranAbstractJsonVisitor >> visitEsopeEndComment: anEsopeCommentNode [
	^self visitEsopeEndsegmentComment: anEsopeCommentNode 
]

{ #category : #'visiting esope' }
FortranAbstractJsonVisitor >> visitEsopeEndsegmentComment: anEsopeCommentNode [
	| esopeCommand |
	esopeCommand := self esopeCommand: (anEsopeCommentNode at: 'comment').
	^{ self visitSpan: (anEsopeCommentNode at: 'span') .
	  esopeCommand first } 

]

{ #category : #'visiting esope' }
FortranAbstractJsonVisitor >> visitEsopePointeurComment: anEsopeCommentNode [
	| esopeCommand |
	esopeCommand := self esopeCommand: (anEsopeCommentNode at: 'comment').
	^{ self visitSpan: (anEsopeCommentNode at: 'span') .
	  esopeCommand first .
	  esopeCommand second } 

]

{ #category : #'visiting esope' }
FortranAbstractJsonVisitor >> visitEsopeSegactComment: anEsopeCommentNode [
	| esopeCommand |
	esopeCommand := self esopeCommand: (anEsopeCommentNode at: 'comment').
	^{ self visitSpan: (anEsopeCommentNode at: 'span') .
	  esopeCommand first .
	  esopeCommand second } 

]

{ #category : #'visiting esope' }
FortranAbstractJsonVisitor >> visitEsopeSegadjComment: anEsopeCommentNode [
	| esopeCommand |
	esopeCommand := self esopeCommand: (anEsopeCommentNode at: 'comment').
	^{ self visitSpan: (anEsopeCommentNode at: 'span') .
	  esopeCommand first .
	  esopeCommand second } 

]

{ #category : #'visiting esope' }
FortranAbstractJsonVisitor >> visitEsopeSegdefComment: anEsopeCommentNode [
	| esopeCommand |
	esopeCommand := self esopeCommand: (anEsopeCommentNode at: 'comment').
	^{ self visitSpan: (anEsopeCommentNode at: 'span') .
	  esopeCommand first .
	  esopeCommand second } 

]

{ #category : #'visiting esope' }
FortranAbstractJsonVisitor >> visitEsopeSegdesComment: anEsopeCommentNode [
	| esopeCommand |
	esopeCommand := self esopeCommand: (anEsopeCommentNode at: 'comment').
	^{ self visitSpan: (anEsopeCommentNode at: 'span') .
	  esopeCommand first .
	  esopeCommand second } 

]

{ #category : #'visiting esope' }
FortranAbstractJsonVisitor >> visitEsopeSeginiComment: anEsopeCommentNode [
	| esopeCommand |
	esopeCommand := self esopeCommand: (anEsopeCommentNode at: 'comment').
	^{ self visitSpan: (anEsopeCommentNode at: 'span') .
	  esopeCommand first .
	  esopeCommand second } 

]

{ #category : #'visiting esope' }
FortranAbstractJsonVisitor >> visitEsopeSegmentComment: anEsopeCommentNode [
	| esopeCommand |
	esopeCommand := self esopeCommand: (anEsopeCommentNode at: 'comment').
	^{ self visitSpan: (anEsopeCommentNode at: 'span') .
	  esopeCommand first .
	  esopeCommand second } 

]

{ #category : #'visiting esope' }
FortranAbstractJsonVisitor >> visitEsopeSegsupComment: anEsopeCommentNode [
	| esopeCommand |
	esopeCommand := self esopeCommand: (anEsopeCommentNode at: 'comment').
	^{ self visitSpan: (anEsopeCommentNode at: 'span') .
	  esopeCommand first .
	  esopeCommand second } 

]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitExitStatement: anExitNode [
	self flag: #TODO.
	^nil
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitExponent: aRealLiteralExponentNode [
	self flag: #TODO.
	^nil
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitExponentiation: aExponentiationOperatorNode [
	^'exponentiation'
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitExpr: anExprNode [
	"Typically a node contains a key 'expr' with value a dictionary containing a tag 'expr'
	 therefore a 1st #visitExpr: will end up calling a 2nd #visitExpr:
	 the 1st executes #ifTrue:, the 2nd executes #ifFalse:"
	^(anExprNode includesKey: 'tag')
		ifTrue: [ self visitJsonTaggedElement: anExprNode ]
		ifFalse: [ self visitJsonElement: (anExprNode at: 'contents') ]
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitExpression: aExpressionNode [
	^self visitJsonElement: aExpressionNode
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitExternalStatement: anExternalStatementNode [
	^self visitJsonMap: anExternalStatementNode keys: #(span vars)
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitFalseLiteralValue: aString [
	^aString
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitFormat: aFormatNode [
	^{ self visitSpan: (aFormatNode at: 'span') .
	  (aFormatNode at: 'list') collect: [ :each | self visitFormatArgument: each ] }
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitFormatArgument: aFormatArgumentNode [
	^self visitArgument: aFormatArgumentNode
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitFortranComment: aFortranCommentNode [
	"A reaf Fortran comment as opposed to a comment that contains an Esope command
	cannot call visitJsonMap: because contains a key 'comment' that would recursively loop on this method"

	^{ self visitSpan: (aFortranCommentNode at: 'span') .
	  aFortranCommentNode at: 'comment' }
	
]

{ #category : #'visiting prog-unit' }
FortranAbstractJsonVisitor >> visitFunction: aFunctionNode [
	^(aFunctionNode includesKey: 'blocks')
	 ifTrue: [ self visitFunctionWithBlocks: aFunctionNode ]
	 ifFalse: [ self visitFunctionAsValue: aFunctionNode ]

]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitFunctionAsValue: aFunctionNode [

	^{self visitSpan: (aFunctionNode at: 'span') .
	 self visitFunctionCalledName: (aFunctionNode at: 'value' at: 'contents') }
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitFunctionCalledName: aString [
	^aString
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitFunctionStatement: aFunctionStatementNode [
	"'name' is an object, not a string so, cannot call #visitName: on it"
	^{ self visitSpan: (aFunctionStatementNode at: 'span') .
	 self visitJsonElement: (aFunctionStatementNode at: 'name') }
	,
	(self visitJsonMap: aFunctionStatementNode keys:  #(arguments body))
]

{ #category : #'visiting prog-unit' }
FortranAbstractJsonVisitor >> visitFunctionWithBlocks: aFunctionNode [
	^self visitJsonMap: aFunctionNode keys: #(span name type arguments blocks) "result subprograms"
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitFunction_call: aFunctionCallNode [

	^self visitCallStatement: aFunctionCallNode
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitGotoStatement: aGotoStatementNode [

	"so far only unconditional case is processed"
	self flag: #TODO.
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitGt: aGreaterthanOperatorNode [
	^'gt'
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitIf: anIfNode [
	"The THEN-Part is in 'conditions', the ELSE-PART in 'blocks', if no ELSE-PART, then 'blocks' is nil'
	 ignoring key: end_label"

	^self visitJsonMap: anIfNode keys: #(span label conditions blocks)

]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitIfCondition: anIfConditionNode [
	^self visitJsonElement: anIfConditionNode
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitImplicitStatement: anImplicitstatementNode [
	
	^self visitJsonMap: anImplicitstatementNode keys:  #(span items)
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitIncrement: anIncrementNode [
	^self visitJsonElement: anIncrementNode
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitIndex: anArrayIndexNode [

	^self visitJsonElement: anArrayIndexNode

]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitIndices: anArrayIndicesNode [
	^self visitJsonArray: (anArrayIndicesNode at: 'list')

]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitInitial: anInitialNode [
	^self visitJsonElement: anInitialNode
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitInteger: anIntegerNode [
	"to be more explicit, Integer nodes are 'transformed' in IntegerLiteralValue nodes"
	^self visitIntegerLiteralValue: (anIntegerNode at: 'contents')
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitIntegerBaseType: aString [
	^aString

]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitIntegerLiteralValue: anIntegerLiteralValueNode [
	^anIntegerLiteralValueNode first
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitItems: anImplicitItemsNode [
	"'items' in implicit statement"

	^anImplicitItemsNode
		ifNil: [ nil ]
		ifNotNil: [ self notYetImplemented ]

]

{ #category : #'visiting reflectivity' }
FortranAbstractJsonVisitor >> visitJsonArray: aNode [
	^aNode collect: [ :each | self visitJsonElement: each ]
]

{ #category : #'visiting reflectivity' }
FortranAbstractJsonVisitor >> visitJsonElement: aNode [
	aNode ifNil: [ ^nil ].
	aNode isDictionary  ifTrue: [ ^self visitJsonMap: aNode ].
	aNode isArray  ifTrue: [ ^self visitJsonArray: aNode ].
]

{ #category : #'visiting reflectivity' }
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

{ #category : #'visiting reflectivity' }
FortranAbstractJsonVisitor >> visitJsonMap: jsonDictionary keys: aCollection [
	"visit only the keys listed in aCollection in the jsonDictionary"

	^aCollection collect: [ :key | self visitJsonNode: key value: (jsonDictionary at: key) ]

]

{ #category : #'visiting reflectivity' }
FortranAbstractJsonVisitor >> visitJsonNode: key value: aValue [
	| selector |
	selector := ('visit' , key capitalized , ':') asSymbol.
	^self perform: selector with: aValue .

]

{ #category : #'visiting reflectivity' }
FortranAbstractJsonVisitor >> visitJsonTaggedElement: jsonDictionary [
	"similar to #visitJsonNode: , but removes first the 'tag' key from the JsonDisctionary
	 so that it is not visited again (not sure this is needed ...?)"
	| key |
	key := jsonDictionary removeKey: 'tag'.
	^self visitJsonNode: key value: jsonDictionary
]

{ #category : #'visiting reflectivity' }
FortranAbstractJsonVisitor >> visitJsonTaggedStatement: aStatementNode [
	"a statementNode containing a tagged element
	 Similar to #visitJsonTaggedElement: on the tagged element, but adds 'Statement' to the selector"
	| key value |
	value := (aStatementNode at: 'statement').
	key := value removeKey: 'tag'.
	^self visitJsonNode: key , 'Statement' value: value
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitLabel: aLabelNode [
	^self visitJsonElement: aLabelNode
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitLeft: aLeftNode [
	^self visitJsonElement: aLeftNode
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitLength: aNode [
	^nil
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitLimit: aLimitNode [
	^self visitJsonElement: aLimitNode
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitList: aListNode [
	^self visitJsonElement: aListNode
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitLogical: aLogicalNode [
	"to be more explicit, Logical nodes are 'transformed' in LogicalLiteralValue nodes"
	^self visitLogicalLiteralValue: (aLogicalNode at: 'contents')
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitLogicalBaseType: aString [
	^aString

]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitLogicalLiteralValue: aString [
	"to be more explicit, we create #visitTrueLiteralValue: and #visitFalseLiteralValue:"
	^(aString = 'true')
		ifTrue: [ self visitTrueLiteralValue: aString ]
		ifFalse: [ self visitFalseLiteralValue: aString ]
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitLt: aLessthanOperatorNode [
	^'lt'
]

{ #category : #'visiting prog-unit' }
FortranAbstractJsonVisitor >> visitMain: aMainProgramNode [
	^self visitJsonMap: aMainProgramNode keys: #(span name blocks subprograms)
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitMessage: aStopMessageNode [
	^self visitJsonElement: aStopMessageNode 
]

{ #category : #'visiting prog-unit' }
FortranAbstractJsonVisitor >> visitMeta: aMetaNode [
	^self visitJsonMap: aMetaNode keys: #(miVersion miFilename)
]

{ #category : #'visiting prog-unit' }
FortranAbstractJsonVisitor >> visitMiFilename: aString [
	^aString
]

{ #category : #'visiting prog-unit' }
FortranAbstractJsonVisitor >> visitMiVersion: aString [
	^aString
		
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitMinus: aMinusOperatorNode [
	"unary minus"
	^'minus'
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitMultiplication: aMultiplicationOperatorNode [
	^'multiplication'
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitName: aString [
	^aString
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitOp: anOpNode [
	"should be a dictionnary with a 'tag' key and a string for value: 'multiplication', 'addition', ..."
	^self visitJsonTaggedElement: anOpNode
]

{ #category : #'visiting prog-unit' }
FortranAbstractJsonVisitor >> visitProgramFile: aProgramFileNode [
	^self visitJsonMap: aProgramFileNode keys: #(meta program_units)
]

{ #category : #'visiting prog-unit' }
FortranAbstractJsonVisitor >> visitProgram_units: aNode [
	^self visitJsonArray: aNode
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitReal: aRealNode [
	"to be more explicit, Real nodes are 'transformed' in RealLiteralValue nodes"
	^self visitRealLiteralValue: (aRealNode at: 'contents')
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitRealBaseType: aString [
	^aString

]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitRealLiteralValue: aRealLiteralValueNode [
	^self visitJsonMap: aRealLiteralValueNode first keys: #(exponent significand)
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitReturnStatement: aReturnStatementNode [
	^self visitJsonMap: aReturnStatementNode keys: #(span target)
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitReturn_spec: aReturn_specNode [
	^self visitJsonMap: aReturn_specNode keys: #(span target)
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitRight: aRightNode [
	^self visitJsonElement: aRightNode
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitSelector: anObject [
	^nil
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitSignificand: aRealLiteralSignificandNode [
	^aRealLiteralSignificandNode
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitSingle: anArraySingleIndexNode [
	^self visitJsonMap: anArraySingleIndexNode keys: #(span index)

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
FortranAbstractJsonVisitor >> visitStar: aStarNode [
	^nil
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitStatement: aStatementNode [
	^(self visitJsonMap: aStatementNode keys: #(span label))
	 ,
	{ ((self isTaggedStatement: aStatementNode)
			ifTrue: [ self visitJsonTaggedStatement: aStatementNode ]
			ifFalse: [ self visitJsonElement: (aStatementNode at: 'statement') ]) }
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitStopStatement: aStopStatementNode [
	^self visitJsonMap: aStopStatementNode keys: #(span message)
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitString: aStringLiteralNode [
	"to be more explicit, String nodes are 'transformed' in StringLiteralValue nodes"
	^self visitStringLiteralValue: aStringLiteralNode
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitStringLiteralValue: aStringLiteralNode [
	^aStringLiteralNode at: 'contents'
]

{ #category : #'visiting prog-unit' }
FortranAbstractJsonVisitor >> visitSubprograms: aNode [
	^nil
]

{ #category : #'visiting prog-unit' }
FortranAbstractJsonVisitor >> visitSubroutine: aSubroutineNode [
	^self visitJsonMap: aSubroutineNode keys: #(span name arguments blocks)
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitSubscript: aSubscriptNode [

	^self visitJsonMap: aSubscriptNode keys: #(span expression indices)

]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitSubtraction: aSubtractionOperatorNode [
	^'subtraction'
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitTarget: aTargetNode [
	^self visitJsonElement: aTargetNode
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitThenPart: aThenPartNode [
	^self visitJsonElement: aThenPartNode
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitTrueLiteralValue: aString [
	^aString
]

{ #category : #visiting }
FortranAbstractJsonVisitor >> visitType: aTypeNode [

	self flag: 'need to consider "selector", for example for lenght of character type'.
	^self visitJsonMap: aTypeNode keys: #(span base_type)
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitUnary: aUnaryNode [
	^self visitJsonMap: aUnaryNode keys: #(span op expression)
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitValue: aValueNode [
	^{ self visitSpan: (aValueNode at: 'span') .
	 self visitJsonTaggedElement: (aValueNode at: 'value') }
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitVariable: aVariableNode [
	^self visitVariableName: (aVariableNode at: 'contents')
]

{ #category : #'visiting expression' }
FortranAbstractJsonVisitor >> visitVariableName: aString [
	^aString
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitVars: anExternalStatementVarList [
	"ignoring 'span' here"

	^self visitJsonArray: (anExternalStatementVarList at: 'list')
]

{ #category : #'visiting statement' }
FortranAbstractJsonVisitor >> visitWriteStatement: aWriteStatementNode [
	^self visitJsonMap: aWriteStatementNode keys: #(span format arguments)
]
