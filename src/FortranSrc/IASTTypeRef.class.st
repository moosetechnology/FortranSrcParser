Class {
	#name : #IASTTypeRef,
	#superclass : #IASTEntityRef,
	#instVars : [
		'length',
		'kind'
	],
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTTypeRef >> addSelector: selector [

	self length: (selector first = 'Nothing'
			 ifTrue: [ selector first ]
			 ifFalse: [ 
				 (selector first class = IASTVarAccess and: [ 
					  selector first isAssigned ])
					 ifTrue: [ selector first entityName asNumber ]
					 ifFalse: [ 'ValStar' ] ]).
	self kind: (selector second = 'Nothing'
			 ifTrue: [ selector second ]
			 ifFalse: [ 
				 selector second isAssigned ifTrue: [ 
					 selector second entityName asNumber ] ])
]

{ #category : #accessing }
IASTTypeRef >> kind [

	^ kind
]

{ #category : #accessing }
IASTTypeRef >> kind: anObject [

	kind := anObject
]

{ #category : #accessing }
IASTTypeRef >> length [

	^ length
]

{ #category : #accessing }
IASTTypeRef >> length: anObject [

	length := anObject
]
