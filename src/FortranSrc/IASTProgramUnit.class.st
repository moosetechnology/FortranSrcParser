Class {
	#name : #IASTProgramUnit,
	#superclass : #IASTAbstractEntity,
	#instVars : [
		'name',
		'varDecls',
		'varAccesses',
		'invocations'
	],
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTProgramUnit >> invocations [

	^ invocations
]

{ #category : #accessing }
IASTProgramUnit >> invocations: anObject [

	invocations := anObject
]

{ #category : #accessing }
IASTProgramUnit >> name [

	^ name
]

{ #category : #accessing }
IASTProgramUnit >> name: anObject [

	name := anObject
]

{ #category : #accessing }
IASTProgramUnit >> varAccesses [

	^ varAccesses
]

{ #category : #accessing }
IASTProgramUnit >> varAccesses: anObject [

	varAccesses := anObject
]

{ #category : #accessing }
IASTProgramUnit >> varDecls [

	^ varDecls
]

{ #category : #accessing }
IASTProgramUnit >> varDecls: anObject [

	varDecls := anObject
]
