Class {
	#name : #MMF77ToMMEsope,
	#superclass : #Object,
	#instVars : [
		'model',
		'keywordClassMap'
	],
	#category : #'FortranSrc-Esope'
}

{ #category : #'private - utility' }
MMF77ToMMEsope >> esopePrefix [
	^ 'ceso'
]

{ #category : #'private - utility' }
MMF77ToMMEsope >> getClass: aString [

	| aKey |
	aKey := (aString trim removePrefix: 'eso') trim.
	^ keywordClassMap
		  detect: [ :assoc | 
		  aKey beginsWith: assoc key caseSensitive: false ]
		  ifOne: [ :assoc | assoc value ]
		  ifNone: [  ]
]

{ #category : #initialization }
MMF77ToMMEsope >> initialize [

	super initialize.

	keywordClassMap := OrderedCollection newFrom: { 
			                   (#segact -> FamixEsopeSegact).
			                   (#segini -> FamixEsopeSegini).
			                   (#segsup -> FamixEsopeSegsup).
			                   (#segdes -> FamixEsopeSegdes).
			                   (#segadj -> FamixEsopeSegadj).
			                   (#pointeur -> FamixEsopePointer).
			                   (#segment -> FamixEsopeSegment).
			                   (#esoar -> FamixEsopeEsoAr).
			                   (#esoat -> FamixEsopeEsoAt).
			                   (#esosl -> FamixEsopeEsoSl).
			 }
]

{ #category : #accessing }
MMF77ToMMEsope >> model [

	^ model
]

{ #category : #accessing }
MMF77ToMMEsope >> model: anObject [

	model := anObject
]

{ #category : #'private - utility' }
MMF77ToMMEsope >> newEntity: anEntity [

	| aClass |
	aClass := self getClass: anEntity name.
	^ aClass
		  ifNotNil: [ aClass newFromFortranFunction: anEntity ]
		  ifNil: [ ]
]

{ #category : #'private - utility' }
MMF77ToMMEsope >> newEntityComment: aFortranComment [

	| aClass |
	aClass := self getClass: aFortranComment content.
	^ aClass
		  ifNotNil: [ aClass newEntity: aFortranComment ]
		  ifNil: [ FamixEsopeUnknown new comment: aFortranComment ]
]

{ #category : #'private - utility' }
MMF77ToMMEsope >> processSegment [

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
MMF77ToMMEsope >> transformComment [

	((self model allWithSubTypesOf: FamixFortranComment) select:
		 #isEsope) do: [ :aFortranComment | 
		self newEntityComment: aFortranComment ]
]

{ #category : #utilities }
MMF77ToMMEsope >> transformFortranToEsopeEntity [

	self transformComment.
	self transformFunction
]

{ #category : #utilities }
MMF77ToMMEsope >> transformFunction [

	((self model allWithSubTypesOf: FamixFortranFunction) select:
		 #isEsope) do: [ :anEntity | self newEntity: anEntity ]
]
