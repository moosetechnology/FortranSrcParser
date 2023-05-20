Class {
	#name : #JsonToIASTVisitorComplexTest,
	#superclass : #TestCase,
	#instVars : [
		'visitor'
	],
	#category : #'FortranSrc-Tests-Visitor'
}

{ #category : #running }
JsonToIASTVisitorComplexTest >> setUp [
	super setUp.
	
	visitor := JsonToIASTVisitor new
]

{ #category : #tests }
JsonToIASTVisitorComplexTest >> testProgramWithEsopeCode [
	| prog programFile |
	programFile := visitor visitCode: '      subroutine demo
      integer i
      integer n
cESO  segment foo
         real bar(n)
cESO  endsegment
cESO  pointeur baz.foo
      n=3
cESO  segini,baz
      i=1
      ESOAr(ESOAt(baz,bar),i)=i*i
cESO  segsup,baz
      end
'.

	prog := programFile progUnits first.
	self assert: prog class equals: IASTSubroutine.
	
	self assert: prog body size equals: 9.
	self assert: prog comments size equals: 0.
	self assert: prog accesses size equals: 4.
	self assert: prog localVariables size equals: 2
	

	

]

{ #category : #tests }
JsonToIASTVisitorComplexTest >> testProgramWithHiddenSegmentInside [
	| prog programFile |
	programFile := visitor visitCode: '      program hello
cESO  segment test
        integer a(n),b(m)
cESO  endsegment
cESO  pointeur ptr1.test
cESO  segini ptr1
      size = ESOSl(ESOat(ptr1,a), 1)
      do i=1, size
        ESOAr(ESOAt(ptr1,a),i)=i*i
      enddo
      size = ESOSl(ESOat(ptr1,b),1)
      do i=1, size
        ESOAr(ESOAt(ptr1,b),i)=3*i
      enddo
cESO  segsup ptr1     
      end
'.

	prog := programFile progUnits first.
	self assert: prog class equals: IASTMainProgram.
	
	self assert: prog body size equals: 8.
	self assert: prog comments size equals: 0.
	self assert: prog accesses size equals: 9.
	self assert: prog localVariables size equals: 0
	

	

]

{ #category : #tests }
JsonToIASTVisitorComplexTest >> testProgramWithMultipleProgUnitsWithInvocation [

	| iast node |
	iast := visitor visitCode: '      program myprog
      i = ifunc (i, j)
      call mysub (name)
      end

      integer function ifunc( k, l )
      ifunc = k + l
      end

      subroutine mysub (msg)
      write(*,*) msg
      end
'.

	self assert: iast progUnits size equals: 3.
	
	node := iast progUnits first.
	self assert: node class equals: IASTMainProgram.
	self assert: node entityName equals: 'myprog'.
	self assert: node body size equals: 2.
	self assert: node accesses size equals: 1.
	self assert: node invocations size equals: 2.
	
	node := iast progUnits second.
	self assert: node class equals: IASTFunction.
	self assert: node parameters size equals: 2.
	self assert: node parameters first entityName equals: 'k'.
	self assert: node parameters second entityName equals: 'l'.
	self assert: node accesses size equals: 3.

	node := iast progUnits third.
	self assert: node class equals: IASTSubroutine.
	self assert: node parameters size equals: 1.
	self assert: node parameters first entityName equals: 'msg'.
]

{ #category : #tests }
JsonToIASTVisitorComplexTest >> testProgramWithSimpleIfElseIfElseStatementWitBody [
	| prog programFile varAccess |
	programFile := visitor visitCode: '      program hello
      if (i < j) then
        i = i + 1
      else if (j.gt.0) then
        j = j - 1
      else
        i = j
      endif
      end
'.

	prog := programFile progUnits first.
	self assert: prog accesses size equals: 9.
	self assertCollection: (prog accesses collect: [ :each | each entityName ]) hasSameElements: #(i j).
	self assert: prog accesses third isWrite.
	self assert: prog accesses sixth isWrite.
	self assert: prog accesses eighth isWrite.

	varAccess := prog accesses seventh.
	self assert: varAccess sourceAnchor startLine equals: 5.
	self assert: varAccess sourceAnchor startColumn equals: 13.
	self assert: varAccess sourceAnchor endLine equals: 5.
	self assert: varAccess sourceAnchor endColumn equals: 14.

	

]
