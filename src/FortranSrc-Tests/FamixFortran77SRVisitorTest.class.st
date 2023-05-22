Class {
	#name : #FamixFortran77SRVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'mooseModel',
		'resolver'
	],
	#category : #'FortranSrc-Tests-Visitor'
}

{ #category : #running }
FamixFortran77SRVisitorTest >> anchorFrom: startPoint to: endPoint [
	^FamixFortran77IndexedFileAnchor new
		mooseModel: mooseModel;
		startLine: startPoint x ;
		startColumn: startPoint y;
		endLine: endPoint x ;
		endColumn: endPoint y ;
		fileName: 'fortran77.f' ;
		yourself
]

{ #category : #running }
FamixFortran77SRVisitorTest >> defaultAccess [
	^(self newEntity: FamixFortran77Access)
		attributeAt: #entity put: self defaultIASTVarAccess;
		sourceAnchor: self defaultAnchor;
		yourself
]

{ #category : #running }
FamixFortran77SRVisitorTest >> defaultAnchor [
	^self anchorFrom: 1 @ 7 to: 2 @ 10
]

{ #category : #running }
FamixFortran77SRVisitorTest >> defaultFunction [
	^self newNamedEntity: 'fct' toFamix: FamixFortran77PUFunction
]

{ #category : #running }
FamixFortran77SRVisitorTest >> defaultIASTInvocation: name [
	^IASTInvocation new
		entityName: name;
		yourself
]

{ #category : #running }
FamixFortran77SRVisitorTest >> defaultIASTVarAccess [
	^IASTVarAccess new
		isWrite: false;
		entityName: 'var';
		yourself
]

{ #category : #running }
FamixFortran77SRVisitorTest >> defaultInvocation: name [
	^(self newEntity: FamixFortran77Invocation)
		attributeAt: #entity put: (self defaultIASTInvocation: name);
		sourceAnchor: self defaultAnchor;
		yourself
]

{ #category : #running }
FamixFortran77SRVisitorTest >> defaultMain [
	^self newNamedEntity: 'main' toFamix: FamixFortran77PUMain
]

{ #category : #running }
FamixFortran77SRVisitorTest >> defaultProgramFile: aFilename [
	^(self newEntity: FamixFortran77ProgramFile)
		name: aFilename;
		filename: aFilename;
		yourself
]

{ #category : #running }
FamixFortran77SRVisitorTest >> defaultSubroutine [
	^self newNamedEntity: 'sub' toFamix: FamixFortran77PUSubroutine
]

{ #category : #running }
FamixFortran77SRVisitorTest >> defaultType: anIntrinsicFortranType [
	^FamixFortran77Type new
		name: anIntrinsicFortranType;
		sourceAnchor: self defaultAnchor;
		yourself
]

{ #category : #running }
FamixFortran77SRVisitorTest >> defaultTypeCharacter [
	^self defaultType: 'character'
]

{ #category : #running }
FamixFortran77SRVisitorTest >> defaultTypeInteger [
	^self defaultType: 'integer'
]

{ #category : #running }
FamixFortran77SRVisitorTest >> defaultTypeReal [
	^self defaultType: 'real'
]

{ #category : #running }
FamixFortran77SRVisitorTest >> defaultVariable [
	^(self newNamedEntity: 'var' toFamix: FamixFortran77Variable)
		declaredType: self defaultTypeInteger;
		yourself 
]

{ #category : #running }
FamixFortran77SRVisitorTest >> newEntity: aFamixClass [
	^aFamixClass new
		mooseModel: mooseModel;
		yourself
]

{ #category : #running }
FamixFortran77SRVisitorTest >> newNamedEntity: aName toFamix: aFamixClass [
	^(self newEntity: aFamixClass)
		name: aName;
		sourceAnchor: self defaultAnchor;
		yourself
]

{ #category : #running }
FamixFortran77SRVisitorTest >> setUp [

	super setUp.

	mooseModel := FamixFortran77Model new name: 'mooseModel-tests'; yourself.
	resolver := FamixFortran77SRVisitor newFrom: mooseModel
]

{ #category : #running }
FamixFortran77SRVisitorTest >> testCreateFamixFortran77Access [
	| entity access accessor famixProgFile |

	accessor := (self defaultMain)
		addLocalVariable: self defaultVariable;
		addAccess: self defaultAccess;
		yourself.

	famixProgFile  := self defaultProgramFile: './main.f'.
	famixProgFile programUnits: { accessor }.

 	resolver resolve.
	self assert: (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) size equals: 1.
	
	entity := (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) first.

	self assert: entity accesses size equals: 1.
	access := entity accesses first.
	
	self assert: access class equals: FamixFortran77Access.
	self assert: access variable equals: entity localVariables first.
]

{ #category : #running }
FamixFortran77SRVisitorTest >> testCreateFamixFortran77AccessNonDeclaredVariable [
	| entity access accessor famixProgFile |

	accessor := (self defaultMain)
		addAccess: self defaultAccess;
		yourself.

	famixProgFile  := self defaultProgramFile: './main.f'.
	famixProgFile programUnits: { accessor }.

 	resolver resolve.
	self assert: (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) size equals: 1.
	
	entity := (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) first.

	self assert: entity accesses size equals: 1.
	access := entity accesses first.
	
	self assert: access class equals: FamixFortran77Access.
	self assert: access variable equals: entity localVariables first.
]

{ #category : #running }
FamixFortran77SRVisitorTest >> testCreateFamixFortran77InvocationCalleeBeforeCaller [
	| entity invocation callee caller famixProgFile |
	
	caller := (self defaultMain)
		addOutgoingInvocation: (self defaultInvocation: 'sub');
		yourself.
		
	callee := self defaultSubroutine.

	famixProgFile  := self defaultProgramFile: './main.f'.
	famixProgFile programUnits: { callee . caller }.

 	resolver resolve.

	entity := (resolver model allWithSubTypesOf: FamixFortran77ProgramFile) first.

	self assert: entity programUnits second outgoingInvocations size equals: 1.
	invocation := entity programUnits second outgoingInvocations first.
	
	self assert: invocation class equals: FamixFortran77Invocation.
	self assert: invocation sender equals: entity programUnits second.
	
	self assert: invocation candidates size equals: 1.
	self assert: invocation candidates first equals: entity programUnits first.
]

{ #category : #running }
FamixFortran77SRVisitorTest >> testCreateFamixFortran77InvocationCallerBeforeCallee [
	| entity invocation callee caller famixProgFile |
	caller := (self defaultMain)
		addOutgoingInvocation: (self defaultInvocation: 'sub');
		yourself.
		
	callee := self defaultSubroutine.

	famixProgFile  := self defaultProgramFile: './main.f'.
	famixProgFile programUnits: { caller . callee }.

 	resolver resolve.
	entity := (resolver model allWithSubTypesOf: FamixFortran77ProgramFile) first.

	self assert: entity programUnits first outgoingInvocations size equals: 1.
	invocation := entity programUnits first outgoingInvocations first.
	
	self assert: invocation class equals: FamixFortran77Invocation.
	self assert: invocation sender equals: entity programUnits first.
	
	self assert: invocation candidates size equals: 1.
	self assert: invocation candidates first equals: entity programUnits second.
]

{ #category : #running }
FamixFortran77SRVisitorTest >> testCreateFamixFortran77InvocationInDifferentFiles [
	| invocation callee caller famixProgFile1 famixProgFile2 main sub |
	
	famixProgFile1  := self defaultProgramFile: './main.f'.
	famixProgFile2  := self defaultProgramFile: './sub.f'.
	
	caller := (self defaultMain)
		addOutgoingInvocation: (self defaultInvocation: 'sub');
		yourself.
		
	callee := self defaultSubroutine.

	famixProgFile1 programUnits: { caller }.	

	famixProgFile2 programUnits: { callee }.
	
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
FamixFortran77SRVisitorTest >> testCreateFamixFortran77InvocationMultipleCalleeBeforeCaller [
	| entity invocation calleeSub calleeFct caller famixProgFile |
	caller := (self defaultMain)
		addOutgoingInvocation: (self defaultInvocation: 'sub');
		addOutgoingInvocation: (self defaultInvocation: 'fct');
		yourself.
		
	calleeSub := self defaultSubroutine.
	calleeFct := self defaultFunction.

	famixProgFile  := self defaultProgramFile: './main.f'.
	famixProgFile programUnits: { calleeSub . calleeFct . caller }.
	
	resolver resolve.

	entity := (resolver model allWithSubTypesOf: FamixFortran77ProgramFile) first.

	self assert: entity programUnits third outgoingInvocations size equals: 2.
	invocation := entity programUnits third outgoingInvocations first.
	
	self assert: invocation class equals: FamixFortran77Invocation.
	self assert: invocation sender equals: entity programUnits third.
	
	self assert: invocation candidates size equals: 1.
	self assert: invocation candidates first equals: entity programUnits first.
	
	invocation := entity programUnits third outgoingInvocations second.
	
	self assert: invocation class equals: FamixFortran77Invocation.
	self assert: invocation sender equals: entity programUnits third.
	
	self assert: invocation candidates size equals: 1.
	self assert: invocation candidates first equals: entity programUnits second.
]
