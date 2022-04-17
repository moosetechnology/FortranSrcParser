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
		'programFileBody',
		'programUnit',
		'puMain',
		'puModule',
		'puSubroutine',
		'puFunction',
		'puBlockData',
		'puComment',
		'srcSpan',
		'prefixSuffix',
		'subroutineArguments',
		'subroutineBody',
		'subPrograms',
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
		'valInteger'
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

{ #category : #grammar }
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

{ #category : #'grammar-subroutine' }
PP2FortranSrcGrammar >> blComment [

	^ (self prelude: 'BlComment') , comment
]

{ #category : #grammar }
PP2FortranSrcGrammar >> blStatement [

	^ (self prelude: 'BlStatement') , label , (self parens: statement)
]

{ #category : #'grammar-subroutine' }
PP2FortranSrcGrammar >> block [
	^ blStatement / "blForAll / blIf / blCase / blDo / blDoWhile / blAssociate / blInterface /" blComment
]

{ #category : #grammar }
PP2FortranSrcGrammar >> comment [

	^ self parens: (self token: 'Comment') , tkString
]

{ #category : #grammar }
PP2FortranSrcGrammar >> commonGroup [
	^ (self prelude: 'CommonGroup') , (self maybe: expression) , (self justAList: declarator)
]

{ #category : #grammar }
PP2FortranSrcGrammar >> declarator [

	^ (self prelude: 'Declarator') , (self parens: expression)
	  , declaratorType , (self maybe: expression)
	  , (self maybe: expression)
]

{ #category : #grammar }
PP2FortranSrcGrammar >> declaratorType [

	^ (self token: 'ScalarDecl')
	  /
	  (self parens: (self token: 'ArrayDecl') , (self justAList: dimensionDeclarator))
]

{ #category : #grammar }
PP2FortranSrcGrammar >> dimensionDeclarator [

	^ (self prelude: 'DimensionDeclarator') , (self maybe: expression) , (self maybe: expression)
]

{ #category : #grammar }
PP2FortranSrcGrammar >> emptyTuple [

	^ self token: '()'
]

{ #category : #grammar }
PP2FortranSrcGrammar >> expValue [

	^ (self prelude: 'ExpValue') , (self parens: value)
]

{ #category : #grammar }
PP2FortranSrcGrammar >> expression [
	^ expValue "/ expBinary / expUnary / expSubscript / expDataRef / expFunctionalCall / expImpliedDo / expInitialisation / expReturnSpec"
]

{ #category : #'grammar-subroutine' }
PP2FortranSrcGrammar >> haskellList: aRule [

	^ (self token: '[') , (aRule separatedBy: tkComma) optional
	  , (self token: ']')
]

{ #category : #grammar }
PP2FortranSrcGrammar >> impCharacter [

	^ (self prelude: 'ImpCharacter') , tkString
]

{ #category : #grammar }
PP2FortranSrcGrammar >> impElement [

	^ impCharacter / impRange
]

{ #category : #grammar }
PP2FortranSrcGrammar >> impList [

	^ (self prelude: 'ImpList') , (self parens: typeSpec) 
	  , (self justAList: impElement)
]

{ #category : #grammar }
PP2FortranSrcGrammar >> impRange [

	^ (self prelude: 'ImpRange') , tkString , tkString
]

{ #category : #grammar }
PP2FortranSrcGrammar >> intent [

	^ (self token: 'In') / (self token: 'Out') / (self token: 'InOut')
]

{ #category : #grammar }
PP2FortranSrcGrammar >> justAList: aRule [
	"parses: (Just AList ...) and: (AList ...)"
	^ self parens: (self token: 'Just') optional , (self token: 'AList')
	  , emptyTuple , srcSpan , (self haskellList: aRule)
]

{ #category : #grammar }
PP2FortranSrcGrammar >> label [
	^ tkNothing
]

{ #category : #grammar }
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

{ #category : #grammar }
PP2FortranSrcGrammar >> parens: aRule [

	^ (self token: '(') , aRule , (self token: ')')
]

{ #category : #grammar }
PP2FortranSrcGrammar >> position [

	^ self parens: tkNumber , (self token: ':') , tkNumber
]

{ #category : #grammar }
PP2FortranSrcGrammar >> prefixSuffix [

	^ self parens: tkNothing , tkComma , tkNothing
]

{ #category : #grammar }
PP2FortranSrcGrammar >> prelude: aString [

	^ aString asPParser trim , emptyTuple , srcSpan
]

{ #category : #grammar }
PP2FortranSrcGrammar >> prelude: aString aList: aRule [

	^ (self prelude: aString) , (self justAList: aRule)
]

{ #category : #grammar }
PP2FortranSrcGrammar >> programFile [

	^ (self token: 'ProgramFile') , metaInfo , programFileBody
]

{ #category : #grammar }
PP2FortranSrcGrammar >> programFileBody [

	^ self parens: (programUnit delimitedBy: tkComma) optional
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

	^ (self prelude:
		  'PUSubroutine') , prefixSuffix , tkString , subroutineArguments
		  , subroutineBody , subPrograms
]

{ #category : #grammar }
PP2FortranSrcGrammar >> selector [

	^ (self prelude: 'Selector') , (self maybe: expression) , (self maybe: expression)
]

{ #category : #grammar }
PP2FortranSrcGrammar >> srcSpan [

	^ position , (self token: '-') , position
]

{ #category : #grammar }
PP2FortranSrcGrammar >> stDeclaration [

	^ (self prelude: 'StDeclaration') , typeSpec
	  , (self maybe: (self justAList: attribute)) , (self justAList: declarator)
]

{ #category : #accessing }
PP2FortranSrcGrammar >> start [
	^programFile
]

{ #category : #grammar }
PP2FortranSrcGrammar >> statement [

	^ stDeclaration /
	"stStructure / stIntent / stOptional / stPublic / stPrivate / stProtected / stSave / "
	(self prelude: 'StDimension' aList: declarator) /
	(self prelude: 'StAllocatable' aList: declarator) /
	" stAsynchronous / stPointer / stTarget / stValue / stVolatile / stData / stAutomatic / ststatic / stNamelist / stParameter / stExternal / stIntrinsic"
	(self prelude: 'StCommon' aList: commonGroup) /
	"stEquivalence / stFormat /"
	(self prelude: 'StImplicit' aList: impList)
	
	" stEntry / stInclude / stDo / stDoWhile / stEnddo / stCycle / stExit / stIfLogical / stIfArithmetic / stSelectCase / stCase / stEndcase / stFunction / stExpressionAssign / stPointerAssign / stLabelAssign / stGotoUnconditional / stGotoAssigned / stGotoComputed / stCall / stReturn / stContinue / ststop / stPause / stRead / stRead2 / stWrite / stPrint / stTypePrint / stOpen / stClose / stFlush / stInquire / stRewind / stRewind2 / stBackspace / stBackspace2 / stEndfile / stEndfile2 / stAllocate / stNullify / stDeallocate / stWhere / stWhereConstruct / stElsewhere / stEndWhere / stUse / stModuleProcedure / stProcedure / stType / stEndType / stSequence / stForall / stForallstatement / stEndForall / stImport / stEnum / stEnumerator / stEndEnum / stFormatBogus"
]

{ #category : #'grammar-subroutine' }
PP2FortranSrcGrammar >> subPrograms [
	^ tkNothing
]

{ #category : #'grammar-subroutine' }
PP2FortranSrcGrammar >> subroutineArguments [

	^ self justAList: expression
]

{ #category : #'grammar-subroutine' }
PP2FortranSrcGrammar >> subroutineBody [

	^ self haskellList: block
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

{ #category : #grammar }
PP2FortranSrcGrammar >> typeSpec [

	^ (self prelude: 'TypeSpec') , baseType , (self maybe: selector)
]

{ #category : #grammar }
PP2FortranSrcGrammar >> valInteger [

	^ (self token: 'ValInteger') , tkString , tkNothing
]

{ #category : #grammar }
PP2FortranSrcGrammar >> valVariable [

	^ (self token: 'ValVariable') , tkString
]

{ #category : #grammar }
PP2FortranSrcGrammar >> value [

	^ valVariable / valInteger "/ valReal / valComplex / valString / valBoz / valHollerith /" "/ valIntrinsic / valLogical / valOperator / valAssignment / valType / valStar / valColon"
]
