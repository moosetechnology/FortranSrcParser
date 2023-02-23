Class {
	#name : #IASTVarAccess,
	#superclass : #IASTAbstractEntity,
	#instVars : [
		'variableName'
	],
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTVarAccess >> variableName [

	^ variableName
]

{ #category : #accessing }
IASTVarAccess >> variableName: anObject [

	variableName := anObject
]
