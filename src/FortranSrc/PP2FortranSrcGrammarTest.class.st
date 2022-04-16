Class {
	#name : #PP2FortranSrcGrammarTest,
	#superclass : #PP2CompositeNodeTest,
	#category : #FortranSrc
}

{ #category : #accessing }
PP2FortranSrcGrammarTest >> parserClass [
	^ PP2FortranSrcGrammar
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testMetaInfo [
	self
		parse: '(MetaInfo
	{miVersion = Fortran77,
	miFilename = "stgbrk.f"})'
		rule: #metaInfo
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testMiFilename [
	self
		parse: 'miFilename = "somefile.f"'
		rule: #miFilename
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testMiVersion [
	self
		parse: 'miVersion = Fortran77'
		rule: #miVersion
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testStringEmpty [
	self
		parse: '""'
		rule: #string
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testStringSimple [
	self
		parse: '"a simple string"'
		rule: #string
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testStringWithDoubleQuote [
	self
		parse: '"A \"string\" inside a string"'
		rule: #string
]
