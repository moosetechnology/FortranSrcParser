Class {
	#name : #IASTToFamixVisitor,
	#superclass : #Object,
	#instVars : [
		'model',
		'f77sourcefile',
		'stack'
	],
	#category : #'FortranSrc-Visitor'
}

{ #category : #'private-helper' }
IASTToFamixVisitor class >> getBasename: filename [

	^ filename asFileReference basename
]

{ #category : #'private-helper' }
IASTToFamixVisitor class >> getLines: filename [

	^ filename asFileReference contents lines
]

{ #category : #visiting }
IASTToFamixVisitor >> defaultImplicitTyping: firstLetter [

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

{ #category : #accessing }
IASTToFamixVisitor >> f77sourcefile [

	^ f77sourcefile
]

{ #category : #accessing }
IASTToFamixVisitor >> f77sourcefile: anObject [

	f77sourcefile := anObject
]

{ #category : #initialization }
IASTToFamixVisitor >> initialize [

	super initialize.
	model := FamixFortran77Model new name: 'mooseModelF77'.
	stack := Stack new.
	f77sourcefile := ''
]

{ #category : #accessing }
IASTToFamixVisitor >> model [

	^ model
]

{ #category : #accessing }
IASTToFamixVisitor >> model: anObject [

	model := anObject
]

{ #category : #'private-creation' }
IASTToFamixVisitor >> newEntity: aClass [
	^aClass new
		  mooseModel: model;
		  yourself
]

{ #category : #'private-creation' }
IASTToFamixVisitor >> newIndexedFileAnchor: filename [
	| file |
	file := filename asFileReference.
	^ (self newEntity: FamixFortran77IndexedFileAnchor)
		  startLine: 1;
		  endLine: (file
				   ifExists: [ (self class getLines: filename) size ]
				   ifAbsent: [ 1 ]);
		  startColumn: 1;
		  endColumn: (file
				   ifExists: [ (self class getLines: filename) last size + 1]
				   ifAbsent: [ 1 ]);
		  fileName: file basename;
		  yourself
]

{ #category : #'private-creation' }
IASTToFamixVisitor >> retrieveProgramUnit: anInvocation [

	self flag: #TODO. "Search in the known programunits for the one whose name matches the aName"
	self flag: #TODO. "Process arguments too ?"
	1halt.
	^ (model allWithSubTypesOf: FamixFortran77PUProcedure) select: [ 
		  :procedure | 
		  procedure name = anInvocation entityName and: [ 
			   procedure parameters size = anInvocation arguments size ] ]
]

{ #category : #'private-creation' }
IASTToFamixVisitor >> searchInLocalSymbolTable: aName [

	self flag: #TODO. "if absent look at implicit or ..."
	^ stack top symbolTable at: aName ifAbsent: [ nil ]
]

{ #category : #accessing }
IASTToFamixVisitor >> stack [

	^ stack
]

{ #category : #accessing }
IASTToFamixVisitor >> stack: anObject [

	stack := anObject
]

{ #category : #visiting }
IASTToFamixVisitor >> visit: anIASTModel [

	^ anIASTModel accept: self
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTBlockData: aBlockData [

	| blockdata |

	blockdata := (self newEntity: FamixFortran77PUBlockdata)
						sourceAnchor: (self visitIndexedFileAnchor: aBlockData sourceAnchor);
						name: aBlockData entityName;
						yourself.
	stack push: blockdata.
	
	"prossess accesses"
	aBlockData accesses do: [ :access | 
		blockdata addAccess: (access accept: self) ].

	"prossess the comments inside this progUnit"
	aBlockData localComments do: [ :comment | 
		blockdata addComment: (comment accept: self) ].

	stack pop.
	^ blockdata
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTComment: aComment [
	| comment |

	comment := aComment isProgUnit
		           ifTrue:  [ self newEntity: FamixFortran77PUComment ]
		           ifFalse: [ (self newEntity: FamixFortran77Comment) isEsope: aComment isEsope ].
	^ comment
		  sourceAnchor: (self visitIndexedFileAnchor: aComment sourceAnchor);
		  content: aComment text;
		  yourself
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTFunction: aFunction [

	| function |

	function := (self newEntity: FamixFortran77PUFunction)
		            sourceAnchor: (self visitIndexedFileAnchor: aFunction sourceAnchor);
		            name: aFunction entityName;
		            returnType: (aFunction returnType ifNotNil: [ aFunction returnType accept: self ]);
		            yourself.
	stack push: function.
	"prossess localVariables inside this progUnit"
	aFunction localVariables do: [ :localVariable | 
		function addLocalVariable: (localVariable accept: self) ].
	"prossess the parameters inside this progUnit"
	aFunction parameters do: [ :parameter | 
		function addParameter: (parameter accept: self) ].
	"prossess the accesses inside this progUnit"
	aFunction accesses do: [ :access | 
		function addAccess: (access accept: self) ].
	"prossess the invocations inside this progUnit"
	aFunction invocations do: [ :invocation | 
		function addOutgoingInvocation: (invocation accept: self) ].
	"prossess the comments inside this progUnit"
	aFunction localComments do: [ :comment | 
		function addComment: (comment accept: self) ].
	stack pop.
	^ function
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTImplicit: anImplicit [

	self flag: #TODO.
	"put implicit info into the FamixFortranProgramFile"
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTInvocation: anInvocation [
	| invocation |

	invocation := (self newEntity: FamixFortran77Invocation)
		sourceAnchor: (self visitIndexedFileAnchor: anInvocation sourceAnchor);
		attributeAt: #entity put: anInvocation;
		yourself.
	^ invocation
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTMainProgram: aMainProgram [

	| main |

	main := (self newEntity: FamixFortran77PUMain)
		        sourceAnchor: (self visitIndexedFileAnchor: aMainProgram sourceAnchor);
		        name: aMainProgram entityName;
		        yourself.
	stack push: main.

	aMainProgram localVariables do: [ :localVariable | 
		main addLocalVariable: (localVariable accept: self) ].

	aMainProgram accesses do: [ :access | 
		main addAccess: (access accept: self) ].
	
	aMainProgram invocations do: [ :invocation | 
		main addOutgoingInvocation: (invocation accept: self) ].
	
	aMainProgram localComments do: [ :comment | 
		main addComment: (comment accept: self) ].
	stack pop.
	^ main
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTParameter: aParameter [

	| parameter |
	parameter := (self newEntity: FamixFortran77Parameter)
		             sourceAnchor: (self visitIndexedFileAnchor: aParameter sourceAnchor);
		             name: aParameter entityName;
		             yourself.
	^ parameter
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTProgramFile: aProgramFile [

	| progFile |
	self f77sourcefile: aProgramFile filename.
	progFile := (self newEntity: FamixFortran77ProgramFile)
		filename: aProgramFile filename;
		name: aProgramFile filename;
		yourself.

	stack push: progFile.

	aProgramFile progUnits do: [ :progUnit | 
		progFile addProgramUnit: (progUnit accept: self) ].

	stack pop.
	^progFile
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTProgramUnit: aProgramUnit toFamix: aFamixFortranClass [

	| progUnit |

	progUnit := (self newEntity: aFamixFortranClass)
		        sourceAnchor: (self visitIndexedFileAnchor: aProgramUnit sourceAnchor);
		        name: aProgramUnit entityName;
		        yourself.
	stack push: progUnit.

	aProgramUnit localVariables do: [ :localVariable | 
		progUnit addLocalVariable: (localVariable accept: self) ].

	aProgramUnit accesses do: [ :access | 
		progUnit addAccess: (access accept: self) ].
	
	aProgramUnit invocations do: [ :invocation | 
		progUnit addOutgoingInvocation: (invocation accept: self) ].
	
	aProgramUnit localComments do: [ :comment | 
		progUnit addComment: (comment accept: self) ].

	stack pop.
	^ progUnit
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTSubroutine: aSubroutine [

	| subroutine |

	subroutine := self visitIASTProgramUnit: aSubroutine toFamix: FamixFortran77PUSubroutine.
	aSubroutine parameters do: [ :parameter | 
		subroutine addParameter: (parameter accept: self) ].

	^ subroutine
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTTypeRef: aType [

	self flag: #TODO. "How to deal with length and kind for example character*20 name produce aType object like:
	- sourceAnchor: ...
	- entityName: TypeCharacter
	- kind: nil"
	^(self newEntity: FamixFortran77FType)
		sourceAnchor: (self visitIndexedFileAnchor: aType sourceAnchor);
		name: aType entityName;
		length: aType length;
		kind: aType kind;
		yourself
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTVarAccess: aVarAccess [

	| access target |
	self flag: #TODO. "refactoring and other"
	access := (self newEntity: FamixFortran77Access)
		sourceAnchor: (self visitIndexedFileAnchor: aVarAccess sourceAnchor);
		attributeAt: #entity put: aVarAccess;
		isWrite: aVarAccess isWrite;
		yourself.
	target := self searchInLocalSymbolTable: aVarAccess entityName.
	target
		ifNil: [ 
			| var |
			var := (self newEntity: FamixFortran77Variable)
				       name: aVarAccess entityName;
				       fType: ((self newEntity: FamixFortran77FType)
						        name: (self defaultImplicitTyping: aVarAccess entityName first);
						        yourself);
				       yourself.
			access target: var ]
		ifNotNil: [ access target: target ].

	^ access
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTVarEsoAr: aVarEsoAr [

	self flag: #TODO.
	1halt.
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTVarEsoAt: aVarEsoAt [

	self flag: #TODO.
	1halt.
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTVarEsoSl: aVarEsoSl [

	self flag: #TODO.
	1halt.
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTVariable: aVariable [

	| var |
	var := (self newEntity: FamixFortran77Variable)
		       sourceAnchor: (self visitIndexedFileAnchor: aVariable sourceAnchor);
		       name: aVariable entityName;
				 declaredType: (self visitIASTTypeRef: aVariable typeSpec);
		       yourself.
	self stack top symbolTable at: var name put: var.
	^ var
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIndexedFileAnchor: aSourceAnchor [
	^aSourceAnchor
	ifNil: [ nil ]
	ifNotNil: [	(self newEntity: FamixFortran77IndexedFileAnchor)
		  startLine: aSourceAnchor startLine ;
		  endLine: aSourceAnchor endLine ;
		  startColumn: aSourceAnchor startColumn ;
		  endColumn: aSourceAnchor endColumn ;
		  fileName: aSourceAnchor fileName ;
		  yourself ]
]
