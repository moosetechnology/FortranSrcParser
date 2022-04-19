Class {
	#name : #FamixFortranBlStatement,
	#superclass : #Object,
	#instVars : [
		'positions',
		'label',
		'statements'
	],
	#category : #FortranSrc
}

{ #category : #accessing }
FamixFortranBlStatement >> label [

	^ label
]

{ #category : #accessing }
FamixFortranBlStatement >> label: anObject [

	label := anObject
]

{ #category : #accessing }
FamixFortranBlStatement >> positions [

	^ positions
]

{ #category : #accessing }
FamixFortranBlStatement >> positions: anObject [

	positions := anObject
]

{ #category : #accessing }
FamixFortranBlStatement >> statements [

	^ statements
]

{ #category : #accessing }
FamixFortranBlStatement >> statements: anObject [

	statements := anObject
]
