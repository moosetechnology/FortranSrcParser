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
	| iast stmt |
	iast := self visitCode: '      subroutine hello
      someVar = otherVar
      end
'.

	self assert: iast first body size equals: 2.

	stmt := iast first body first.
	self assert: stmt class equals: IASTVarAccess.
	self assert: stmt isWrite.
	self assert: stmt entityName equals: 'somevar'.

	stmt := iast first body second.
	self assert: stmt class equals: IASTVarAccess.
	self deny: stmt isWrite.
	self assert: stmt entityName equals: 'othervar'.

]

{ #category : #tests }
IASTVisitorJSONTest >> testAssignementStatementWithComplexRHS [
	| iast stmt |
	iast := self visitCode: '      subroutine hello
      someVar = otherVar + thirdVar
      end
'.

	self assert: iast first body size equals: 3.

	stmt := iast first body first.
	self assert: stmt class equals: IASTVarAccess.
	self assert: stmt entityName equals: 'somevar'.

	stmt := iast first body second.
	self assert: stmt class equals: IASTVarAccess.
	self assert: stmt entityName equals: 'othervar'.

	stmt := iast first body third.
	self assert: stmt class equals: IASTVarAccess.
	self assert: stmt entityName equals: 'thirdvar'.

]

{ #category : #tests }
IASTVisitorJSONTest >> testAssignementStatementWithEsoAt [
	| iast stmt |
	iast := self visitCode: '      subroutine hello
      someVar = esoat(var,1)
      end
'.

	self assert: iast first body size equals: 2.

	stmt := iast first body first.
	self assert: stmt class equals: IASTVarAccess.
	self assert: stmt entityName equals: 'somevar'.

	stmt := iast first body second.
	self assert: stmt class equals: IASTVarEsoAt.
	self deny: stmt isWrite.
	self assert: stmt entities size equals: 1

]

{ #category : #tests }
IASTVisitorJSONTest >> testEmptySubroutine [
	| iast sub |
	iast := self visitCode: '      subroutine hello
      end
'.

	self assert: iast isCollection.
	self assert: iast size equals: 1.
	self assert: iast first class equals: IASTSubroutine.
	sub := iast first.
	self assert: sub entityName equals: 'hello'.
	self assert: sub parameters isEmpty.
	self assert: sub body isEmpty.
]

{ #category : #tests }
IASTVisitorJSONTest >> testEmptySubroutineOneParam [
	| iast sub |
	iast := self visitCode: '      subroutine hello( name )
      end
'.

	sub := iast first.
	self assert: sub entityName equals: 'hello'.
	self assert: sub parameters size equals: 1.
	self assert: sub parameters first class equals: IASTParameter.
	self assert: sub parameters first entityName equals: 'name'.
	self assert: sub body isEmpty.
]

{ #category : #tests }
IASTVisitorJSONTest >> testEmptySubroutineTwoParams [
	| iast sub |
	iast := self visitCode: '      subroutine hello( param1, param2 )
      end
'.

	sub := iast first.
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
	| iast stmt |
	iast := self visitCode: '      subroutine hello( name )
        esoar(baz,bar) = 5
      end
'.

	self assert: iast first body size equals: 1.
	stmt := iast first body first.
	self assert: stmt class equals: IASTVarEsoAr.
	self assert: stmt isWrite.
	self assert: stmt entities size equals: 2.

]

{ #category : #tests }
IASTVisitorJSONTest >> testEsoArWithEsoAtArg [
	| iast esoar esoat |
	iast := self visitCode: '      subroutine hello( name )
        esoar(esoat(baz,bar),2) = 5
      end
'.

	self assert: iast first body size equals: 1.
	esoar := iast first body first.

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
	| iast stmt |
	iast := self visitCode: '      subroutine hello( name )
        esoat(baz,2) = 5
      end
'.

	self assert: iast first body size equals: 1.
	stmt := iast first body first.
	self assert: stmt class equals: IASTVarEsoAt.
	self assert: stmt isWrite.
	self assert: stmt entities size equals: 1.
	self assert: stmt entities first class equals: IASTVarAccess.
	self assert: stmt entities first entityName equals: 'baz'.
]

{ #category : #tests }
IASTVisitorJSONTest >> testEsoAtTwoArgs [
	| iast stmt |
	iast := self visitCode: '      subroutine hello( name )
        esoat(baz,bar) = 5
      end
'.

	self assert: iast first body size equals: 1.
	stmt := iast first body first.
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
	| iast stmt |
	iast := self visitCode: '      subroutine hello( name )
        esoat(baz,bar) = otherVar
      end
'.

	self assert: iast first body size equals: 2.
	stmt := iast first body second.
	self assert: stmt class equals: IASTVarAccess.
	self assert: stmt entityName equals: 'othervar'.
	self deny: stmt isWrite.
]

{ #category : #parsing }
IASTVisitorJSONTest >> visitCode: aString [
	self astJSON: aString.
	^'./fortran77.f.ast' asFileReference readStreamDo: [ :st |
			visitor visitProgramFile: (NeoJSONReader fromString: st contents) ]
]
