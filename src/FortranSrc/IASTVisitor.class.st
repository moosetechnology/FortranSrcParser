Class {
	#name : #IASTVisitor,
	#superclass : #Object,
	#category : #'FortranSrc-Visitor'
}

{ #category : #visiting }
IASTVisitor >> visit: anObject [

	^ anObject accept: self
]

{ #category : #visiting }
IASTVisitor >> visitIASTArgument: anArgument [

	self flag: #TODO.
]

{ #category : #visiting }
IASTVisitor >> visitIASTBlockData: aBlockData [

	self flag: #TODO.
]

{ #category : #visiting }
IASTVisitor >> visitIASTComment: aComment [

	self flag: #TODO.
]

{ #category : #visiting }
IASTVisitor >> visitIASTFunction: aFunction [

	self flag: #TODO.
]

{ #category : #visiting }
IASTVisitor >> visitIASTImplicit: anImplicit [

	self flag: #TODO.
]

{ #category : #visiting }
IASTVisitor >> visitIASTInvocation: anInvocation [

	self flag: #TODO.
]

{ #category : #visiting }
IASTVisitor >> visitIASTMainProgram: aMainProgram [

	self flag: #TODO.
]

{ #category : #visiting }
IASTVisitor >> visitIASTParameter: aParameter [

	self flag: #TODO.
]

{ #category : #visiting }
IASTVisitor >> visitIASTProgramFile: aProgramFile [

	self flag: #TODO.
	aProgramFile progUnits do: [ :programUnit | programUnit accept: self ]
]

{ #category : #visiting }
IASTVisitor >> visitIASTSubroutine: aSubroutine [

	self flag: #TODO.
]

{ #category : #visiting }
IASTVisitor >> visitIASTTypeRef: aType [

	self flag: #TODO.
]

{ #category : #visiting }
IASTVisitor >> visitIASTVarAccess: aVarAccess [

	self flag: #TODO.
]

{ #category : #visiting }
IASTVisitor >> visitIASTVariable: aVariable [

	self flag: #TODO.
]
