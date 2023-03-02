Class {
	#name : #PP2FortranSrcGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'any',
		'programFile',
		'metaInfo',
		'miVersion',
		'miFilename',
		'miParameters',
		'programUnit',
		'puMain',
		'puModule',
		'puSubroutine',
		'puFunction',
		'puBlockData',
		'puComment',
		'srcSpan',
		'prefixSuffix',
		'position',
		'tkNothing',
		'tkString',
		'tkNumber',
		'tkIdentifier',
		'tkComma',
		'emptyTuple',
		'expression',
		'expValue',
		'value',
		'block',
		'blComment',
		'comment',
		'blStatement',
		'statement',
		'impList',
		'typeSpec',
		'impElement',
		'impCharacter',
		'impRange',
		'baseType',
		'selector',
		'stDeclaration',
		'attribute',
		'declarator',
		'dimensionDeclarator',
		'intent',
		'declaratorType',
		'commonGroup',
		'valInteger',
		'ixSingle',
		'ixRange',
		'expSubscript',
		'index',
		'expBinary',
		'expUnary',
		'unaryOp',
		'binaryOp',
		'stExpressionAssign',
		'stCall',
		'argument',
		'argumentExpression',
		'blDo',
		'doSpecification',
		'expFunctionCall',
		'blIf',
		'lastPos',
		'stIfLogical',
		'forallHeader',
		'blForAll',
		'blCase',
		'blDoWhile',
		'blAssociate',
		'haskellListOfString',
		'maybeOfString',
		'valLogical',
		'stFunction',
		'stPrint',
		'valStar',
		'stExternal',
		'stWrite',
		'controlPair',
		'stExit',
		'stFormatBogus',
		'stStop',
		'stData',
		'dataGroup',
		'justAListNewOfExpression',
		'impElementNew',
		'nonEmptyList',
		'ifElseIfClause'
	],
	#category : #'FortranSrc-Parser'
}

