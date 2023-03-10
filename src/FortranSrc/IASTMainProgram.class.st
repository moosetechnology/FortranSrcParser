Class {
	#name : #IASTMainProgram,
	#superclass : #IASTProgramUnit,
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTMainProgram >> accept: aVisitor [

	^ aVisitor visitIASTMainProgram: self.
]
