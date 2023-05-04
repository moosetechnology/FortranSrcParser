"
An IASTVisitorF77Test is a test class for testing the behavior of IASTVisitorF77
"
Class {
	#name : #IASTVisitorF77Test,
	#superclass : #TestCase,
	#instVars : [
		'jSonVisitor',
		'visitor'
	],
	#category : #'FortranSrc-Tests-Visitor'
}

{ #category : #running }
IASTVisitorF77Test >> setUp [
	super setUp.
	
	jSonVisitor := IASTVisitorJSON new.
	visitor := IASTVisitorF77 new.
]

{ #category : #running }
IASTVisitorF77Test >> testCreateFamixFortran77Access [
	| entity code |
	code := '      program main
      i = 2
      end
'.

	entity := (jSonVisitor visitCode: code) accept: visitor.

	self assert: entity class equals: FamixFortran77ProgramFile.
	self assert: entity programUnits size equals: 1.

	entity := entity programUnits first.
	self assert: entity class equals: FamixFortran77PUMain.
	self assert: entity accesses size equals: 1.
	
	entity := entity accesses first.
	self assert: entity class equals: FamixFortran77Access.
	self assert: entity name equals: 'i'.
	self assert: entity isWrite.
	self assert: entity sourceAnchor startLine equals: 2.
	self assert: entity sourceAnchor startColumn equals: 7.
	self assert: entity sourceAnchor endLine equals: 2.
	self assert: entity sourceAnchor endColumn equals: 8.
]

{ #category : #running }
IASTVisitorF77Test >> testCreateFamixFortran77Comment [
	| entity code |
	code := '      program main
c a comment
      end
'.

	entity := (jSonVisitor visitCode: code) accept: visitor.

	self assert: entity class equals: FamixFortran77ProgramFile.
	self assert: entity programUnits size equals: 1.

	entity := entity programUnits first.
	self assert: entity class equals: FamixFortran77PUMain.
	self assert: entity comments size equals: 1.
	
	entity := entity comments first.
	self assert: entity class equals: FamixFortran77Comment.
	self assert: entity content equals: ' a comment'.
	self assert: entity sourceAnchor startLine equals: 2.
	self assert: entity sourceAnchor startColumn equals: 1.
	self assert: entity sourceAnchor endLine equals: 2.
	self assert: entity sourceAnchor endColumn equals: 12.
]

{ #category : #running }
IASTVisitorF77Test >> testCreateFamixFortran77Function [
	| entity code |
	code := '      function hello()
      end
'.

	entity := (jSonVisitor visitCode: code) accept: visitor.

	self assert: entity class equals: FamixFortran77ProgramFile.
	self assert: entity programUnits size equals: 1.

	entity := entity programUnits first.
	self assert: entity class equals: FamixFortran77PUFunction.

	self assert: entity sourceAnchor startLine equals: 1.
	self assert: entity sourceAnchor startColumn equals: 7.
	self assert: entity sourceAnchor endLine equals: 2.
	self assert: entity sourceAnchor endColumn equals: 10.
]

{ #category : #running }
IASTVisitorF77Test >> testCreateFamixFortran77PUComment [
	| entity code |
	code := 'c a comment
'.

	entity := (jSonVisitor visitCode: code) accept: visitor.

	self assert: entity class equals: FamixFortran77ProgramFile.
	self assert: entity programUnits size equals: 1.

	entity := entity programUnits first.
	self assert: entity class equals: FamixFortran77PUComment.
	self assert: entity content equals: ' a comment'.
	self assert: entity sourceAnchor startLine equals: 1.
	self assert: entity sourceAnchor startColumn equals: 1.
	self assert: entity sourceAnchor endLine equals: 1.
	self assert: entity sourceAnchor endColumn equals: 12.
]

{ #category : #running }
IASTVisitorF77Test >> testCreateFamixFortran77PUMain [
	| entity code |
	code := '      program main
      end
'.

	entity := (jSonVisitor visitCode: code) accept: visitor.

	self assert: entity class equals: FamixFortran77ProgramFile.
	self assert: entity programUnits size equals: 1.

	entity := entity programUnits first.
	self assert: entity class equals: FamixFortran77PUMain.
	self assert: entity name equals: 'main'.
	self assert: entity sourceAnchor startLine equals: 1.
	self assert: entity sourceAnchor startColumn equals: 7.
	self assert: entity sourceAnchor endLine equals: 2.
	self assert: entity sourceAnchor endColumn equals: 10.
]

{ #category : #running }
IASTVisitorF77Test >> testCreateFamixFortran77ProgramFile [
	| entity code |
	code := '      program main
      end
'.

	entity := (jSonVisitor visitCode: code) accept: visitor.

	self assert: entity class equals: FamixFortran77ProgramFile.
	self assert: entity programUnits size equals: 1.
	self assert: entity filename equals: './fortran77.f'.
	self assert: entity name equals: 'fortran77.f'.
	self assert: entity sourceAnchor fileName equals: 'fortran77.f'.
	self assert: entity sourceAnchor startLine equals: 1.
	self assert: entity sourceAnchor startColumn equals: 1.
	self assert: entity sourceAnchor endLine equals: 2.
	self assert: entity sourceAnchor endColumn equals: 10.
]

{ #category : #running }
IASTVisitorF77Test >> testCreateFamixFortran77Subroutine [
	| entity code |
	code := '      subroutine hello
      end
'.

	entity := (jSonVisitor visitCode: code) accept: visitor.

	self assert: entity class equals: FamixFortran77ProgramFile.
	self assert: entity programUnits size equals: 1.

	entity := entity programUnits first.
	self assert: entity class equals: FamixFortran77PUSubroutine.

	self assert: entity sourceAnchor startLine equals: 1.
	self assert: entity sourceAnchor startColumn equals: 7.
	self assert: entity sourceAnchor endLine equals: 2.
	self assert: entity sourceAnchor endColumn equals: 10.
]
