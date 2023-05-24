Class {
	#name : #FamixFortran77ResolverTest,
	#superclass : #TestCase,
	#instVars : [
		'mooseModel',
		'resolver',
		'famixProgFile'
	],
	#category : #'FortranSrc-Tests-Visitor'
}

{ #category : #'default values' }
FamixFortran77ResolverTest >> anchorFrom: startPoint to: endPoint [
	^FamixFortran77IndexedFileAnchor new
		mooseModel: mooseModel;
		startLine: startPoint x ;
		startColumn: startPoint y;
		endLine: endPoint x ;
		endColumn: endPoint y ;
		fileName: 'fortran77.f' ;
		yourself
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultAccess [
	^(self newEntity: FamixFortran77Access)
		attributeAt: #entity put: (self defaultIASTVarAccess: 'var' writable: false);
		sourceAnchor: self defaultAnchor;
		yourself
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultAnchor [
	^self anchorFrom: 1 @ 7 to: 2 @ 10
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultFunction: name [
	^(self newNamedEntity: name toFamix: FamixFortran77PUFunction)
		programFile: famixProgFile
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultFunction: name belongsTo: aFamixProgramFile [
	^(self newNamedEntity: name toFamix: FamixFortran77PUFunction)
		programFile: aFamixProgramFile
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultIASTInvocation: name [
	^IASTInvocation new
		entityName: name;
		yourself
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultIASTVarAccess [
	^IASTVarAccess new
		isWrite: false;
		entityName: 'var';
		yourself
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultIASTVarAccess: name writable: boolean [
	^IASTVarAccess new
		isWrite: boolean;
		entityName: name;
		yourself
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultIntegerVariable: name [
	^(self newNamedEntity: name toFamix: FamixFortran77Variable)
		declaredType: self defaultTypeInteger
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultInvocation: name [
	^(self newEntity: FamixFortran77Invocation)
		attributeAt: #entity put: (self defaultIASTInvocation: name);
		sourceAnchor: self defaultAnchor;
		yourself
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultMain: name [
	^(self newNamedEntity: name toFamix: FamixFortran77PUMain)
		programFile: famixProgFile
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultMain: name belongsTo: aFamixProgramFile [
	^(self newNamedEntity: name toFamix: FamixFortran77PUMain)
		programFile: aFamixProgramFile
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultParameter: name [
	^self 
		newNamedEntity: name
		toFamix: FamixFortran77Parameter
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultProgramFile: aFilename [
	^(self newEntity: FamixFortran77ProgramFile)
		name: aFilename;
		filename: aFilename;
		yourself
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultSubroutine: name [
	^(self newNamedEntity: name toFamix: FamixFortran77PUSubroutine)
		programFile: famixProgFile
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultSubroutine: name belongsTo: aFamixProgramFile [
	^(self newNamedEntity: name toFamix: FamixFortran77PUSubroutine)
		programFile: aFamixProgramFile
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultType: anIntrinsicFortranType [
	^FamixFortran77Type new
		name: anIntrinsicFortranType;
		sourceAnchor: self defaultAnchor;
		yourself
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultTypeCharacter [
	^self defaultType: 'character'
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultTypeInteger [
	^self defaultType: 'integer'
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultTypeReal [
	^self defaultType: 'real'
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultVariable [
	^(self newNamedEntity: 'var' toFamix: FamixFortran77Variable)
		declaredType: self defaultTypeInteger;
		yourself 
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultVariable: name withType: type [
	^(self newNamedEntity: name toFamix: FamixFortran77Variable)
		declaredType: (self defaultType: type)
]

{ #category : #running }
FamixFortran77ResolverTest >> newEntity: aFamixClass [
	^aFamixClass new
		mooseModel: mooseModel;
		yourself
]

{ #category : #running }
FamixFortran77ResolverTest >> newNamedEntity: aName toFamix: aFamixClass [
	^(self newEntity: aFamixClass)
		name: aName;
		sourceAnchor: self defaultAnchor;
		yourself
]

{ #category : #running }
FamixFortran77ResolverTest >> setUp [

	super setUp.

	mooseModel := FamixFortran77Model new name: 'mooseModel-tests'; yourself.
	resolver := FamixFortran77Resolver newFrom: mooseModel.
	famixProgFile  := self defaultProgramFile: './main.f'.
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77Access [
	| entity access accessor |

	accessor := (self defaultMain: 'main')
		addLocalVariable: (self defaultVariable: 'var' withType: #integer);
		addAccess: self defaultAccess;
		yourself.

 	resolver resolve.

	self assert: (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) size equals: 1.
	
	entity := (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) first.

	self assert: entity accesses size equals: 1.
	access := entity accesses first.
	
	self assert: access class equals: FamixFortran77Access.
	self assert: access variable equals: entity localVariables first.
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77AccessNonDeclaredVariable [
	| main access accessor |
	"
      program main
      var
      end
	"

	accessor := (self defaultMain: 'main')
		addAccess: self defaultAccess;
		yourself.

 	resolver resolve.

	self assert: (resolver model allWithType: FamixFortran77PUMain) size equals: 1.
	
	main := (resolver model allWithType: FamixFortran77PUMain) first.

	self assert: main accesses size equals: 1.
	access := main accesses first.
	
	self assert: access class equals: FamixFortran77Access.
	self assert: access variable equals: main localVariables first.
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77InvocationCalleeBeforeCaller [
	| sub main invocation callee caller |
	
	caller := (self defaultMain: 'main')
		addOutgoingInvocation: (self defaultInvocation: 'sub');
		yourself.
		
	callee := self defaultSubroutine: 'sub'.

 	resolver resolve.

	main := (resolver model allWithType: FamixFortran77PUMain) first.
	sub := (resolver model allWithType: FamixFortran77PUSubroutine) first.

	self assert: main outgoingInvocations size equals: 1.
	invocation := main outgoingInvocations first.
	
	self assert: invocation class equals: FamixFortran77Invocation.
	self assert: invocation sender equals: main.
	
	self assert: invocation candidates size equals: 1.
	self assert: invocation candidates first equals: sub.
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77InvocationCallerBeforeCallee [
	| main sub invocation callee caller |
	caller := (self defaultMain: 'main')
		addOutgoingInvocation: (self defaultInvocation: 'sub');
		yourself.
		
	callee := self defaultSubroutine: 'sub'.

 	resolver resolve.

	main := (resolver model allWithType: FamixFortran77PUMain) first.
	sub := (resolver model allWithType: FamixFortran77PUSubroutine) first.

	self assert: main outgoingInvocations size equals: 1.
	invocation := main outgoingInvocations first.
	
	self assert: invocation class equals: FamixFortran77Invocation.
	self assert: invocation sender equals: main.
	
	self assert: invocation candidates size equals: 1.
	self assert: invocation candidates first equals: sub.
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77InvocationInDifferentFiles [
	| invocation callee caller famixProgFile1 main sub |

	famixProgFile1  := self defaultProgramFile: './sub.f'.
	
	caller := (self defaultMain: 'main' belongsTo: famixProgFile)
		addOutgoingInvocation: (self defaultInvocation: 'sub');
		yourself.
		
	callee := (self defaultSubroutine: 'sub' belongsTo: famixProgFile1).

	
	resolver resolve.
	
	main := (resolver model allWithType: FamixFortran77PUMain) anyOne.
	sub := (resolver model allWithType: FamixFortran77PUSubroutine) anyOne.

	self assert: main outgoingInvocations size equals: 1.
	invocation := main outgoingInvocations first.
	
	self assert: invocation class equals: FamixFortran77Invocation.
	self assert: invocation sender equals: main.
	
	self assert: invocation candidates size equals: 1.
	self assert: invocation candidates first equals: sub.
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77InvocationMultipleCalleeBeforeCaller [
	| main sub fct invocation calleeSub calleeFct caller |
	caller := (self defaultMain: 'main')
		addOutgoingInvocation: (self defaultInvocation: 'sub');
		addOutgoingInvocation: (self defaultInvocation: 'fct');
		yourself.
		
	calleeSub := self defaultSubroutine: 'sub'.
	calleeFct := self defaultFunction: 'fct'.
	
	resolver resolve.

	main := (resolver model allWithType: FamixFortran77PUMain) first.
	fct := (resolver model allWithType: FamixFortran77PUFunction) first.
	sub := (resolver model allWithType: FamixFortran77PUSubroutine) first.

	self assert: main outgoingInvocations size equals: 2.
	invocation := main outgoingInvocations first.
	
	self assert: invocation class equals: FamixFortran77Invocation.
	self assert: invocation sender equals: main.
	
	self assert: invocation candidates size equals: 1.
	self assert: invocation candidates first equals: sub.
	
	invocation := main outgoingInvocations second.
	
	self assert: invocation class equals: FamixFortran77Invocation.
	self assert: invocation sender equals: main.
	
	self assert: invocation candidates size equals: 1.
	self assert: invocation candidates first equals: fct.
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77LocalVariableAsFunction [
	| main fct famixMain famixFunction |
	"
      program main
      real f
      end
      function f()
      end
	"
	main := (self defaultMain: 'main')
		addLocalVariable: (self defaultVariable: 'f' withType: #real);
		yourself.
		
	fct := (self defaultFunction: 'f').

 	resolver resolve.
	
	famixMain := (resolver model allWithType: FamixFortran77PUMain) first.
	famixFunction := (resolver model allWithType: FamixFortran77PUFunction) first.
	
	self assert: famixMain localVariables isEmpty.
	self assert: famixFunction declaredType class equals: FamixFortran77Type.
	self assert: famixFunction declaredType name equals: 'real'.
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77LocalVariableAsParameter [
	| entity access accessor |

	accessor := (self defaultSubroutine: 'sub')
		addParameter: (self defaultParameter: 'var');
		addLocalVariable: (self defaultVariable: 'var' withType: #integer);
		addAccess: self defaultAccess;
		addAccess: self defaultAccess;
		yourself.

 	resolver resolve.

	self assert: (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) size equals: 1.
	
	entity := (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) first.

	self assert: entity accesses size equals: 2.
	access := entity accesses first.
	
	self assert: access class equals: FamixFortran77Access.
	self assert: access variable equals: entity parameters first.
	
	access := entity accesses second.
	
	self assert: access class equals: FamixFortran77Access.
	self assert: access variable equals: entity parameters first.
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77ParameterWithLocalVariable [
	| entity access accessor |

	accessor := (self defaultSubroutine: 'sub')
		addParameter: (self defaultParameter: 'var');
		addLocalVariable: (self defaultVariable: 'var' withType: 'integer');
		addAccess: self defaultAccess;
		yourself.

 	resolver resolve.

	self assert: (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) size equals: 1.
	
	entity := (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) first.

	self assert: entity accesses size equals: 1.
	access := entity accesses first.
	
	self assert: access class equals: FamixFortran77Access.
	self assert: access variable equals: entity parameters first.
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77ResolveParametersType [
	| entity access accessor |

	accessor := (self defaultSubroutine: 'sub')
		addParameter: (self defaultParameter: 'var');
		addAccess: self defaultAccess;
		addAccess: self defaultAccess;
		yourself.

 	resolver resolve.

	self assert: (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) size equals: 1.
	
	entity := (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) first.

	self assert: entity accesses size equals: 2.
	access := entity accesses first.
	
	self assert: access class equals: FamixFortran77Access.
	self assert: access variable equals: entity parameters first.
	
	access := entity accesses second.
	
	self assert: access class equals: FamixFortran77Access.
	self assert: access variable equals: entity parameters first.
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77ResolveParametersTypeWithDeclaration [
	| entity access accessor |

	accessor := (self defaultSubroutine: 'sub')
		addParameter: (self defaultParameter: 'var');
		addLocalVariable: (self defaultVariable: 'var' withType: #integer);
		addAccess: self defaultAccess;
		addAccess: self defaultAccess;
		yourself.

 	resolver resolve.

	self assert: (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) size equals: 1.
	
	entity := (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) first.

	self assert: entity accesses size equals: 2.
	access := entity accesses first.
	
	self assert: access class equals: FamixFortran77Access.
	self assert: access variable equals: entity parameters first.
	
	access := entity accesses second.
	
	self assert: access class equals: FamixFortran77Access.
	self assert: access variable equals: entity parameters first.
]
