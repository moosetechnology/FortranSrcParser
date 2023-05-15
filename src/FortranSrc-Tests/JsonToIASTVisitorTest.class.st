"
An IASTVisitorJSONTest is a test class for testing the behavior of IASTVisitorJSON
"
Class {
	#name : #JsonToIASTVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'visitor'
	],
	#category : #'FortranSrc-Tests-Visitor'
}

{ #category : #running }
JsonToIASTVisitorTest >> setUp [
	super setUp.
	
	visitor := JsonToIASTVisitor new
]

{ #category : #tests }
JsonToIASTVisitorTest >> testAssignementStatement [
	| programFile var |
	programFile := visitor visitCode: '      subroutine hello
      someVar = otherVar
      end
'.

	self assert: programFile progUnits first body first size equals: 2.

	var := programFile progUnits first body first first.
	self assert: var class equals: IASTVarAccess.
	self assert: var isWrite.
	self assert: var entityName equals: 'somevar'.

	var := programFile progUnits first body first second.
	self assert: var class equals: IASTVarAccess.
	self deny: var isWrite.
	self assert: var entityName equals: 'othervar'.

]

{ #category : #tests }
JsonToIASTVisitorTest >> testAssignementStatementWithComplexRHS [
	| programFile stmt |
	programFile := visitor visitCode: '      subroutine hello
      someVar = otherVar + thirdVar
      end
'.

	self assert: programFile progUnits first body first size equals: 3.

	stmt := programFile progUnits first body first first.
	self assert: stmt class equals: IASTVarAccess.
	self assert: stmt entityName equals: 'somevar'.

	stmt := programFile progUnits first body first second.
	self assert: stmt class equals: IASTVarAccess.
	self assert: stmt entityName equals: 'othervar'.

	stmt := programFile progUnits first body first third.
	self assert: stmt class equals: IASTVarAccess.
	self assert: stmt entityName equals: 'thirdvar'.

]

{ #category : #tests }
JsonToIASTVisitorTest >> testAssignementStatementWithEsoAt [
	| programFile stmt |
	programFile := visitor visitCode: '      subroutine hello
      someVar = esoat(var,1)
      end
'.

	self assert: programFile progUnits first body first size equals: 2.

	stmt := programFile progUnits first body first first.
	self assert: stmt class equals: IASTVarAccess.
	self assert: stmt entityName equals: 'somevar'.

	stmt := programFile progUnits first body first second.
	self assert: stmt class equals: IASTVarEsoAt.
	self deny: stmt isWrite.
	self assert: stmt entities size equals: 1

]

{ #category : #tests }
JsonToIASTVisitorTest >> testBlockDataWithOneCommon [
	| programFile blockdata var |

	programFile := visitor visitCode: '      blockdata hello
      common /mycom/ i
      end
'.

	self assert: programFile class equals: IASTProgramFile.
	self assert: programFile progUnits size equals: 1.

	blockdata := programFile progUnits first.
	self assert: blockdata entityName equals: 'hello'.
	self assert: blockdata body size equals: 1.
	
	var := blockdata body first first.
	self assert: var class equals: IASTVariable.
	self assert: var entityName equals: 'mycom'

]

{ #category : #tests }
JsonToIASTVisitorTest >> testBlockDataWithOneCommonOneData [
	| programFile blockdata |
	self flag: 'not dealing with COMMON for now'.
	self skip.
	
	programFile := visitor visitCode: '      block data hello
      common /mycom/ i
      data i /12345/
      end
'.

	self assert: programFile class equals: IASTProgramFile.
	self assert: programFile progUnits size equals: 1.
	self assert: programFile progUnits first class equals: IASTBlockData.

	blockdata := programFile progUnits first.
	self assert: blockdata entityName equals: 'hello'.
	self assert: blockdata body size equals: 3.
	self assert: blockdata comments isEmpty.
]

{ #category : #tests }
JsonToIASTVisitorTest >> testCallToWrite [

	| programFile stmt arg |
	programFile := visitor visitCode: '      subroutine mysub (msg)
      write(*,*) msg
      end
'.

	self assert: programFile progUnits first body first size equals: 1.

	stmt := programFile progUnits first body first first.
	self assert: stmt class equals: IASTInvocation.
	self assert: stmt entityName equals: 'write'.
	self assert: stmt arguments size equals: 1.
	self assert: stmt sourceAnchor isNotNil.

	arg := stmt arguments first.
	self assert: arg class equals: IASTVarAccess.
	self assert: arg entityName equals: 'msg'.
	self deny: arg isWrite

]

{ #category : #tests }
JsonToIASTVisitorTest >> testComment [
	| programFile stmt |
	programFile := visitor visitCode: 'c     blah'.

	self assert: programFile progUnits size equals: 1.
	stmt := programFile progUnits first.
	self assert: stmt class equals: IASTComment.
	self assert: stmt text equals: '     blah'.

	self assert: stmt sourceAnchor notNil.
	self assert: stmt sourceAnchor class equals: IASTIndexedFileAnchor.
	self assert: stmt sourceAnchor fileName equals: './fortran77.f'.
	self assert: stmt sourceAnchor startLine equals: 1.
	self assert: stmt sourceAnchor startColumn equals: 1.
	self assert: stmt sourceAnchor endLine equals: 1.
	self assert: stmt sourceAnchor endColumn equals: 11.

]

{ #category : #tests }
JsonToIASTVisitorTest >> testCommentInside [
	| programFile stmt |
	programFile := visitor visitCode: '      integer function hello()
c     blah
      end
'.

	self assert: programFile progUnits first body size equals: 1.
	stmt := programFile progUnits first body first.

	self assert: stmt class equals: IASTComment.
	self assert: stmt text equals: '     blah'.

]

{ #category : #tests }
JsonToIASTVisitorTest >> testCommentOutside [
	| programFile stmt |
	programFile := visitor visitCode: 'c     blah
      integer function hello()
      end
'.

	self assert: programFile progUnits size equals: 2.
	stmt := programFile progUnits first.
	self assert: stmt class equals: IASTComment.
	self assert: stmt text equals: '     blah'.

]

{ #category : #tests }
JsonToIASTVisitorTest >> testEmptyBlockData [
	| programFile block |
	programFile := visitor visitCode: '      BLOCK data hello
      end
'.

	self assert: programFile class equals: IASTProgramFile.
	self assert: programFile progUnits size equals: 1.
	self assert: programFile progUnits first class equals: IASTBlockData.
	block := programFile progUnits first.
	self assert: block entityName equals: 'hello'.
	self assert: block body isEmpty.
	self assert: block comments isEmpty.
]

{ #category : #tests }
JsonToIASTVisitorTest >> testEmptyFunction [
	| programFile fct |
	programFile := visitor visitCode: '      integer function hello()
      end
'.

	self assert: programFile class equals: IASTProgramFile.
	self assert: programFile progUnits size equals: 1.
	self assert: programFile progUnits first class equals: IASTFunction.
	fct := programFile progUnits first.
	self assert: fct entityName equals: 'hello'.
	self assert: fct parameters isEmpty.
	self assert: fct returnType class equals: IASTTypeRef.
	self assert: fct returnType entityName equals: 'integer'.
	self assert: fct body isEmpty.

	self assert: fct sourceAnchor notNil.
	self assert: fct sourceAnchor class equals: IASTIndexedFileAnchor.
	self assert: fct sourceAnchor fileName equals: './fortran77.f'.
	self assert: fct sourceAnchor startLine equals: 1.
	self assert: fct sourceAnchor startColumn equals: 7.
	self assert: fct sourceAnchor endLine equals: 2.
	self assert: fct sourceAnchor endColumn equals: 10.

]

{ #category : #tests }
JsonToIASTVisitorTest >> testEmptyFunctionWithArguments [
	| programFile fct param |
	programFile := visitor visitCode: '      integer function hello(i,j)
      end
'.

	fct := programFile progUnits first.
	self assert: fct entityName equals: 'hello'.
	self assert: fct parameters size equals: 2.

	param := fct parameters first.
	self assert: param class equals: IASTParameter.
	self assert: param entityName equals: 'i'.

	param := fct parameters second.
	self assert: param class equals: IASTParameter.
	self assert: param entityName equals: 'j'.

]

{ #category : #tests }
JsonToIASTVisitorTest >> testEmptyProgram [
	| programFile prog |
	programFile := visitor visitCode: '      program hello
      end
'.

	self assert: programFile class equals: IASTProgramFile.
	self assert: programFile progUnits size equals: 1.
	self assert: programFile progUnits first class equals: IASTMainProgram.
	prog := programFile progUnits first.
	self assert: prog entityName equals: 'hello'.
	self assert: prog body isEmpty.
	self assert: prog comments isEmpty.

	self assert: prog sourceAnchor notNil.
	self assert: prog sourceAnchor class equals: IASTIndexedFileAnchor.
	self assert: prog sourceAnchor fileName equals: './fortran77.f'.
	self assert: prog sourceAnchor startLine equals: 1.
	self assert: prog sourceAnchor startColumn equals: 7.
	self assert: prog sourceAnchor endLine equals: 2.
	self assert: prog sourceAnchor endColumn equals: 10.

]

{ #category : #tests }
JsonToIASTVisitorTest >> testEmptySubroutine [
	| programFile sub |
	programFile := visitor visitCode: '      subroutine hello
      end
'.

	self assert: programFile class equals: IASTProgramFile.
	self assert: programFile progUnits size equals: 1.
	self assert: programFile progUnits first class equals: IASTSubroutine.
	sub := programFile progUnits first.
	self assert: sub entityName equals: 'hello'.
	self assert: sub parameters isEmpty.
	self assert: sub body isEmpty.

	self assert: sub sourceAnchor notNil.
	self assert: sub sourceAnchor class equals: IASTIndexedFileAnchor.
	self assert: sub sourceAnchor fileName equals: './fortran77.f'.
	self assert: sub sourceAnchor startLine equals: 1.
	self assert: sub sourceAnchor startColumn equals: 7.
	self assert: sub sourceAnchor endLine equals: 2.
	self assert: sub sourceAnchor endColumn equals: 10.
]

{ #category : #tests }
JsonToIASTVisitorTest >> testEmptySubroutineOneParam [
	| programFile sub |
	programFile := visitor visitCode: '      subroutine hello( name )
      end
'.

	sub := programFile progUnits first.
	self assert: sub entityName equals: 'hello'.
	self assert: sub parameters size equals: 1.
	self assert: sub parameters first class equals: IASTParameter.
	self assert: sub parameters first entityName equals: 'name'.
	self assert: sub body isEmpty.
]

{ #category : #tests }
JsonToIASTVisitorTest >> testEmptySubroutineTwoParams [
	| programFile sub |
	programFile := visitor visitCode: '      subroutine hello( param1, param2 )
      end
'.

	sub := programFile progUnits first.
	self assert: sub entityName equals: 'hello'.
	self assert: sub parameters size equals: 2.
	self assert: sub parameters first class equals: IASTParameter.
	self assert: sub parameters first entityName equals: 'param1'.
	self assert: sub parameters second class equals: IASTParameter.
	self assert: sub parameters second entityName equals: 'param2'.
	self assert: sub body isEmpty.
]

{ #category : #tests }
JsonToIASTVisitorTest >> testEsoArTwoArgs [
	| programFile stmt |
	programFile := visitor visitCode: '      subroutine hello()
        esoar(baz,bar) = 5
      end
'.

	self assert: programFile progUnits first body first size equals: 1.
	stmt := programFile progUnits first body first first.
	self assert: stmt class equals: IASTVarEsoAr.
	self assert: stmt isWrite.
	self assert: stmt entities size equals: 2.

]

{ #category : #tests }
JsonToIASTVisitorTest >> testEsoArWithEsoAtArg [
	| programFile esoar esoat |
	programFile := visitor visitCode: '      subroutine hello( )
        esoar(esoat(baz,bar),2) = 5
      end
'.

	self assert: programFile progUnits first body first size equals: 1.
	esoar := programFile progUnits first body first first.

	self assert: esoar class equals: IASTVarEsoAr.
	self assert: esoar isWrite.
	self assert: esoar entities size equals: 1.

	esoat := esoar entities first.
	self assert: esoat class equals: IASTVarEsoAt.
	self deny: esoat isWrite.
	self assert: esoat entities size equals: 2.

]

{ #category : #tests }
JsonToIASTVisitorTest >> testEsoAtOneArg [
	| programFile stmt |
	programFile := visitor visitCode: '      subroutine hello( )
        esoat(baz,2) = 5.3
      end
'.

	self assert: programFile progUnits first body first size equals: 1.
	stmt := programFile progUnits first body first first.
	self assert: stmt class equals: IASTVarEsoAt.
	self assert: stmt isWrite.
	self assert: stmt entities size equals: 1.
	self assert: stmt entities first class equals: IASTVarAccess.
	self assert: stmt entities first entityName equals: 'baz'.
	self deny: stmt entities first isWrite
]

{ #category : #tests }
JsonToIASTVisitorTest >> testEsoAtTwoArgs [
	| programFile stmt |
	programFile := visitor visitCode: '      subroutine hello( )
        esoat(baz,bar) = 5
      end
'.

	self assert: programFile progUnits first body first size equals: 1.
	stmt := programFile progUnits first body first first.
	self assert: stmt class equals: IASTVarEsoAt.
	self assert: stmt isWrite.
	self assert: stmt entities size equals: 2.
	stmt entities do: [ :ent |
		self assert: ent class equals: IASTVarAccess.
		self assert: (#(baz bar) includes: ent entityName asSymbol).
		self deny:ent isWrite
	]
]

{ #category : #tests }
JsonToIASTVisitorTest >> testEsoAtTwoArgsReceivesVar [
	| programFile var |
	programFile := visitor visitCode: '      subroutine hello( )
        esoat(baz,bar) = otherVar
      end
'.

	self assert: programFile progUnits first body first size equals: 2.

	var := programFile progUnits first body first first.
	self assert: var class equals: IASTVarEsoAt.

	var := programFile progUnits first body first second.
	self assert: var class equals: IASTVarAccess.
	self assert: var entityName equals: 'othervar'.
	self deny: var isWrite.
]

{ #category : #tests }
JsonToIASTVisitorTest >> testFunctionWithFunctionInvocation [

	| iast fct |
	iast := visitor visitCode: '      integer function efunc()
      i = ifunc (i, j)
      end

      integer function ifunc( k, l )
      end
 '.

	self assert: iast progUnits size equals: 2.
	
	fct := iast progUnits first.

	self assert: fct class equals: IASTFunction.
	self assert: fct entityName equals: 'efunc'.
	self assert: fct body first size equals: 2.
	self assert: fct sourceAnchor startLine equals: 1.
	self assert: fct sourceAnchor startColumn equals: 7.
	self assert: fct sourceAnchor endLine equals: 3.
	self assert: fct sourceAnchor endColumn equals: 10.
	
	 
	fct := iast progUnits second.
	self assert: fct class equals: IASTFunction.
	self assert: fct parameters size equals: 2.
	self assert: fct parameters first entityName equals: 'k'.
	self assert: fct parameters second entityName equals: 'l'.
	self assert: fct sourceAnchor startLine equals: 5.
	self assert: fct sourceAnchor startColumn equals: 7.
	self assert: fct sourceAnchor endLine equals: 6.
	self assert: fct sourceAnchor endColumn equals: 10.
]

{ #category : #tests }
JsonToIASTVisitorTest >> testIntegerVariableDeclaration [
	| programFile var |
	programFile := visitor visitCode: '      subroutine hello
      integer i
      end
'.

	self assert: programFile progUnits first body first size equals: 1.
	var := programFile progUnits first body first first.

	self assert: var class equals: IASTVariable.
	self assert: var entityName equals: 'i'.
	self assert: var typeSpec class equals: IASTTypeRef.
	self assert: var typeSpec entityName equals: 'integer'.
	self assert: var sourceAnchor isNotNil.
	self assert: var sourceAnchor class equals: IASTIndexedFileAnchor
]

{ #category : #tests }
JsonToIASTVisitorTest >> testMultipleStatements [
	| programFile stmt |
	programFile := visitor visitCode: '      subroutine hello
      integer someVar
      someVar = 3 * someVar
      end
'.

	self assert: programFile progUnits first body size equals: 2.

	stmt := programFile progUnits first body first first.
	self assert: stmt class equals: IASTVariable.
	self assert: stmt typeSpec class equals: IASTTypeRef.
	self assert: stmt entityName equals: 'somevar'.

	stmt := programFile progUnits first body second first.
	self assert: stmt class equals: IASTVarAccess.
	self assert: stmt isWrite.
	self assert: stmt entityName equals: 'somevar'.

	stmt := programFile progUnits first body second second.
	self assert: stmt class equals: IASTVarAccess.
	self deny: stmt isWrite.
	self assert: stmt entityName equals: 'somevar'.

]

{ #category : #tests }
JsonToIASTVisitorTest >> testProgramWithEmptyDoStatement [
	| prog programFile |
	programFile := visitor visitCode: '      program hello
      do i=1, n
      enddo 
      end
'.

	prog := programFile progUnits first.
	self assert: prog accesses size equals: 2.
	self assertCollection: (prog accesses collect: [ :each | each entityName ]) hasSameElements: #(i n)
	

	

]

{ #category : #tests }
JsonToIASTVisitorTest >> testProgramWithOneStatement [
	| programFile prog |
	programFile := visitor visitCode: '      program hello
      a = -b
      end
'.

	self assert: programFile class equals: IASTProgramFile.
	self assert: programFile progUnits size equals: 1.
	self assert: programFile progUnits first class equals: IASTMainProgram.

	prog := programFile progUnits first.
	self assert: prog entityName equals: 'hello'.
	self assert: prog body size equals: 1.
	self assert: prog comments isEmpty.
	self assert: prog body first size equals: 2.
]

{ #category : #tests }
JsonToIASTVisitorTest >> testProgramWithSimpleIfElseStatementWitBody [
	| prog programFile |
	programFile := visitor visitCode: '      program hello
      if (i < j) then
        i = i + 1
      else
        j = j - 1
      endif
      end
'.

	prog := programFile progUnits first.
	self assert: prog accesses size equals: 6.
	self assertCollection: (prog accesses collect: [ :each | each entityName ]) hasSameElements: #(i j).
	self assert: (prog accesses select: [:each | each entityName = 'i']) size equals: 3.
	self assert: prog accesses third isWrite.
	self assert: prog accesses fifth isWrite.
	

	

]

{ #category : #tests }
JsonToIASTVisitorTest >> testProgramWithSimpleIfStatementWitBody [
	| prog programFile |
	programFile := visitor visitCode: '      program hello
      if (i < j) then
        i = j
      endif
      end
'.

	prog := programFile progUnits first.
	self assert: prog accesses size equals: 4.
	self assertCollection: (prog accesses collect: [ :each | each entityName ]) hasSameElements: #(i j).
	self assert: prog accesses third isWrite.
	

	

]

{ #category : #tests }
JsonToIASTVisitorTest >> testProgramWithSimpleIfStatementWithoutBody [
	| prog programFile |
	programFile := visitor visitCode: '      program hello
      if (i < j) then
      endif
      end
'.

	prog := programFile progUnits first.
	self assert: prog accesses size equals: 2.
	self assertCollection: (prog accesses collect: [ :each | each entityName ]) hasSameElements: #(i j)
	

	

]

{ #category : #tests }
JsonToIASTVisitorTest >> testStringVariableDeclaration [
	| programFile var |
	programFile := visitor visitCode: '      subroutine hello
      character*8 str
      end
'.

	self assert: programFile progUnits first body first  size equals: 1.

	var := programFile progUnits first body first first.
	self assert: var class equals: IASTVariable.
	self assert: var entityName equals: 'str'.
	self assert: var typeSpec class equals: IASTTypeRef.
	self assert: var typeSpec entityName equals: 'character'.

]

{ #category : #tests }
JsonToIASTVisitorTest >> testSubroutineInvocation [
	| programFile stmt |
	programFile := visitor visitCode: '      subroutine hello
      call someSubRoutine
      end
'.

	self assert: programFile progUnits first body first size equals: 1.

	stmt := programFile progUnits first body first first.
	self assert: stmt class equals: IASTInvocation.
	self assert: stmt entityName equals: 'somesubroutine'.
	self assert: stmt arguments size equals: 0

]

{ #category : #tests }
JsonToIASTVisitorTest >> testSubroutineInvocationWithArguments [
	| programFile stmt arg |
	programFile := visitor visitCode: '      subroutine hello
      call someSubRoutine(bar,5,baz)
      end
'.

	self assert: programFile progUnits first body first size equals: 1.

	stmt := programFile progUnits first body first first.
	self assert: stmt class equals: IASTInvocation.
	self assert: stmt entityName equals: 'somesubroutine'.
	self assert: stmt arguments size equals: 2.

	arg := stmt arguments first.
	self assert: arg class equals: IASTParameter.
	self assert: arg entityName equals: 'bar'.

	arg := stmt arguments second.
	self assert: arg class equals: IASTParameter.
	self assert: arg entityName equals: 'baz'.
]

{ #category : #tests }
JsonToIASTVisitorTest >> testTwoIntegerVariableDeclarations [
	| programFile var |
	programFile := visitor visitCode: '      subroutine hello
      integer i,j
      end
'.

	self assert: programFile progUnits first body first size equals: 2.

	var := programFile progUnits first body first first.
	self assert: var class equals: IASTVariable.
	self assert: var entityName equals: 'i'.
	self assert: var typeSpec class equals: IASTTypeRef.
	self assert: var typeSpec entityName equals: 'integer'.

	var := programFile progUnits first body first second.
	self assert: var class equals: IASTVariable.
	self assert: var entityName equals: 'j'.
	self assert: var typeSpec class equals: IASTTypeRef.
	self assert: var typeSpec entityName equals: 'integer'.
]
