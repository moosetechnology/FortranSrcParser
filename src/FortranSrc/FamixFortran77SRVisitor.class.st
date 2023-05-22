Class {
	#name : #FamixFortran77SRVisitor,
	#superclass : #Object,
	#instVars : [
		'model',
		'f77sourcefile',
		'stack'
	],
	#category : #'FortranSrc-Visitor'
}

{ #category : #'private-helper' }
FamixFortran77SRVisitor class >> getBasename: filename [

	^ filename asFileReference basename
]

{ #category : #'private-helper' }
FamixFortran77SRVisitor class >> getLines: filename [

	^ filename asFileReference contents lines
]

{ #category : #'private-helper' }
FamixFortran77SRVisitor class >> newFrom: aMooseModel [
	"Answer an instance with same model as aMooseModel."
	^self new
		  model: aMooseModel;
		  yourself
]

{ #category : #'private - utility' }
FamixFortran77SRVisitor >> defaultImplicitTyping: firstLetter [
	^ ('ijklmn' includes: firstLetter)
		  ifTrue: [ #TypeInteger ]
		  ifFalse: [ #TypeReal ]
]

{ #category : #'private - utility' }
FamixFortran77SRVisitor >> findEntity: anEntity forType: aType [
	^((self model allWithSubTypesOf:  aType) select: [ :each |
		each class = aType and: [ 
		each name = anEntity entityName ]]) first.
]

{ #category : #initialization }
FamixFortran77SRVisitor >> initialize [

	super initialize.
	"f77sourcefile := ''.
	model := FamixFortran77Model new name: 'mooseModelF77'."
	stack := Stack new.
	
]

{ #category : #accessing }
FamixFortran77SRVisitor >> model [

	^ model
]

{ #category : #accessing }
FamixFortran77SRVisitor >> model: anObject [

	model := anObject
]

{ #category : #visiting }
FamixFortran77SRVisitor >> newEntity: aFamixClass [
	^aFamixClass new
		mooseModel: model;
		yourself
]

{ #category : #'symbols resolution' }
FamixFortran77SRVisitor >> resolve [

	| programUnits |
	programUnits := self model allWithSubTypesOf: FamixFortran77ProgramUnit.
	programUnits
		select: [ :programUnit | (programUnit class = FamixFortran77PUComment) not ]
		thenDo: [ :programUnit | self resolveFor: programUnit ]
]

{ #category : #visiting }
FamixFortran77SRVisitor >> resolveAccess: anAccess [
	| target varAcceded |
	self flag: #FIXME. "how to build sourceAnchor for newly created var?"
	varAcceded := anAccess attributeAt: #entity ifAbsent: [ nil ].
	target := self retrieveVariable: varAcceded.
	target
		ifNil: [ 
			| var |
			var := ((self newEntity: FamixFortran77Variable)
				name: varAcceded entityName;
				declaredType: ((self newEntity: FamixFortran77Type)
					name: (self defaultImplicitTyping: varAcceded entityName first);
					yourself);
				yourself).
			anAccess accessor addLocalVariable: var.
			anAccess target: var ]
		ifNotNil: [ anAccess target: target ]
]

{ #category : #'symbols resolution' }
FamixFortran77SRVisitor >> resolveAccesses: anAccesses [
	anAccesses do: [ :access | self resolveAccess: access ]
]

{ #category : #'symbols resolution' }
FamixFortran77SRVisitor >> resolveFor: aProgramUnit [
	self resolveAccesses: aProgramUnit accesses.
	self resolveInvocations: aProgramUnit outgoingInvocations.
]

{ #category : #visiting }
FamixFortran77SRVisitor >> resolveInvocation: aFamixF77Entity [
	aFamixF77Entity target: (self retrieveInvocable:
		(aFamixF77Entity attributeAt: #entity ifAbsent: [ nil ]))
]

{ #category : #'symbols resolution' }
FamixFortran77SRVisitor >> resolveInvocations: anInvocations [
	anInvocations do: [ :invoke | self resolveInvocation: invoke ]
]

{ #category : #'private-creation' }
FamixFortran77SRVisitor >> retrieveInvocable: anInvocation [

	self flag: #TODO.
	"- Search in the known programunits for the one whose name matches the aName"
	"- Process arguments too: their numbers, their type ?"

	^ (model allWithSubTypesOf: FamixFortran77PUProcedure) select: [ 
		  :procedure | 
		  procedure name = anInvocation entityName and: [ 
			  procedure parameters size = anInvocation arguments size ] ]
]

{ #category : #'private-creation' }
FamixFortran77SRVisitor >> retrieveProgramUnit: anInvocation [

	self flag: #TODO. "Search in the known programunits for the one whose name matches the aName"
	self flag: #TODO. "Process arguments too ?"
	^ (model allWithSubTypesOf: FamixFortran77PUProcedure) select: [ 
		  :procedure | 
		  procedure name = anInvocation entityName and: [ 
			   procedure parameters size = anInvocation arguments size ] ]
]

{ #category : #'private-creation' }
FamixFortran77SRVisitor >> retrieveVariable: anAccess [

	| target |
	self flag: #TODO.
	"- Search in the known variables for the one whose name matches the anAccess name"
	"- compare their type also ?"
	target := (model allWithType: FamixFortran77Variable) select: [ :variable | 
		   variable name = anAccess entityName ].
	^ target isNotEmpty
		ifTrue: [ target anyOne ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
FamixFortran77SRVisitor >> visitFamixF77Invocation: aFamixF77Entity [
	self flag: #FIXME. "aFamixF77Entity attributeAt: 'iast' ifAbsent: '' does not work"
	aFamixF77Entity target: (self retrieveProgramUnit: (aFamixF77Entity entityAttributes first value)).
]

{ #category : #visiting }
FamixFortran77SRVisitor >> visitFamixF77PUMain: aFamixF77Entity [
	self visitInvocable: aFamixF77Entity
]

{ #category : #visiting }
FamixFortran77SRVisitor >> visitFamixF77Procedure: aFamixF77Entity [
	^self visitInvocable: aFamixF77Entity.
]

{ #category : #visiting }
FamixFortran77SRVisitor >> visitFamixF77ProgramFile: aFamixF77Entity [
	^aFamixF77Entity programUnits collect: [ :pu | pu accept: self  ]
]

{ #category : #visiting }
FamixFortran77SRVisitor >> visitInvocable: aFamixF77Entity [
	^aFamixF77Entity outgoingInvocations do: [ :invok | invok accept: self ]
]
