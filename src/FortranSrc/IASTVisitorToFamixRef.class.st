Class {
	#name : #IASTVisitorToFamixRef,
	#superclass : #Object,
	#instVars : [
		'model',
		'f77sourcefile',
		'stack'
	],
	#category : #'FortranSrc-Visitor'
}

{ #category : #'private-helper' }
IASTVisitorToFamixRef class >> getBasename: filename [

	^ filename asFileReference basename
]

{ #category : #'private-helper' }
IASTVisitorToFamixRef class >> getLines: filename [

	^ filename asFileReference contents lines
]

{ #category : #visiting }
IASTVisitorToFamixRef >> addAccessesTo: anEntity [

	self flag: #FIXME. "have to be completed, ensure that variable exists or create it"
	^ anEntity accesses collect: [ :varAccess | 1halt.
		  (self newEntity: FamixFortran77Variable)
			  sourceAnchor: (self newSourceAnchor: varAccess sourceAnchor);
			  name: varAccess entityName;
			  yourself ]
]

{ #category : #visiting }
IASTVisitorToFamixRef >> addInvocationsTo: anEntity [

	self flag: #FIXME. "have to be completed by adding a sender, receiver, candidates but here we have only: the caller(sender=aFunction) and the callee(receiver/only one candidates=inv)"
	^ anEntity invocations collect: [ :inv | 
		  (self newEntity: FamixFortran77Invocation)
			  sourceAnchor: (self newSourceAnchor: inv sourceAnchor);
			  "sender: (self ensureFunction: inv entityName intrinsic: true);"
			  "receiver: inv entityName;"
			  "candidates: #();"
			  yourself ]
]

{ #category : #visiting }
IASTVisitorToFamixRef >> addLocalVariablesTo: anEntity [

	self flag: #FIXME. "declaredType: var typeSpec"
	^ anEntity localVariables collect: [ :var | 
		  (self newEntity: FamixFortran77Variable)
			  sourceAnchor: (self newSourceAnchor: var sourceAnchor);
			  name: var entityName;
			  "declaredType: var typeSpec;"yourself ]
]

{ #category : #visiting }
IASTVisitorToFamixRef >> addParametersTo: anEntity [

	^ anEntity parameters collect: [ :param | 
		  (self newEntity: FamixFortran77Parameter)
			  sourceAnchor: (self newSourceAnchor: param sourceAnchor);
			  name: param entityName;
			  yourself ]
]

{ #category : #visiting }
IASTVisitorToFamixRef >> defaultImplicitTyping: firstLetter [

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
IASTVisitorToFamixRef >> f77sourcefile [

	^ f77sourcefile
]

{ #category : #accessing }
IASTVisitorToFamixRef >> f77sourcefile: anObject [

	f77sourcefile := anObject
]

{ #category : #initialization }
IASTVisitorToFamixRef >> initialize [

	super initialize.
	model := FamixFortran77Model new name: 'mooseModelF77'.
	stack := Stack new.
	f77sourcefile := ''
]

{ #category : #accessing }
IASTVisitorToFamixRef >> model [

	^ model
]

{ #category : #accessing }
IASTVisitorToFamixRef >> model: anObject [

	model := anObject
]

{ #category : #'private-creation' }
IASTVisitorToFamixRef >> newEntity: aClass [
	^aClass new
		  mooseModel: model;
		  yourself
]

{ #category : #'private-creation' }
IASTVisitorToFamixRef >> newIndexedFileAnchor: filename [
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
IASTVisitorToFamixRef >> searchInKnownProgUnit: anInvocation [

	self flag: #TODO. "Search in the known programunits for the one whose name matches the aName"
	self flag: #TODO. "Process arguments too ?"
	1halt.
	^ (model allWithSubTypesOf: FamixFortran77PUProcedure) select: [ 
		  :procedure | 
		  procedure name = anInvocation entityName and: [ 
			   procedure parameters size = anInvocation arguments size ] ]
]

{ #category : #'private-creation' }
IASTVisitorToFamixRef >> searchInLocalSymbolTable: aName [

	self flag: #TODO. "if absent look at implicit or ..."
	^ stack top symbolTable at: aName ifAbsent: [ nil ]
]

{ #category : #accessing }
IASTVisitorToFamixRef >> stack [

	^ stack
]

{ #category : #accessing }
IASTVisitorToFamixRef >> stack: anObject [

	stack := anObject
]

{ #category : #visiting }
IASTVisitorToFamixRef >> visit: anIASTModel [

	^ anIASTModel accept: self
]

{ #category : #visiting }
IASTVisitorToFamixRef >> visitIASTBlockData: aBlockData [

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
IASTVisitorToFamixRef >> visitIASTComment: aComment [
	| comment |

	comment := aComment isProgUnit
		           ifTrue:  [ self newEntity: FamixFortran77PUComment ]
		           ifFalse: [ self newEntity: FamixFortran77Comment ].
	^ comment
		  sourceAnchor: (self visitIndexedFileAnchor: aComment sourceAnchor);
		  content: aComment text;
		  yourself
]

{ #category : #visiting }
IASTVisitorToFamixRef >> visitIASTFunction: aFunction [

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
IASTVisitorToFamixRef >> visitIASTImplicit: anImplicit [

	self flag: #TODO.
]

{ #category : #visiting }
IASTVisitorToFamixRef >> visitIASTInvocation: anInvocation [

	| invocation |
	self flag: #TODO. "howto process invocation arguments ?"

	invocation := (self newEntity: FamixFortran77Invocation)
		              sourceAnchor: (self visitIndexedFileAnchor: anInvocation sourceAnchor);
		              yourself.
	"anInvocation arguments do: [ :argument | invocation addArgument: (invocation accept: self) ]."
	invocation target: (self searchInKnownProgUnit: anInvocation entityName).
	^ invocation
]

{ #category : #visiting }
IASTVisitorToFamixRef >> visitIASTMainProgram: aMainProgram [

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
IASTVisitorToFamixRef >> visitIASTParameter: aParameter [

	| parameter declaredParam |
	self flag: #TODO. "relation between parameter and localVariable declaration"
	parameter := (self newEntity: FamixFortran77Parameter)
		             sourceAnchor:
			             (self newSourceAnchor: aParameter sourceAnchor);
		             name: aParameter entityName;
		             yourself.
	"declaredParam := self searchInLocalSymbolTable: aParameter entityName.
	declaredParam ifNotNil: [ parameter variable: declaredParam ]."
	^ parameter
]

{ #category : #visiting }
IASTVisitorToFamixRef >> visitIASTProgramFile: aProgramFile [

	| progFile |
	self f77sourcefile: aProgramFile filename.
	progFile := (self newEntity: FamixFortran77ProgramFile)
		            filename: aProgramFile filename;
		            version: aProgramFile version;
		            name: (self class getBasename: aProgramFile filename);
		            yourself.
	stack push: progFile.
	"process the programunits inside of this file"
	aProgramFile progUnits do: [ :progUnit | 
		progFile addProgramUnit: (progUnit accept: self) ].
	stack pop.
	^progFile
]

{ #category : #visiting }
IASTVisitorToFamixRef >> visitIASTSubroutine: aSubroutine [

	| subroutine |

	subroutine := (self newEntity: FamixFortran77PUSubroutine)
		              sourceAnchor: (self visitIndexedFileAnchor: aSubroutine sourceAnchor) ;
		              name: aSubroutine entityName;
		              yourself.
	stack push: subroutine.
	"prossess localVariables"
	aSubroutine localVariables do: [ :localVariable | 
		subroutine addLocalVariable: (localVariable accept: self) ].
	"prossess parameters"
	aSubroutine parameters do: [ :parameter | 
		subroutine addParameter: (parameter accept: self) ].
	"prossess accesses"
	aSubroutine accesses do: [ :access | 
		subroutine addAccess: (access accept: self) ].
	"prossess invocations"
	aSubroutine invocations do: [ :invocation | 
		subroutine addOutgoingInvocation: (invocation accept: self) ].
	"prossess the comments inside this progUnit"
	aSubroutine localComments do: [ :comment | 
		subroutine addComment: (comment accept: self) ].

	stack pop.
	^ subroutine
]

{ #category : #visiting }
IASTVisitorToFamixRef >> visitIASTTypeRef: aType [

	| type |
	self flag: #TODO. "How to deal with length and kind for example character*20 name produce aType object like:
	- sourceAnchor: ...
	- entityName: TypeCharacter
	- length: 20
	- kind: nil"
	^(self newEntity: FamixFortran77FType)
		sourceAnchor: (self visitIndexedFileAnchor: aType sourceAnchor);
		name: aType entityName;
		length: aType length;
		kind: aType kind;
		yourself
]

{ #category : #visiting }
IASTVisitorToFamixRef >> visitIASTVarAccess: aVarAccess [

	| access target |
	self flag: #TODO. "refactoring and resolving"
	access := (self newEntity: FamixFortran77Access)
		          sourceAnchor: (self visitIndexedFileAnchor: aVarAccess sourceAnchor);
		          isWrite: aVarAccess isWrite;
		          yourself.
	target := self searchInLocalSymbolTable: aVarAccess entityName.
	target
		ifNil: [ 
			| var |
			var := (self newEntity: FamixFortran77Variable)
				       name: aVarAccess entityName;
				       fType: ((self newEntity: FamixFortran77FType)
						        name:
							        (self defaultImplicitTyping:
									         aVarAccess entityName first);
						        yourself);
				       yourself.
			access target: var ]
		ifNotNil: [ access target: target ].

	^ access
]

{ #category : #visiting }
IASTVisitorToFamixRef >> visitIASTVarEsoAr: aVarEsoAr [

	self flag: #TODO.
	1halt.
]

{ #category : #visiting }
IASTVisitorToFamixRef >> visitIASTVarEsoAt: aVarEsoAt [

	self flag: #TODO.
	1halt.
]

{ #category : #visiting }
IASTVisitorToFamixRef >> visitIASTVarEsoSl: aVarEsoSl [

	self flag: #TODO.
	1halt.
]

{ #category : #visiting }
IASTVisitorToFamixRef >> visitIASTVariable: aVariable [

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
IASTVisitorToFamixRef >> visitIndexedFileAnchor: aSourceAnchor [
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
