Class {
	#name : #IASTProgramFile,
	#superclass : #IASTAbstractEntity,
	#instVars : [
		'filename',
		'version',
		'name',
		'comments',
		'progUnits'
	],
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTProgramFile >> comments [

	^ comments
]

{ #category : #accessing }
IASTProgramFile >> comments: anObject [

	comments := anObject
]

{ #category : #accessing }
IASTProgramFile >> filename [

	^ filename
]

{ #category : #accessing }
IASTProgramFile >> filename: anObject [

	filename := anObject
]

{ #category : #accessing }
IASTProgramFile >> name [

	^ name
]

{ #category : #accessing }
IASTProgramFile >> name: anObject [

	name := anObject
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
