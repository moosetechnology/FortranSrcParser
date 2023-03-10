Class {
	#name : #IASTComment,
	#superclass : #IASTAbstractEntity,
	#instVars : [
		'text'
	],
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTComment >> accept: aVisitor [

	^ aVisitor visitIASTComment: self.
]

{ #category : #accessing }
IASTComment >> text [

	^ text
]

{ #category : #accessing }
IASTComment >> text: anObject [

	text := anObject
]
