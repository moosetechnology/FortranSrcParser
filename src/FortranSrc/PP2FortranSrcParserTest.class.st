Class {
	#name : #PP2FortranSrcParserTest,
	#superclass : #PP2FortranSrcGrammarTest,
	#category : #'FortranSrc-Tests'
}

{ #category : #'tests - todo' }
PP2FortranSrcParserTest class >> haskellAst [
	^ ''
]

{ #category : #accessing }
PP2FortranSrcParserTest >> parserClass [
	^ PP2FortranSrcParser 
]

{ #category : #running }
PP2FortranSrcParserTest >> setUp [

	super setUp.
	parser := self parserInstance.
	parser model: FamixFortranModel new
]

{ #category : #'tests-block' }
PP2FortranSrcParserTest >> testBlComment [

	| ast comment |
	ast := self
		       parse: 'BlComment ()
	(4:1)-(4:19)
	(Comment "     some comment  ")'
		       rule: #blComment.

	comment := '     some comment  '.

	self assert: ast content equals: comment.
	
	self
		assert:
		(parser model allWithType: FamixFortranComment) size 
		equals: 1.

	self
		assert:
		(parser model allWithType: FamixFortranComment) first content
		equals: comment
]

{ #category : #tests }
PP2FortranSrcParserTest >> testExpValueInteger [

	| ast |
	ast := self
		       parse: 'ExpValue ()
	(3:14)-(3:19)
	(ValInteger "42" Nothing)'
		       rule: #expValue.

	self assert: ast second equals: 'ValInteger'.
	self assert: ast third equals: 42
]

{ #category : #tests }
PP2FortranSrcParserTest >> testExpValueString [

	| ast |
	ast := self
		       parse: 'ExpValue ()
	(3:14)-(3:19)
	(ValString "a string")'
		       rule: #expValue.

	self assert: ast second equals: 'ValString'.
	self assert: ast third equals: 'a string'
]

{ #category : #tests }
PP2FortranSrcParserTest >> testExpValueType [

	| ast |
	ast := self
		       parse: 'ExpValue ()
	(3:14)-(3:19)
	(ValType "a string")'
		       rule: #expValue.

	self assert: ast second equals: 'ValType'.
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

	self assert: ast second equals: 'ValVariable'.
	self assert: ast third equals: 'status'
]

{ #category : #tests }
PP2FortranSrcParserTest >> testFullHaskellAST [

	| ast |
	ast := self parse: self class haskellAst rule: #programFile.
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
	self assert: list first equals: 'aa'.
	self assert: list second  equals: 'bb'.
	self assert: list third equals: 'cc'
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserTest >> testProgramFileEmpty [

	| ast programFile |
	ast := self
		       parse: 'ProgramFile (MetaInfo
	{miVersion = Fortran77,
	miFilename = "emptyFile.f"})
	[]'
		       rule: #programFile.

	self
		assert: (parser model allWithType: FamixFortranProgramFile) size
		equals: 1.
	programFile := (parser model allWithType: FamixFortranProgramFile)
		               first.

	self assert: programFile version equals: 'Fortran77'.

	self assert: programFile filename equals: 'emptyFile.f'.

	self assertEmpty: programFile programUnits.
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserTest >> testProgramFileNoEmpty [

	| ast progFile |
	ast := self
		       parse: 'ProgramFile (MetaInfo
	{miVersion = Fortran77,
	miFilename = "emptyFile.f"})
	[PUSubroutine ()
	(1:7)-(302:9)
	(Nothing, Nothing)
	"subrtn"
	Nothing
		[]
	Nothing]'
		       rule: #programFile.

	self
		assert: (parser model allWithType: FamixFortranProgramFile) size
		equals: 1.

	progFile := (parser model allWithType: FamixFortranProgramFile) first.

	self assert: progFile programUnits size equals: 1.
	self assert: progFile programUnits first name equals: 'subrtn'
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserTest >> testPuSubroutine [

	| ast subroutine |
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
		assert: (parser model allWithType: FamixFortranSubroutine) size
		equals: 1.

	subroutine := (parser model allWithType: FamixFortranSubroutine)
		              first.

	self assert: subroutine name value equals: 'subrtn'.

	self assert: subroutine parameters size equals: 1.

	self assert: subroutine parameters first name equals: 'status'.

	self assertEmpty: subroutine programUnits
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserTest >> testPuSubroutineWithComment [

	| ast subroutine |
	ast := self
		       parse: 'PUSubroutine ()
	(49:7)-(144:9)
	(Nothing, Nothing)
	"stgbrk"
	Nothing
	[BlComment ()
		(14:1)-(14:72)
		(Comment " xxx(/)xxxxxxxxxxxx"),
	BlComment ()
		(15:1)-(15:1)
		(Comment "")]
	Nothing'
		       rule: #puSubroutine.

	subroutine := (parser model allWithType: FamixFortranSubroutine)
		              first.

	self assert: subroutine name equals: 'stgbrk'.

	self assertEmpty: subroutine parameters.

	self assertEmpty: subroutine programUnits.

	self assert: subroutine comments size equals: 2.
	
	self assert: subroutine comments first content equals: ' xxx(/)xxxxxxxxxxxx'.
	self assert: subroutine comments last content equals: ''.
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserTest >> testPuSubroutineWithNoParameter [

	| ast subroutine |
	ast := self
		       parse: 'PUSubroutine ()
	(49:7)-(144:9)
	(Nothing, Nothing)
	"test01"
	Nothing
	[]
	Nothing'
		       rule: #puSubroutine.

	subroutine := (parser model allWithType: FamixFortranSubroutine)
		              first.

	self assert: subroutine name equals: 'test01'.

	self assertEmpty: subroutine parameters.

	self assertEmpty: subroutine programUnits.
	
	self assertEmpty: subroutine comments.
]

{ #category : #tests }
PP2FortranSrcParserTest >> testPuSubroutineWithSeveralParameters [

	| subroutine |
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
	[BlComment ()
		(14:1)-(14:72)
		(Comment " xxxxxxxxxxxat.t(/1)xxxxxxxx"),
	BlComment ()
		(15:1)-(15:1)
		(Comment "")]
	Nothing'
		rule: #puSubroutine.
	subroutine := (parser model allWithType: FamixFortranSubroutine)
		              first.

	self assert: subroutine name equals: 'stgbrk'.

	self assert: subroutine parameters size equals: 4.

	self
		assertCollection:
		(subroutine parameters collect: [ :param | param name ])
		hasSameElements: #( alist splist rlist status ).

	self assertEmpty: subroutine programUnits.

	self assert: subroutine comments size equals: 2.

	self
		assert: subroutine comments first content
		equals: ' xxxxxxxxxxxat.t(/1)xxxxxxxx'.
	self assert: subroutine comments last content equals: ''
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

{ #category : #'tests-programUnit' }
PP2FortranSrcParserTest >> testTkString [

	| ast |
	ast := self
		       parse: '"aString"'
		       rule: #tkString.
	self assert: ast equals: 'aString'.
		
]
