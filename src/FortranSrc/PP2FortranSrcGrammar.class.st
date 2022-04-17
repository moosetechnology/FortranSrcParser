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
		'valVariable',
		'block',
		'blComment',
		'comment',
		'blStatement',
		'label',
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
		'binaryOp'
	],
	#category : #FortranSrc
}

{ #category : #token }
PP2FortranSrcGrammar >> any [
	^ #any asPParser token trim

]

{ #category : #grammar }
PP2FortranSrcGrammar >> attribute [

	^ (self prelude: 'AttrAllocatable')
	  / (self prelude: 'AttrAsynchronous')
	  / (self prelude: 'AttrDimension' aList: dimensionDeclarator)
	  / (self prelude: 'AttrExternal')
	  / ((self prelude: 'AttrIntent') , intent)
	  / (self prelude: 'AttrIntrinsic') / (self prelude: 'AttrOptional')
	  / (self prelude: 'AttrParameter') / (self prelude: 'AttrPointer')
	  / (self prelude: 'AttrPrivate') / (self prelude: 'AttrProtected')
	  / (self prelude: 'AttrPublic') / (self prelude: 'AttrSave')
	  / ((self prelude: 'AttrSuffix') , tkNothing)
	  / (self prelude: 'AttrTarget') / (self prelude: 'AttrValue')
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
  / (self token: 'GT')
  / (self token: 'GTE')
  / (self token: 'LT')
  / (self token: 'LTE')
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
PP2FortranSrcGrammar >> blComment [

	^ (self prelude: 'BlComment') , comment
]

{ #category : #'grammar-block' }
PP2FortranSrcGrammar >> blStatement [

	^ (self prelude: 'BlStatement') , (self maybe: label) , (self parens: statement)
]

{ #category : #'grammar-block' }
PP2FortranSrcGrammar >> block [
	^ blStatement / "blForAll / blIf / blCase / blDo / blDoWhile / blAssociate / blInterface /" blComment
]

{ #category : #grammar }
PP2FortranSrcGrammar >> comment [

	^ self parens: (self token: 'Comment') , tkString
]

{ #category : #'grammar-declaration' }
PP2FortranSrcGrammar >> commonGroup [
	^ (self prelude: 'CommonGroup') , (self maybe: expression) , (self justAList: declarator)
]

{ #category : #'grammar-declaration' }
PP2FortranSrcGrammar >> declarator [

	^ (self prelude: 'Declarator') , (self parens: expression)
	  , declaratorType , (self maybe: expression)
	  , (self maybe: expression)
]

{ #category : #'grammar-declaration' }
PP2FortranSrcGrammar >> declaratorType [

	^ (self token: 'ScalarDecl')
	  /
	  (self parens: (self token: 'ArrayDecl') , (self justAList: dimensionDeclarator))
]

{ #category : #'grammar-declaration' }
PP2FortranSrcGrammar >> dimensionDeclarator [

	^ (self prelude: 'DimensionDeclarator') , (self maybe: expression) , (self maybe: expression)
]

{ #category : #grammar }
PP2FortranSrcGrammar >> emptyTuple [

	^ self token: '()'
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> expBinary [
	^ (self prelude: 'ExpBinary') , binaryOp , (self parens: expression) , (self parens: expression)
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> expSubscript [
	^ (self prelude: 'ExpSubscript') , (self parens: expression) , (self justAList: index)
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> expUnary [
	^ (self prelude: 'ExpUnary') , unaryOp , (self parens: expression)
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> expValue [

	^ (self prelude: 'ExpValue') , (self parens: value)
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> expression [
	^ expValue /
	expBinary / 
	expUnary /
	expSubscript "/ expDataRef / expFunctionalCall / expImpliedDo / expInitialisation / expReturnSpec"
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> haskellList: aRule [

	^ (self token: '[') , (aRule separatedBy: tkComma) optional
	  , (self token: ']')
]

{ #category : #'grammar-declaration' }
PP2FortranSrcGrammar >> impCharacter [

	^ (self prelude: 'ImpCharacter') , tkString
]

{ #category : #'grammar-declaration' }
PP2FortranSrcGrammar >> impElement [

	^ impCharacter / impRange
]

{ #category : #'grammar-declaration' }
PP2FortranSrcGrammar >> impList [

	^ (self prelude: 'ImpList') , (self parens: typeSpec) 
	  , (self justAList: impElement)
]

{ #category : #'grammar-declaration' }
PP2FortranSrcGrammar >> impRange [

	^ (self prelude: 'ImpRange') , tkString , tkString
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> index [
	^ ixSingle / ixRange
]

{ #category : #grammar }
PP2FortranSrcGrammar >> intent [

	^ (self token: 'In') / (self token: 'Out') / (self token: 'InOut')
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> ixRange [
	^ (self prelude: 'IxRange') , (self maybe: expression) , (self maybe: expression) , (self maybe: expression)
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> ixSingle [
	^ (self prelude: 'IxSingle') , (self maybe: tkString) , (self parens: expression)
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> justAList: aRule [
	"(Just AList ...) | (AList ...)"
	^ self parens: (self token: 'Just') optional , (self prelude: 'AList') , (self haskellList: aRule)
]

{ #category : #grammar }
PP2FortranSrcGrammar >> label [
	^ tkNothing
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> maybe: aRule [
	"Maybe  -> Nothing / (Just aRule)"
	^ tkNothing / (self parens: (self token: 'Just') , aRule)
]

{ #category : #'grammar-metaInfo' }
PP2FortranSrcGrammar >> metaInfo [

	^ self parens: (self token: 'MetaInfo') , (self token: '{')
	  , (miParameters delimitedBy: tkComma) , (self token: '}')
	  
]

{ #category : #'grammar-metaInfo' }
PP2FortranSrcGrammar >> miFilename [

	^ (self token: 'miFilename') , (self token: '=') , tkString
]

{ #category : #'grammar-metaInfo' }
PP2FortranSrcGrammar >> miParameters [
	^ miVersion / miFilename
]

{ #category : #'grammar-metaInfo' }
PP2FortranSrcGrammar >> miVersion [

	^ (self token: 'miVersion') , (self token: '=') , tkIdentifier
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> parens: aRule [

	^ (self token: '(') , aRule , (self token: ')')
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcGrammar >> position [

	^ self parens: tkNumber , (self token: ':') , tkNumber
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcGrammar >> prefixSuffix [

	^ self parens: tkNothing , tkComma , tkNothing
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> prelude: aString [

	^ aString asPParser trim , emptyTuple , srcSpan
]

{ #category : #'grammar-helper' }
PP2FortranSrcGrammar >> prelude: aString aList: aRule [

	^ (self prelude: aString) , (self justAList: aRule)
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcGrammar >> programFile [

	^ (self token: 'ProgramFile') , metaInfo , (self haskellList: programUnit)
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcGrammar >> programUnit [
	^ "puMain / puModule /" puSubroutine "/ puFunction / puBlockData" / puComment
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcGrammar >> puBlockData [
	^any
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcGrammar >> puComment [

	^ (self prelude: 'PUComment') , comment
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcGrammar >> puFunction [
	^any
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcGrammar >> puMain [
	^any
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcGrammar >> puModule [
	^any
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcGrammar >> puSubroutine [

	^ (self prelude: 'PUSubroutine') , prefixSuffix , tkString ,
		((self token: 'Nothing') / (self justAList: expression)) ,
		(self haskellList: block) , (self maybe: programUnit)
]

{ #category : #'grammar-declaration' }
PP2FortranSrcGrammar >> selector [

	^ (self prelude: 'Selector') , (self maybe: expression) , (self maybe: expression)
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcGrammar >> srcSpan [

	^ position , (self token: '-') , position
]

{ #category : #'grammar-statement' }
PP2FortranSrcGrammar >> stDeclaration [

	^ (self prelude: 'StDeclaration') , (self parens: typeSpec)
	  , (self maybe: (self justAList: attribute)) , (self justAList: declarator)
]

{ #category : #accessing }
PP2FortranSrcGrammar >> start [
	^programFile
]

{ #category : #'grammar-statement' }
PP2FortranSrcGrammar >> statement [

	^ stDeclaration /
	"stStructure / stIntent / stOptional / stPublic / stPrivate / stProtected / stSave / "
	(self prelude: 'StDimension' aList: declarator) /
	(self prelude: 'StAllocatable' aList: declarator) /
	" stAsynchronous / stPointer / stTarget / stValue / stVolatile / stData / stAutomatic / ststatic / stNamelist / stParameter / stExternal / stIntrinsic"
	(self prelude: 'StCommon' aList: commonGroup) /
	(self prelude: 'StEquivalence' aList: (self justAList: expression)) /
	" stFormat /"
	(self prelude: 'StImplicit' aList: impList)
	
	" stEntry / stInclude / stDo / stDoWhile / stEnddo / stCycle / stExit / stIfLogical / stIfArithmetic / stSelectCase / stCase / stEndcase / stFunction / stExpressionAssign / stPointerAssign / stLabelAssign / stGotoUnconditional / stGotoAssigned / stGotoComputed / stCall / stReturn / stContinue / ststop / stPause / stRead / stRead2 / stWrite / stPrint / stTypePrint / stOpen / stClose / stFlush / stInquire / stRewind / stRewind2 / stBackspace / stBackspace2 / stEndfile / stEndfile2 / stAllocate / stNullify / stDeallocate / stWhere / stWhereConstruct / stElsewhere / stEndWhere / stUse / stModuleProcedure / stProcedure / stType / stEndType / stSequence / stForall / stForallstatement / stEndForall / stImport / stEnum / stEnumerator / stEndEnum / stFormatBogus"
]

{ #category : #token }
PP2FortranSrcGrammar >> tkComma [

	^ self token: ','
]

{ #category : #token }
PP2FortranSrcGrammar >> tkIdentifier [
	^#word asPParser plus token trim
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
	^ ($" asPParser , ('\"' asPParser / $" asPParser negate) star , $" asPParser) trim
]

{ #category : #token }
PP2FortranSrcGrammar >> token: aString [

	^  aString asPParser trim
]

{ #category : #'grammar-declaration' }
PP2FortranSrcGrammar >> typeSpec [

	^ (self prelude: 'TypeSpec') , baseType , (self maybe: selector)
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
PP2FortranSrcGrammar >> valVariable [

	^ (self token: 'ValVariable') , tkString
]

{ #category : #'grammar-expression' }
PP2FortranSrcGrammar >> value [

	^ valVariable / valInteger "/ valReal / valComplex / valString / valBoz / valHollerith /" "/ valIntrinsic / valLogical / valOperator / valAssignment / valType / valStar / valColon"
]
