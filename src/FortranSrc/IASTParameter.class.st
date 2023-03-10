Class {
	#name : #IASTParameter,
	#superclass : #IASTEntityRef,
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTParameter >> accept: aVisitor [

	^ aVisitor visitIASTParameter: self.
]
