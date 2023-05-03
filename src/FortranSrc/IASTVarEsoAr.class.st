Class {
	#name : #IASTVarEsoAr,
	#superclass : #IASTVarEso,
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTVarEsoAr >> accept: aVisitor [

	^ aVisitor visitIASTVarEsoAr: self
]
