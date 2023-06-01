Class {
	#name : #FamixFortran77Resolver,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'FortranSrc-Resolver'
}

{ #category : #'private-helper' }
FamixFortran77Resolver class >> newFrom: aMooseModel [
	"Answer an instance with same model as aMooseModel."
	^self new
		  model: aMooseModel;
		  yourself
]

{ #category : #'private - utility' }
FamixFortran77Resolver >> defaultImplicitTyping: name fromProgramUnit: programUnit [
	^programUnit dicImplicit at: name first
	"^('ijklmn' includes: name first)
		ifTrue: [ #integer ]
		ifFalse: [ #real ]"
]

{ #category : #'private - utility' }
FamixFortran77Resolver >> findEntity: anEntity forType: aType [
	^((self model allWithType:  aType) 
		select: [ :each | each class = aType 
			and: [ each name = anEntity entityName ]]) first.
]

{ #category : #initialization }
FamixFortran77Resolver >> initialize [

	super initialize
	
]

{ #category : #accessing }
FamixFortran77Resolver >> model [

	^ model
]

{ #category : #accessing }
FamixFortran77Resolver >> model: anObject [

	model := anObject
]

{ #category : #'private-creation' }
FamixFortran77Resolver >> newEntity: aFamixClass [
	^aFamixClass new
		mooseModel: model;
		yourself
]

{ #category : #'symbols resolution' }
FamixFortran77Resolver >> removeFromModel: entity [
	"Set all pointers in the entity to nil beforehand, to make the work of the GarbageCollector easier."
	entity declaredType: nil.
	entity parentBehaviouralEntity: nil.
	entity sourceAnchor: nil.
	self model remove: entity.
]

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
	self resolveImplicitsDeclarations: (self model allWithSubTypesOf: FamixFortran77ProgramUnit).
	self requalifyVariableDeclarations: (self model allWithType: FamixFortran77Variable).
	self resolveAccesses: (self model allWithType: FamixFortran77Access).
	self resolveInvocations: (self model allWithType: FamixFortran77Invocation)
]

{ #category : #'symbols resolution' }
FamixFortran77Resolver >> resolveAccess: anAccess [
	| target varAccessed var |
	
	varAccessed := self retrieveStoredIast: anAccess.

	target := self retrieveVariable: varAccessed fromProgramUnit: anAccess accessor.
	target ifNotNil: [ ^ anAccess target: target ].
	
	var := self resolveAsImplicit: varAccessed fromProgramUnit: anAccess accessor.
	anAccess accessor addLocalVariable: var.
	^anAccess target: var
]

{ #category : #'symbols resolution' }
FamixFortran77Resolver >> resolveAccesses [
	(self model allWithSubTypesOf: FamixFortran77Access) 
		do: [ :access | self resolveAccess: access ]
]

{ #category : #'symbols resolution' }
FamixFortran77Resolver >> resolveAccesses: anAccesses [
	anAccesses do: [ :access | self resolveAccess: access ]
]

{ #category : #'symbols resolution' }
FamixFortran77Resolver >> resolveAsImplicit: anImplicitVariable fromProgramUnit: progUnit [
	| var type |
	self flag: #FIXME. "how to build sourceAnchor for newly created var?"
	type := self newEntity: FamixFortran77Type.
	type name: (self 
		defaultImplicitTyping: anImplicitVariable entityName
		fromProgramUnit: progUnit).

	var := self newEntity: FamixFortran77Variable.
	var 
		name: anImplicitVariable entityName;
		declaredType: type.
	^var
	
]

{ #category : #'symbols resolution' }
FamixFortran77Resolver >> resolveImplicitsDeclarations: programUnits [
	programUnits do: [ :programUnit | self resolveImplicitsFor: programUnit ]
]

{ #category : #'symbols resolution' }
FamixFortran77Resolver >> resolveImplicitsFor: programUnit [

	| implicits |
	implicits := programUnit attributeAt: #implicits ifAbsent: [  ].
	implicits ifNotNil: [ 
		implicits do: [ :each | 
			each ranges
				ifNotNil: [ 
					each ranges flattened do: [ :letter | 
						programUnit dicImplicit
							at: letter
							put: each forType name asSymbol ] ]
				ifNil: [ 
					($a to: $z) do: [ :letter | 
						programUnit dicImplicit at: letter put: nil ] ] ] ]
]

{ #category : #'symbols resolution' }
FamixFortran77Resolver >> resolveInvocation: anInvocation [
	| invocated |
	invocated := self retrieveStoredIast: anInvocation.
	anInvocation addCandidate: (self retrieveInvocables: invocated entityName)
	
]

{ #category : #'symbols resolution' }
FamixFortran77Resolver >> resolveInvocations: anInvocations [
	anInvocations
		do: [ :invocation | self resolveInvocation: invocation ]
]

{ #category : #'private-creation' }
FamixFortran77Resolver >> retrieveEntity: entityName fromList: famixEntities [
	^famixEntities 
		detect: [ :entity | entity name = entityName ]
		ifFound: [ :entity | entity ]
		ifNone: [ nil ]
]

{ #category : #'private-creation' }
FamixFortran77Resolver >> retrieveInvocables: name [
	^self 
		retrieveEntity: name
		fromList: (model allWithSubTypesOf: FamixFortran77PUProcedure)
]

{ #category : #'symbols resolution' }
FamixFortran77Resolver >> retrieveParameters: aProgramUnit [
	^aProgramUnit isInvocable
		ifTrue: [ aProgramUnit parameters ]
		ifFalse: [ #() ]
	
		
]

{ #category : #'private - utility' }
FamixFortran77Resolver >> retrieveStoredIast: anEntity [
	^self retrieveStoredIast: anEntity forSymbol: #entity
]

{ #category : #'private - utility' }
FamixFortran77Resolver >> retrieveStoredIast: anEntity forSymbol: aSymbol [
	| entity |
	entity := anEntity 
		attributeAt: aSymbol 
		ifAbsent: [ Notification signal: 'problem with generated entity' ].
	anEntity attributeAt: aSymbol put: nil.
	^entity
]

{ #category : #'private-creation' }
FamixFortran77Resolver >> retrieveVariable: variableName fromList: variables [
	^self retrieveEntity: variableName fromList: variables
]

{ #category : #'private-creation' }
FamixFortran77Resolver >> retrieveVariable: aVariable fromProgramUnit: programUnit [

	"- Search in the known parameters and variables for the one whose name matches the aVariable name"
	"- compare their type also ?"
	| target |
	target := programUnit isInvocable
		ifTrue: [ self retrieveVariable: aVariable entityName fromList: programUnit parameters ]
		ifFalse: [ nil ].
	target ifNotNil: [ ^target ].	
	^self retrieveVariable: aVariable entityName fromList: programUnit localVariables.
]
