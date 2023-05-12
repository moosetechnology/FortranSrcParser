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

	"God is real . . . unless declared integer"

	"{ 
		($i -> #TypeInteger).
		($j -> #TypeInteger).
		($k -> #TypeInteger).
		($l -> #TypeInteger).
		($m -> #TypeInteger).
		($n -> #TypeInteger) } asDictionary at: $b ifAbsent: [ #TypeReal ]"

	^ ('ijklmn' includes: firstLetter)
		  ifTrue: [ #TypeInteger ]
		  ifFalse: [ #TypeReal ]
]

{ #category : #'reflective operations' }
FamixFortran77SRVisitor >> doesNotUnderstand: aMessage [
	| code |
	(aMessage selector beginsWith: 'visit') ifFalse: [ ^ self ].
	code := aMessage selector asString , ' aFamixF77Entity
	self flag: #TODO.
	self shouldBeImplemented'.
	self class compile: code classified: 'visiting'
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

{ #category : #'private-creation' }
FamixFortran77SRVisitor >> retrieveProgramUnit: anInvocation [

	self flag: #TODO. "Search in the known programunits for the one whose name matches the aName"
	self flag: #TODO. "Process arguments too ?"
	^ (model allWithSubTypesOf: FamixFortran77PUProcedure) select: [ 
		  :procedure | 
		  procedure name = anInvocation entityName and: [ 
			   procedure parameters size = anInvocation arguments size ] ]
]

{ #category : #visiting }
FamixFortran77SRVisitor >> visitFamixF77Invocation: aFamixF77Entity [
	| invocation |
	invocation := self retrieveProgramUnit: (aFamixF77Entity entityAttributes first value).
	aFamixF77Entity target: invocation.
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
