Class {
	#name : #IASTVarAccess,
	#superclass : #IASTEntityRef,
	#instVars : [
		'isAssigned'
	],
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTVarAccess >> accept: aVisitor [

	^ aVisitor visitIASTVarAccess: self.
]

{ #category : #accessing }
IASTVarAccess >> isAssigned [

	^ isAssigned ifNil: [ isAssigned := false ]
]

{ #category : #accessing }
IASTVarAccess >> isAssigned: anObject [

	isAssigned := anObject
]
