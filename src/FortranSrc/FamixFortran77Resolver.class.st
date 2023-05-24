Class {
	#name : #FamixFortran77Resolver,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'FortranSrc-Resolver'
}

{ #category : #'symbols resolution' }
FamixFortran77Resolver >> requalifyVariableDeclaration: variableDeclaration [
	(self requalifyVariableDeclarationAsParameter: variableDeclaration) 
		ifTrue: [ ^self ].

	self requalifyVariableDeclarationAsFunction: variableDeclaration
]

{ #category : #'symbols resolution' }
FamixFortran77Resolver >> requalifyVariableDeclarationAsFunction: variableDeclaration [
	| function |
	function := self retrieveInvocables: variableDeclaration name.
	function ifNil: [ ^false ].
	function declaredType: variableDeclaration declaredType.
	self removeFromModel: variableDeclaration.
	^true
		
]

{ #category : #'symbols resolution' }
FamixFortran77Resolver >> requalifyVariableDeclarationAsParameter: variableDeclaration [
	| param |
	param := self 
		retrieveVariable: variableDeclaration name 
		fromList: (self retrieveParameters: variableDeclaration parentBehaviouralEntity).

	param ifNil: [ ^false ].
	param declaredType: variableDeclaration declaredType.
	self removeFromModel: variableDeclaration.
	^true
		
]

{ #category : #'symbols resolution' }
FamixFortran77Resolver >> requalifyVariableDeclarations: variableDeclarations [
	"a LocalVariable declaration can be a:
	- Function
	- Parameter"
	variableDeclarations 
		do: [ :variableDeclaration | self requalifyVariableDeclaration: variableDeclaration ]
]

{ #category : #'symbols resolution' }
FamixFortran77Resolver >> resolve [
	self requalifyVariableDeclarations: (self model allWithType: FamixFortran77Variable).
	self resolveAccesses: (self model allWithType: FamixFortran77Access).
	self resolveInvocations: (self model allWithType: FamixFortran77Invocation)
]

{ #category : #'symbols resolution' }
FamixFortran77Resolver >> retrieveParameters: aProgramUnit [
	^aProgramUnit isInvocable
		ifTrue: [ aProgramUnit parameters ]
		ifFalse: [ #() ]
	
		
]

{ #category : #'private-creation' }
FamixFortran77Resolver >> retrieveVariable: variableName fromList: variables [
	^self retrieveEntity: variableName fromList: variables
]
