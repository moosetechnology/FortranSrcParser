Class {
	#name : #IASTEntityRef,
	#superclass : #IASTAbstractEntity,
	#instVars : [
		'entityName'
	],
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTEntityRef >> entityName [

	^ entityName
]

{ #category : #accessing }
IASTEntityRef >> entityName: anObject [

	entityName := anObject
]
