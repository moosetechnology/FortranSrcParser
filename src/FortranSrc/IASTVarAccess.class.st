Class {
	#name : #IASTVarAccess,
	#superclass : #IASTEntityRef,
	#instVars : [
		'isAssigned',
		'isWrite'
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

{ #category : #accessing }
IASTVarAccess >> isEsope [

	^ self entityName
		  ifNotNil: [ { #esoar. #esoat. #esosl } includes: self entityName ]
		  ifNil: [ false ]
]

{ #category : #accessing }
IASTVarAccess >> isWrite [

	^ isWrite ifNil: [ isWrite := false ]
]

{ #category : #accessing }
IASTVarAccess >> isWrite: anObject [

	isWrite := anObject
]
