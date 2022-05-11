Class {
	#name : #PP2FortranSrcParserTest,
	#superclass : #PP2FortranSrcGrammarTest,
	#category : #'FortranSrc-Tests'
}

{ #category : #accessing }
PP2FortranSrcParserTest >> parserClass [
	^ PP2FortranSrcParser 
]

{ #category : #tests }
PP2FortranSrcParserTest >> testExpValue [

	self
		parse: 'ExpValue ()
	(3:14)-(3:19)
	(ValVariable "status")'
		rule: #expValue.
]

{ #category : #tests }
PP2FortranSrcParserTest >> testHaskellList [

	| list |
	list := self parse: '[]' rule: #haskellListOfString.
	self assertEmpty: list.
]

{ #category : #tests }
PP2FortranSrcParserTest >> testHaskellListNotEmpty [

	| list |
	list := self parse: '["aa", "bb", "cc"]' rule: #haskellListOfString.
	self assert: list size equals: 3
]

{ #category : #tests }
PP2FortranSrcParserTest >> testProgramFileEmpty [

	self
		parse: 'ProgramFile (MetaInfo
	{miVersion = Fortran77,
	miFilename = "emptyFile.f"})
	[]'
		rule: #programFile.

	self
		assert: (parser model allWithType: FamixFortranProgramFile) size
		equals: 1.

	self
		assert:
			(parser model allWithType: FamixFortranProgramFile) first version
				value
		equals: 'Fortran77'.

	"self
		assert:
			(parser model allWithType: FamixFortranProgramFile) first filename
				value
		equals: 'emptyFile.f'."
		
	self assertEmpty:
		(parser model allWithType: FamixFortranProgramFile) first
			programUnits
]

{ #category : #tests }
PP2FortranSrcParserTest >> testPuSubroutine [

	self
		parse: 'PUSubroutine ()
	(1:7)-(302:9)
	(Nothing, Nothing)
	"subrtn"
	(Just AList ()
		(2:8)-(3:19)
		[ExpValue ()
			(3:14)-(3:19)
			(ValVariable "status")])
	[]
	Nothing'
		rule: #puSubroutine.
	
	
]

{ #category : #tests }
PP2FortranSrcParserTest >> testSubroutine [

	self
		parse: 'ProgramFile (MetaInfo
	{miVersion = Fortran77,
	miFilename = "emptyFile.f"})
	[]'
		rule: #programFile.

	self
		assert: (parser model allWithType: FamixFortranProgramFile) size
		equals: 1.

	self
		assert:
			(parser model allWithType: FamixFortranProgramFile) first version
				value
		equals: 'Fortran77'.

	"self
		assert:
			(parser model allWithType: FamixFortranProgramFile) first filename
				value
		equals: 'emptyFile.f'."

	self assertEmpty:
		(parser model allWithType: FamixFortranProgramFile) first
			programUnits
]
