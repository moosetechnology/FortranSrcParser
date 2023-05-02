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
IASTVisitorJSONTest >> testEsoAtTwoArgs [
	| iast sub |
	iast := self visitCode: '      subroutine hello( name )
        esoat(baz,bar) = 5
      end
'.

	sub := iast first.
]

{ #category : #parsing }
IASTVisitorJSONTest >> visitCode: aString [
	self astJSON: aString.
	^'./fortran77.f.ast' asFileReference readStreamDo: [ :st |
			visitor visitProgramFile: (NeoJSONReader fromString: st contents) ]
]