{ #category : #accessing }
PP2FortranSrcGrammar class >> ignoredNames [

	^super ignoredNames , #(lastPos)
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> aList: aRule [

	^ (self prelude: 'AList')
	, (self haskellList: aRule)
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> aListNew: aRule [

	^ (self token: 'AList')
	, (self token: '{')
	, (self prefixed: emptyTuple by:  'alistAnno =') , tkComma
	, (self prefixed: srcSpan by:  'alistSpan =') , tkComma
	, (self prefixed: (self haskellList: aRule) by: 'alistList = ')
	, (self token: '}')
]

{ #category : #token }
PP2FortranSrcGrammar >> any [

	^ #any asPParser token trim

]

{ #category : #'grammar-statement' }
PP2FortranSrcGrammar >> argument [

	^ (self token: 'Argument')
	, (self token: '{')
	, (self prefixed: emptyTuple by:  'argumentAnno =') , tkComma
	, (self prefixed: srcSpan by:  'argumentSpan =') , tkComma
	, (self prefixed: (self maybe: tkString) by: 'argumentName =') , tkComma
	, (self prefixed: argumentExpression by: 'argumentExpr =')
	, (self token: '}')
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> argumentExpression [

	^ ((self token: 'ArgExpr') , (self parens: expression))
	/ ((self prelude: 'ArgExprVar') , tkString)
]

{ #category : #grammar }
PP2FortranSrcGrammar >> attribute [

	^ (self prelude: 'AttrAllocatable')
	/ (self prelude: 'AttrAsynchronous')
	/ (self prelude: 'AttrDimension' aList: dimensionDeclarator)
	/ (self prelude: 'AttrExternal')
	/ ((self prelude: 'AttrIntent') , intent)
	/ (self prelude: 'AttrIntrinsic')
	/ (self prelude: 'AttrOptional')
	/ (self prelude: 'AttrParameter')
	/ (self prelude: 'AttrPointer')
	/ (self prelude: 'AttrPrivate')
	/ (self prelude: 'AttrProtected')
	/ (self prelude: 'AttrPublic')
	/ (self prelude: 'AttrSave')
	/ ((self prelude: 'AttrSuffix') , tkNothing)
	/ (self prelude: 'AttrTarget')
	/ (self prelude: 'AttrValue')
	/ (self prelude: 'AttrVolatile')
]

{ #category : #'grammar-declaration' }
PP2FortranSrcGrammar >> baseType [

	^ (self token: 'TypeInteger')
  	/ (self token: 'TypeReal')
  	/ (self token: 'TypeDoublePrecision')
  	/ (self token: 'TypeComplex')
  	/ (self token: 'TypeDoubleComplex')
  	/ (self token: 'TypeLogical')
  	/ (self token: 'TypeCharacter')
  	/ ((self token: 'TypeCustom') , tkString)
  	/ (self token: 'ClassStar')
  	/ ((self token: 'ClassCustom') , tkString)
  	/ (self token: 'TypeByte')
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> binaryOp [

	^ (self token: 'Addition')
  	/ (self token: 'Subtraction')
  	/ (self token: 'Multiplication')
  	/ (self token: 'Division')
  	/ (self token: 'Exponentiation')
  	/ (self token: 'Concatenation')
  	/ (self token: 'GTE')
  	/ (self token: 'GT')
  	/ (self token: 'LTE')
  	/ (self token: 'LT')
  	/ (self token: 'EQ')
  	/ (self token: 'NE')
  	/ (self token: 'Or')
  	/ (self token: 'XOr')
  	/ (self token: 'And')
  	/ (self token: 'Equivalent')
  	/ (self token: 'NotEquivalent')
  	/ ((self token: 'BinCustom') , tkString)
]

{ #category : #'grammar-block' }
PP2FortranSrcGrammar >> blAssociate [

	^ (self prelude: 'BlAssociate')
	, (self maybe: expression)
	, (self maybe: tkString)
	", (self maybe: expression)" "Commit: "
	, (self justAList: (self justATuple: expression and: expression))
	, (self haskellList: block)
	, (self maybe: expression)
]

{ #category : #'grammar-block' }
PP2FortranSrcGrammar >> blCase [

	^ (self prelude: 'BlCase')
	, (self maybe: expression)
	, (self maybe: tkString)
	, (self parens: expression)
	, (self maybe: (self parens: (self aList: index)))
	, (self haskellList: (self haskellList: block))
	, (self maybe: expression)
]

{ #category : #'grammar-block' }
PP2FortranSrcGrammar >> blComment [

	^ (self prelude: 'BlComment')
	, comment
]

{ #category : #'grammar-block' }
PP2FortranSrcGrammar >> blDo [

	^ (self prelude: 'BlDo')
	, (self maybe: expression)
	, (self maybe: tkString)
	, (self maybe: expression)
	, (self maybe: doSpecification)
	, (self haskellList: block)
	, (self maybe: expression)
]

{ #category : #'grammar-block' }
PP2FortranSrcGrammar >> blDoWhile [

	^ (self prelude: 'BlDoWhile')
	, (self maybe: expression)
	, (self maybe: tkString)
	, (self maybe: expression)
	, (self parens: expression)
	, (self haskellList: block)
	, (self maybe: expression)
]

{ #category : #'grammar-block' }
PP2FortranSrcGrammar >> blForAll [

	^ (self prelude: 'BlForall')
	, (self maybe: expression)
	, (self maybe: tkString)
	, (self parens: forallHeader)
	, (self haskellList: block)
	, (self maybe: expression)
]

{ #category : #'grammar-block' }
PP2FortranSrcGrammar >> blIf [
	
	"https://github.com/camfort/fortran-src/blob/416ce763fd9cde24415b1eee2e5ee7966ae0045c/src/Language/Fortran/AST.hs#L342"

	^ (self prelude: 'BlIf')
	, (self maybe: expression)
	, (self maybe: tkString)
	, (self parens: 
						ifElseIfClause
					 , (self token: ':|') ":| -> It is the constructor for a non-empty list"
					 , (self haskellList: ifElseIfClause)
	  )
	, (self maybe: (self haskellList: block))
	, (self maybe: expression)
]

{ #category : #'grammar-block' }
PP2FortranSrcGrammar >> blStatement [

	^ (self prelude: 'BlStatement')
	, (self maybe: expression)
	, (self parens: statement)
]

{ #category : #'grammar-block' }
PP2FortranSrcGrammar >> block [

	^ blStatement
	/ blIf
	/ blDo
	/ blComment
	/ blForAll
	/ blCase
	/ blDoWhile
	/ blAssociate
	"/ blInterface"
]

{ #category : #'grammar-block' }
PP2FortranSrcGrammar >> comment [

	^ self parens: (self token: 'Comment')
	, tkString
]

{ #category : #'grammar-declaration' }
PP2FortranSrcGrammar >> commonGroup [

	^ (self token: 'CommonGroup')
	, (self token: '{')
	, (self prefixed: emptyTuple by:  'commonGroupAnno = ') , tkComma
	, (self prefixed: srcSpan by:  'commonGroupSpan = ') , tkComma
	, (self prefixed: (self maybeNoParens: expression) by: 'commonGroupName = ') , tkComma
	, (self prefixed: (self aListNew: declarator) by: 'commonGroupVars = ')
	, (self token: '}')
]

{ #category : #'grammar-statement' }
PP2FortranSrcGrammar >> controlPair [

	^ (self token: 'ControlPair')
	, (self token: '{')
	, (self prefixed: emptyTuple by:  'controlPairAnno = ') , tkComma
	, (self prefixed: srcSpan by:  'controlPairSpan = ') , tkComma
	, (self prefixed: (self maybe: tkString) by: 'controlPairName = ') , tkComma
	, (self prefixed: (expression) by: 'controlPairExpr = ')
	, (self token: '}')
]

{ #category : #'grammar-statement' }
PP2FortranSrcGrammar >> dataGroup [

	^ (self token: 'DataGroup')
	, (self token: '{')
	, (self prefixed: emptyTuple by:  'dataGroupAnno =') , tkComma
	, (self prefixed: srcSpan by:  'dataGroupSpan =') , tkComma
	, (self prefixed: (self aListNew: expression) by:  'dataGroupNames =') , tkComma
	, (self prefixed: (self aListNew: expression) by:  'dataGroupInitializers =')
	, (self token: '}')
]

{ #category : #'grammar-declaration' }
PP2FortranSrcGrammar >> declarator [

	^ (self token: 'Declarator')
	, (self token: '{')
	, (self prefixed: emptyTuple by:  'declaratorAnno =') , tkComma
	, (self prefixed: srcSpan by:  'declaratorSpan =') , tkComma
	, (self prefixed: expression by: 'declaratorVariable =') , tkComma
	, (self prefixed: declaratorType by: 'declaratorType =') , tkComma
	, (self prefixed: (self maybeNoParens: expression) by: 'declaratorLength =') , tkComma
	, (self prefixed: (self maybeNoParens: expression) by: 'declaratorInitial =')
	, (self token: '}')
]

{ #category : #'grammar-declaration' }
PP2FortranSrcGrammar >> declaratorType [

	^ (self token: 'ScalarDecl')
	  /
	  (self parens: (self token: 'ArrayDecl') , (self parens: (self aList: dimensionDeclarator)))
]

{ #category : #'grammar-declaration' }
PP2FortranSrcGrammar >> dimensionDeclarator [

	^ (self prelude: 'DimensionDeclarator')
	, (self maybe: expression)
	, (self maybe: expression)
]

{ #category : #'grammar-block' }
PP2FortranSrcGrammar >> doSpecification [

	^ (self token: 'DoSpecification')
	, (self token: '{')
	, (self prefixed: emptyTuple by:  'doSpecAnno =') , tkComma
	, (self prefixed: srcSpan by:  'doSpecSpan =') , tkComma
	, (self prefixed: statement by:  'doSpecInitial =') , tkComma
	, (self prefixed: expression by:  'doSpecLimit =') , tkComma
	, (self prefixed: (self maybeNoParens: expression) by:  'doSpecIncrement =')
	, (self token: '}')
]

{ #category : #token }
PP2FortranSrcGrammar >> emptyTuple [

	^ self token: '()'
]

{ #category : #token }
PP2FortranSrcGrammar >> emptyTuple: aPrefix [

	^ (self tokenWithPrefix: aPrefix suffix: 'Anno = ')
	, (self token: '()')
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> expBinary [

	^ (self prelude: 'ExpBinary')
	, binaryOp
	, (self parens: expression)
	, (self parens: expression)
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> expFunctionCall [

	^ (self prelude: 'ExpFunctionCall')
	, (self parens: expression)
	, (self parens: (self aListNew: argument))
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> expSubscript [

	^ (self prelude: 'ExpSubscript')
	, (self parens: expression)
	, (self parens: (self aListNew: index))
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> expUnary [

	^ (self prelude: 'ExpUnary')
	, unaryOp
	, (self parens: expression)
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> expValue [

	^ (self prelude: 'ExpValue')
	, ((self parens: value) / valStar)
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> expression [

	^ expValue
	/ expBinary
	/ expUnary
	/ expSubscript
	/ expFunctionCall
	"/ expImpliedDo
	/ expDataRef
	/ expInitialisation
	/ expReturnSpec"
]

{ #category : #'grammar-block' }
PP2FortranSrcGrammar >> forallHeader [

	^ (self haskellList:
		   tkString
		 , (self parens: expression)
		 , (self parens: expression)
		 , (self maybe: expression)
	  )
	  , (self maybe: expression)
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> haskellList: aRule [

	^ (self token: '[')
	, (aRule separatedBy: tkComma) optional
	, (self token: ']')
]

{ #category : #'grammar-tests' }
PP2FortranSrcGrammar >> haskellListOfString [
	self flag: #TODO. "has to be removed, debugging purpose only"
	"rule to test method #haskellList:"

	^ self aListNew: tkString
]

{ #category : #'grammar-block' }
PP2FortranSrcGrammar >> ifElseIfClause [

	^ (self parens:  expression, tkComma , (self haskellList: block))
]

{ #category : #'grammar-declaration' }
PP2FortranSrcGrammar >> impCharacter [

	^ $' asPParser
	, #letter asPParser flatten
	, $' asPParser
]

{ #category : #'grammar-declaration' }
PP2FortranSrcGrammar >> impElement [

	^ impCharacter
	/ impRange
]

{ #category : #'grammar-declaration' }
PP2FortranSrcGrammar >> impElementNew [

	^ (self token: 'ImpElement')
	, (self token: '{')
	, (self prefixed: emptyTuple by:  'impElementAnno =') , tkComma
	, (self prefixed: srcSpan by:  'impElementSpan =') , tkComma
	, (self prefixed: impCharacter by: 'impElementFrom ='), tkComma
	, (self prefixed: (self maybeNoParens: impCharacter) by: 'impElementTo =')
	, (self token: '}')
]

{ #category : #'grammar-declaration' }
PP2FortranSrcGrammar >> impList [

	^ (self token: 'ImpList')
	, (self token: '{')
	, (self prefixed: emptyTuple by:  'impListAnno =') , tkComma
	, (self prefixed: srcSpan by:  'impListSpan =') , tkComma
	, (self prefixed: typeSpec by: 'impListType ='), tkComma
	, (self prefixed: (self aListNew: impElementNew) by: 'impListElements =')
	, (self token: '}')
]

{ #category : #'grammar-declaration' }
PP2FortranSrcGrammar >> impRange [

	^ (self prelude: 'ImpRange')
	, tkString
	, #space asPParser star
	, tkString
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> index [

	^ ixSingle
	/ ixRange
]

{ #category : #initialization }
PP2FortranSrcGrammar >> initialize [

	super initialize.
	lastPos := {(0 @ 0) . (0 @ 0)}
]

{ #category : #grammar }
PP2FortranSrcGrammar >> intent [

	^ (self token: 'In')
	/ (self token: 'Out')
	/ (self token: 'InOut')
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> ixRange [

	^ (self prelude: 'IxRange')
	, (self maybe: expression)
	, (self maybe: expression)
	, (self maybe: expression)
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> ixSingle [

	^ (self prelude: 'IxSingle')
	, (self maybe: tkString)
	, (self parens: expression)
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> justAList: aRule [

	^ self parens: (self token: 'Just')
	, (self aList: aRule)
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> justAListNew: aRule [

	^ self parens: (self token: 'Just') , (self aListNew: aRule)
]

{ #category : #'grammar-tests' }
PP2FortranSrcGrammar >> justAListNewOfExpression [

	"rule to test method #haskellList:"

	^ self justAListNew: expression
]

{ #category : #'grammar-tests' }
PP2FortranSrcGrammar >> justAListNewOfString [

	"rule to test method #haskellList:"

	^ self haskellList: tkString
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> justATuple: aRule1 and: aRule2 [

	^ self parens: (self token: 'Just')
	, (self aList: aRule1)
	, (self aList: aRule2)
]

{ #category : #accessing }
PP2FortranSrcGrammar >> lastPos [

	^ lastPos 
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> maybe: aRule [

	"Maybe  -> Nothing / (Just aRule)"

	^ tkNothing
	/ (self parens: (self token: 'Just') , aRule)
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> maybeNoParens: aRule [

	"a special #maybe: that does not put parentheses around 'Just aRule'
	notably when it is in a haskell list"

	^ tkNothing
	/ ((self token: 'Just') , aRule)
]

{ #category : #'grammar-tests' }
PP2FortranSrcGrammar >> maybeOfString [

	self flag: #TODO. "must be deleted, debug purpose only"
	"rule to test method #maybe:"

	^ self maybe: tkString
]

{ #category : #'grammar-metaInfo' }
PP2FortranSrcGrammar >> metaInfo [

	^ (self token: 'MetaInfo')
	, (self token: '{')
	, (miParameters delimitedBy: tkComma)
	, (self token: '}')
	  
]

{ #category : #'grammar-metaInfo' }
PP2FortranSrcGrammar >> miFilename [

	^ (self token: 'miFilename')
	, (self token: '=')
	, tkString
]

{ #category : #'grammar-metaInfo' }
PP2FortranSrcGrammar >> miParameters [

	^ miVersion
	/ miFilename
]

{ #category : #'grammar-metaInfo' }
PP2FortranSrcGrammar >> miVersion [

	^ (self token: 'miVersion')
	, (self token: '=')
	, tkIdentifier
]

{ #category : #'grammar-block' }
PP2FortranSrcGrammar >> nonEmptyList [

	"It is the constructor for a non-empty list (Data.List.NonEmpty)."
	^ self token: ':|'
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> parens: aRule [

	^ (self token: '(')
	, aRule
	, (self token: ')')
]

{ #category : #grammar }
PP2FortranSrcGrammar >> position [

	^ self parens: (tkNumber , (self token: ':') , tkNumber)
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcGrammar >> prefixSuffix [

	^ self parens: tkNothing , tkComma , tkNothing
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcGrammar >> prefixed: aRule by: aPrefix [

	^ (self token: aPrefix uncapitalized)
	, aRule
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> prelude: aString [

	^ aString asPParser flatten trim
	, emptyTuple
	, srcSpan
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> prelude: aString aList: aRule [

	^ (self prelude: aString)
	, (self parens: (self aList: aRule))
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> prelude: aString aListNew: aRule [

	^ (self prelude: aString)
	, (self parens: (self aListNew: aRule))
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> prelude: aString maybe: aRule [

	^ (self prelude: aString)
	, (self maybe: aRule)
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> prelude: aString with: aPrefix [

	^ aString asPParser flatten trim
	, (self emptyTuple: aPrefix)
	, (self srcSpan: aPrefix)
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> preludeWithPrefix: aString [
	
	^ aString asPParser flatten trim
	, (self token: '{')
	, (self emptyTuple: aString)
	, tkComma
	, (self srcSpan: aString)
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcGrammar >> programFile [

	^ (self token: 'ProgramFile')
	, (self token: '{')
	, (self prefixed: metaInfo by: 'programFileMeta =') , tkComma
	, (self prefixed: (self haskellList: programUnit) by:  'programFileProgramUnits =')
	, (self token: '}')
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcGrammar >> programUnit [

	^ puMain
	/ puModule
	/ puSubroutine
	/ puFunction
	/ puBlockData
	/ puComment
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcGrammar >> puBlockData [

	^ (self prelude: 'PUBlockData')
	, (self maybe: tkString)
	, (self haskellList: block)
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcGrammar >> puComment [

	^ (self prelude: 'PUComment')
	,  comment
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcGrammar >> puFunction [

	^ (self prelude: 'PUFunction')
	, (self maybe: typeSpec)
	, prefixSuffix
	, tkString
	, ((self token: 'Nothing') / (self justAListNew: expression))
	, (self maybe: expression)
	, (self haskellList: block)
	, (self maybe: programUnit)
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcGrammar >> puMain [

	^ (self prelude: 'PUMain')
	, (self maybe: tkString)
	, (self haskellList: block)
	, (self maybe: programUnit)
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcGrammar >> puModule [

	^ (self prelude: 'PUModule')
	, tkString
	, (self haskellList: block)
	, (self maybe: programUnit)
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcGrammar >> puSubroutine [

	^ (self prelude: 'PUSubroutine')
	, prefixSuffix
	, tkString
	, ((self token: 'Nothing') / (self justAListNew: expression))
	, (self haskellList: block)
	, (self maybe: programUnit)
]

{ #category : #'grammar-declaration' }
PP2FortranSrcGrammar >> selector [

	^ (self token: 'Selector')
	, (self token: '{')
	, (self prefixed: emptyTuple by:  'selectorAnno =') , tkComma
	, (self prefixed: srcSpan by:  'selectorSpan =') , tkComma
	, (self prefixed: (self maybeNoParens: expression) by: 'selectorLength =') , tkComma
	, (self prefixed: (self maybeNoParens: expression) by: 'selectorKind =')
	, (self token: '}')
]

{ #category : #grammar }
PP2FortranSrcGrammar >> srcSpan [

	^ position
	, (self token: '-')
	, position
	"The following production rule is for debugging purposes."
	==> [ :nodes || line col|
		line := nodes first second first asInteger.
		col := nodes first second third asInteger.
		(lastPos first x < line)
			ifTrue: [ lastPos := { (line @ col) . nodes third second} ] 
			ifFalse: [ ((lastPos first x = line) and: [lastPos first y < col])
				ifTrue: [lastPos := { (line @ col) . nodes third second}] ].
		nodes
	]
]

{ #category : #grammar }
PP2FortranSrcGrammar >> srcSpan: aPrefix [

	^ (self tokenWithPrefix: aPrefix suffix: 'Span = ')
	, position
	, (self token: '-')
	, position
	"The following production rule is for debugging purposes."
	==> [ :nodes || line col|
		line := nodes second second first asInteger.
		col := nodes second second third asInteger.
		(lastPos first x < line)
			ifTrue: [ lastPos := { (line @ col) . nodes fourth second} ] 
			ifFalse: [ ((lastPos first x = line) and: [lastPos first y < col])
				ifTrue: [lastPos := { (line @ col) . nodes fourth second}] ].
		nodes
	]
]

{ #category : #'grammar-statement' }
PP2FortranSrcGrammar >> stCall [

	^ ((self prelude: 'StCall')
	, (self parens: expression)
	, (self parens: (self aListNew:  argument)))
]

{ #category : #'grammar-statement' }
PP2FortranSrcGrammar >> stData [

	^ (self prelude: 'StData')
	, (self parens: (self aListNew: dataGroup))
]

{ #category : #'grammar-statement' }
PP2FortranSrcGrammar >> stDeclaration [

	^ (self prelude: 'StDeclaration')
	, (self parens: typeSpec)
	, (self maybe: (self aListNew: attribute))
	, (self parens: (self aListNew: declarator))
]

{ #category : #'grammar-statement' }
PP2FortranSrcGrammar >> stExit [

	^ (self prelude: 'StExit')
	, (self maybe: expression)
]

{ #category : #'grammar-statement' }
PP2FortranSrcGrammar >> stExpressionAssign [

	^ ((self prelude: 'StExpressionAssign')
	, (self parens: expression)
	, (self parens: expression))
]

{ #category : #'grammar-statement' }
PP2FortranSrcGrammar >> stExternal [

	^ (self prelude: 'StExternal')
	, (self parens: (self aListNew: expression))
]

{ #category : #'grammar-statement' }
PP2FortranSrcGrammar >> stFormatBogus [

	^ (self prelude: 'StFormatBogus') , tkString
]

{ #category : #'grammar-statement' }
PP2FortranSrcGrammar >> stFunction [

	^ (self prelude: 'StFunction')
	, (self parens: expression)
	, (self parens: (self aListNew: expression))
	, (self parens: expression)
]

{ #category : #'grammar-statement' }
PP2FortranSrcGrammar >> stIfLogical [
	^ (self prelude: 'StIfLogical')
	, (self parens: expression)
	, (self parens: statement)
]

{ #category : #'grammar-statement' }
PP2FortranSrcGrammar >> stPrint [
	^ (self prelude: 'StPrint')
	, (self parens: expression)
	, (self maybe: (self justAList: expression))
]

{ #category : #'grammar-statement' }
PP2FortranSrcGrammar >> stStop [

	^ (self prelude: 'StStop')
	  , (self maybe: expression)
]

{ #category : #'grammar-statement' }
PP2FortranSrcGrammar >> stWrite [

	^ (self prelude: 'StWrite')
	, (self parens: (self aListNew: controlPair))
	, (self maybe: (self aListNew: expression))
]

{ #category : #accessing }
PP2FortranSrcGrammar >> start [
	^programFile
]

{ #category : #'grammar-statement' }
PP2FortranSrcGrammar >> statement [

	^ stDeclaration / (self prelude: 'StDimension' aList: declarator)
	  / (self prelude: 'StAllocatable' aList: declarator)
	  / (self prelude: 'StCommon' aListNew: commonGroup)
	  / (self prelude: 'StEquivalence' aList: (self aList: expression))
	  / (self prelude: 'StImplicit' maybe: (self aListNew: impList))
	  / stIfLogical / stExpressionAssign
	  /
	  ((self prelude: 'StGotoUnconditional') , (self parens: expression))
	  / stCall / (self prelude: 'StReturn' maybe: expression)
	  / (self prelude: 'StContinue') / stFunction / stPrint / stExternal / stWrite / stExit 
	  / stFormatBogus / stStop / stData
	"/ stStructure / stIntent / stOptional / stPublic / stPrivate / stProtected / stSave"
	"/ stAsynchronous / stPointer / stTarget / stValue / stVolatile / stAutomatic / ststatic / stNamelist / stParameter  / stIntrinsic"
	"/ stFormat"

	"/ stEntry / stInclude / stDo / stDoWhile / stEnddo / stCycle  "
	" / stIfArithmetic / stSelectCase / stCase / stEndcase"
	" / stPointerAssign / stLabelAssign"
	" / stGotoAssigned / stGotoComputed"
	" / stPause / stRead / stRead2 / stTypePrint / stOpen / stClose / stFlush / stInquire / stRewind / stRewind2 / stBackspace / stBackspace2 / stEndfile / stEndfile2 / stAllocate / stNullify / stDeallocate / stWhere / stWhereConstruct / stElsewhere / stEndWhere / stUse / stModuleProcedure / stProcedure / stType / stEndType / stSequence / stForall / stForallstatement / stEndForall / stImport / stEnum / stEnumerator / stEndEnum "
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> surrounded: aRule by: aCollectionOfToken [

	^ (self token: aCollectionOfToken first)
	, aRule
	, (self token: aCollectionOfToken last)
]

{ #category : #token }
PP2FortranSrcGrammar >> tkComma [

	^ self token: ','
]

{ #category : #token }
PP2FortranSrcGrammar >> tkIdentifier [

	^ #word asPParser plus flatten trim
]

{ #category : #token }
PP2FortranSrcGrammar >> tkNothing [

	^ self token: 'Nothing'
]

{ #category : #token }
PP2FortranSrcGrammar >> tkNumber [
	^ #digit asPParser plus flatten trim
]

{ #category : #token }
PP2FortranSrcGrammar >> tkString [

	^ $" asPParser
	, ('\"' asPParser / $" asPParser negate) star flatten
	, $" asPParser
]

{ #category : #token }
PP2FortranSrcGrammar >> tkStringNew [

	^ $' asPParser
	, ('''' asPParser  /  $' asPParser negate) star flatten
	, $' asPParser
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> token: aString [

	^ aString asPParser flatten trim
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> tokenWithPrefix: aString suffix: aSuffix [
	
	| aPrefix |
	aPrefix := aString uncapitalized trim.
	
	^ (self token: aPrefix, aSuffix)
	, (self token: aString)
]

{ #category : #'grammar-declaration' }
PP2FortranSrcGrammar >> typeSpec [

	^ (self token: 'TypeSpec')
	, (self token: '{')
	, (self prefixed: emptyTuple by:  'typeSpecAnno =') , tkComma
	, (self prefixed: srcSpan by:  'typeSpecSpan =') , tkComma
	, (self prefixed: baseType by: 'typeSpecBaseType =') , tkComma
	, (self prefixed: (self maybeNoParens: selector) by: 'typeSpecSelector =')
	, (self token: '}')
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> unaryOp [

	^ (self token: 'Plus') /
	(self token: 'Minus') /
	(self token: 'Not') /
	((self token: 'UnCustom') , tkString)
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> valInteger [

	^ (self token: 'ValInteger') , tkString , tkNothing
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> valLogical [

	^ (self token: 'ValLogical')
	, ((self token: 'False') / (self token: 'True'))
	, tkNothing
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> valStar [

	^ self token: 'ValStar'
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> value [

	^ valInteger 
	  / ((self token: 'ValString') , tkString)
	  / ((self token: 'ValHollerith') , tkString)
	  / ((self token: 'ValVariable') , tkString)
	  / ((self token: 'ValIntrinsic') , tkString)
	  / ((self token: 'ValOperator') , tkString)
	  / ((self token: 'ValType') , tkString)
	  "/ (self token: 'ValStar')"
	"/ valReal / valComplex"
	"/ valBoz"
	/ valLogical
	"/ valAssignment / valColon"
]
