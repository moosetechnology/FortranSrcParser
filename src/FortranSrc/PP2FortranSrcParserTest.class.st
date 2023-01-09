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

{ #category : #'tests - allnodes' }
PP2FortranSrcParserTest >> testEsoAr [

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
PP2FortranSrcParserTest >> testExpFunctionCallWithParameters [

	| ast |
	ast := self
		       parse: 'ExpFunctionCall ()
	(21:13)-(21:25)
   (ExpValue ()
   		(21:13)-(21:17)
   		(ValVariable "esosl"))
   (Just AList ()
       (21:19)-(21:24)
       [Argument ()
           (21:19)-(21:20)
           Nothing
           (ArgExpr (ExpValue ()
           (21:19)-(21:20)
           (ValVariable "t1"))),
       Argument ()
           (21:22)-(21:24)
           Nothing
          (ArgExpr (ExpValue ()
             (21:22)-(21:24)
             (ValVariable "tab")))])'
		       rule: #expFunctionCall.
	self assert: ast candidates size equals: 1.
	self assert: ast candidates first name equals: 'esosl'.
	self assert: ast candidates first parameters size equals: 2.
	self assert: ast candidates first parameters first name equals: 't1'.
	self assert: ast candidates first parameters last name equals: 'tab'.
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
PP2FortranSrcParserTest >> testFullAstWithMultipleProcedure [

	| ast |
	ast := self parse: self class fullAst rule: #start.
	1halt.
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

{ #category : #'tests-programUnit' }
PP2FortranSrcParserTest >> testProgramFileNoEmptyTmp [

	| ast progFile |
	ast := self
		       parse: 'ProgramFile (MetaInfo
                     {miVersion = Fortran77,
                      miFilename = "/Users/sow/Documents/framacode/demo/build/f77_intrinsics.f"})
            [PUMain ()
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
PP2FortranSrcParserTest >> testProgramFileWithPuMainTmp [

	| ast progFile |
	ast := self
		       parse: 'ProgramFile (MetaInfo
   {miVersion = Fortran77,
   miFilename = "f77_intrinsics.f"})
	[PUMain ()
   (1:7)-(95:9)
   (Just "main")
	[BlComment ()
                               (3:1)-(3:72)
                               (Comment "*********************************************************************72"),
                     BlComment () (4:1)-(4:1) (Comment ""),
                     BlComment ()
                               (5:1)-(5:47)
                               (Comment "c main is the main program for f77_intrinsics."),
                     BlComment () (6:1)-(6:1) (Comment ""),
                     BlComment () (7:1)-(7:14) (Comment "  discussion:"),
                     BlComment () (8:1)-(8:1) (Comment ""),
                     BlComment ()
                               (9:1)-(9:55)
                               (Comment "    f77_intrinsics tests fortran77 intrinsic routines."),
                     BlComment () (10:1)-(10:1) (Comment ""),
                     BlComment () (11:1)-(11:13) (Comment "  licensing:"),
                     BlComment () (12:1)-(12:1) (Comment ""),
                     BlComment ()
                               (13:1)-(13:57)
                               (Comment "    this code is distributed under the gnu lgpl license."),
                     BlComment () (14:1)-(14:1) (Comment ""),
                     BlComment () (15:1)-(15:12) (Comment "  modified:"),
                     BlComment () (16:1)-(16:1) (Comment ""),
                     BlComment ()
                               (17:1)-(17:17)
                               (Comment "    02 june 2007"),
                     BlComment () (18:1)-(18:1) (Comment ""),
                     BlComment () (19:1)-(19:10) (Comment "  author:"),
                     BlComment () (20:1)-(20:1) (Comment ""),
                     BlComment ()
                               (21:1)-(21:18)
                               (Comment "    john burkardt"),
                     BlComment () (22:1)-(22:1) (Comment ""),
                     BlStatement ()
                                 (23:7)-(23:19)
                                 Nothing
                                 (StImplicit () (23:7)-(23:19) Nothing),
                     BlStatement ()
                                 (25:7)-(25:24)
                                 Nothing
                                 (StCall ()
                                         (25:7)-(25:24)
                                         (ExpValue ()
                                                   (25:12)-(25:20)
                                                   (ValVariable "timestamp"))
                                         (Just AList () (25:22)-(25:24) [])),
                     BlStatement ()
                                 (27:7)-(27:28)
                                 Nothing
                                 (StWrite ()
                                          (27:7)-(27:28)
                                          (AList ()
                                                 (27:13)-(27:24)
                                                 [ControlPair ()
                                                              (27:15)-(27:15)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (27:15)-(27:15)
                                                                        ValStar),
                                                  ControlPair ()
                                                              (27:18)-(27:22)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (27:18)-(27:22)
                                                                        (ValString "(a)"))])
                                          (Just AList ()
                                                      (27:26)-(27:28)
                                                      [ExpValue ()
                                                                (27:26)-(27:28)
                                                                (ValString " ")])),
                     BlStatement ()
                                 (28:7)-(28:41)
                                 Nothing
                                 (StWrite ()
                                          (28:7)-(28:41)
                                          (AList ()
                                                 (28:13)-(28:24)
                                                 [ControlPair ()
                                                              (28:15)-(28:15)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (28:15)-(28:15)
                                                                        ValStar),
                                                  ControlPair ()
                                                              (28:18)-(28:22)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (28:18)-(28:22)
                                                                        (ValString "(a)"))])
                                          (Just AList ()
                                                      (28:26)-(28:41)
                                                      [ExpValue ()
                                                                (28:26)-(28:41)
                                                                (ValString "F77_INTRINSICS")])),
                     BlStatement ()
                                 (29:7)-(29:46)
                                 Nothing
                                 (StWrite ()
                                          (29:7)-(29:46)
                                          (AList ()
                                                 (29:13)-(29:24)
                                                 [ControlPair ()
                                                              (29:15)-(29:15)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (29:15)-(29:15)
                                                                        ValStar),
                                                  ControlPair ()
                                                              (29:18)-(29:22)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (29:18)-(29:22)
                                                                        (ValString "(a)"))])
                                          (Just AList ()
                                                      (29:26)-(29:46)
                                                      [ExpValue ()
                                                                (29:26)-(29:46)
                                                                (ValString "  FORTRAN77 version")])),
                     BlStatement ()
                                 (30:7)-(30:62)
                                 Nothing
                                 (StWrite ()
                                          (30:7)-(30:62)
                                          (AList ()
                                                 (30:13)-(30:24)
                                                 [ControlPair ()
                                                              (30:15)-(30:15)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (30:15)-(30:15)
                                                                        ValStar),
                                                  ControlPair ()
                                                              (30:18)-(30:22)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (30:18)-(30:22)
                                                                        (ValString "(a)"))])
                                          (Just AList ()
                                                      (30:26)-(30:62)
                                                      [ExpValue ()
                                                                (30:26)-(30:62)
                                                                (ValString "  Test FORTRAN77 intrinsic library.")])),
                     BlStatement ()
                                 (32:7)-(32:19)
                                 Nothing
                                 (StCall ()
                                         (32:7)-(32:19)
                                         (ExpValue ()
                                                   (32:12)-(32:19)
                                                   (ValVariable "test_abs"))
                                         Nothing),
                     BlStatement ()
                                 (33:7)-(33:20)
                                 Nothing
                                 (StCall ()
                                         (33:7)-(33:20)
                                         (ExpValue ()
                                                   (33:12)-(33:20)
                                                   (ValVariable "test_acos"))
                                         Nothing),
                     BlStatement ()
                                 (34:7)-(34:21)
                                 Nothing
                                 (StCall ()
                                         (34:7)-(34:21)
                                         (ExpValue ()
                                                   (34:12)-(34:21)
                                                   (ValVariable "test_aimag"))
                                         Nothing),
                     BlStatement ()
                                 (35:7)-(35:20)
                                 Nothing
                                 (StCall ()
                                         (35:7)-(35:20)
                                         (ExpValue ()
                                                   (35:12)-(35:20)
                                                   (ValVariable "test_aint"))
                                         Nothing),
                     BlStatement ()
                                 (36:7)-(36:21)
                                 Nothing
                                 (StCall ()
                                         (36:7)-(36:21)
                                         (ExpValue ()
                                                   (36:12)-(36:21)
                                                   (ValVariable "test_anint"))
                                         Nothing),
                     BlStatement ()
                                 (37:7)-(37:20)
                                 Nothing
                                 (StCall ()
                                         (37:7)-(37:20)
                                         (ExpValue ()
                                                   (37:12)-(37:20)
                                                   (ValVariable "test_asin"))
                                         Nothing),
                     BlStatement ()
                                 (38:7)-(38:20)
                                 Nothing
                                 (StCall ()
                                         (38:7)-(38:20)
                                         (ExpValue ()
                                                   (38:12)-(38:20)
                                                   (ValVariable "test_atan"))
                                         Nothing),
                     BlStatement ()
                                 (39:7)-(39:21)
                                 Nothing
                                 (StCall ()
                                         (39:7)-(39:21)
                                         (ExpValue ()
                                                   (39:12)-(39:21)
                                                   (ValVariable "test_atan2"))
                                         Nothing),
                     BlStatement ()
                                 (40:7)-(40:21)
                                 Nothing
                                 (StCall ()
                                         (40:7)-(40:21)
                                         (ExpValue ()
                                                   (40:12)-(40:21)
                                                   (ValVariable "test_btest"))
                                         Nothing),
                     BlStatement ()
                                 (41:7)-(41:20)
                                 Nothing
                                 (StCall ()
                                         (41:7)-(41:20)
                                         (ExpValue ()
                                                   (41:12)-(41:20)
                                                   (ValVariable "test_char"))
                                         Nothing),
                     BlStatement ()
                                 (42:7)-(42:21)
                                 Nothing
                                 (StCall ()
                                         (42:7)-(42:21)
                                         (ExpValue ()
                                                   (42:12)-(42:21)
                                                   (ValVariable "test_cmplx"))
                                         Nothing),
                     BlStatement ()
                                 (43:7)-(43:21)
                                 Nothing
                                 (StCall ()
                                         (43:7)-(43:21)
                                         (ExpValue ()
                                                   (43:12)-(43:21)
                                                   (ValVariable "test_conjg"))
                                         Nothing),
                     BlStatement ()
                                 (44:7)-(44:22)
                                 Nothing
                                 (StCall ()
                                         (44:7)-(44:22)
                                         (ExpValue ()
                                                   (44:12)-(44:22)
                                                   (ValVariable "test_cos_c4"))
                                         Nothing),
                     BlStatement ()
                                 (45:7)-(45:22)
                                 Nothing
                                 (StCall ()
                                         (45:7)-(45:22)
                                         (ExpValue ()
                                                   (45:12)-(45:22)
                                                   (ValVariable "test_cos_r8"))
                                         Nothing),
                     BlStatement ()
                                 (46:7)-(46:20)
                                 Nothing
                                 (StCall ()
                                         (46:7)-(46:20)
                                         (ExpValue ()
                                                   (46:12)-(46:20)
                                                   (ValVariable "test_cosh"))
                                         Nothing),
                     BlStatement ()
                                 (47:7)-(47:20)
                                 Nothing
                                 (StCall ()
                                         (47:7)-(47:20)
                                         (ExpValue ()
                                                   (47:12)-(47:20)
                                                   (ValVariable "test_dble"))
                                         Nothing),
                     BlStatement ()
                                 (48:7)-(48:19)
                                 Nothing
                                 (StCall ()
                                         (48:7)-(48:19)
                                         (ExpValue ()
                                                   (48:12)-(48:19)
                                                   (ValVariable "test_dim"))
                                         Nothing),
                     BlStatement ()
                                 (49:7)-(49:21)
                                 Nothing
                                 (StCall ()
                                         (49:7)-(49:21)
                                         (ExpValue ()
                                                   (49:12)-(49:21)
                                                   (ValVariable "test_dprod"))
                                         Nothing),
                     BlStatement ()
                                 (50:7)-(50:19)
                                 Nothing
                                 (StCall ()
                                         (50:7)-(50:19)
                                         (ExpValue ()
                                                   (50:12)-(50:19)
                                                   (ValVariable "test_exp"))
                                         Nothing),
                     BlStatement ()
                                 (51:7)-(51:23)
                                 Nothing
                                 (StCall ()
                                         (51:7)-(51:23)
                                         (ExpValue ()
                                                   (51:12)-(51:23)
                                                   (ValVariable "test_iand_i4"))
                                         Nothing),
                     BlStatement ()
                                 (52:7)-(52:21)
                                 Nothing
                                 (StCall ()
                                         (52:7)-(52:21)
                                         (ExpValue ()
                                                   (52:12)-(52:21)
                                                   (ValVariable "test_ibclr"))
                                         Nothing),
                     BlStatement ()
                                 (53:7)-(53:21)
                                 Nothing
                                 (StCall ()
                                         (53:7)-(53:21)
                                         (ExpValue ()
                                                   (53:12)-(53:21)
                                                   (ValVariable "test_ibits"))
                                         Nothing),
                     BlStatement ()
                                 (54:7)-(54:21)
                                 Nothing
                                 (StCall ()
                                         (54:7)-(54:21)
                                         (ExpValue ()
                                                   (54:12)-(54:21)
                                                   (ValVariable "test_ibset"))
                                         Nothing),
                     BlStatement ()
                                 (55:7)-(55:21)
                                 Nothing
                                 (StCall ()
                                         (55:7)-(55:21)
                                         (ExpValue ()
                                                   (55:12)-(55:21)
                                                   (ValVariable "test_ichar"))
                                         Nothing),
                     BlStatement ()
                                 (56:7)-(56:23)
                                 Nothing
                                 (StCall ()
                                         (56:7)-(56:23)
                                         (ExpValue ()
                                                   (56:12)-(56:23)
                                                   (ValVariable "test_ieor_i4"))
                                         Nothing),
                     BlStatement ()
                                 (57:7)-(57:21)
                                 Nothing
                                 (StCall ()
                                         (57:7)-(57:21)
                                         (ExpValue ()
                                                   (57:12)-(57:21)
                                                   (ValVariable "test_index"))
                                         Nothing),
                     BlStatement ()
                                 (58:7)-(58:19)
                                 Nothing
                                 (StCall ()
                                         (58:7)-(58:19)
                                         (ExpValue ()
                                                   (58:12)-(58:19)
                                                   (ValVariable "test_int"))
                                         Nothing),
                     BlStatement ()
                                 (59:7)-(59:22)
                                 Nothing
                                 (StCall ()
                                         (59:7)-(59:22)
                                         (ExpValue ()
                                                   (59:12)-(59:22)
                                                   (ValVariable "test_ior_i4"))
                                         Nothing),
                     BlStatement ()
                                 (60:7)-(60:21)
                                 Nothing
                                 (StCall ()
                                         (60:7)-(60:21)
                                         (ExpValue ()
                                                   (60:12)-(60:21)
                                                   (ValVariable "test_ishft"))
                                         Nothing),
                     BlStatement ()
                                 (61:7)-(61:22)
                                 Nothing
                                 (StCall ()
                                         (61:7)-(61:22)
                                         (ExpValue ()
                                                   (61:12)-(61:22)
                                                   (ValVariable "test_ishftc"))
                                         Nothing),
                     BlStatement ()
                                 (62:7)-(62:19)
                                 Nothing
                                 (StCall ()
                                         (62:7)-(62:19)
                                         (ExpValue ()
                                                   (62:12)-(62:19)
                                                   (ValVariable "test_len"))
                                         Nothing),
                     BlStatement ()
                                 (63:7)-(63:24)
                                 Nothing
                                 (StCall ()
                                         (63:7)-(63:24)
                                         (ExpValue ()
                                                   (63:12)-(63:24)
                                                   (ValVariable "test_len_trim"))
                                         Nothing),
                     BlStatement ()
                                 (64:7)-(64:19)
                                 Nothing
                                 (StCall ()
                                         (64:7)-(64:19)
                                         (ExpValue ()
                                                   (64:12)-(64:19)
                                                   (ValVariable "test_lge"))
                                         Nothing),
                     BlStatement ()
                                 (65:7)-(65:19)
                                 Nothing
                                 (StCall ()
                                         (65:7)-(65:19)
                                         (ExpValue ()
                                                   (65:12)-(65:19)
                                                   (ValVariable "test_lgt"))
                                         Nothing),
                     BlStatement ()
                                 (66:7)-(66:19)
                                 Nothing
                                 (StCall ()
                                         (66:7)-(66:19)
                                         (ExpValue ()
                                                   (66:12)-(66:19)
                                                   (ValVariable "test_lle"))
                                         Nothing),
                     BlStatement ()
                                 (67:7)-(67:19)
                                 Nothing
                                 (StCall ()
                                         (67:7)-(67:19)
                                         (ExpValue ()
                                                   (67:12)-(67:19)
                                                   (ValVariable "test_llt"))
                                         Nothing),
                     BlStatement ()
                                 (68:7)-(68:19)
                                 Nothing
                                 (StCall ()
                                         (68:7)-(68:19)
                                         (ExpValue ()
                                                   (68:12)-(68:19)
                                                   (ValVariable "test_log"))
                                         Nothing),
                     BlStatement ()
                                 (69:7)-(69:21)
                                 Nothing
                                 (StCall ()
                                         (69:7)-(69:21)
                                         (ExpValue ()
                                                   (69:12)-(69:21)
                                                   (ValVariable "test_log10"))
                                         Nothing),
                     BlStatement ()
                                 (70:7)-(70:19)
                                 Nothing
                                 (StCall ()
                                         (70:7)-(70:19)
                                         (ExpValue ()
                                                   (70:12)-(70:19)
                                                   (ValVariable "test_max"))
                                         Nothing),
                     BlStatement ()
                                 (71:7)-(71:19)
                                 Nothing
                                 (StCall ()
                                         (71:7)-(71:19)
                                         (ExpValue ()
                                                   (71:12)-(71:19)
                                                   (ValVariable "test_min"))
                                         Nothing),
                     BlStatement ()
                                 (72:7)-(72:22)
                                 Nothing
                                 (StCall ()
                                         (72:7)-(72:22)
                                         (ExpValue ()
                                                   (72:12)-(72:22)
                                                   (ValVariable "test_mod_i4"))
                                         Nothing),
                     BlStatement ()
                                 (73:7)-(73:22)
                                 Nothing
                                 (StCall ()
                                         (73:7)-(73:22)
                                         (ExpValue ()
                                                   (73:12)-(73:22)
                                                   (ValVariable "test_mod_r4"))
                                         Nothing),
                     BlStatement ()
                                 (74:7)-(74:22)
                                 Nothing
                                 (StCall ()
                                         (74:7)-(74:22)
                                         (ExpValue ()
                                                   (74:12)-(74:22)
                                                   (ValVariable "test_mvbits"))
                                         Nothing),
                     BlStatement ()
                                 (75:7)-(75:20)
                                 Nothing
                                 (StCall ()
                                         (75:7)-(75:20)
                                         (ExpValue ()
                                                   (75:12)-(75:20)
                                                   (ValVariable "test_nint"))
                                         Nothing),
                     BlStatement ()
                                 (76:7)-(76:22)
                                 Nothing
                                 (StCall ()
                                         (76:7)-(76:22)
                                         (ExpValue ()
                                                   (76:12)-(76:22)
                                                   (ValVariable "test_not_i4"))
                                         Nothing),
                     BlStatement ()
                                 (77:7)-(77:23)
                                 Nothing
                                 (StCall ()
                                         (77:7)-(77:23)
                                         (ExpValue ()
                                                   (77:12)-(77:23)
                                                   (ValVariable "test_real_c4"))
                                         Nothing),
                     BlStatement ()
                                 (78:7)-(78:20)
                                 Nothing
                                 (StCall ()
                                         (78:7)-(78:20)
                                         (ExpValue ()
                                                   (78:12)-(78:20)
                                                   (ValVariable "test_sign"))
                                         Nothing),
                     BlStatement ()
                                 (79:7)-(79:22)
                                 Nothing
                                 (StCall ()
                                         (79:7)-(79:22)
                                         (ExpValue ()
                                                   (79:12)-(79:22)
                                                   (ValVariable "test_sin_r8"))
                                         Nothing),
                     BlStatement ()
                                 (80:7)-(80:20)
                                 Nothing
                                 (StCall ()
                                         (80:7)-(80:20)
                                         (ExpValue ()
                                                   (80:12)-(80:20)
                                                   (ValVariable "test_sinh"))
                                         Nothing),
                     BlStatement ()
                                 (81:7)-(81:20)
                                 Nothing
                                 (StCall ()
                                         (81:7)-(81:20)
                                         (ExpValue ()
                                                   (81:12)-(81:20)
                                                   (ValVariable "test_sqrt"))
                                         Nothing),
                     BlStatement ()
                                 (82:7)-(82:19)
                                 Nothing
                                 (StCall ()
                                         (82:7)-(82:19)
                                         (ExpValue ()
                                                   (82:12)-(82:19)
                                                   (ValVariable "test_tan"))
                                         Nothing),
                     BlStatement ()
                                 (83:7)-(83:20)
                                 Nothing
                                 (StCall ()
                                         (83:7)-(83:20)
                                         (ExpValue ()
                                                   (83:12)-(83:20)
                                                   (ValVariable "test_tanh"))
                                         Nothing),
                     BlComment () (84:1)-(84:1) (Comment ""),
                     BlComment () (85:1)-(85:13) (Comment "  terminate."),
                     BlComment () (86:1)-(86:1) (Comment ""),
                     BlStatement ()
                                 (87:7)-(87:28)
                                 Nothing
                                 (StWrite ()
                                          (87:7)-(87:28)
                                          (AList ()
                                                 (87:13)-(87:24)
                                                 [ControlPair ()
                                                              (87:15)-(87:15)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (87:15)-(87:15)
                                                                        ValStar),
                                                  ControlPair ()
                                                              (87:18)-(87:22)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (87:18)-(87:22)
                                                                        (ValString "(a)"))])
                                          (Just AList ()
                                                      (87:26)-(87:28)
                                                      [ExpValue ()
                                                                (87:26)-(87:28)
                                                                (ValString " ")])),
                     BlStatement ()
                                 (88:7)-(88:41)
                                 Nothing
                                 (StWrite ()
                                          (88:7)-(88:41)
                                          (AList ()
                                                 (88:13)-(88:24)
                                                 [ControlPair ()
                                                              (88:15)-(88:15)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (88:15)-(88:15)
                                                                        ValStar),
                                                  ControlPair ()
                                                              (88:18)-(88:22)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (88:18)-(88:22)
                                                                        (ValString "(a)"))])
                                          (Just AList ()
                                                      (88:26)-(88:41)
                                                      [ExpValue ()
                                                                (88:26)-(88:41)
                                                                (ValString "F77_INTRINSICS")])),
                     BlStatement ()
                                 (89:7)-(89:53)
                                 Nothing
                                 (StWrite ()
                                          (89:7)-(89:53)
                                          (AList ()
                                                 (89:13)-(89:24)
                                                 [ControlPair ()
                                                              (89:15)-(89:15)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (89:15)-(89:15)
                                                                        ValStar),
                                                  ControlPair ()
                                                              (89:18)-(89:22)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (89:18)-(89:22)
                                                                        (ValString "(a)"))])
                                          (Just AList ()
                                                      (89:26)-(89:53)
                                                      [ExpValue ()
                                                                (89:26)-(89:53)
                                                                (ValString "  Normal end of execution.")])),
                     BlStatement ()
                                 (91:7)-(91:28)
                                 Nothing
                                 (StWrite ()
                                          (91:7)-(91:28)
                                          (AList ()
                                                 (91:13)-(91:24)
                                                 [ControlPair ()
                                                              (91:15)-(91:15)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (91:15)-(91:15)
                                                                        ValStar),
                                                  ControlPair ()
                                                              (91:18)-(91:22)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (91:18)-(91:22)
                                                                        (ValString "(a)"))])
                                          (Just AList ()
                                                      (91:26)-(91:28)
                                                      [ExpValue ()
                                                                (91:26)-(91:28)
                                                                (ValString " ")])),
                     BlStatement ()
                                 (92:7)-(92:24)
                                 Nothing
                                 (StCall ()
                                         (92:7)-(92:24)
                                         (ExpValue ()
                                                   (92:12)-(92:20)
                                                   (ValVariable "timestamp"))
                                         (Just AList () (92:22)-(92:24) [])),
                     BlStatement ()
                                 (94:7)-(94:10)
                                 Nothing
                                 (StStop () (94:7)-(94:10) Nothing)]]
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
	self assert: ast second equals: 'abs'.
	
	ast := self parse: 'ValStar' rule: #value.
	self assert: ast equals: 'ValStar'
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
