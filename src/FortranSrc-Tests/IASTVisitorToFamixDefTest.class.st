"
An IASTVisitorF77Test is a test class for testing the behavior of IASTVisitorF77
"
Class {
	#name : #IASTVisitorToFamixDefTest,
	#superclass : #TestCase,
	#instVars : [
		'visitor',
		'programFile'
	],
	#category : #'FortranSrc-Tests-Visitor'
}

{ #category : #running }
IASTVisitorToFamixDefTest >> anchorFrom: startPoint to: endPoint [
	^IASTIndexedFileAnchor new
		startLine: startPoint x ;
		startColumn: startPoint y;
		endLine: endPoint x ;
		endColumn: endPoint y ;
		fileName: 'fortran77.f' ;
		yourself
]

{ #category : #running }
IASTVisitorToFamixDefTest >> defaultAnchor [
	^ self anchorFrom: 1 @ 7 to: 2 @ 10
]

{ #category : #running }
IASTVisitorToFamixDefTest >> defaultVariable [
	^ IASTVariable new
		entityName: 'aVar';
		typeSpec: 'integer';
		yourself
]

{ #category : #running }
IASTVisitorToFamixDefTest >> setUp [
	super setUp.
	
	programFile := IASTProgramFile new filename: 'fortran77.f' ; yourself.
	visitor := IASTVisitorToFamixDef new.
]

{ #category : #running }
IASTVisitorToFamixDefTest >> testCreateFamixFortran77 [

	| entity var |
	programFile progUnits: { IASTSubroutine new
		entityName: 'sub';
		body: { self defaultVariable };
		yourself
	}.

	entity := programFile accept: visitor.

	self assert: entity programUnits first localVariables size equals: 1.

	var := entity programUnits first localVariables first.
	self assert: var class equals: FamixFortran77Variable.
	self assert: var name equals: 'aVar'.
	self assert: var parentBehaviouralEntity isNotNil.
	self
		assert: var parentBehaviouralEntity
		equals: entity programUnits first
]

{ #category : #running }
IASTVisitorToFamixDefTest >> testCreateFamixFortran77Comment [

	| entity comment |

	programFile progUnits: { IASTMainProgram new
			 entityName: 'main';
			 body: { IASTComment new
		           text: 'a normal comment';
		           yourself. };
			 yourself }.

	entity := programFile accept: visitor.

	self assert: entity programUnits size equals: 1.
	self assert: entity programUnits first comments size equals: 1.

	comment := entity programUnits first comments first.
	self assert: comment class equals: FamixFortran77Comment.
	self assert: comment content equals: 'a normal comment'.
	
	self assert: comment commentedEntity equals: entity programUnits first.
]

{ #category : #running }
IASTVisitorToFamixDefTest >> testCreateFamixFortran77InvocationCalleeBeforeCaller [
	| entity invocation caller callee |

	callee := IASTSubroutine new entityName: 'sub'; yourself.

	caller := IASTMainProgram new
			entityName: 'main';
			body: { IASTInvocation new entityName: 'sub'; yourself };
			yourself.
	programFile progUnits: { callee . caller }.

	entity := programFile accept: visitor.

	self assert: entity programUnits second outgoingInvocations size equals: 1.
	invocation := entity programUnits second outgoingInvocations first.
	
	self assert: invocation class equals: FamixFortran77Invocation.
	self assert: invocation sender equals: entity programUnits second.
	
	self assert: invocation candidates size equals: 1.
	self assert: invocation candidates first equals: entity programUnits first.
]

{ #category : #running }
IASTVisitorToFamixDefTest >> testCreateFamixFortran77InvocationCallerBeforeCallee [
	| entity invocation caller callee |

	callee := IASTSubroutine new entityName: 'sub'; yourself.

	caller := IASTMainProgram new
			entityName: 'main';
			body: { IASTInvocation new entityName: 'sub'; yourself };
			yourself.
	programFile progUnits: { caller . callee }.

	entity := programFile accept: visitor.

	self assert: entity programUnits second outgoingInvocations size equals: 1.
	invocation := entity programUnits second outgoingInvocations first.
	
	self assert: invocation class equals: FamixFortran77Invocation.
	self assert: invocation sender equals: entity programUnits second.
	
	self assert: invocation candidates size equals: 1.
	self assert: invocation candidates first equals: entity programUnits first.
]

{ #category : #running }
IASTVisitorToFamixDefTest >> testCreateFamixFortran77LocalVariable [

	| entity var |
	programFile progUnits: { IASTSubroutine new
			 entityName: 'sub';
			 body: { self defaultVariable };
			 yourself }.

	entity := programFile accept: visitor.

	self assert: entity programUnits first localVariables size equals: 1.

	var := entity programUnits first localVariables first.
	self assert: var class equals: FamixFortran77Variable.
	self assert: var name equals: 'aVar'.
	self assert: var parentBehaviouralEntity isNotNil.
	self
		assert: var parentBehaviouralEntity
		equals: entity programUnits first
]

{ #category : #running }
IASTVisitorToFamixDefTest >> testCreateFamixFortran77PUBlockdata [

	| entity |
	programFile progUnits: { IASTBlockData new
			 entityName: 'bdata';
			 yourself
	}.

	entity := programFile accept: visitor.

	self assert: entity programUnits size equals: 1.

	entity := entity programUnits first.
	self assert: entity class equals: FamixFortran77PUBlockdata.
	self assert: entity name equals: 'bdata'.
	self assert: entity programFile isNotNil.
	self assert: entity programFile filename equals: 'fortran77.f'.
]

{ #category : #running }
IASTVisitorToFamixDefTest >> testCreateFamixFortran77PUComment [
	| entity |
	programFile progUnits: { IASTComment new
		text: ' a comment' ;
		isProgUnit: true ;
		yourself  
	}.

	entity := programFile accept: visitor.

	self assert: entity programUnits size equals: 1.

	entity := entity programUnits first.
	self assert: entity class equals: FamixFortran77PUComment.
	self assert: entity content equals: ' a comment'.
	self assert: entity programFile isNotNil.
	self assert: entity programFile filename equals: 'fortran77.f'.
]

{ #category : #running }
IASTVisitorToFamixDefTest >> testCreateFamixFortran77PUFunction [

	| entity |
	programFile progUnits: { IASTFunction new
			 entityName: 'fct';
			 yourself }.

	entity := programFile accept: visitor.

	self assert: entity programUnits size equals: 1.

	entity := entity programUnits first.
	self assert: entity class equals: FamixFortran77PUFunction.
	self assert: entity name equals: 'fct'.
	self assert: entity programFile isNotNil.
	self assert: entity programFile filename equals: 'fortran77.f'.
]

{ #category : #running }
IASTVisitorToFamixDefTest >> testCreateFamixFortran77PUMain [

	| entity |
	programFile progUnits: { IASTMainProgram new
			 entityName: 'main';
			 yourself }.

	entity := programFile accept: visitor.

	self assert: entity programUnits size equals: 1.

	entity := entity programUnits first.
	self assert: entity class equals: FamixFortran77PUMain.
	self assert: entity name equals: 'main'.
	self assert: entity programFile isNotNil.
	self assert: entity programFile filename equals: 'fortran77.f'.
]

{ #category : #running }
IASTVisitorToFamixDefTest >> testCreateFamixFortran77ProgramFile [
	| entity |
	entity := programFile accept: visitor.
	
	self assert: entity class equals: FamixFortran77ProgramFile.
	self assert: entity filename equals: 'fortran77.f'.

]

{ #category : #running }
IASTVisitorToFamixDefTest >> testCreateFamixFortran77SourceAnchor [
	| entity |
	entity := self defaultAnchor accept: visitor.
	
	self assert: entity class equals: FamixFortran77IndexedFileAnchor.
	self assert: entity fileName equals: 'fortran77.f'.
	self assert: entity startLine equals: 1.
	self assert: entity startColumn equals: 7.
	self assert: entity endLine equals: 2.
	self assert: entity endColumn equals: 10.
]

{ #category : #running }
IASTVisitorToFamixDefTest >> testCreateFamixFortran77Subroutine [

	| entity |
	programFile progUnits: { IASTSubroutine new
			 entityName: 'sub';
			 yourself }.

	entity := programFile accept: visitor.

	self assert: entity programUnits size equals: 1.

	entity := entity programUnits first.
	self assert: entity class equals: FamixFortran77PUSubroutine.
	self assert: entity name equals: 'sub'.
	self assert: entity programFile isNotNil.
	self assert: entity programFile filename equals: 'fortran77.f'.
	self assert: entity parameters size equals: 0
]
