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
FamixFortran77SRVisitorTest >> defaultAnchor [

	^ self anchorFrom: 1 @ 7 to: 2 @ 10
]

{ #category : #running }
FamixFortran77SRVisitorTest >> defaultTypeCharacter [
	^IASTTypeRef new
		entityName: 'character';
		sourceAnchor: self defaultAnchor;
		yourself
]

{ #category : #running }
FamixFortran77SRVisitorTest >> defaultTypeInteger [
	^IASTTypeRef new
		entityName: 'integer';
		sourceAnchor: self defaultAnchor;
		yourself
]

{ #category : #running }
FamixFortran77SRVisitorTest >> defaultTypeReal [
	^IASTTypeRef new
		entityName: 'real';
		sourceAnchor: self defaultAnchor;
		yourself
]

{ #category : #running }
FamixFortran77SRVisitorTest >> defaultVariable [
	^ IASTVariable new
		   entityName: 'aVar';
			typeSpec: self defaultTypeInteger;
		 	yourself
]

{ #category : #running }
FamixFortran77SRVisitorTest >> setUp [
	super setUp.
	
	iastProgFile := IASTProgramFile new filename: 'fortran77.f' ; yourself.
	iastProgFile2 := IASTProgramFile new filename: 'fortran77.1.f' ; yourself.
	defVisitor := IASTToFamixVisitor new.
	refVisitor := FamixFortran77SRVisitor newFrom: defVisitor model.
]

{ #category : #running }
FamixFortran77SRVisitorTest >> testCreateFamixFortran77Access [
	| entity access accessor |

	accessor := IASTMainProgram new
			entityName: 'main';
			body: { 
				self defaultVariable .
				IASTVarAccess new
					entityName: 'aVar'; 
					yourself 
			};
			yourself.

	iastProgFile progUnits: { accessor }.
	
 	(iastProgFile accept: defVisitor) accept: refVisitor.
	entity := (refVisitor model allWithSubTypesOf: FamixFortran77ProgramFile) first.

	self assert: entity programUnits first accesses size equals: 1.
	access := entity programUnits first accesses first.
	
	self assert: access class equals: FamixFortran77Access.
	self assert: access variable equals: entity programUnits first localVariables first.
]

{ #category : #running }
FamixFortran77SRVisitorTest >> testCreateFamixFortran77InvocationCalleeBeforeCaller [
	| entity invocation callee caller |
	callee := IASTSubroutine new entityName: 'sub'; yourself.

	caller := IASTMainProgram new
			entityName: 'main';
			body: { IASTInvocation new entityName: 'sub'; yourself };
			yourself.
	iastProgFile progUnits: { callee . caller }.
	
	(iastProgFile accept: defVisitor) accept: refVisitor.
	entity := (refVisitor model allWithSubTypesOf: FamixFortran77ProgramFile) first.

	self assert: entity programUnits second outgoingInvocations size equals: 1.
	invocation := entity programUnits second outgoingInvocations first.
	
	self assert: invocation class equals: FamixFortran77Invocation.
	self assert: invocation sender equals: entity programUnits second.
	
	self assert: invocation candidates size equals: 1.
	self assert: invocation candidates first equals: entity programUnits first.
]

{ #category : #running }
FamixFortran77SRVisitorTest >> testCreateFamixFortran77InvocationCallerBeforeCallee [
	| entity invocation callee caller |
	callee := IASTSubroutine new entityName: 'sub'; yourself.

	caller := IASTMainProgram new
			entityName: 'main';
			body: { IASTInvocation new entityName: 'sub'; yourself };
			yourself.
	iastProgFile progUnits: { caller . callee }.
	
	(iastProgFile accept: defVisitor) accept: refVisitor.
	entity := (refVisitor model allWithSubTypesOf: FamixFortran77ProgramFile) first.

	self assert: entity programUnits first outgoingInvocations size equals: 1.
	invocation := entity programUnits first outgoingInvocations first.
	
	self assert: invocation class equals: FamixFortran77Invocation.
	self assert: invocation sender equals: entity programUnits first.
	
	self assert: invocation candidates size equals: 1.
	self assert: invocation candidates first equals: entity programUnits second.
]

{ #category : #running }
FamixFortran77SRVisitorTest >> testCreateFamixFortran77InvocationInDifferentFiles [
	| entity invocation callee caller |
	callee := IASTSubroutine new entityName: 'sub'; yourself.
	
	caller := IASTMainProgram new
			entityName: 'main';
			body: { IASTInvocation new entityName: 'sub'; yourself };
			yourself.
	iastProgFile progUnits: { caller }.
	iastProgFile2 progUnits: { caller }.
	
	({iastProgFile . iastProgFile2 } do: [ :pf | pf accept: defVisitor ]) accept: refVisitor.
	1halt.
	entity := (refVisitor model allWithSubTypesOf: FamixFortran77ProgramFile) first.

	self assert: entity programUnits first outgoingInvocations size equals: 1.
	invocation := entity programUnits first outgoingInvocations first.
	
	self assert: invocation class equals: FamixFortran77Invocation.
	self assert: invocation sender equals: entity programUnits first.
	
	self assert: invocation candidates size equals: 1.
	self assert: invocation candidates first equals: entity programUnits second.
]

{ #category : #running }
FamixFortran77SRVisitorTest >> testCreateFamixFortran77InvocationMultipleCalleeBeforeCaller [
	| entity invocation calleeSub calleeFct caller |
	calleeSub := IASTSubroutine new entityName: 'sub'; yourself.
	calleeFct := IASTFunction new entityName: 'f'; yourself.

	caller := IASTMainProgram new
			entityName: 'main';
			body: { IASTInvocation new entityName: 'sub'; yourself. IASTInvocation new entityName: 'f'; yourself };
			yourself.
	iastProgFile progUnits: { calleeSub . calleeFct . caller }.
	
	(iastProgFile accept: defVisitor) accept: refVisitor.
	entity := (refVisitor model allWithSubTypesOf: FamixFortran77ProgramFile) first.

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

{ #category : #running }
FamixFortran77SRVisitorTest >> testCreateFamixFortran77LocalVariable [

	| entity var |
	iastProgFile progUnits: { IASTSubroutine new
			 entityName: 'sub';
			 body: { self defaultVariable };
			 yourself }.

	entity := iastProgFile accept: defVisitor.

	self assert: entity programUnits first localVariables size equals: 1.

	var := entity programUnits first localVariables first.
	self assert: var class equals: FamixFortran77Variable.
	self assert: var declaredType class equals: FamixFortran77FType.
	self assert: var declaredType name equals: 'integer'.
]
