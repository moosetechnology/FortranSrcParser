Class {
	#name : #IASTVarEsoSl,
	#superclass : #IASTVarEso,
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTVarEsoSl >> accept: aVisitor [

	^ aVisitor visitIASTVarEsoSl: self
]
