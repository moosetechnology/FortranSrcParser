Class {
	#name : #IASTAbstractEntity,
	#superclass : #Object,
	#instVars : [
		'sourceAnchor'
	],
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTAbstractEntity >> sourceAnchor [

	^ sourceAnchor
]

{ #category : #accessing }
IASTAbstractEntity >> sourceAnchor: anObject [

	sourceAnchor := anObject
]
