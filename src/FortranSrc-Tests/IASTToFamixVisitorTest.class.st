"
An IASTVisitorF77Test is a test class for testing the behavior of IASTVisitorF77
"
Class {
	#name : #IASTToFamixVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'visitor',
		'programFile'
	],
	#category : #'FortranSrc-Tests-Visitor'
}

{ #category : #running }
IASTToFamixVisitorTest >> anchorFrom: startPoint to: endPoint [
	^IASTIndexedFileAnchor new
		startLine: startPoint x ;
		startColumn: startPoint y;
		endLine: endPoint x ;
		endColumn: endPoint y ;
		fileName: 'fortran77.f' ;
		yourself
]

{ #category : #running }
IASTToFamixVisitorTest >> defaultAnchor [
	^ self anchorFrom: 1 @ 7 to: 2 @ 10
]

{ #category : #running }
IASTToFamixVisitorTest >> defaultParameter [
	^IASTParameter new
		entityName: 'var';
		sourceAnchor: self defaultAnchor;
		yourself
]

{ #category : #running }
IASTToFamixVisitorTest >> defaultTypeCharacter [
	^IASTTypeRef new
		entityName: 'character';
		sourceAnchor: self defaultAnchor;
		yourself
]

{ #category : #running }
IASTToFamixVisitorTest >> defaultTypeInteger [
	^IASTTypeRef new
		entityName: 'integer';
		sourceAnchor: self defaultAnchor;
		yourself
]

{ #category : #running }
IASTToFamixVisitorTest >> defaultTypeReal [
	^IASTTypeRef new
		entityName: 'real';
		sourceAnchor: self defaultAnchor;
		yourself
]

{ #category : #running }
IASTToFamixVisitorTest >> defaultVariable [
	^ IASTVariable new
		entityName: 'aVar';
		typeSpec: self defaultTypeInteger;
		yourself
]

{ #category : #running }
IASTToFamixVisitorTest >> setUp [
	super setUp.
	
	programFile := IASTProgramFile new filename: 'fortran77.f' ; yourself.
	visitor := IASTToFamixVisitor new.
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77 [

	| entity |
	programFile progUnits: { IASTSubroutine new
		entityName: 'sub';
		body: #();
		yourself
	}.
	programFile accept: visitor.

	self assert: visitor model size equals: 2.

	entity := visitor model detect: [:each | each class = FamixFortran77ProgramFile ].
	self assert: entity programUnits size equals: 1.

	entity := entity programUnits first.
	self assert: entity class equals: FamixFortran77PUSubroutine.
	self assert: entity name equals: 'sub'.

]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77Comment [

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
	self deny: comment isEsope.
	
	self assert: comment commentedEntity equals: entity programUnits first.
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77Invocation [
	| entity invocation caller callee |

	callee := IASTSubroutine new
		entityName: 'sub';
		yourself.

	caller := IASTMainProgram new
			entityName: 'main';
			body: { IASTInvocation new entityName: 'sub'; yourself };
			yourself.
	programFile progUnits: { callee . caller }.

	programFile accept: visitor.
	entity := visitor model detect: [:each | each class = FamixFortran77ProgramFile ].

	self assert: entity programUnits first class equals: FamixFortran77PUSubroutine.
	self assert: entity programUnits second class equals: FamixFortran77PUMain.

	self assert: entity programUnits second outgoingInvocations size equals: 1.
	invocation := entity programUnits second outgoingInvocations first.
	
	self assert: invocation class equals: FamixFortran77Invocation.
	self assert: invocation sender equals: entity programUnits second.
	self assert: (invocation attributeAt: #entity ifAbsent: [ nil ] ) isNotNil
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77LocalVariable [

	| entity var |
	programFile progUnits: { IASTSubroutine new
			 entityName: 'sub';
			 body: { self defaultVariable };
			 yourself }.
	programFile accept: visitor.

	entity := visitor model detect: [:each | each class = FamixFortran77ProgramFile ].

	self assert: entity programUnits first localVariables size equals: 1.

	var := entity programUnits first localVariables first.
	self assert: var class equals: FamixFortran77Variable.
	self assert: var name equals: 'aVar'.
	self assert: var declaredType class equals: FamixFortran77Type.
	self assert: var declaredType name equals: 'integer'.
	self assert: var parentBehaviouralEntity isNotNil.
	self
		assert: var parentBehaviouralEntity
		equals: entity programUnits first
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77PUBlockdata [

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
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77PUComment [
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
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77PUFunction [

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
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77PUFunctionWithParameter [

	| entity param |
	programFile progUnits: { IASTFunction new
			 entityName: 'fct';
			 parameters: { self defaultParameter };
			 yourself }.

	entity := programFile accept: visitor.

	self assert: entity programUnits size equals: 1.

	entity := entity programUnits first.
	self assert: entity class equals: FamixFortran77PUFunction.
	self assert: entity name equals: 'fct'.
	self assert: entity programFile isNotNil.

	self assert: entity parameters size equals: 1.
	param := entity parameters first.
	self assert: param class equals: FamixFortran77Parameter.
	self assert: param name equals: 'var'.
	self assert: param parentBehaviouralEntity equals: entity.
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77PUMain [

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
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77ProgramFile [
	| entity |
	programFile accept: visitor.

	self assert: visitor model size equals: 1.

	entity := visitor model first.
	self assert: entity class equals: FamixFortran77ProgramFile.
	self assert: entity filename equals: 'fortran77.f'.
	self assert: entity programUnits size equals: 0
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77SourceAnchor [
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
IASTToFamixVisitorTest >> testCreateFamixFortran77Subroutine [

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
	self assert: entity parameters size equals: 0
]
