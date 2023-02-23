Class {
	#name : #IASTComment,
	#superclass : #IASTAbstractEntity,
	#instVars : [
		'text'
	],
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTComment >> text [

	^ text
]

{ #category : #accessing }
IASTComment >> text: anObject [

	text := anObject
]
