Class {
	#name : #FortranCommentToEsopeEntity,
	#superclass : #Object,
	#instVars : [
		'model',
		'dictionary'
	],
	#category : #'FortranSrc-Esope'
}

{ #category : #accessing }
FortranCommentToEsopeEntity >> dictionary [

	^ dictionary
]

{ #category : #accessing }
FortranCommentToEsopeEntity >> dictionary: anObject [

	dictionary := anObject
]

{ #category : #'private - utility' }
FortranCommentToEsopeEntity >> esopePrefix [
	^ 'ceso'
]

{ #category : #'private - utility' }
FortranCommentToEsopeEntity >> getClass: aString [

	| aKey |
	aKey := self dictionary keys select: [ :each | 
		        aString includesSubstring: each caseSensitive: false ].
	^ aKey size = 1
		  ifTrue: [ self dictionary at: aKey first ifAbsent: [  ] ]
		  ifFalse: [  ]
]

{ #category : #initialization }
FortranCommentToEsopeEntity >> initialize [

	super initialize.

	dictionary := Dictionary newFrom: { 
			              (#segact -> FamixEsopeSegact).
			              (#segini -> FamixEsopeSegini).
			              (#segsup -> FamixEsopeSegsup).
			              (#segdes -> FamixEsopeSegdes).
			              (#segadj -> FamixEsopeSegadj).
			              (#pointeur -> FamixEsopePointerType).
			              (#segment -> FamixEsopeSegment) }
]

{ #category : #accessing }
FortranCommentToEsopeEntity >> model [

	^ model
]

{ #category : #accessing }
FortranCommentToEsopeEntity >> model: anObject [

	model := anObject
]

{ #category : #'private - utility' }
FortranCommentToEsopeEntity >> newEntity: anEntity [

	| aClass |
	aClass := self getClass: anEntity content.
	^ aClass ifNotNil: [ 
		  aClass := (aClass newFromFortranComment: anEntity) 
			            mooseModel: model;
			            yourself.
		  aClass ]
]

{ #category : #'private - utility' }
FortranCommentToEsopeEntity >> processSegment [

	| segments |
	segments := (self model allWithType: FamixEsopeSegment) asCollection.
	segments do: [ :segment | 
		| contents |
		contents := segment content splitOn: '\t'.
		segment name: ((contents first removePrefix: 'eso  segment') removePrefix: ',') trim.
		2 to: contents size - 1 do: [ :i | 
			| content type |
			content := ((contents at: i) removePrefix: 'ceso') trim splitOn:
				           Character space.
			"type := FamixEsopeType new
				        mooseModel: model;
				        name: content first;
				        yourself."
			1halt.
			segment addAttribute: (FamixEsopeAttribute new
					 mooseModel: model;
					 type: type;
					 name: (content allButFirst joinUsing: Character space);
					 segment: segment;
					 yourself) ] ]
]

{ #category : #utilities }
FortranCommentToEsopeEntity >> transform: entities [

	entities do: [ :anEntity | self newEntity: anEntity ]
]

{ #category : #utilities }
FortranCommentToEsopeEntity >> transformFortranCommentToEsopeEntity [

	self transform: (self model allComments select: #isEsope)
]
