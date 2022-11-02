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

{ #category : #'tests-block' }
PP2FortranSrcParserTest >> testBlCommentEsope [

	| ast comment |
	ast := self
		       parse: 'BlComment ()
	(332:1)-(332:25)
	(Comment "ESO  segact,alist")'
		       rule: #blComment.
	comment := 'ESO  segact,alist'.
	self assert: ast content equals: comment.
	self
		assert: (parser model allWithType: FamixEsopeComment) size
		equals: 1.
	self
		assert: (parser model allWithType: FamixEsopeComment) first content
		equals: comment.
	self
		assert: (parser model allWithType: FamixEsopeComment) first class
		equals: FamixEsopeComment
]

{ #category : #'tests-block' }
PP2FortranSrcParserTest >> testBlStatement [

	| ast |
	ast := self
		       parse: 'BlStatement ()
	(62:7)-(62:18)
	Nothing
	(StCall ()
	(108:7)-(108:45)
	(ExpValue ()
		(108:12)-(108:17)
		(ValVariable "edmess"))
	(Just AList ()
		(108:18)-(108:45)
		[Argument ()
			(108:19)-(108:44)
			Nothing
			(ArgExpr (ExpValue ()                                                                        					(108:19)-(108:44)
					(ValString "valrma: routine en echec")))]))'
		       rule: #blStatement.

	self
		assert: (parser model allWithType: FamixFortranInvocation) size
		equals: 1.
	self assert: ast candidates size equals: 1.
	self assert: ast candidates first name equals: 'edmess'.
]

{ #category : #'tests-expression' }
PP2FortranSrcParserTest >> testExpFunctionCall [

	| ast |
	ast := self
		       parse: 'ExpFunctionCall ()
	(118:10)-(118:47)
	(ExpValue ()
		(118:10)-(118:12)
		(ValIntrinsic "abs"))
	(Just AList ()
		(118:14)-(118:46)
		[])'
		       rule: #expFunctionCall.
	self assert: ast candidates size equals: 1.
	self assert: ast candidates first name equals: 'abs'.
	self assert: ast candidates first isIntrinsic.
]

{ #category : #'tests-expression' }
PP2FortranSrcParserTest >> testExpUnary [

	| ast |
	ast := self
		       parse: 'ExpUnary ()
	(118:21)-(118:25)
	Minus
	(ExpValue ()
		(118:22)-(118:25)
		(ValInteger "0008" Nothing))'
		       rule: #expUnary.

	self assert: ast first equals: 'ExpUnary'.
	self assert: ast third equals: 'Minus'.
	self assert: ast fourth second equals: 'ValInteger'.
	self assert: ast fourth third  equals: 8
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

{ #category : #'tests - allnodes' }
PP2FortranSrcParserTest >> testFullFileStgbrk [

	| ast |
	ast := self parse: self class stgbrkAst rule: #start.
	self assert: ast first name equals: 'stgbrk'.
	self assert: ast first comments size equals: 140.
	self assert: ast first outgoingInvocations size equals: 22.
	self
		assert: ast first outgoingInvocations first signature
		equals: 'CALLOOOWIN(OO4,0,''STGBRK 20 RLIST '',OO1,2+NLIST)'.
	self
		assert: ast first outgoingInvocations first sender name
		equals: 'stgbrk'.
	self
		assert: ast first outgoingInvocations first candidates size
		equals: 1.

	self
		assert: ast first outgoingInvocations first candidates first name
		equals: 'ooowin'
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserTest >> testFullFileStgbrkEso [

	| ast |
	ast := self parse: self class stgbrkAstEso rule: #start.
	self assert: ast first name equals: 'stgbrk'.
	self assert: ast first comments size equals: 131.
	self assert: ast first outgoingInvocations size equals: 16.
	self
		assert: ast first outgoingInvocations last signature
		equals: 'ESOar(ESOat(rlist,elist),ESOat(rlist,ilist))=ms'.
	self
		assert: ast first outgoingInvocations first sender name
		equals: 'stgbrk'.
	self
		assert: ast first outgoingInvocations first candidates size
		equals: 1.

	self
		assert: ast first outgoingInvocations last candidates first name
		equals: 'esoar'
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserTest >> testFullFileStgget [

	| ast |
	ast := self parse: self class stggetAst rule: #start.
	self assert: ast first name equals: 'stgget'.
	self assert: ast first comments size equals: 80.
	self assert: ast first outgoingInvocations size equals: 6.
	self
		assert: ast first outgoingInvocations second signature
		equals: 'CALLOOOWAC(OO4,0,''STGGET 15 XS '',OO1,0)'.
	self
		assert: ast first outgoingInvocations first sender name
		equals: 'stgget'.
	self
		assert: ast first outgoingInvocations first candidates size
		equals: 1.

	self
		assert: ast first outgoingInvocations first candidates first name
		equals: 'abs'
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserTest >> testFullFileStgglu [

	| ast |
	ast := self parse: self class stggluAst rule: #start.
	self assert: ast first name equals: 'stgglu'.
	self assert: ast first comments size equals: 93.
	self assert: ast first outgoingInvocations size equals: 14.
	self
		assert: ast first outgoingInvocations second signature
		equals: 'CALLOOOWAC(OO4,0,''STGGLU 19 ZS '',OO1,0)'.
	self
		assert: ast first outgoingInvocations first sender name
		equals: 'stgglu'.
	self
		assert: ast first outgoingInvocations first candidates size
		equals: 1.

	self
		assert: ast first outgoingInvocations second candidates first name
		equals: 'ooowac'
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserTest >> testFullFileStglen [

	| ast |
	ast := self parse: self class stglenAst rule: #start.
	self assert: ast first name equals: 'stglen'.
	self assert: ast first comments size equals: 63.
	self assert: ast first outgoingInvocations size equals: 3.
	self
		assert: ast first outgoingInvocations second signature
		equals: 'CALLOOOWAC(OO4,0,''STGLEN 13 XS '',OO1,0)'.
	self
		assert: ast first outgoingInvocations first sender name
		equals: 'stglen'.
	self
		assert: ast first outgoingInvocations first candidates size
		equals: 1.

	self
		assert: ast first outgoingInvocations second candidates first name
		equals: 'ooowac'
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserTest >> testFullFileStglow [

	| ast |
	ast := self parse: self class stglowAst rule: #start.
	self assert: ast first name equals: 'stglow'.
	self assert: ast first comments size equals: 65.
	self assert: ast first outgoingInvocations size equals: 5.
	self
		assert: ast first outgoingInvocations second signature
		equals: 'CALLOOOWI1(OO4,0,''STGLOW 13 RS '',OO6,OO5)'.
	self
		assert: ast first outgoingInvocations first sender name
		equals: 'stglow'.
	self
		assert: ast first outgoingInvocations first candidates size
		equals: 1.

	self
		assert: ast first outgoingInvocations second candidates first name
		equals: 'ooowi1'
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserTest >> testFullFileStgset [

	| ast |
	ast := self parse: self class stgsetAst rule: #start.
	self assert: ast first name equals: 'stgset'.
	self assert: ast first comments size equals: 80.
	self assert: ast first outgoingInvocations size equals: 7.
	self
		assert: ast first outgoingInvocations third signature
		equals: 'CALLOOOWAC(OO4,0,''STGSET 21 XS '',OO1,0)'.
	self
		assert: ast first outgoingInvocations first sender name
		equals: 'stgset'.
	self
		assert: ast first outgoingInvocations first candidates size
		equals: 1.

	self
		assert: ast first outgoingInvocations third candidates first name
		equals: 'ooowac'
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserTest >> testFullFileStgup [

	| ast |
	ast := self parse: self class stgupAst rule: #start.
	self assert: ast first name equals: 'stgup'.
	self assert: ast first comments size equals: 65.
	self assert: ast first outgoingInvocations size equals: 5.
	self
		assert: ast first outgoingInvocations second signature
		equals: 'CALLOOOWI1(OO4,0,''STGUP 13 RS '',OO6,OO5)'.
	self
		assert: ast first outgoingInvocations first sender name
		equals: 'stgup'.
	self
		assert: ast first outgoingInvocations first candidates size
		equals: 1.

	self
		assert: ast first outgoingInvocations second candidates first name
		equals: 'ooowi1'
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserTest >> testFullFileString [

	| ast |
	ast := self parse: self class stringAst rule: #start.
	self assert: ast first name equals: 'string'.
	self assert: ast first comments size equals: 110.
	self assert: ast first outgoingInvocations size equals: 134.
	self
		assert: ast first outgoingInvocations first signature
		equals: 'CALL GLSGET(GLSMOD)'.
	self
		assert: ast first outgoingInvocations first sender name
		equals: 'string'.
	self
		assert: ast first outgoingInvocations first candidates size
		equals: 1.

	self
		assert: ast first outgoingInvocations first candidates first name
		equals: 'glsget'
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserTest >> testFullFileValrma [

	| ast |
	ast := self parse: self class valrmaAst rule: #start.
	self assert: ast first name equals: 'valrma'.
	self assert: ast first comments size equals: 81.
	self assert: ast first outgoingInvocations size equals: 6.
	self
		assert: ast first outgoingInvocations last signature
		equals: 'call edmess()'.
	self
		assert: ast first outgoingInvocations first sender name
		equals: 'valrma'.
	self
		assert: ast first outgoingInvocations first candidates size
		equals: 1.

	self
		assert: ast first outgoingInvocations last candidates first name
		equals: 'edmess'
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
PP2FortranSrcParserTest >> testMaybe [

	self assert: (self parse: '(Just "circle")' rule: #maybeOfString) equals: 'circle'.
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserTest >> testMaybeNothing [

	self assert: (self parse: 'Nothing' rule: #maybeOfString) equals: 'Nothing'
]

{ #category : #'tests-block' }
PP2FortranSrcParserTest >> testPosition [

	self assert: (self parse: '(1:7)' rule: #position) equals: 1 @ 7.
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

{ #category : #'tests-programFile' }
PP2FortranSrcParserTest >> testProgramFileWithPuMain [

	| ast program |
	ast := self parse: 'ProgramFile (MetaInfo
	{miVersion = Fortran77,
	miFilename = "file.f"})	
	[PUMain ()
	(1:7)-(13:9)
	(Just "circle")
	[]
	Nothing]' rule: #programFile.
	self assert: (parser model allWithType: FamixFortranProgram) size equals: 1.

	program := (parser model allWithType: FamixFortranProgram) first.

	self assert: program name equals: 'circle'.

	self assertEmpty: program comments.

	self assertEmpty: program programUnits
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserTest >> testPuMain [

	| ast program |
	ast := self
		       parse: 'PUMain ()
	(1:7)-(13:9)
	(Just "circle")
	[]
	Nothing'
		       rule: #puMain.
	self
		assert: (parser model allWithType: FamixFortranProgram) size
		equals: 1.

	program := (parser model allWithType: FamixFortranProgram)
		              first.

	self assert: program name equals: 'circle'.

	self assertEmpty: program comments.

	self assertEmpty: program programUnits
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

{ #category : #tests }
PP2FortranSrcParserTest >> testPuSubroutineWithSubroutineCall [

	| ast invocations |
	ast := self
		       parse: 'PUSubroutine ()
	(1:7)-(302:9)
	(Nothing, Nothing)
	"stgbrk"
	Nothing
	[BlStatement ()
	(108:7)-(108:19)
	Nothing
	(StCall ()
		(108:7)-(108:19)
		(ExpValue ()
			(108:12)-(108:17)
			(ValVariable "edmess"))
		(Just AList ()
			(108:18)-(108:19)
		[]))]
	Nothing'
		       rule: #puSubroutine.

	invocations := ast outgoingInvocations.

	self assert: invocations size equals: 1.
	self assert: invocations first sender name equals: 'stgbrk'.
	self assert: invocations first candidates size equals: 1.
	self assert: invocations first candidates first name equals: 'edmess'.
	"self assert: invocations first signature equals: 'call edmess()'"
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserTest >> testSrcSpan [
	| ast |
	ast := self
		parse: '(1:7)-(302:9)'
		rule: #srcSpan.
	
	self assert: ast startLine equals: 1.
	self assert: ast endLine equals: 302.
	self assert: ast startColumn equals: 7.
	self assert: ast endColumn equals: 9.
]

{ #category : #'tests-statement' }
PP2FortranSrcParserTest >> testStCall [

	| ast |
	ast := self
		       parse: 'StCall ()
	(108:7)-(108:45)
	(ExpValue ()
		(108:12)-(108:17)
		(ValVariable "edmess"))
	(Just AList ()
		(108:18)-(108:45)
		[Argument ()
			(108:19)-(108:44)
			Nothing
			(ArgExpr (ExpValue ()                                                                        					(108:19)-(108:44)
					(ValString "valrma: routine en echec")))])'
		       rule: #stCall.

	self assert: ast candidates first name equals: 'edmess'.
]

{ #category : #'tests-statement' }
PP2FortranSrcParserTest >> testStFunction [

	| ast |
	ast := self
		       parse: 'StFunction ()
	(100:7)-(100:26)
	(ExpValue ()
		(100:7)-(100:11)
 		(ValVariable "esoat"))
	(AList ()
		(100:13)-(100:23)
		[ExpValue ()
			(100:13)-(100:17)
			(ValVariable "rlist"),
		ExpValue ()
			(100:19)-(100:23)
			(ValVariable "ilist")])
	(ExpValue ()
		(100:26)-(100:26)
		(ValInteger "0" Nothing))'
		       rule: #statement.
	self assert: ast candidates first name equals: 'esoat'
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserTest >> testTkNumber [

	self assert: (self parse: '42' rule: #tkNumber) equals: 42
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserTest >> testTkString [

	| ast |
	ast := self
		       parse: '"aString"'
		       rule: #tkString.
	self assert: ast equals: 'aString'.
		
]

{ #category : #tests }
PP2FortranSrcParserTest >> testValInteger [

	| ast |
	ast := self
		       parse: 'ValInteger "42" Nothing'
		       rule: #value.

	self assert: ast first equals: 'ValInteger'.
	self assert: ast second equals: 42
]

{ #category : #tests }
PP2FortranSrcParserTest >> testValString [

	| ast |
	ast := self
		       parse: 'ValString "a string"'
		       rule: #value.

	self assert: ast first equals: 'ValString'.
	self assert: ast second equals: 'a string'
]

{ #category : #tests }
PP2FortranSrcParserTest >> testValue [

	| ast |
	ast := self parse: 'ValInteger "42" Nothing' rule: #value.

	self assert: ast first equals: 'ValInteger'.
	self assert: ast second equals: 42.

	ast := self parse: 'ValString "a string"' rule: #value.
	self assert: ast first equals: 'ValString'.
	self assert: ast second equals: 'a string'.

	ast := self parse: 'ValVariable "var"' rule: #value.
	self assert: ast first equals: 'ValVariable'.
	self assert: ast second equals: 'var'.

	ast := self parse: 'ValIntrinsic "abs"' rule: #value.

	self assert: ast first equals: 'ValIntrinsic'.
	self assert: ast second equals: 'abs'
]

{ #category : #tests }
PP2FortranSrcParserTest >> testValueInteger [

	| ast |
	ast := self
		       parse: 'ValInteger "42" Nothing'
		       rule: #valInteger.

	self assert: ast first equals: 'ValInteger'.
	self assert: ast second equals: 42
]
