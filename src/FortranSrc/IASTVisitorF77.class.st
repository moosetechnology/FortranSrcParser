Class {
	#name : #IASTVisitorF77,
	#superclass : #Object,
	#instVars : [
		'model',
		'f77sourcefile',
		'stack'
	],
	#category : #'FortranSrc-Visitor'
}

{ #category : #'private-helper' }
IASTVisitorF77 class >> getBasename: filename [

	^ filename asFileReference basename
]

{ #category : #'private-helper' }
IASTVisitorF77 class >> getLines: filename [

	^ filename asFileReference contents lines
]

{ #category : #visiting }
IASTVisitorF77 >> addAccessesTo: anEntity [

	self flag: #FIXME. "have to be completed, ensure that variable exists or create it"
	^ anEntity accesses collect: [ :varAccess | 1halt.
		  (self newEntity: FamixFortran77Variable)
			  sourceAnchor: (self newSourceAnchor: varAccess sourceAnchor);
			  name: varAccess entityName;
			  yourself ]
]

{ #category : #visiting }
IASTVisitorF77 >> addInvocationsTo: anEntity [

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
IASTVisitorF77 >> addLocalVariablesTo: anEntity [

	self flag: #FIXME. "declaredType: var typeSpec"
	^ anEntity localVariables collect: [ :var | 
		  (self newEntity: FamixFortran77Variable)
			  sourceAnchor: (self newSourceAnchor: var sourceAnchor);
			  name: var entityName;
			  "declaredType: var typeSpec;"yourself ]
]

{ #category : #visiting }
IASTVisitorF77 >> addParametersTo: anEntity [

	^ anEntity parameters collect: [ :param | 
		  (self newEntity: FamixFortran77Parameter)
			  sourceAnchor: (self newSourceAnchor: param sourceAnchor);
			  name: param entityName;
			  yourself ]
]

{ #category : #visiting }
IASTVisitorF77 >> defaultImplicitTyping: firstLetter [

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
IASTVisitorF77 >> f77sourcefile [

	^ f77sourcefile
]

{ #category : #accessing }
IASTVisitorF77 >> f77sourcefile: anObject [

	f77sourcefile := anObject
]

{ #category : #initialization }
IASTVisitorF77 >> initialize [

	super initialize.
	model := FamixFortran77Model new name: 'mooseModelF77'.
	stack := Stack new.
	f77sourcefile := ''
]

{ #category : #accessing }
IASTVisitorF77 >> model [

	^ model
]

{ #category : #accessing }
IASTVisitorF77 >> model: anObject [

	model := anObject
]

{ #category : #'private-creation' }
IASTVisitorF77 >> newEntity: aClass [

	^ aClass new
		  mooseModel: model;
		  yourself
]

{ #category : #'private-creation' }
IASTVisitorF77 >> newIndexedFileAnchor: filename [

	^ (self newEntity: FamixFortran77IndexedFileAnchor)
		  startLine: 1;
		  endLine: (filename asFileReference
				   ifExists: [ (self class getLines: filename) size ]
				   ifAbsent: [ 1 ]);
		  startColumn: 1;
		  endColumn: (filename asFileReference
				   ifExists: [ (self class getLines: filename) last size + 1]
				   ifAbsent: [ 1 ]);
		  fileName: filename asFileReference basename;
		  yourself
]

{ #category : #'private-creation' }
IASTVisitorF77 >> newSourceAnchor: points [

	^ (self newEntity: FamixFortran77IndexedFileAnchor)
		  startLine: points first x;
		  endLine: points second x;
		  startColumn: points first y;
		  endColumn: points second y + 1;
		  fileName: self f77sourcefile;
		  yourself
]

{ #category : #'private-creation' }
IASTVisitorF77 >> searchInKnownProgUnit: aName [

	self flag: #TODO. "Search the known programunits for the one whose name matches the aName"
	^ (model allWithSubTypesOf: FamixFortran77ProgramUnit) select:
		  [ :progUnit | progUnit name = aName ]
]

{ #category : #'private-creation' }
IASTVisitorF77 >> searchInLocalSymbolTable: aName [

	self flag: #TODO. "if absent look at implicit or ..."
	^ stack top symbolTable at: aName ifAbsent: [ nil ]
]

{ #category : #accessing }
IASTVisitorF77 >> stack [

	^ stack
]

{ #category : #accessing }
IASTVisitorF77 >> stack: anObject [

	stack := anObject
]

{ #category : #visiting }
IASTVisitorF77 >> visit: anIASTModel [

	^ anIASTModel accept: self
]

{ #category : #visiting }
IASTVisitorF77 >> visitIASTArgument: anArgument [

	self flag: #TODO.
]

{ #category : #visiting }
IASTVisitorF77 >> visitIASTBlockData: aBlockData [

	self flag: #TODO.
]

{ #category : #visiting }
IASTVisitorF77 >> visitIASTComment: aComment [

	| comment |
	self flag: #TODO.

	comment := aComment isProgUnit
		           ifTrue: [ self newEntity: FamixFortran77PUComment ]
		           ifFalse: [ self newEntity: FamixFortran77Comment ].
	^ comment
		  sourceAnchor: (self newSourceAnchor: aComment sourceAnchor);
		  content: aComment text;
		  yourself
]

{ #category : #visiting }
IASTVisitorF77 >> visitIASTFunction: aFunction [

	| function |
	self flag: #TODO. "Add the body with statements (accesses, invocations, localVariables)."
	self flag: #TODO. "declaredType <- aFunction returnType"

	function := (self newEntity: FamixFortran77PUFunction)
		            sourceAnchor:
			            (self newSourceAnchor: aFunction sourceAnchor);
		            name: aFunction entityName;
		            returnType: (aFunction returnType accept: self);
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
IASTVisitorF77 >> visitIASTImplicit: anImplicit [

	self flag: #TODO.
]

{ #category : #visiting }
IASTVisitorF77 >> visitIASTInvocation: anInvocation [

	| invocation |
	self flag: #TODO. "howto process invocation arguments ?"

	invocation := (self newEntity: FamixFortran77Invocation)
		              sourceAnchor:
			              (self newSourceAnchor: anInvocation sourceAnchor);
		              yourself.
	"anInvocation arguments do: [ :argument | invocation addArgument: (invocation accept: self) ]."
	invocation target:
		(self searchInKnownProgUnit: anInvocation entityName).
	^ invocation
]

{ #category : #visiting }
IASTVisitorF77 >> visitIASTMainProgram: aMainProgram [

	| main |
	1 halt.
	self flag: #TODO. "Add the body with statements (accesses, invocations, localVariables)."
	main := (self newEntity: FamixFortran77PUMain)
		        sourceAnchor:
			        (self newSourceAnchor: aMainProgram sourceAnchor);
		        name: aMainProgram entityName;
		        yourself.
	stack push: main.
	"prossess localVariables"
	aMainProgram localVariables do: [ :localVariable | 
		main addLocalVariable: (localVariable accept: self) ].
	"prossess accesses"
	aMainProgram accesses do: [ :access | 
		main addAccess: (access accept: self) ].
	"prossess invocations"
	aMainProgram invocations do: [ :invocation | 
		main addOutgoingInvocation: (invocation accept: self) ].
	"prossess the comments inside this progUnit"
	aMainProgram localComments do: [ :comment | 
		main addComment: (comment accept: self) ].
	stack pop.
	^ main
]

{ #category : #visiting }
IASTVisitorF77 >> visitIASTParameter: aParameter [

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
IASTVisitorF77 >> visitIASTProgramFile: aProgramFile [

	| progFile |
	self flag: #TODO.
	self f77sourcefile: aProgramFile filename.
	progFile := (self newEntity: FamixFortran77ProgramFile)
		            filename: aProgramFile filename;
		            version: aProgramFile version;
		            name: (self class getBasename: aProgramFile filename);
		            sourceAnchor:
			            (self newIndexedFileAnchor: aProgramFile filename);
		            yourself.
	stack push: progFile.
	"process the programunits inside of this file"
	aProgramFile progUnits do: [ :programUnit | 
		progFile addProgramUnit: (programUnit accept: self) ].
	stack pop
]

{ #category : #visiting }
IASTVisitorF77 >> visitIASTSubroutine: aSubroutine [

	| subroutine |
	1 halt.
	self flag: #TODO. "Add the body with statements (accesses, invocations, localVariables)"
	subroutine := (self newEntity: FamixFortran77PUSubroutine)
		              sourceAnchor:
			              (self newSourceAnchor: aSubroutine sourceAnchor);
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
IASTVisitorF77 >> visitIASTTypeRef: aType [

	| type |
	self flag: #TODO. "How to deal with length and kind for example character*20 name produce aType object like:
	- sourceAnchor: ...
	- entityName: TypeCharacter
	- length: 20
	- kind: nil"
	type := (self newEntity: FamixFortran77FType)
		        sourceAnchor: (self newSourceAnchor: aType sourceAnchor);
		        name: aType entityName;
		        length: aType length;
		        kind: aType kind;
		        yourself.
	^ type
]

{ #category : #visiting }
IASTVisitorF77 >> visitIASTVarAccess: aVarAccess [

	| access target |
	self flag: #TODO. "refactoring and other"
	access := (self newEntity: FamixFortran77Access)
		          sourceAnchor:
			          (self newSourceAnchor: aVarAccess sourceAnchor);
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
IASTVisitorF77 >> visitIASTVarEsoAr: aVarEsoAr [

	self flag: #TODO.
	1halt.
]

{ #category : #visiting }
IASTVisitorF77 >> visitIASTVarEsoAt: aVarEsoAt [

	self flag: #TODO.
	1halt.
]

{ #category : #visiting }
IASTVisitorF77 >> visitIASTVarEsoSl: aVarEsoSl [

	self flag: #TODO.
	1halt.
]

{ #category : #visiting }
IASTVisitorF77 >> visitIASTVariable: aVariable [

	| var |
	self flag: #TODO.
	var := (self newEntity: FamixFortran77Variable)
		       sourceAnchor: (self newSourceAnchor: aVariable sourceAnchor);
		       name: aVariable entityName;
		       fType: (aVariable typeSpec accept: self);
		       yourself.
	self stack top symbolTable at: var name put: var.
	^ var
]
