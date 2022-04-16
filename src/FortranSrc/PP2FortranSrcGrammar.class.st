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
		'tkJust',
		'tkAList',
		'expression',
		'expValue',
		'value',
		'valVariable',
		'block',
		'blComment',
		'comment'
	],
	#category : #FortranSrc
}

{ #category : #token }
PP2FortranSrcGrammar >> any [
	^ #any asPParser token trim

]

{ #category : #'grammar-subroutine' }
PP2FortranSrcGrammar >> blComment [
	^ 'BlComment' asPParser trim , emptyTuple , srcSpan , comment
]

{ #category : #'grammar-subroutine' }
PP2FortranSrcGrammar >> block [
	^ "blStatement / blForAll / blIf / blCase / blDo / blDoWhile / blAssociate / blInterface /" blComment
]

{ #category : #grammar }
PP2FortranSrcGrammar >> comment [
	^ tkOpenParen , 'Comment' asPParser trim, tkString , tkCloseParen
]

{ #category : #grammar }
PP2FortranSrcGrammar >> emptyTuple [
	^ tkOpenParen , tkCloseParen
]

{ #category : #grammar }
PP2FortranSrcGrammar >> expValue [
	^ 'ExpValue' asPParser trim , emptyTuple , srcSpan , value
]

{ #category : #grammar }
PP2FortranSrcGrammar >> expression [
	^ expValue "/ expBinary / expUnary / expSubscript / expDataRef / expFunctionalCall / expImpliedDo / expInitialisation / expReturnSpec"
]

{ #category : #'grammar-metaInfo' }
PP2FortranSrcGrammar >> metaInfo [
	^ tkOpenParen ,  'MetaInfo' asPParser trim , '{' asPParser trim , (miParameters delimitedBy: tkComma) , '}' asPParser trim , tkCloseParen
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
PP2FortranSrcGrammar >> position [
	^ tkOpenParen , tkNumber , ':' asPParser , tkNumber, tkCloseParen
]

{ #category : #grammar }
PP2FortranSrcGrammar >> prefixSuffix [
	^ tkOpenParen , tkNothing, tkComma , tkNothing , tkCloseParen
]

{ #category : #grammar }
PP2FortranSrcGrammar >> programFile [
	^ 'ProgramFile' asPParser trim ,  metaInfo , programFileBody
]

{ #category : #grammar }
PP2FortranSrcGrammar >> programFileBody [
	^ tkOpenSquare , (programUnit delimitedBy: tkComma) optional , tkCloseSquare 
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
	^ 'PUComment' asPParser trim , emptyTuple , srcSpan , comment
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
	^'PUSubroutine' asPParser trim , emptyTuple , srcSpan , prefixSuffix , tkString , subroutineArguments , subroutineBody , subPrograms
]

{ #category : #grammar }
PP2FortranSrcGrammar >> srcSpan [
	^ position , '-' asPParser , position
]

{ #category : #accessing }
PP2FortranSrcGrammar >> start [
	^programFile
]

{ #category : #'grammar-subroutine' }
PP2FortranSrcGrammar >> subPrograms [
	^ tkNothing
]

{ #category : #'grammar-subroutine' }
PP2FortranSrcGrammar >> subroutineArguments [
	^ tkOpenParen , tkJust , tkAList , emptyTuple , srcSpan , tkOpenSquare , ( expression separatedBy: tkComma) optional , tkCloseSquare , tkCloseParen
]

{ #category : #'grammar-subroutine' }
PP2FortranSrcGrammar >> subroutineBody [
	^ tkOpenSquare , (block separatedBy: tkComma) optional , tkCloseSquare
]

{ #category : #token }
PP2FortranSrcGrammar >> tkAList [
	^ 'AList' asPParser trim
]

{ #category : #token }
PP2FortranSrcGrammar >> tkCloseParen [
	^ ')' asPParser trim
]

{ #category : #token }
PP2FortranSrcGrammar >> tkCloseSquare [
	^ ']' asPParser trim
]

{ #category : #token }
PP2FortranSrcGrammar >> tkComma [
	^ ',' asPParser trim
]

{ #category : #token }
PP2FortranSrcGrammar >> tkIdentifier [
	^#word asPParser plus token trim
]

{ #category : #token }
PP2FortranSrcGrammar >> tkJust [
	^ 'Just' asPParser trim
]

{ #category : #token }
PP2FortranSrcGrammar >> tkNothing [
	^ 'Nothing' asPParser trim
]

{ #category : #token }
PP2FortranSrcGrammar >> tkNumber [
	^ #digit asPParser plus flatten trim
]

{ #category : #token }
PP2FortranSrcGrammar >> tkOpenParen [
	^ '(' asPParser trim
]

{ #category : #token }
PP2FortranSrcGrammar >> tkOpenSquare [
	^ '[' asPParser trim
]

{ #category : #token }
PP2FortranSrcGrammar >> tkString [
	^ ($" asPParser , ('\"' asPParser / $" asPParser negate) star , $" asPParser) trim
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
