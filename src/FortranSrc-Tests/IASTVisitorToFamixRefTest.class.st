Class {
	#name : #IASTVisitorToFamixRefTest,
	#superclass : #TestCase,
	#instVars : [
		'iastProgFile',
		'visitorDef'
	],
	#category : #'FortranSrc-Tests-Visitor'
}

{ #category : #running }
IASTVisitorToFamixRefTest >> anchorFrom: startPoint to: endPoint [
	^IASTIndexedFileAnchor new
		startLine: startPoint x ;
		startColumn: startPoint y;
		endLine: endPoint x ;
		endColumn: endPoint y ;
		fileName: 'fortran77.f' ;
		yourself
]

{ #category : #running }
IASTVisitorToFamixRefTest >> defaultAnchor [

	^ self anchorFrom: 1 @ 7 to: 2 @ 10
]

{ #category : #running }
IASTVisitorToFamixRefTest >> defaultTypeCharacter [
	^IASTTypeRef new
		entityName: 'character';
		sourceAnchor: self defaultAnchor;
		yourself
]

{ #category : #running }
IASTVisitorToFamixRefTest >> defaultTypeInteger [
	^IASTTypeRef new
		entityName: 'integer';
		sourceAnchor: self defaultAnchor;
		yourself
]

{ #category : #running }
IASTVisitorToFamixRefTest >> defaultTypeReal [
	^IASTTypeRef new
		entityName: 'real';
		sourceAnchor: self defaultAnchor;
		yourself
]

{ #category : #running }
IASTVisitorToFamixRefTest >> defaultVariable [

	^ IASTVariable new
		   entityName: 'aVar';
			typeSpec: self defaultTypeInteger;
		 	yourself
]

{ #category : #running }
IASTVisitorToFamixRefTest >> setUp [
	super setUp.
	
	iastProgFile := IASTProgramFile new filename: 'fortran77.f' ; yourself.
	visitorDef := IASTVisitorToFamixDef new.
]

{ #category : #running }
IASTVisitorToFamixRefTest >> testCreateFamixFortran77Access [
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

	entity := iastProgFile accept: visitorDef.

	self assert: entity programUnits first accesses size equals: 1.
	access := entity programUnits first accesses first.
	
	self assert: access class equals: FamixFortran77Access.
	self assert: access variable equals: entity programUnits first localVariables first.
]

{ #category : #running }
IASTVisitorToFamixRefTest >> testCreateFamixFortran77Access2 [
	| step2 access accessor |

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
	iastProgFile accept: visitorDef.

	step2 := iastProgFile accept: (IASTVisitorToFamixRef newFrom: visitorDef model).

	self assert: step2 programUnits first accesses size equals: 1.
	access := step2 programUnits first accesses first.

	self assert: access class equals: FamixFortran77Access.
	self assert: access variable equals: step2 programUnits first localVariables first.
]

{ #category : #running }
IASTVisitorToFamixRefTest >> testCreateFamixFortran77InvocationCalleeBeforeCaller [
	| entity invocation caller callee |

	callee := IASTSubroutine new entityName: 'sub'; yourself.

	caller := IASTMainProgram new
			entityName: 'main';
			body: { IASTInvocation new entityName: 'sub'; yourself };
			yourself.
	iastProgFile progUnits: { callee . caller }.

	entity := iastProgFile accept: visitorDef.

	self assert: entity programUnits second outgoingInvocations size equals: 1.
	invocation := entity programUnits second outgoingInvocations first.
	
	self assert: invocation class equals: FamixFortran77Invocation.
	self assert: invocation sender equals: entity programUnits second.
	
	self assert: invocation candidates size equals: 1.
	self assert: invocation candidates first equals: entity programUnits first.
]

{ #category : #running }
IASTVisitorToFamixRefTest >> testCreateFamixFortran77InvocationCallerBeforeCallee [
	| entity invok caller callee |

	callee := IASTSubroutine new entityName: 'sub'; yourself.

	caller := IASTMainProgram new
			entityName: 'main';
			body: { IASTInvocation new entityName: 'sub'; yourself };
			yourself.
	iastProgFile progUnits: { caller . callee }.

	entity := iastProgFile accept: visitorDef.

	self assert: entity programUnits first outgoingInvocations size equals: 1.
	invok := entity programUnits first outgoingInvocations first.
	
	self assert: invok class equals: FamixFortran77Invocation.
	self assert: invok sender equals: entity programUnits first.
	
	self assert: invok candidates size equals: 1.
	self assert: invok candidates first equals: entity programUnits second.
]

{ #category : #running }
IASTVisitorToFamixRefTest >> testCreateFamixFortran77InvocationCallerBeforeCallee2 [
	| step1 step2 invok caller callee |

	callee := IASTSubroutine new entityName: 'sub'; yourself.

	caller := IASTMainProgram new
			entityName: 'main';
			body: { IASTInvocation new entityName: 'sub'; yourself };
			yourself.
	iastProgFile progUnits: { caller . callee }.

	step1 := iastProgFile accept: visitorDef.
	step2 := iastProgFile accept: (IASTVisitorToFamixRef newFrom: visitorDef model).

	self assert: step2 programUnits first outgoingInvocations size equals: 1.
	invok := step2 programUnits first outgoingInvocations first.
	
	self assert: invok class equals: FamixFortran77Invocation.
	self assert: invok sender equals: step2 programUnits first.
	
	self assert: invok candidates size equals: 1.
	self assert: invok candidates first equals: step2 programUnits second.
]

{ #category : #running }
IASTVisitorToFamixRefTest >> testCreateFamixFortran77LocalVariable [

	| entity var |
	iastProgFile progUnits: { IASTSubroutine new
			 entityName: 'sub';
			 body: { self defaultVariable };
			 yourself }.

	entity := iastProgFile accept: visitorDef.

	self assert: entity programUnits first localVariables size equals: 1.

	var := entity programUnits first localVariables first.
	self assert: var class equals: FamixFortran77Variable.
	self assert: var declaredType class equals: FamixFortran77FType.
	self assert: var declaredType name equals: 'integer'.
]
