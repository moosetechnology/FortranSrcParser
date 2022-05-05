Class {
	#name : #FamixFortranPUSubroutine,
	#superclass : #Object,
	#instVars : [
		'position',
		'name',
		'arguments',
		'body',
		'subProgram'
	],
	#category : #'FortranSrc-Uncategorized'
}

{ #category : #accessing }
FamixFortranPUSubroutine >> arguments [

	^ arguments
]

{ #category : #accessing }
FamixFortranPUSubroutine >> arguments: anObject [

	arguments := anObject
]

{ #category : #accessing }
FamixFortranPUSubroutine >> body [

	^ body
]

{ #category : #accessing }
FamixFortranPUSubroutine >> body: anObject [

	body := anObject
]

{ #category : #accessing }
FamixFortranPUSubroutine >> name [

	^ name
]

{ #category : #accessing }
FamixFortranPUSubroutine >> name: anObject [

	name := anObject
]

{ #category : #accessing }
FamixFortranPUSubroutine >> position [

	^ position
]

{ #category : #accessing }
FamixFortranPUSubroutine >> position: anObject [

	position := anObject
]

{ #category : #accessing }
FamixFortranPUSubroutine >> subProgram [

	^ subProgram
]

{ #category : #accessing }
FamixFortranPUSubroutine >> subProgram: anObject [

	subProgram := anObject
]
