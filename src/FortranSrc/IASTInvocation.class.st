Class {
	#name : #IASTInvocation,
	#superclass : #IASTAbstractEntity,
	#instVars : [
		'procedureName'
	],
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTInvocation >> procedureName [

	^ procedureName
]

{ #category : #accessing }
IASTInvocation >> procedureName: anObject [

	procedureName := anObject
]
