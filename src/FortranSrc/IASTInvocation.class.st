Class {
	#name : #IASTInvocation,
	#superclass : #IASTEntityRef,
	#instVars : [
		'isIntrinsic',
		'arguments'
	],
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTInvocation >> arguments [

	^ arguments ifNil: [ arguments := OrderedCollection new ]
]

{ #category : #accessing }
IASTInvocation >> arguments: aCollection [

	self arguments addAll: aCollection
]

{ #category : #accessing }
IASTInvocation >> isIntrinsic [

	^ isIntrinsic
]

{ #category : #accessing }
IASTInvocation >> isIntrinsic: anObject [

	isIntrinsic := anObject
]
