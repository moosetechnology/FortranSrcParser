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
PP2FortranSrcGrammarTest >> testBlComment [
	self
		parse: 'BlComment ()
	(4:1)-(4:19)
	(Comment "     some comment  ")'
		rule: #blComment
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testComment [
	self
		parse: '(Comment "     some comment  ")'
		rule: #comment
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testExpValue [
	self
		parse: 'ExpValue ()
	(3:14)-(3:19)
	(ValVariable "status")'
		rule: #expValue
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testImpCharacter [

	self
		parse: 'ImpCharacter ()
	(52:25)-(52:27)
	"a"'
		rule: #impCharacter
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testImpList [

	self
		parse: 'ImpList ()
	(52:16)-(52:28)
	(TypeSpec ()
		(52:16)-(52:22)
		TypeLogical
		Nothing)
	(AList ()
		(52:25)-(52:27)
		[ImpRange ()
			(52:25)-(52:27)
			"a"
			"z"])'
		rule: #impList
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testImpRange [

	self
		parse: 'ImpRange ()
	(52:25)-(52:27)
	"a"
	"z"'
		rule: #impRange
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
PP2FortranSrcGrammarTest >> testPosition [
	self
		parse: '(1:7)'
		rule: #position
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testPuSubroutine [
	self
		parse: 'PUSubroutine ()
	(1:7)-(302:9)
	(Nothing, Nothing)
	"stgbrk"
	(Just AList ()
		(2:8)-(3:19)
		[ExpValue ()
			(3:14)-(3:19)
			(ValVariable "status")])
	[]
	Nothing'
		rule: #puSubroutine
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testSrcSpan [
	self
		parse: '(1:7)-(302:9)'
		rule: #srcSpan
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testStringEmpty [
	self
		parse: '""'
		rule: #tkString
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testStringSimple [
	self
		parse: '"a simple string"'
		rule: #tkString
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testStringWithDoubleQuote [
	self
		parse: '"A \"string\" inside a string"'
		rule: #tkString
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testSubRoutineArguments [

	self
		parse: '(Just AList ()
	(2:8)-(3:19)
	[])'
		rule: #subroutineArguments
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testSubroutineBody [
	self
		parse: '[BlComment ()
	(4:1)-(4:19)
	(Comment "     some comment  ")
	]'
		rule: #subroutineBody
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testSubroutineBodyEmpty [
	self
		parse: '[]'
		rule: #subroutineBody
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testValVariable [
	self
		parse: 'ValVariable "status"'
		rule: #valVariable
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testValue [
	self
		parse: '(ValVariable "status")'
		rule: #value
]
