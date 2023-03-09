Class {
	#name : #IASTProgramUnit,
	#superclass : #IASTAbstractEntity,
	#instVars : [
		'body',
		'entityName',
		'comments'
	],
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTProgramUnit >> accesses [

	^ body
		  ifNil: [ #(  ) ]
		  ifNotNil: [ 
		  body flattened select: [ :entity | entity class = IASTVarAccess ] ]
]

{ #category : #accessing }
IASTProgramUnit >> body [

	^ body
]

{ #category : #accessing }
IASTProgramUnit >> body: anObject [

	body := anObject
]

{ #category : #accessing }
IASTProgramUnit >> comments [

	^ comments
]

{ #category : #accessing }
IASTProgramUnit >> comments: anObject [

	comments := anObject
]

{ #category : #accessing }
IASTProgramUnit >> entityName [

	^ entityName
]

{ #category : #accessing }
IASTProgramUnit >> entityName: anObject [

	entityName := anObject
]

{ #category : #accessing }
IASTProgramUnit >> invocations [

	^ body
		  ifNil: [ #(  ) ]
		  ifNotNil: [ 
		  body flattened select: [ :entity | entity class = IASTInvocation ] ]
]

{ #category : #accessing }
IASTProgramUnit >> localVariables [

	^ body
		  ifNil: [ #(  ) ]
		  ifNotNil: [ 
		  body flattened select: [ :entity | entity class = IASTVariable ] ]
]
