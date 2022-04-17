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
		'tkOpenParen',
		'tkNothing',
		'tkString',
		'tkNumber',
		'tkCloseParen',
		'tkIdentifier',
		'tkComma',
		'emptyTuple',
		'tkOpenSquare',
		'tkCloseSquare',
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
		'stImplicit',
		'impList',
		'typeSpec',
		'impElement',
		'impCharacter',
		'impRange',
		'baseType',
		'selector'
	],
	#category : #FortranSrc
}

{ #category : #token }
PP2FortranSrcGrammar >> any [
	^ #any asPParser token trim

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

	^ (self prelude: 'BlStatement') , label , statement
]

{ #category : #'grammar-subroutine' }
PP2FortranSrcGrammar >> block [
	^ blStatement / "blForAll / blIf / blCase / blDo / blDoWhile / blAssociate / blInterface /" blComment
]

{ #category : #grammar }
PP2FortranSrcGrammar >> comment [

	^ self parens: ('Comment' asPParser trim , tkString)
]

{ #category : #grammar }
PP2FortranSrcGrammar >> emptyTuple [
	^ tkOpenParen , tkCloseParen
]

{ #category : #grammar }
PP2FortranSrcGrammar >> expValue [

	^ (self prelude: 'ExpValue') , value
]

{ #category : #grammar }
PP2FortranSrcGrammar >> expression [
	^ expValue "/ expBinary / expUnary / expSubscript / expDataRef / expFunctionalCall / expImpliedDo / expInitialisation / expReturnSpec"
]

{ #category : #'grammar-subroutine' }
PP2FortranSrcGrammar >> haskellList: aRule [

	^ tkOpenSquare , (aRule separatedBy: tkComma) optional
	  , tkCloseSquare
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
PP2FortranSrcGrammar >> justAList: aRule [

	^ self parens: (self token: 'Just') optional , (self token: 'AList')
	  , emptyTuple , srcSpan , (self haskellList: aRule)
]

{ #category : #grammar }
PP2FortranSrcGrammar >> label [
	^ tkNothing
]

{ #category : #'grammar-metaInfo' }
PP2FortranSrcGrammar >> metaInfo [

	^ self parens: (self token: 'MetaInfo') , (self token: '{')
	  , (miParameters delimitedBy: tkComma) , (self token: '}')
	  
]

{ #category : #'grammar-metaInfo' }
PP2FortranSrcGrammar >> miFilename [
	^ 'miFilename' asPParser trim , '=' asPParser trim , tkString
]

{ #category : #'grammar-metaInfo' }
PP2FortranSrcGrammar >> miParameters [
	^ miVersion / miFilename
]

{ #category : #'grammar-metaInfo' }
PP2FortranSrcGrammar >> miVersion [
	^ 'miVersion' asPParser trim , '=' asPParser trim , tkIdentifier
]

{ #category : #grammar }
PP2FortranSrcGrammar >> parens: aRule [

	^ tkOpenParen , aRule , tkCloseParen
]

{ #category : #grammar }
PP2FortranSrcGrammar >> position [

	^ self parens: tkNumber , (self token: ':') , tkNumber
]

{ #category : #grammar }
PP2FortranSrcGrammar >> prefixSuffix [
	^ tkOpenParen , tkNothing, tkComma , tkNothing , tkCloseParen
]

{ #category : #grammar }
PP2FortranSrcGrammar >> prelude: aString [

	^ aString asPParser trim , emptyTuple , srcSpan
]

{ #category : #grammar }
PP2FortranSrcGrammar >> programFile [
	^ 'ProgramFile' asPParser trim ,  metaInfo , programFileBody
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

	^ tkNothing
]

{ #category : #grammar }
PP2FortranSrcGrammar >> srcSpan [
	^ position , '-' asPParser , position
]

{ #category : #grammar }
PP2FortranSrcGrammar >> stImplicit [

	^ tkOpenParen , (self prelude: 'StImplicit')
	  , (self justAList: impList) , tkCloseParen
]

{ #category : #accessing }
PP2FortranSrcGrammar >> start [
	^programFile
]

{ #category : #grammar }
PP2FortranSrcGrammar >> statement [
	^ "stDeclaration / stStructure / stIntent / stOptional / stPublic / stPrivate / stProtected / stSave / stDimension / stAllocatable / stAsynchronous / stPointer / stTarget / stValue / stVolatile / stData / stAutomatic / ststatic / stNamelist / stParameter / stExternal / stIntrinsic / stCommon / stEquivalence / stFormat /" stImplicit "/ stEntry / stInclude / stDo / stDoWhile / stEnddo / stCycle / stExit / stIfLogical / stIfArithmetic / stSelectCase / stCase / stEndcase / stFunction / stExpressionAssign / stPointerAssign / stLabelAssign / stGotoUnconditional / stGotoAssigned / stGotoComputed / stCall / stReturn / stContinue / ststop / stPause / stRead / stRead2 / stWrite / stPrint / stTypePrint / stOpen / stClose / stFlush / stInquire / stRewind / stRewind2 / stBackspace / stBackspace2 / stEndfile / stEndfile2 / stAllocate / stNullify / stDeallocate / stWhere / stWhereConstruct / stElsewhere / stEndWhere / stUse / stModuleProcedure / stProcedure / stType / stEndType / stSequence / stForall / stForallstatement / stEndForall / stImport / stEnum / stEnumerator / stEndEnum / stFormatBogus"
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
PP2FortranSrcGrammar >> tkCloseParen [

	^ self token: ')'
]

{ #category : #token }
PP2FortranSrcGrammar >> tkCloseSquare [

	^ self token: ']'
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
PP2FortranSrcGrammar >> tkOpenParen [

	^ self token: '('
]

{ #category : #token }
PP2FortranSrcGrammar >> tkOpenSquare [

	^ self token: '['
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

	^ (self prelude: 'TypeSpec') , baseType , selector
]

{ #category : #grammar }
PP2FortranSrcGrammar >> valVariable [
	^ 'ValVariable' asPParser trim , tkString 
]

{ #category : #grammar }
PP2FortranSrcGrammar >> value [
	^ tkOpenParen ,
	( "valInteger / valReal / valComplex / valString / valBoz / valHollerith /" valVariable "/ valIntrinsic / valLogical / valOperator / valAssignment / valType / valStar / valColon") ,
	 tkCloseParen
]
