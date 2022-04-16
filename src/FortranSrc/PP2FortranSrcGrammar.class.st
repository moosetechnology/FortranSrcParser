Class {
	#name : #PP2FortranSrcGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'any',
		'programFile',
		'programUnitList',
		'metaInfo',
		'miVersion',
		'miFilename',
		'string',
		'miParameters',
		'identifier',
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
		'subPrograms'
	],
	#category : #FortranSrc
}

{ #category : #token }
PP2FortranSrcGrammar >> any [
	^ #any asPParser token trim

]

{ #category : #token }
PP2FortranSrcGrammar >> identifier [
	^#word asPParser plus token trim
]

{ #category : #grammar }
PP2FortranSrcGrammar >> metaInfo [
	^ '(' asPParser trim ,  'MetaInfo' asPParser trim , '{' asPParser trim , miParameters , '}' asPParser trim , ')' asPParser trim
]

{ #category : #grammar }
PP2FortranSrcGrammar >> miFilename [
	^ 'miFilename' asPParser trim , '=' asPParser trim , string
]

{ #category : #grammar }
PP2FortranSrcGrammar >> miParameters [
	^(miVersion / miFilename) , ( ',' asPParser trim , miParameters) optional
]

{ #category : #grammar }
PP2FortranSrcGrammar >> miVersion [
	^ 'miVersion' asPParser trim , '=' asPParser trim , identifier
]

{ #category : #grammar }
PP2FortranSrcGrammar >> prefixSuffix [
	^any
]

{ #category : #grammar }
PP2FortranSrcGrammar >> programFile [
	^ 'ProgramFile' asPParser trim ,  metaInfo , programFileBody
]

{ #category : #grammar }
PP2FortranSrcGrammar >> programFileBody [
	^ '[' asPParser trim , programUnitList , ']' asPParser trim 
]

{ #category : #grammar }
PP2FortranSrcGrammar >> programUnit [
	^ puMain / puModule / puSubroutine / puFunction / puBlockData / puComment
]

{ #category : #grammar }
PP2FortranSrcGrammar >> programUnitList [
	^ programUnit , ( ',' asPParser trim , programUnit) star
]

{ #category : #grammar }
PP2FortranSrcGrammar >> puBlockData [
	^any
]

{ #category : #grammar }
PP2FortranSrcGrammar >> puComment [
	^any
]

{ #category : #grammar }
PP2FortranSrcGrammar >> puFunction [
	^any
]

{ #category : #grammar }
PP2FortranSrcGrammar >> puMain [
	^any
]

{ #category : #grammar }
PP2FortranSrcGrammar >> puModule [
	^any
]

{ #category : #grammar }
PP2FortranSrcGrammar >> puSubroutine [
	^'PUSubroutine' asPParser trim , '()' asPParser trim , srcSpan , prefixSuffix , string , subroutineArguments , subroutineBody , subPrograms
]

{ #category : #grammar }
PP2FortranSrcGrammar >> srcSpan [
	^any
]

{ #category : #accessing }
PP2FortranSrcGrammar >> start [
	^programFile
]

{ #category : #token }
PP2FortranSrcGrammar >> string [
	^ ($" asPParser , ('\"' asPParser / $" asPParser negate) star , $" asPParser) trim
]

{ #category : #grammar }
PP2FortranSrcGrammar >> subPrograms [
	^any
]

{ #category : #grammar }
PP2FortranSrcGrammar >> subroutineArguments [
	^any
]

{ #category : #grammar }
PP2FortranSrcGrammar >> subroutineBody [
	^any
]
