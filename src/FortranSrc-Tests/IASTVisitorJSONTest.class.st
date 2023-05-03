"
An IASTVisitorJSONTest is a test class for testing the behavior of IASTVisitorJSON
"
Class {
	#name : #IASTVisitorJSONTest,
	#superclass : #TestCase,
	#instVars : [
		'visitor'
	],
	#category : #'FortranSrc-Tests'
}

{ #category : #parsing }
IASTVisitorJSONTest >> astJSON: sourceCode [

	| filename option |
	option := 'serialize -t json -v77l encode'.
	"option := ''."
	filename := './fortran77.f'.
	filename asFileReference writeStreamDo: [ :stream | 
		stream truncate.
		stream
		<< (sourceCode copy replaceAll: Character cr with: Character lf) ].

	LibC runCommand: ('{1} {2} "{3}" > "{3}.ast" 2> "{3}.err"' format: { 
				 self fortranSrcPath.
				 option.
				 filename. })
]

{ #category : #parsing }
IASTVisitorJSONTest >> fortranSrcPath [

	^ 'fortran-src-extras'
]

{ #category : #running }
IASTVisitorJSONTest >> setUp [
	super setUp.
	
	visitor := IASTVisitorJSON new
]

{ #category : #tests }
IASTVisitorJSONTest >> testAssignementStatement [
	| programFile stmt |
	programFile := self visitCode: '      subroutine hello
      someVar = otherVar
      end
'.

	self assert: programFile progUnits first body size equals: 2.

	stmt := programFile progUnits first body first.
	self assert: stmt class equals: IASTVarAccess.
	self assert: stmt isWrite.
	self assert: stmt entityName equals: 'somevar'.

	stmt := programFile progUnits first body second.
	self assert: stmt class equals: IASTVarAccess.
	self deny: stmt isWrite.
	self assert: stmt entityName equals: 'othervar'.

]

{ #category : #tests }
IASTVisitorJSONTest >> testAssignementStatementWithComplexRHS [
	| programFile stmt |
	programFile := self visitCode: '      subroutine hello
      someVar = otherVar + thirdVar
      end
'.

	self assert: programFile progUnits first body size equals: 3.

	stmt := programFile progUnits first body first.
	self assert: stmt class equals: IASTVarAccess.
	self assert: stmt entityName equals: 'somevar'.

	stmt := programFile progUnits first body second.
	self assert: stmt class equals: IASTVarAccess.
	self assert: stmt entityName equals: 'othervar'.

	stmt := programFile progUnits first body third.
	self assert: stmt class equals: IASTVarAccess.
	self assert: stmt entityName equals: 'thirdvar'.

]

{ #category : #tests }
IASTVisitorJSONTest >> testAssignementStatementWithEsoAt [
	| programFile stmt |
	programFile := self visitCode: '      subroutine hello
      someVar = esoat(var,1)
      end
'.

	self assert: programFile progUnits first body size equals: 2.

	stmt := programFile progUnits first body first.
	self assert: stmt class equals: IASTVarAccess.
	self assert: stmt entityName equals: 'somevar'.

	stmt := programFile progUnits first body second.
	self assert: stmt class equals: IASTVarEsoAt.
	self deny: stmt isWrite.
	self assert: stmt entities size equals: 1

]

{ #category : #tests }
IASTVisitorJSONTest >> testBlockDataWithOneCommon [
	| programFile blockdata |
	programFile := self visitCode: '      block data hello
      common /mycom/ i
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
IASTVisitorJSONTest >> testBlockDataWithOneCommonOneData [
	| programFile blockdata |
	programFile := self visitCode: '      block data hello
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
IASTVisitorJSONTest >> testComment [
	| programFile stmt |
	programFile := self visitCode: 'c     blah'.

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
IASTVisitorJSONTest >> testCommentInside [
	| programFile stmt |
	programFile := self visitCode: '      integer function hello()
c     blah
      end
'.

	self assert: programFile progUnits first body size equals: 1.
	stmt := programFile progUnits first body first.

	self assert: stmt class equals: IASTComment.
	self assert: stmt text equals: '     blah'.

]

{ #category : #tests }
IASTVisitorJSONTest >> testCommentOutside [
	| programFile stmt |
	programFile := self visitCode: 'c     blah
      integer function hello()
      end
'.

	self assert: programFile progUnits size equals: 2.
	stmt := programFile progUnits first.
	self assert: stmt class equals: IASTComment.
	self assert: stmt text equals: '     blah'.

]

{ #category : #tests }
IASTVisitorJSONTest >> testEmptyBlockData [
	| programFile prog |
	programFile := self visitCode: '      BLOCK data hello
      end
'.

	self assert: programFile class equals: IASTProgramFile.
	self assert: programFile progUnits size equals: 1.
	self assert: programFile progUnits first class equals: IASTBlockData.
	prog := programFile progUnits first.
	self assert: prog entityName equals: 'hello'.
	self assert: prog body isEmpty.
	self assert: prog comments isEmpty.
]

{ #category : #tests }
IASTVisitorJSONTest >> testEmptyFunction [
	| programFile fct |
	programFile := self visitCode: '      integer function hello()
      end
'.

	self assert: programFile class equals: IASTProgramFile.
	self assert: programFile progUnits size equals: 1.
	self assert: programFile progUnits first class equals: IASTFunction.
	fct := programFile progUnits first.
	self assert: fct entityName equals: 'hello'.
	self assert: fct parameters isEmpty.
	self assert: fct returnType equals: 'integer'.
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
IASTVisitorJSONTest >> testEmptyProgram [
	| programFile prog |
	programFile := self visitCode: '      program hello
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
IASTVisitorJSONTest >> testEmptySubroutine [
	| programFile sub |
	programFile := self visitCode: '      subroutine hello
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
IASTVisitorJSONTest >> testEmptySubroutineOneParam [
	| programFile sub |
	programFile := self visitCode: '      subroutine hello( name )
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
IASTVisitorJSONTest >> testEmptySubroutineTwoParams [
	| programFile sub |
	programFile := self visitCode: '      subroutine hello( param1, param2 )
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
IASTVisitorJSONTest >> testEsoArTwoArgs [
	| programFile stmt |
	programFile := self visitCode: '      subroutine hello( name )
        esoar(baz,bar) = 5
      end
'.

	self assert: programFile progUnits first body size equals: 1.
	stmt := programFile progUnits first body first.
	self assert: stmt class equals: IASTVarEsoAr.
	self assert: stmt isWrite.
	self assert: stmt entities size equals: 2.

]

{ #category : #tests }
IASTVisitorJSONTest >> testEsoArWithEsoAtArg [
	| programFile esoar esoat |
	programFile := self visitCode: '      subroutine hello( name )
        esoar(esoat(baz,bar),2) = 5
      end
'.

	self assert: programFile progUnits first body size equals: 1.
	esoar := programFile progUnits first body first.

	self assert: esoar class equals: IASTVarEsoAr.
	self assert: esoar isWrite.
	self assert: esoar entities size equals: 1.

	esoat := esoar entities first.
	self assert: esoat class equals: IASTVarEsoAt.
	self deny: esoat isWrite.
	self assert: esoat entities size equals: 2.

]

{ #category : #tests }
IASTVisitorJSONTest >> testEsoAtOneArg [
	| programFile stmt |
	programFile := self visitCode: '      subroutine hello( name )
        esoat(baz,2) = 5
      end
'.

	self assert: programFile progUnits first body size equals: 1.
	stmt := programFile progUnits first body first.
	self assert: stmt class equals: IASTVarEsoAt.
	self assert: stmt isWrite.
	self assert: stmt entities size equals: 1.
	self assert: stmt entities first class equals: IASTVarAccess.
	self assert: stmt entities first entityName equals: 'baz'.
]

{ #category : #tests }
IASTVisitorJSONTest >> testEsoAtTwoArgs [
	| programFile stmt |
	programFile := self visitCode: '      subroutine hello( name )
        esoat(baz,bar) = 5
      end
'.

	self assert: programFile progUnits first body size equals: 1.
	stmt := programFile progUnits first body first.
	self assert: stmt class equals: IASTVarEsoAt.
	self assert: stmt isWrite.
	self assert: stmt entities size equals: 2.
	stmt entities do: [ :ent |
		self assert: ent class equals: IASTVarAccess.
		self assert: (#(baz bar) includes: ent entityName asSymbol).
		self deny: ent isWrite.
	]
]

{ #category : #tests }
IASTVisitorJSONTest >> testEsoAtTwoArgsReceivesVar [
	| programFile stmt |
	programFile := self visitCode: '      subroutine hello( name )
        esoat(baz,bar) = otherVar
      end
'.

	self assert: programFile progUnits first body size equals: 2.
	stmt := programFile progUnits first body second.
	self assert: stmt class equals: IASTVarAccess.
	self assert: stmt entityName equals: 'othervar'.
	self deny: stmt isWrite.
]

{ #category : #tests }
IASTVisitorJSONTest >> testIntegerVariableDeclaration [
	| programFile stmt |
	programFile := self visitCode: '      subroutine hello
      integer i
      end
'.

	self assert: programFile progUnits first body size equals: 1.
	stmt := programFile progUnits first body first.

	self assert: stmt class equals: IASTVariable.
	self assert: stmt entityName equals: 'i'.
	self assert: stmt typeSpec equals: 'integer'.
]

{ #category : #tests }
IASTVisitorJSONTest >> testMultipleStatements [
	| programFile stmt |
	programFile := self visitCode: '      subroutine hello
      integer someVar
      someVar = 3 * someVar
      end
'.

	self assert: programFile progUnits first body size equals: 3.

	stmt := programFile progUnits first body first.
	self assert: stmt class equals: IASTVariable.
	self assert: stmt entityName equals: 'somevar'.

	stmt := programFile progUnits first body second.
	self assert: stmt class equals: IASTVarAccess.
	self assert: stmt isWrite.
	self assert: stmt entityName equals: 'somevar'.

	stmt := programFile progUnits first body third.
	self assert: stmt class equals: IASTVarAccess.
	self deny: stmt isWrite.
	self assert: stmt entityName equals: 'somevar'.

]

{ #category : #tests }
IASTVisitorJSONTest >> testProgramWithEmptyDoStatement [
	| prog programFile |
	programFile := self visitCode: '      program hello
      do i=1, n
      enddo 
      end
'.

	prog := programFile progUnits first.
	self assert: prog accesses size equals: 2.
	self assertCollection: (prog accesses collect: [ :each | each entityName ]) hasSameElements: #(i n)
	

	

]

{ #category : #tests }
IASTVisitorJSONTest >> testProgramWithOneStatement [
	| programFile prog |
	programFile := self visitCode: '      program hello
      a = -b
      end
'.

	self assert: programFile class equals: IASTProgramFile.
	self assert: programFile progUnits size equals: 1.
	self assert: programFile progUnits first class equals: IASTMainProgram.
	prog := programFile progUnits first.
	self assert: prog entityName equals: 'hello'.
	self assert: prog body size equals: 2.
	self assert: prog comments isEmpty.
]

{ #category : #tests }
IASTVisitorJSONTest >> testStringVariableDeclaration [
	| programFile stmt |
	programFile := self visitCode: '      subroutine hello
      character*8 str
      end
'.

	self assert: programFile progUnits first body size equals: 1.

	stmt := programFile progUnits first body first.
	self assert: stmt class equals: IASTVariable.
	self assert: stmt entityName equals: 'str'.
	self assert: stmt typeSpec equals: 'character'.

]

{ #category : #tests }
IASTVisitorJSONTest >> testSubroutineInvocation [
	| programFile stmt |
	programFile := self visitCode: '      subroutine hello
      call someSubRoutine
      end
'.

	self assert: programFile progUnits first body size equals: 1.

	stmt := programFile progUnits first body first.
	self assert: stmt class equals: IASTInvocation.
	self assert: stmt entityName equals: 'somesubroutine'.
	self assert: stmt arguments size equals: 0

]

{ #category : #tests }
IASTVisitorJSONTest >> testSubroutineInvocationWithArguments [
	| programFile stmt arg |
	programFile := self visitCode: '      subroutine hello
      call someSubRoutine(bar,5,baz)
      end
'.

	self assert: programFile progUnits first body size equals: 1.

	stmt := programFile progUnits first body first.
	self assert: stmt class equals: IASTInvocation.
	self assert: stmt entityName equals: 'somesubroutine'.
	self assert: stmt arguments size equals: 2.

	arg := stmt arguments first.
	self assert: arg class equals: IASTVarAccess.
	self assert: arg entityName equals: 'bar'.
	self deny: arg isWrite.

	arg := stmt arguments second.
	self assert: arg class equals: IASTVarAccess.
	self assert: arg entityName equals: 'baz'.
	self deny: arg isWrite.
]

{ #category : #tests }
IASTVisitorJSONTest >> testTwoIntegerVariableDeclarations [
	| programFile stmt |
	programFile := self visitCode: '      subroutine hello
      integer i,j
      end
'.

	self assert: programFile progUnits first body size equals: 2.

	stmt := programFile progUnits first body first.
	self assert: stmt class equals: IASTVariable.
	self assert: stmt entityName equals: 'i'.
	self assert: stmt typeSpec equals: 'integer'.

	stmt := programFile progUnits first body second.
	self assert: stmt class equals: IASTVariable.
	self assert: stmt entityName equals: 'j'.
	self assert: stmt typeSpec equals: 'integer'.
]

{ #category : #parsing }
IASTVisitorJSONTest >> visitCode: aString [
	self astJSON: aString.
	^'./fortran77.f.ast' asFileReference readStreamDo: [ :st |
			visitor visitProgramFile: (NeoJSONReader fromString: st contents) ]
]
