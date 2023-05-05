"
An IASTVisitorF77Test is a test class for testing the behavior of IASTVisitorF77
"
Class {
	#name : #IASTVisitorToFamixDefTest,
	#superclass : #TestCase,
	#instVars : [
		'visitor',
		'iast'
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
	
	iast := IASTProgramFile new filename: 'fortran77.f' ; yourself.
	visitor := IASTVisitorToFamixDef new.
]

{ #category : #running }
IASTVisitorToFamixDefTest >> testCreateFamixFortran77Comment [

	| entity comment |

	iast progUnits: { (IASTMainProgram new
			 entityName: 'main';
			 body: { IASTComment new
		           text: 'a normal comment';
		           yourself. };
			 yourself) }.

	entity := iast accept: visitor.

	self assert: entity programUnits size equals: 1.
	self assert: entity programUnits first comments size equals: 1.

	comment := entity programUnits first comments first.
	self assert: comment class equals: FamixFortran77Comment.
	self assert: comment content equals: 'a normal comment'.
	
	self assert: comment commentedEntity equals: entity programUnits first.
]

{ #category : #running }
IASTVisitorToFamixDefTest >> testCreateFamixFortran77LocalVariable [

	| entity var |
	iast progUnits: { (IASTSubroutine new
			 entityName: 'sub';
			 body: { self defaultVariable };
			 yourself) }.

	entity := iast accept: visitor.

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
	iast progUnits: { (IASTBlockData new
			 entityName: 'bdata';
			 yourself) }.

	entity := iast accept: visitor.

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
	iast progUnits: { IASTComment new text: ' a comment' ; isProgUnit: true ; yourself  }.

	entity := iast accept: visitor.

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
	iast progUnits: { (IASTFunction new
			 entityName: 'fct';
			 yourself) }.

	entity := iast accept: visitor.

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
	iast progUnits: { (IASTMainProgram new
			 entityName: 'main';
			 yourself) }.

	entity := iast accept: visitor.

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
	entity := iast accept: visitor.
	
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
	iast progUnits: { (IASTSubroutine new
			 entityName: 'sub';
			 yourself) }.

	entity := iast accept: visitor.

	self assert: entity programUnits size equals: 1.

	entity := entity programUnits first.
	self assert: entity class equals: FamixFortran77PUSubroutine.
	self assert: entity name equals: 'sub'.
	self assert: entity programFile isNotNil.
	self assert: entity programFile filename equals: 'fortran77.f'.
	self assert: entity parameters size equals: 0
]
