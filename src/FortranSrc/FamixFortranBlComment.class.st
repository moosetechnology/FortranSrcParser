Class {
	#name : #FamixFortranBlComment,
	#superclass : #Object,
	#instVars : [
		'positions',
		'comments'
	],
	#category : #FortranSrc
}

{ #category : #accessing }
FamixFortranBlComment >> comments [

	^ comments
]

{ #category : #accessing }
FamixFortranBlComment >> comments: anObject [

	comments := anObject
]

{ #category : #accessing }
FamixFortranBlComment >> positions [

	^ positions
]

{ #category : #accessing }
FamixFortranBlComment >> positions: anObject [

	positions := anObject
]
