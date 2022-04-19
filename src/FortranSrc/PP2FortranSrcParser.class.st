Class {
	#name : #PP2FortranSrcParser,
	#superclass : #PP2FortranSrcGrammar,
	#category : #FortranSrc
}

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> metaInfo [
	"self parens: (self token: 'MetaInfo') , (self token: '{') , (miParameters delimitedBy: tkComma) , (self token: '}')
	  "
	^ super metaInfo 
	==> [ :nodes |
		(nodes second third detect: [ :each | each isAssociation and: [ each key = 'miFilename' ] ])
			value
	]
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> miFilename [

	"(self token: 'miFilename') , (self token: '=') , tkString"
	^ super miFilename 
	==> [ :nodes |
		nodes first -> nodes third
	]
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> miParameters [
	"miVersion / miFilename"
	^ super miParameters
"	==> [ :nodes |
		1halt
	]"
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> miVersion [

	"(self token: 'miVersion') , (self token: '=') , tkIdentifier"
	^ super miVersion 
	==> [ :nodes |
		nodes first -> nodes third
	]
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> programFile [

	"(self token: 'ProgramFile') , metaInfo , (self haskellList: programUnit)"
	^ super programFile 
	==> [ :nodes |
		FamixFortranProgramFile new
			name: nodes second ;
			body: nodes third ;
			yourself
	]
]

{ #category : #token }
PP2FortranSrcParser >> tkString [
	^ super tkString
	==> [ :nodes | String withAll: nodes second ]
]
