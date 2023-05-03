Class {
	#name : #IASTVarEsoAt,
	#superclass : #IASTVarEso,
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTVarEsoAt >> accept: aVisitor [

	^ aVisitor visitIASTVarEsoAt: self
]
