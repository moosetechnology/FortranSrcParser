Class {
	#name : #IASTBlockData,
	#superclass : #IASTProgramUnit,
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTBlockData >> accept: aVisitor [

	^ aVisitor visitIASTBlockData: self.
]
