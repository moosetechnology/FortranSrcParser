Class {
	#name : #IASTEntityRef,
	#superclass : #IASTAbstractEntity,
	#instVars : [
		'entityName',
		'comments'
	],
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTEntityRef >> comments [

	^ comments
]

{ #category : #accessing }
IASTEntityRef >> comments: anObject [

	comments := anObject
]

{ #category : #accessing }
IASTEntityRef >> entityName [

	^ entityName
]

{ #category : #accessing }
IASTEntityRef >> entityName: anObject [

	entityName := anObject
]
