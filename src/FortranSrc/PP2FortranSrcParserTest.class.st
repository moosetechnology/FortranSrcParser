Class {
	#name : #PP2FortranSrcParserTest,
	#superclass : #PP2FortranSrcGrammarTest,
	#category : #'FortranSrc-Tests'
}

{ #category : #accessing }
PP2FortranSrcParserTest >> parserClass [
	^ PP2FortranSrcParser 
]

{ #category : #running }
PP2FortranSrcParserTest >> setUp [

	super setUp.
	parser := self parserInstance.
	parser model: FamixFortranModel new.
]

{ #category : #tests }
PP2FortranSrcParserTest >> testBlComment [
	| ast |
	ast := self
		parse: 'BlComment ()
	(4:1)-(4:19)
	(Comment "     some comment  ")'
		rule: #blComment.

	self 
		assert: ast second second value equals: '     some comment  '
]

{ #category : #tests }
PP2FortranSrcParserTest >> testComment [

	| ast |
	ast := self parse: '(Comment "some comment")' rule: #comment.

	self assert: ast first value equals: 'Comment'.
	self assert: ast second value equals: 'some comment'
]

{ #category : #tests }
PP2FortranSrcParserTest >> testExpValueString [

	| ast |
	ast := self
		       parse: 'ExpValue ()
	(3:14)-(3:19)
	(ValString "a string")'
		       rule: #expValue.

	self assert: ast first equals: 'ValString'.
	self assert: ast third equals: 'a string'
]

{ #category : #tests }
PP2FortranSrcParserTest >> testExpValueVariable [

	| ast |
	ast := self
		       parse: 'ExpValue ()
	(3:14)-(3:19)
	(ValVariable "status")'
		       rule: #expValue.

	self assert: ast first equals: 'ValVariable'.
	self assert: ast third equals: 'status'
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
	self assert: list size equals: 3.
	self assert: list first second equals: 'aa'.
	self assert: list second second  equals: 'bb'.
	self assert: list third second equals: 'cc'
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserTest >> testProgramFileEmpty [

	| ast |
	ast := self
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

	self
		assert:
			(parser model allWithType: FamixFortranProgramFile) first filename second
				value
		equals: 'emptyFile.f'.
		
	self assertEmpty:
		(parser model allWithType: FamixFortranProgramFile) first
			programUnits
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserTest >> testPuSubroutine [

	| ast |
	ast := self
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

	self
		assert:
		(parser model allWithType: FamixFortranSubroutine) first name value
		equals: '"subrtn"'.

	self
		assert:
			(parser model allWithType: FamixFortranSubroutine) first parameters
				size
		equals: 1.

	self assertCollection: ((parser model allWithType: FamixFortranSubroutine) first
			parameters collect: [ :param | param name ]) hasSameElements: #(status).

	self assertEmpty:
		(parser model allWithType: FamixFortranSubroutine) first
			programUnits
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserTest >> testPuSubroutineWithComment [

	| ast |
	ast := self
		       parse: 'PUSubroutine ()
	(49:7)-(144:9)
	(Nothing, Nothing)
	"test01"
	Nothing
	[BlComment ()
		(4:1)-(4:19)
		(Comment "     some comment  ")]
	Nothing'
		       rule: #puSubroutine.

	self
		assert:
		(parser model allWithType: FamixFortranSubroutine) first name value
		equals: '"test01"'.

	self assertEmpty:
		(parser model allWithType: FamixFortranSubroutine) first parameters.

	self assertEmpty:
		(parser model allWithType: FamixFortranSubroutine) first
			programUnits
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserTest >> testPuSubroutineWithNoParameter [

	| ast |
	ast := self parse: 'PUSubroutine ()
	(49:7)-(144:9)
	(Nothing, Nothing)
	"test01"
	Nothing
	[]
	Nothing'
		rule: #puSubroutine.

	self
		assert:
			(parser model allWithType: FamixFortranSubroutine) first name value
		equals: '"test01"'.

	self assertEmpty:
		(parser model allWithType: FamixFortranSubroutine) first parameters.

	self assertEmpty:
		(parser model allWithType: FamixFortranSubroutine) first
			programUnits
]

{ #category : #tests }
PP2FortranSrcParserTest >> testPuSubroutineWithSeveralParameters [

	self
		parse: 'PUSubroutine ()
	(1:7)-(302:9)
	(Nothing, Nothing)
	"stgbrk"
	(Just AList ()
		(2:8)-(3:19)
		[ExpValue ()
			(2:8)-(2:12)
			(ValVariable "alist"),
		ExpValue ()
			(2:14)-(2:19)
			(ValVariable "splist"),
		ExpValue ()
			(3:8)-(3:12)
			(ValVariable "rlist"),
		ExpValue ()
			(3:14)-(3:19)
			(ValVariable "status")])
	[]
	Nothing'
		rule: #puSubroutine.

	self
		assert:
		(parser model allWithType: FamixFortranSubroutine) first name value
		equals: '"stgbrk"'.

	self
		assert:
			(parser model allWithType: FamixFortranSubroutine) first parameters
				size
		equals: 4.

	self
		assertCollection:
			((parser model allWithType: FamixFortranSubroutine) first
				 parameters collect: [ :param | param name ])
		hasSameElements: #( alist splist rlist status ).

	self assertEmpty:
		(parser model allWithType: FamixFortranSubroutine) first
			programUnits
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserTest >> testSrcSpan [
	| ast |
	ast := self
		parse: '(1:7)-(302:9)'
		rule: #srcSpan.
	
	self assertCollection: ast hasSameElements: {1@7 . 302@9}.

	ast := self
		parse: '(2:8)-(3:19)'
		rule: #srcSpan.
	
	self assertCollection: ast hasSameElements: {2@8 . 3@19}
]
