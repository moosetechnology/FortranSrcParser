Class {
	#name : #IASTInvocation,
	#superclass : #IASTEntityRef,
	#instVars : [
		'isIntrinsic',
		'arguments'
	],
	#category : #'FortranSrc-intrermediateAST'
}

{ #category : #accessing }
IASTInvocation >> accept: aVisitor [

	^ aVisitor visitIASTInvocation: self.
]

{ #category : #accessing }
IASTInvocation >> arguments [

	^ arguments ifNil: [ arguments := OrderedCollection new ]
]

{ #category : #accessing }
IASTInvocation >> arguments: aNodes [

	arguments := aNodes ifNil: [ #(  ) ] ifNotNil: [ 
		             aNodes flattened
			             select: [ :node | node class = IASTVarAccess ]
			             thenCollect: [ :node | 
				             IASTArgument new
					             sourceAnchor: node sourceAnchor;
					             entityName: node entityName;
					             isConstant: node isAssigned;
					             yourself ] ]
]

{ #category : #accessing }
IASTInvocation >> isIntrinsic [

	^ isIntrinsic
]

{ #category : #accessing }
IASTInvocation >> isIntrinsic: anObject [

	isIntrinsic := anObject
]
