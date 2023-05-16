"
Intermediate representation of AST for ESOPE segment declaration

A segment has
- an `entityName`
- a list of `declarations` (fields in the segment)
"
Class {
	#name : #IASTEsopeSegment,
	#superclass : #IASTAbstractEntity,
	#instVars : [
		'entityName',
		'declarations'
	],
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTEsopeSegment >> accept: aVisitor [

	^ aVisitor visitIASTEsopeSegment: self.
]

{ #category : #accessing }
IASTEsopeSegment >> declarations [

	^ declarations
]

{ #category : #accessing }
IASTEsopeSegment >> declarations: anObject [

	declarations := anObject
]

{ #category : #accessing }
IASTEsopeSegment >> entityName [

	^ entityName
]

{ #category : #accessing }
IASTEsopeSegment >> entityName: anObject [

	entityName := anObject
]

{ #category : #testing }
IASTEsopeSegment >> isEsopeSegment [
	^true
]
