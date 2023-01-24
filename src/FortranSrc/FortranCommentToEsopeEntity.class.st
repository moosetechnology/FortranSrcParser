Class {
	#name : #FortranCommentToEsopeEntity,
	#superclass : #Object,
	#instVars : [
		'model',
		'keywordClassMap'
	],
	#category : #'FortranSrc-Esope'
}

{ #category : #'private - utility' }
FortranCommentToEsopeEntity >> esopePrefix [
	^ 'ceso'
]

{ #category : #'private - utility' }
FortranCommentToEsopeEntity >> getClass: aString [

	^keywordClassMap
		detect: [ :assoc | aString includesSubstring: assoc key caseSensitive: false ]
		ifOne: [ :assoc | assoc value ]
		ifNone: [ self ]
	
]

{ #category : #initialization }
FortranCommentToEsopeEntity >> initialize [

	super initialize.

	keywordClassMap := OrderedCollection newFrom: { 
			              (#segact -> FamixEsopeSegact).
			              (#segini -> FamixEsopeSegini).
			              (#segsup -> FamixEsopeSegsup).
			              (#segdes -> FamixEsopeSegdes).
			              (#segadj -> FamixEsopeSegadj).
			              (#pointe -> FamixEsopePointer).
			              (#segmen -> FamixEsopeSegment) }
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
	^ aClass
		  ifNotNil: [ aClass newFromFortranComment: anEntity ]
		  ifNil: [ nil ]
]

{ #category : #'private - utility' }
FortranCommentToEsopeEntity >> newEntityComment: aFortranComment [

	| aClass |
	aClass := self getClass: aFortranComment content.
	^ aClass
		  ifNotNil: [ aClass newEntity: aFortranComment ]
		  ifNil: [ FamixEsopeUnknown new comment: aFortranComment ]
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
FortranCommentToEsopeEntity >> transformComment [

	((self model allWithSubTypesOf: FamixFortranFunction) select:
		 #isEsope) do: [ :aFortranComment | 
		self newEntityComment: aFortranComment ]
]

{ #category : #utilities }
FortranCommentToEsopeEntity >> transformFortranToEsopeEntity [

	self transformComment.
	self transformFunction
]

{ #category : #utilities }
FortranCommentToEsopeEntity >> transformFunction [

	((self model allWithSubTypesOf: FamixFortranFunction) select:
		 #isEsope) do: [ :anEntity | self newEntity: anEntity ]
]
