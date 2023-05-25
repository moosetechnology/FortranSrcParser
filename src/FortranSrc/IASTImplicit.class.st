Class {
	#name : #IASTImplicit,
	#superclass : #IASTAbstractEntity,
	#instVars : [
		'forType',
		'range'
	],
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTImplicit >> accept: aVisitor [

	^ aVisitor visitIASTImplicit: self.
]

{ #category : #accessing }
IASTImplicit >> forType [

	^ forType
]

{ #category : #accessing }
IASTImplicit >> forType: anObject [

	forType := anObject
]

{ #category : #accessing }
IASTImplicit >> range [
	"actually a collection of ranges, each range being an array {from . to}"
	^ range
]

{ #category : #accessing }
IASTImplicit >> range: anObject [

	range := anObject
]
