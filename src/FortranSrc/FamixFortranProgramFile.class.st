Class {
	#name : #FamixFortranProgramFile,
	#superclass : #Object,
	#instVars : [
		'name',
		'body'
	],
	#category : #FortranSrc
}

{ #category : #accessing }
FamixFortranProgramFile >> body [

	^ body
]

{ #category : #accessing }
FamixFortranProgramFile >> body: anObject [

	body := anObject
]

{ #category : #accessing }
FamixFortranProgramFile >> name [

	^ name
]

{ #category : #accessing }
FamixFortranProgramFile >> name: anObject [

	name := anObject
]
