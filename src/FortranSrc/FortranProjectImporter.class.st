Class {
	#name : #FortranProjectImporter,
	#superclass : #Object,
	#instVars : [
		'directory'
	],
	#category : #'FortranSrc-Tests'
}

{ #category : #accessing }
FortranProjectImporter class >> parse: aPath [

	^ self new director: aPath asPath
]

{ #category : #accessing }
FortranProjectImporter >> directory [

	^ directory
]

{ #category : #accessing }
FortranProjectImporter >> directory: anObject [

	directory := anObject
]
