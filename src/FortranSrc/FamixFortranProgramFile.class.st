Class {
	#name : #FamixFortranProgramFile,
	#superclass : #Object,
	#instVars : [
		'filename',
		'body'
	],
	#category : #'FortranSrc-Uncategorized'
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
FamixFortranProgramFile >> filename [

	^ filename
]

{ #category : #accessing }
FamixFortranProgramFile >> filename: anObject [

	filename := anObject
]
