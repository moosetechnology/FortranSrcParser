Class {
	#name : #IASTVarAccess,
	#superclass : #IASTEntityRef,
	#instVars : [
		'isAssigned'
	],
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTVarAccess >> isAssigned [

	^ isAssigned
]

{ #category : #accessing }
IASTVarAccess >> isAssigned: anObject [

	isAssigned := anObject
]
