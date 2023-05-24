Class {
	#name : #FamixFortran77Resolver,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'FortranSrc-Resolver'
}

{ #category : #'symbols resolution' }
FamixFortran77Resolver >> resolve [
	self requalifyVariableDeclarations: (self model allWithType: FamixFortran77Variable).
	self resolveAccesses: (self model allWithType: FamixFortran77Access).
	self resolveInvocations: (self model allWithType: FamixFortran77Invocation)
]
