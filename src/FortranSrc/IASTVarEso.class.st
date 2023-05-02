Class {
	#name : #IASTVarEso,
	#superclass : #IASTEntityRef,
	#instVars : [
		'entities'
	],
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTVarEso >> addEntities: aCollection [

	aCollection asCollection do: [ :element | 1halt.
		(element class = IASTVarAccess and: [ element isAssigned not ]) ifTrue: [ 
			self entities add: element ] ]
]

{ #category : #accessing }
IASTVarEso >> addRefsEntities: aCollection [

	aCollection do: [ :element | 1halt.
		(element class = IASTVarAccess or: [ 
			 element class inheritsFrom: IASTVarEso ]) ifTrue: [ 
			self entities add: element ] ]
]

{ #category : #accessing }
IASTVarEso >> entities [

	^ entities
]

{ #category : #accessing }
IASTVarEso >> entities: anObject [

	entities := anObject
]

{ #category : #accessing }
IASTVarEso >> initialize [

	super initialize.

	entities := OrderedCollection new.
]
