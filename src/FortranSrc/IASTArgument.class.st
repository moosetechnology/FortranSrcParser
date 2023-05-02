Class {
	#name : #IASTArgument,
	#superclass : #IASTEntityRef,
	#instVars : [
		'isConstant'
	],
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTArgument >> accept: aVisitor [

	^ aVisitor visitIASTArgument: self.
]

{ #category : #accessing }
IASTArgument >> isConstant [

	^ isConstant
]

{ #category : #accessing }
IASTArgument >> isConstant: anObject [

	isConstant := anObject
]
