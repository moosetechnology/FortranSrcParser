Class {
	#name : #IASTProgramFile,
	#superclass : #IASTAbstractEntity,
	#instVars : [
		'filename',
		'version',
		'progUnits'
	],
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTProgramFile >> filename [

	^ filename
]

{ #category : #accessing }
IASTProgramFile >> filename: anObject [

	filename := anObject
]

{ #category : #accessing }
IASTProgramFile >> progUnits [

	^ progUnits
]

{ #category : #accessing }
IASTProgramFile >> progUnits: anObject [

	progUnits := anObject
]

{ #category : #accessing }
IASTProgramFile >> version [

	^ version
]

{ #category : #accessing }
IASTProgramFile >> version: anObject [

	version := anObject
]
