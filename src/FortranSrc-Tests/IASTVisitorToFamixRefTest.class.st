Class {
	#name : #IASTVisitorToFamixRefTest,
	#superclass : #TestCase,
	#instVars : [
		'visitor',
		'iast'
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
	
	iast := IASTProgramFile new filename: 'fortran77.f' ; yourself.
	visitor := IASTVisitorToFamixRef new
]

{ #category : #running }
IASTVisitorToFamixRefTest >> testCreateFamixFortran77Access [
	| entity access accessor |

	accessor := IASTMainProgram new
			 entityName: 'main';
			 body: { self defaultVariable . IASTVarAccess new entityName: 'aVar'; yourself };
			 yourself.
	iast progUnits: { accessor }.

	entity := iast accept: visitor.

	self assert: entity programUnits first accesses size equals: 1.
	access := entity programUnits first accesses first.
	
	self assert: access class equals: FamixFortran77Access.
	self assert: access variable equals: entity programUnits first localVariables first.
]

{ #category : #running }
IASTVisitorToFamixRefTest >> testCreateFamixFortran77Invocation [
	| entity invok caller callee |

	callee := IASTSubroutine new entityName: 'sub'; yourself.

	caller := IASTMainProgram new
			 entityName: 'main';
			 yourself.
	iast progUnits: { callee . caller }.
	
	caller body: { IASTInvocation new entityName: 'sub'; yourself }.

	entity := iast accept: visitor.

	self assert: entity programUnits second outgoingInvocations size equals: 1.
	invok := entity programUnits second outgoingInvocations first.
	
	self assert: invok class equals: FamixFortran77Invocation.
	self assert: invok sender equals: entity programUnits second.
	
	self assert: invok candidates size equals: 1.
	self assert: invok candidates first equals: entity programUnits first.
]

{ #category : #running }
IASTVisitorToFamixRefTest >> testCreateFamixFortran77LocalVariable [

	| entity var |
	iast progUnits: { (IASTSubroutine new
			 entityName: 'sub';
			 body: { self defaultVariable };
			 yourself) }.

	entity := iast accept: visitor.

	self assert: entity programUnits first localVariables size equals: 1.

	var := entity programUnits first localVariables first.
	self assert: var class equals: FamixFortran77Variable.
	self assert: var declaredType class equals: FamixFortran77FType.
	self assert: var declaredType name equals: 'integer'.
]
