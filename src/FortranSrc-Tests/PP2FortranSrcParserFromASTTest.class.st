Class {
	#name : #PP2FortranSrcParserFromASTTest,
	#superclass : #PP2FortranSrcGrammarTest,
	#category : #'FortranSrc-Tests'
}

{ #category : #accessing }
PP2FortranSrcParserFromASTTest >> parserClass [
	^ PP2FortranSrcParser 
]

{ #category : #running }
PP2FortranSrcParserFromASTTest >> setUp [

	super setUp.
	parser := self parserInstance.
]

{ #category : #'tests-expression' }
PP2FortranSrcParserFromASTTest >> testExpFunctionCall [

	| iast |
	iast := self
		       parse: 'ExpFunctionCall ()
	(118:10)-(118:47)
	(ExpValue ()
		(118:10)-(118:12)
		(ValIntrinsic "abs"))
	(Just AList ()
		(118:14)-(118:46)
		[])'
		       rule: #expFunctionCall.

	self assert: iast size equals: 1.
	self assert: iast anyOne class equals: IASTInvocation.
	self assert: iast anyOne name equals: 'abs'.
	self assert: iast anyOne isIntrinsic.
]

{ #category : #'tests-expression' }
PP2FortranSrcParserFromASTTest >> testExpFunctionCallWithParameters [

	| iast node |
	iast := self
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


	self assert: iast size equals: 3.
	
	node := iast first.
	self assert: node class equals: IASTInvocation.
	self assert: node name equals: 'esosl'.
	self deny: node isIntrinsic.

	node := iast second.
	self assert: node class equals: IASTVarAccess.
	self assert: node name equals: 't1'.
	self deny: node isAssigned.

	node := iast third.
	self assert: node class equals: IASTVarAccess.
	self assert: node name equals: 'tab'.
	self deny: node isAssigned.

]

{ #category : #'tests-expression' }
PP2FortranSrcParserFromASTTest >> testExpUnary [

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
	self assert: ast fourth entityName equals: 'ValInteger'.
	self assert: ast fourth third  equals: 8
]

{ #category : #tests }
PP2FortranSrcParserFromASTTest >> testExpValueInteger [

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
PP2FortranSrcParserFromASTTest >> testExpValueString [

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
PP2FortranSrcParserFromASTTest >> testExpValueType [

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
PP2FortranSrcParserFromASTTest >> testExpValueVariable [

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
PP2FortranSrcParserFromASTTest >> testFullFileBorbk [

	| ast |
	self class borbk.
	ast := self parse: self class borbkAST rule: #start.

	self assert: ast size equals: 1.
	self assert: ast first parameters size equals: 3.
	self assert: ast first comments size equals: 56.

	self assert: ast first class equals: FamixFortranSubroutine.
	self assert: ast first name equals: 'borbk'.
	self assert: ast first container filename equals: 'borbk.0.e.f'.

	self
		assertCollection: (ast first parameters collect: [ :p | p name ])
		hasSameElements: { #lib. #name. #title }.
	
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromASTTest >> testFullFileExample [

	| ast |
	self class example.
	ast := self parse: self class exampleAST rule: #start.

	self assert: ast size equals: 2.
	self assert: ast second parameters size equals: 4.
	self assert: ast second comments size equals: 6.

	self assert: ast second class equals: FamixFortranSubroutine.
	self assert: ast second name equals: 'mynew'.
	self assert: ast second container filename equals: 'example.f'.
	self
		assert: ast second container programUnits first content
		equals:
		'23456789012345678901234567890123456789012345678901234567890123456789012'.

	self
		assertCollection: (ast second parameters collect: [ :p | p name ])
		hasSameElements: { #t1. #sizea. #start. #step }
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromASTTest >> testFullFileExampleWithMultipleProgUnit [

	| ast puComments puOthers |
	self class exampleWithMultipleProgUnit.
	ast := self
		       parse: self class exampleWithMultipleProgUnitAST
		       rule: #start.


	puComments := ast select: [ :pu | pu class = FamixFortranComment ].
	puOthers := ast select: [ :pu | pu class ~= FamixFortranComment ].
	self assert: ast size equals: 30.
	self assert: puComments size equals: 26.
	self assert: puOthers first outgoingInvocations size equals: 2.


	self
		assertCollection: (puOthers collect: [ :pu | pu class ])
		hasSameElements: { 
				FamixFortranProgram.
				FamixFortranSubroutine.
				FamixFortranFunction.
				FamixFortranBlockData }.
	self
		assertCollection: (puOthers collect: [ :pu | pu name ])
		hasSameElements: { #myprog. #mysub. #ifunc. #myblck }.
	self assert: ast first container filename equals: 'example.f'.
	
	self flag: #FIXME. "this function had only one parameter, but it seem it have two
	possible problem can be using the actual argument as a parameter "
	self assert: puOthers third parameters size equals: 1.
	self assert: puOthers first parameters name equals: #k.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromASTTest >> testFullFileFindbk [

	| ast |
	self class findbk.
	ast := self parse: self class findbkAST rule: #start.

	self assert: ast size equals: 1.
	self assert: ast first parameters size equals: 2.
	self assert: ast first comments size equals: 50.

	self assert: ast first class equals: FamixFortranFunction.
	self assert: ast first name equals: 'findbk'.
	self assert: ast first container filename equals: 'findbk.0.e.f'.

	self
		assertCollection: (ast first parameters collect: [ :p | p name ])
		hasSameElements: { #lib. #title }.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromASTTest >> testFullFileFindur [

	| ast |
	self class findur.
	ast := self parse: self class findurAST rule: #start.

	self assert: ast size equals: 1.
	self assert: ast first parameters size equals: 2.
	self assert: ast first comments size equals: 50.

	self assert: ast first class equals: FamixFortranFunction.
	self assert: ast first name equals: 'findur'.
	self assert: ast first container filename equals: 'findur.0.e.f'.

	self
		assertCollection: (ast first parameters collect: [ :p | p name ])
		hasSameElements: { #lib. #name }.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromASTTest >> testFullFileLibpnt [

	| ast |
	self class libpnt.
	ast := self parse: self class libpntAST rule: #start.

	self assert: ast size equals: 1.
	self assert: ast first parameters size equals: 1.
	self assert: ast first comments size equals: 66.

	self assert: ast first class equals: FamixFortranSubroutine.
	self assert: ast first name equals: 'libprt'.
	self assert: ast first container filename equals: 'libpnt.0.e.f'.

	self
		assert: ast first parameters first name
		equals: #lib.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromASTTest >> testFullFileMain [

	| ast |
	self class main.
	ast := self parse: self class mainAST rule: #start.

	self assert: ast size equals: 1.
	self assert: ast first comments size equals: 41.

	self assert: ast first class equals: FamixFortranProgram.
	self assert: ast first name equals: 'main'.
	self assert: ast first container filename equals: 'main.0.e.f'.

	self assert: ast first outgoingInvocations size equals: 10.

	self flag: #FIXME. "idea:
	- it would be nice to have a Map of invocable and the number of their invocations:
		e.g: in main.0.e.f => newbook -> (2, list of arguments and their values).
	"
	self
		assertCollection: (ast first outgoingInvocations collect: [ :inv | 
				 inv candidates first name ])
		hasSameElements:
			{ #ooossg. #newlib. #newbook. #newbook. #newuser. #newuser. #borbk.
			#relbk. #libprt. #ooostp }
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromASTTest >> testFullFileNewbook [

	| ast |
	self class newbook. 
	ast := self parse: self class newbookAST rule: #start.

	self assert: ast size equals: 1.
	self assert: ast first parameters size equals: 4.
	self assert: ast first comments size equals: 55.

	self assert: ast first class equals: FamixFortranSubroutine.
	self assert: ast first name equals: 'newbook'.
	self assert: ast first container filename equals: 'newbook.0.e.f'.

	self
		assertCollection: (ast first parameters collect: [ :p | p name ])
		hasSameElements: { #lib.  #title . #pages. #udc }.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromASTTest >> testFullFileNewlib [

	| ast |
	self class newlib.
	ast := self parse: self class newlibAST rule: #start.

	self assert: ast size equals: 1.
	self assert: ast first parameters size equals: 1.
	self assert: ast first comments size equals: 48.

	self assert: ast first class equals: FamixFortranSubroutine.
	self assert: ast first name equals: 'newlib'.
	self assert: ast first container filename equals: 'newlib.0.e.f'.

	self
		assertCollection: (ast first parameters collect: [ :p | p name ])
		hasSameElements: { #lib }.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromASTTest >> testFullFileNewuser [

	| ast |
	self class newuser.
	ast := self parse: self class newuserAST rule: #start.

	self assert: ast size equals: 1.
	self assert: ast first parameters size equals: 2.
	self assert: ast first comments size equals: 57.

	self assert: ast first class equals: FamixFortranSubroutine.
	self assert: ast first name equals: 'newuser'.
	self assert: ast first container filename equals: 'newuser.0.e.f'.

	self
		assertCollection: (ast first parameters collect: [ :p | p name ])
		hasSameElements: { #lib. #name }.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromASTTest >> testFullFileRelbk [

	| ast |
	self class relbk.
	ast := self parse: self class relbkAST rule: #start.

	self assert: ast size equals: 1.
	self assert: ast first parameters size equals: 3.
	self assert: ast first comments size equals: 62.

	self assert: ast first class equals: FamixFortranSubroutine.
	self assert: ast first name equals: 'relbk'.
	self assert: ast first container filename equals: 'relbk.0.e.f'.

	self
		assertCollection: (ast first parameters collect: [ :p | p name ])
		hasSameElements: { #lib. #name. #title }.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromASTTest >> testMultipleProgUnit [

	| ast |
	ast := self
		       parse: '       program myprog
      write(6,*) i
      end

      subroutine mysub
      return
      end

      integer function ifunc( k )
      return
      end
 '
		       rule: #start.

	self assert: ast first name equals: 'myprog'.

	self assert: ast second name equals: 'mysub'.
	self assert: ast second parameters size equals: 0.


	self assert: ast third name equals: 'ifunc'.
	self assert: ast third parameters size equals: 1.
	self assert: ast third parameters first name equals: #k
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserFromASTTest >> testProgramFileEmpty [

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
PP2FortranSrcParserFromASTTest >> testProgramFileNoEmpty [

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
PP2FortranSrcParserFromASTTest >> testProgramFileWithMultipleProgramUnits [

	| ast program |
	ast := self parse: 'ProgramFile (MetaInfo
	{miVersion = Fortran77,
	miFilename = "file.f"})	
	[PUComment ()
		(25:1)-(25:73)
      (Comment "234567890123456789012345678901234567890123456789012345678901234567890123"),
	PUMain ()
		(1:7)-(13:9)
		(Just "circle")
		[BlStatement ()
			(32:7)-(32:16)
			Nothing
			(StCall ()
				(32:7)-(32:16)
				(ExpValue ()
					(32:12)-(32:16)
					(ValVariable "mysub"))
			Nothing)
		]
		Nothing,
	PUSubroutine ()
		(38:7)-(43:9)
		(Nothing, Nothing)
		"mysub"
		Nothing
		[]
	   Nothing,
	PUFunction ()
		(45:7)-(49:9)
		(Just TypeSpec () (45:7)-(45:13) TypeInteger Nothing)
		(Nothing, Nothing)
		"ifunc"
		(Just AList ()
			(45:31)-(45:31)
			[ExpValue ()
				(45:31)-(45:31)
				(ValVariable "k")])
		Nothing
		[]
		Nothing,
	PUBlockData ()
		(51:7)-(54:9)
		(Just "myblck")
		[],
	PUComment ()
		(55:1)-(55:72)
		(Comment "----------------------------------------------------------------------^")
	]' rule: #programFile.

	self assert: (parser model allWithType: FamixFortranProgram) size equals: 1.

	program := (parser model allWithType: FamixFortranProgram) first.

	self assert: program name equals: 'circle'.

	self assertEmpty: program comments.

	self assertEmpty: program programUnits
]

{ #category : #'tests-programFile' }
PP2FortranSrcParserFromASTTest >> testProgramFileWithPuMain [

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
PP2FortranSrcParserFromASTTest >> testPuBlockData [

	| ast  |
	ast := self parse: 'PUBlockData ()
		(51:7)-(54:9)
		(Just "myblck")
		[]' rule: #puBlockData.
	self assert: ast name equals: 'myblck'.
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserFromASTTest >> testPuFunction [

	| ast |
	ast := self
		       parse: 'PUFunction ()
	(1:7)-(103:9)
	(Just TypeSpec () (1:7)-(1:13) TypeInteger Nothing)
	(Nothing, Nothing)
	"findbk"
	(Just AList ()
		(1:31)-(1:39)
		[ExpValue ()
			(1:31)-(1:33)
			(ValVariable "lib"),
		ExpValue ()
			(1:35)-(1:39)
			(ValVariable "title")])
	Nothing
	[]
	Nothing'
		       rule: #puFunction.

	self assert: ast parameters size equals: 2.
	self assert: ast parameters first name equals: 'lib'.
	self assert: ast parameters last name equals: 'title'.
	self assert: ast name equals: 'findbk'.
	self flag: #FIXME. "self assert: ast body equals: 0."
	self assert: ast sourceAnchor startLine equals: 1.
	self assert: ast sourceAnchor startColumn equals: 7.	
	self assert: ast sourceAnchor endLine equals: 103.
	self assert: ast sourceAnchor endColumn equals: 9.	

]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserFromASTTest >> testPuMain [

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
PP2FortranSrcParserFromASTTest >> testPuSubroutine [

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
	
	self assert: subroutine sourceAnchor startLine equals: 1.

	self assert: subroutine sourceAnchor endLine equals: 302.
	
	self assert: subroutine sourceAnchor startColumn equals: 7.

	self assert: subroutine sourceAnchor endColumn equals: 9.

	self assert: subroutine parameters first name equals: 'status'.

	self assertEmpty: subroutine programUnits
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserFromASTTest >> testPuSubroutineWithComment [

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
PP2FortranSrcParserFromASTTest >> testPuSubroutineWithNoParameter [

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
PP2FortranSrcParserFromASTTest >> testPuSubroutineWithSeveralParameters [

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
PP2FortranSrcParserFromASTTest >> testPuSubroutineWithSubroutineCall [

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
PP2FortranSrcParserFromASTTest >> testSrcSpan [
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
PP2FortranSrcParserFromASTTest >> testStCall [

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

{ #category : #'tests-programUnit' }
PP2FortranSrcParserFromASTTest >> testStExternal [

	
	| ast |
	ast := self
		parse: 'StExternal ()
	(61:7)-(61:20)
	(AList ()
		(61:16)-(61:20)
		[ExpValue ()
			(61:16)-(61:20)
			(ValVariable "mypnt")])'
		rule: #stExternal.
	self flag: #TODO. "process this node stExternal"
]

{ #category : #'tests-statement' }
PP2FortranSrcParserFromASTTest >> testStFunction [

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
PP2FortranSrcParserFromASTTest >> testTkNumber [

	self assert: (self parse: '42' rule: #tkNumber) equals: 42
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserFromASTTest >> testTkString [

	| ast |
	ast := self
		       parse: '"aString"'
		       rule: #tkString.
	self assert: ast equals: 'aString'.
		
]

{ #category : #tests }
PP2FortranSrcParserFromASTTest >> testValInteger [

	| ast |
	ast := self
		       parse: 'ValInteger "42" Nothing'
		       rule: #value.

	self assert: ast first equals: 'ValInteger'.
	self assert: ast second equals: 42
]

{ #category : #tests }
PP2FortranSrcParserFromASTTest >> testValStar [

	| ast |
	ast := self
		       parse: 'ValStar'
		       rule: #valStar.

	self assert: ast equals: 'ValStar'
]

{ #category : #tests }
PP2FortranSrcParserFromASTTest >> testValString [

	| ast |
	ast := self
		       parse: 'ValString "a string"'
		       rule: #value.

	self assert: ast first equals: 'ValString'.
	self assert: ast second equals: 'a string'
]

{ #category : #tests }
PP2FortranSrcParserFromASTTest >> testValue [

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
	
	ast := self parse: 'ValStar' rule: #valStar.
	self assert: ast equals: 'ValStar'
]

{ #category : #tests }
PP2FortranSrcParserFromASTTest >> testValueInteger [

	| ast |
	ast := self
		       parse: 'ValInteger "42" Nothing'
		       rule: #valInteger.

	self assert: ast first equals: 'ValInteger'.
	self assert: ast second equals: 42
]
