Class {
	#name : #FortranProjectImporter,
	#superclass : #Object,
	#instVars : [
		'workdir',
		'parser'
	],
	#category : #'FortranSrc-Tests'
}

{ #category : #accessing }
FortranProjectImporter class >> parse: aPath [

	^ self new director: aPath asPath
]

{ #category : #accessing }
FortranProjectImporter class >> workdir: workdir parser: parser [
	^ self new
		workdir: workdir;
		parser: parser;
		yourself
]

{ #category : #accessing }
FortranProjectImporter >> createBuildDirectory [
	self workdir  / 'build' asFileReference  ensureCreateDirectory
]

{ #category : #accessing }
FortranProjectImporter >> getEsopeFiles [
	^ self workdir asFileReference allChildrenMatching: '*.e'
]

{ #category : #accessing }
FortranProjectImporter >> getFortranFiles [
	^ self workdir asFileReference allChildrenMatching: '*.f'
]

{ #category : #accessing }
FortranProjectImporter >> parser [

	^ parser
]

{ #category : #accessing }
FortranProjectImporter >> parser: anObject [

	parser := anObject
]

{ #category : #accessing }
FortranProjectImporter >> workdir [

	^ workdir
]

{ #category : #accessing }
FortranProjectImporter >> workdir: anObject [

	workdir := anObject
]
