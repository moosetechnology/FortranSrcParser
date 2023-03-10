Class {
	#name : #PP2FortranSrcParser,
	#superclass : #PP2FortranSrcGrammar,
	#instVars : [
		'stack',
		'model',
		'f77sourcefile'
	],
	#category : #'FortranSrc-Parser'
}

{ #category : #'private-helper' }
PP2FortranSrcParser class >> getBasename: filename [

	^ filename asFileReference basename
]

{ #category : #'private-helper' }
PP2FortranSrcParser class >> getLines: filename [

	^ filename asFileReference contents lines
]

{ #category : #accessing }
PP2FortranSrcParser class >> ignoredNames [

	^ super ignoredNames , #( stack model #f77sourcefile )
]

{ #category : #debugging }
PP2FortranSrcParser class >> pp2FortranSrcDebug [
	| methodsLink |
	<script>

	Transcript open.

	methodsLink := MetaLink new. "A first example of a Metalink.
Here, we want the class, the name of the method and the arguments it takes"
	methodsLink metaObject: [ :receiver :selector :args | receiver trace.
        ' ' trace.
        selector trace.
        ' ' trace.
        args traceCr ].
	methodsLink selector: #value:value:value:. "i can just use context instead of receiver and selector"
	methodsLink arguments: #( receiver selector arguments ).
	methodsLink control: #before. "We install the metalink on every method of a collection of classes we give"
	^ (({ 
		    PP2FortranSrcGrammar.
		    PP2FortranSrcParser } collect: #methods) flattened collect: #ast) 
		  do: [ :node | node link: methodsLink ]
]

{ #category : #'grammar-helper' }
PP2FortranSrcParser >> aList: aRule [

	" (self token: 'AList')
	, (self token: '{')
	, (self overturedBy: 'alist')
	, (self prefix: 'alistList')
	, (self haskellList: aRule)
	, (self token: '}')"

	^ (super aList: aRule) ==> [ :nodes |
		nodes fifth
	  "{ 
		  nodes third sixth. ""srcSpan."" self flag: #FIXME. ""est-ce vraiment pertinent d'avoir ce srcSpan ? à voir""
		  nodes fifth ""aRule"" } "]
]

{ #category : #'grammar-statement' }
PP2FortranSrcParser >> argument [

	" (self token: 'Argument')
	, (self token: '{')
	, (self overturedBy: 'argument')
	, (self prefix: 'argumentName')
	, (self maybe: tkString)
	, tkComma
	, (self prefix: 'argumentExpr')
	, argumentExpression
	, (self token: '}')"

	^ super argument
	==> [ :nodes |
			{ nodes third sixth . nodes fifth . nodes eighth }
		 ]
]

{ #category : #'grammar-expression' }
PP2FortranSrcParser >> argumentExpression [

	"((self token: 'ArgExpr'), (self parens: expression))
	/ ((self prelude: 'ArgExprVar') , tkString)"
	
	^ super argumentExpression ==> [ :nodes | nodes second. ]
	
]

{ #category : #'grammar-block' }
PP2FortranSrcParser >> blComment [
	
	" (self prelude: 'BlComment')
	, comment"

	^ super blComment ==> [ :nodes |
		IASTComment new
			text: nodes second second ;
			sourceAnchor: nodes first second ;
			yourself
	]
]

{ #category : #'grammar-block' }
PP2FortranSrcParser >> blStatement [

	"(self prelude: 'BlStatement') , (self maybe: expression)
	  , (self parens: statement)"

	^ super blStatement ==> [ :nodes | nodes third ]
]

{ #category : #'grammar-expression' }
PP2FortranSrcParser >> createInvocation: nodes to: candidate [

	^ (self newEntity: FamixFortranInvocation)
		  addCandidate: candidate;
		  sourceAnchor: nodes;
		  signature: (self getSignature: nodes);
		  yourself
]

{ #category : #'grammar-expression' }
PP2FortranSrcParser >> createParameters: nodes to: candidate [

	nodes do: [ :n | 
		| parameter aName |
		aName := n third second.
		parameter := (self newEntity: FamixFortranParameter)
			             name: (aName isArray ifTrue: [ aName third asString ] ifFalse: [ aName sourceText]) ;
			             sourceAnchor: (aName isArray ifTrue: [ aName first ] ifFalse: [ aName sourceAnchor]);
			             yourself.
		parameter setOwner: candidate ]
]

{ #category : #'grammar-expression' }
PP2FortranSrcParser >> declarator [

	" (self token: 'Declarator')
	, (self token: '{')
	, (self overturedBy: 'declarator')
	, (self prefix: 'declaratorVariable')
	, expression
	, tkComma
	, (self prefix: 'declaratorType')
	, declaratorType
	, tkComma
	, (self prefix: 'declaratorLength')
	, (self maybeNoParens: expression)
	, tkComma
	, (self prefix: 'declaratorInitial')
	, (self maybeNoParens: expression)
	, (self token: '}')"

	^ super declarator ==> [ :nodes | 
	  { 
		  (nodes at: 3) sixth.
		  (nodes at: 5).
		  (nodes at: 8).
		  (nodes at: 11).
		  (nodes at: 14) } ]
]

{ #category : #'private-creation' }
PP2FortranSrcParser >> ensureBlockdata: aName [

	| aBlockdata candidates |
	aBlockdata := self model allWithType: FamixFortranBlockData.

	candidates := aBlockdata select: [ :each | each name = aName ].
	^ candidates
		  ifEmpty: [ 
			  (self newEntity: FamixFortranBlockData)
				  name: aName;
				  yourself ]
		  ifNotEmpty: [ candidates first ]
]

{ #category : #'private-creation' }
PP2FortranSrcParser >> ensureFunction: aName [

	| externalProcedures candidates |
	externalProcedures := self model allWithType: FamixFortranFunction.

	candidates := externalProcedures select: [ :each | 
		              each name = aName ].
	^ candidates
		  ifEmpty: [ 
			  (self newEntity: FamixFortranFunction)
				  name: aName;
				  isEsope: ({ #esoat. #esoar. #esosl } includes: aName);
				  isStub: true;
				  yourself ]
		  ifNotEmpty: [ candidates first]
]

{ #category : #'private-creation' }
PP2FortranSrcParser >> ensureFunction: aName intrinsic: aBoolean [

	| externalProcedures candidates |
	externalProcedures := self model allWithType: FamixFortranFunction.

	candidates := externalProcedures select: [ :each | 
		              each name = aName ].
	^ candidates
		  ifEmpty: [ 
			  (self newEntity: FamixFortranFunction)
				  name: aName;
				  isIntrinsic: aBoolean;
				  isStub: true;
				  isEsope: ({ #esoat. #esoar. #esosl } includes: aName);
				  yourself ]
		  ifNotEmpty: [ candidates first ]
]

{ #category : #'private-creation' }
PP2FortranSrcParser >> ensureSubroutine: aName [

	| externalProcedures candidates |
	externalProcedures := self model allWithType: FamixFortranSubroutine.

	candidates := externalProcedures select: [ :each | each name = aName ].
	^ candidates
		  ifEmpty: [ 
			  (self newEntity: FamixFortranSubroutine)
				  name: aName;
				  isStub: true;
				  yourself ]
		  ifNotEmpty: [ candidates first ]
]

{ #category : #'grammar-expression' }
PP2FortranSrcParser >> expFunctionCall [

	"return a function expression applied to a list of arguments."

	"(self prelude: 'ExpFunctionCall') , (self parens: expression)
	  , (self maybe: (self aList: argument))"

	^ super expFunctionCall ==> [ :nodes | 1halt.
	IASTInvocation new 
		sourceAnchor: nodes first second;
		entityName: nodes second entityName;
		arguments: (nodes third flattened select: [ :node | node class = IASTVarAccess ]) ;
		yourself.
	 ]
]

{ #category : #'grammar-expression' }
PP2FortranSrcParser >> expUnary [

	"(self prelude: 'ExpUnary') , unaryOp , (self parens: expression)"

	^ super expUnary ==> [ :nodes | 1halt.
	  { 
		  nodes first first.
		  nodes first second.
		  nodes second.
		  nodes third } ]
]

{ #category : #'grammar-expression' }
PP2FortranSrcParser >> expValue [

	" (self prelude: 'ExpValue')
	, ((self parens: value) / valStar)"

	^ super expValue ==> [ :nodes |
	  (nodes second = 'ValStar' or: [ nodes second first = 'ValString' ])
		  ifTrue: [ nodes ]
		  ifFalse: [ 
			 IASTVarAccess new
				  sourceAnchor: nodes first second ;
				  isAssigned: (nodes second second isNumber) ; 
				  entityName: nodes second second asString ;
				  yourself ] ]
]

{ #category : #accessing }
PP2FortranSrcParser >> f77sourcefile [

	^ f77sourcefile
]

{ #category : #accessing }
PP2FortranSrcParser >> f77sourcefile: filename [

	f77sourcefile := filename
]

{ #category : #'private-helper' }
PP2FortranSrcParser >> getSignature: aNode [

	^ self f77sourcefile asFileReference
		  readStreamDo: [ :stream | 
			  stream contents copyFrom: aNode startPos to: aNode endPos + 1 ]
		  ifAbsent: [ '' ] 
]

{ #category : #'grammar-helper' }
PP2FortranSrcParser >> haskellList: aRule [

	" (self token: '[')
	, (aRule separatedBy: tkComma) optional
	, (self token: ']')"

	^ (super haskellList: aRule) ==> [ :nodes |
	  nodes second ifNil: [ #(  ) ] ifNotNil: [ 
		  (1 to: nodes second size by: 2) collect: [ :i | 
			  nodes second at: i ] ] ]
]

{ #category : #initialization }
PP2FortranSrcParser >> initialize [

	super initialize.

	"stack := Stack new."
	model := OrderedCollection new.
	f77sourcefile := ''
]

{ #category : #'private - utility' }
PP2FortranSrcParser >> isEsope: nodes [

	^ nodes second second beginsWith: 'ESO' caseSensitive: false
]

{ #category : #'grammar-helper' }
PP2FortranSrcParser >> justAList: aRule [

	" self parens: (self token: 'Just')
	, (self aList: aRule)"

	^ (super justAList: aRule) ==> [ :nodes | nodes second ]
]

{ #category : #'grammar-helper' }
PP2FortranSrcParser >> maybe: aRule [

	"Maybe  -> Nothing / (Just aRule)"

	" tkNothing
	/ (self parens: (self token: 'Just') , aRule)"

	^ (super maybe: aRule) ==> [ :nodes | 
	  nodes ifNotNil: [ nodes second ] ]
]

{ #category : #'grammar-metaInfo' }
PP2FortranSrcParser >> metaInfo [

	" (self token: 'MetaInfo')
	, (self token: '{')
	, (miParameters delimitedBy: tkComma)
	, (self token: '}')"

	^ super metaInfo ==> [ :nodes |
	  (nodes third select: #isAssociation) asDictionary ]
]

{ #category : #'grammar-metaInfo' }
PP2FortranSrcParser >> miFilename [

	" (self token: 'miFilename')
	, tkEqual
	, tkString"

	^ super miFilename ==> [ :nodes |
	  self f77sourcefile: nodes third.
	  nodes first -> nodes third ]
]

{ #category : #'grammar-metaInfo' }
PP2FortranSrcParser >> miVersion [

	" (self token: 'miVersion')
	, tkEqual
	, tkIdentifier"
	^ super miVersion 
	==> [ :nodes |
		nodes first -> nodes third
	]
]

{ #category : #accessing }
PP2FortranSrcParser >> model [

	^ model
]

{ #category : #accessing }
PP2FortranSrcParser >> model: anObject [

	model := anObject
]

{ #category : #'private-creation' }
PP2FortranSrcParser >> newEntity: aClass [

	^ aClass new
		  mooseModel: model;
		  yourself
]

{ #category : #'private-creation' }
PP2FortranSrcParser >> newIndexedFileAnchor: filename [

	^ (self newEntity: FamixFortranIndexedFileAnchor)
		  startLine: 1;
		  endLine: (filename asFileReference
				   ifExists: [ (self class getLines: filename) size ]
				   ifAbsent: [ 1 ]);
		  startColumn: 1;
		  endColumn: (filename asFileReference
				   ifExists: [ (self class getLines: filename) last size ]
				   ifAbsent: [ 1 ]);
		  fileName: (self class getBasename: filename);
		  yourself
]

{ #category : #'grammar-helper' }
PP2FortranSrcParser >> parens: aRule [

	" (self token: '(')
	, aRule
	, (self token: ')')"

	^ (super parens: aRule) ==> [ :nodes | nodes second ]
]

{ #category : #grammar }
PP2FortranSrcParser >> position [

	"self parens: (tkNumber , (self token: ':') , tkNumber)"

	^ super position ==> [ :nodes | nodes first @ nodes third ]
]

{ #category : #'grammar-helper' }
PP2FortranSrcParser >> prelude: aString [

	" aString asPParser flatten trim
	, emptyTuple
	, srcSpan"
	^ (super prelude: aString) ==> [ :nodes | { nodes first. nodes third } ]
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> programFile [

	" (self token: 'ProgramFile')
	, (self token: '{')
	, (self prefix: 'programFileMeta')
	, metaInfo
	, tkComma
	, (self prefix: 'programFileProgramUnits')
	, (self haskellList: programUnit)
	, (self token: '}')"

	^ super programFile ==> [ :nodes | 
	  | compilationUnit |
	  1 halt.
	  compilationUnit := IASTProgramFile new
		                     filename:
			                     (nodes fourth
				                      at: 'miFilename'
				                      ifAbsent: [ '' ]);
		                     version:
			                     (nodes fourth
				                      at: 'miVersion'
				                      ifAbsent: [ 'Fortran77' ]);
		                     progUnits: nodes seventh;
		                     yourself.
		self model add: compilationUnit.
		compilationUnit
		 ]
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> puBlockData [

	" (self prelude: 'PUBlockData')
	, (self maybe: tkString)
	, (self haskellList: block)"

	^ super puBlockData ==> [ :nodes | 1halt.
		IASTBlockData new
			sourceAnchor: nodes first second ;
			entityName: (nodes second
				ifNil: [ '**No Name**' ]
				ifNotNil: [ nodes second ]) ;
			body: nodes third ; 
			yourself ]
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> puComment [

	"(self prelude: 'PUComment') , comment"

	^ super puComment ==> [ :nodes | 1halt.
		IASTComment new
			sourceAnchor: nodes first second ;
			text: nodes second second ;
			yourself
	]
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> puFunction [

	" (self prelude: 'PUFunction')
	, (self maybe: typeSpec)
	, prefixSuffix
	, tkString
	, ((self token: 'Nothing') / (self justAList: expression))
	, (self maybe: expression)
	, (self haskellList: block)
	, (self maybe: programUnit)"

	^ super puFunction ==> [ :nodes | 
	  1 halt.
	  IASTFunction new
		  sourceAnchor: nodes first second;
		  returnType: nodes second;
		  entityName: nodes fourth;
		  parameters: nodes fifth;
		  body: nodes seventh;
		  yourself ]
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> puMain [

	"(self prelude: 'PUMain') , (self maybe: tkString)
	  , (self haskellList: block) , (self maybe: programUnit)"

	^ super puMain ==> [ :nodes | 
	  1 halt.
	  IASTMainProgram new
		  sourceAnchor: nodes first second;
		  entityName: (nodes second
				   ifNil: [ '** No name given **' ]
				   ifNotNil: [ nodes second ]);
		  body: nodes third;
		  yourself ]
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> puSubroutine [

	" (self prelude: 'PUSubroutine')
	, prefixSuffix
	, tkString
	, ((self token: 'Nothing') / (self justAList: expression))
	, (self haskellList: block)
	, (self maybe: programUnit)"

	^ super puSubroutine ==> [ :nodes | 1halt.
		IASTSubroutine new
			sourceAnchor: nodes first second ;
			entityName: nodes third ;
			parameters: nodes fourth ;
			body: nodes fifth ;
			comments: (nodes fifth select: [ :node | node class = IASTComment ]) ;
			yourself ]
]

{ #category : #'grammar-declaration' }
PP2FortranSrcParser >> selector [

	" (self token: 'Selector')
	, (self token: '{')
	, (self overturedBy: 'selector')
	, (self prefix: 'selectorLength')
	, (self maybeNoParens: expression)
	, tkComma
	, (self prefix: 'selectorKind')
	, (self maybeNoParens: expression)
	, (self token: '}')"

	^ super selector ==> [ :nodes | 
	  nodes fifth = 'Nothing'
		  ifTrue: [ 
			  { 
				  nodes fifth.
				  nodes eighth second } ]
		  ifFalse: [ 
			  { 
				  nodes fifth second.
				  nodes eighth } ] ]
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> setStubEntity [

	| subroutines programFiles |
	subroutines  := self model allWithType: FamixFortranSubroutine.
	programFiles  := (self model allWithType: FamixFortranProgramFile) collect: [ :pf | pf filename asLowercase withoutSuffix: '.e.f' ].

	subroutines collect: [ :subroutine | programFiles includes: subroutine name ] thenDo: [ :subroutine | subroutine isStub: false ] 
]

{ #category : #grammar }
PP2FortranSrcParser >> srcSpan [

	"NB: `super srcSpan` has a production rule.
	We cannot call it directly, for that we have to use call the definition instead rather than calling srcSpan from the superclass"
	
	" position
	, (self token: '-')
	, position"

	^ (position , (self token: '-') , position) ==> [ :nodes |
	  { nodes first . nodes third } ]
]

{ #category : #'grammar-statement' }
PP2FortranSrcParser >> stCall [

	"(self prelude: 'StCall') , (self parens: expression)
	  , (self maybe: (self aList: argument))"

	^ super stCall ==> [ :nodes |
	  1 halt.
	  self flag: #TODO. "manage arguments by overriding argument method and extracting needed infos"
	  IASTInvocation new
		  sourceAnchor: nodes first second;
		  entityName: nodes second entityName;
		  arguments: nodes third;
		  yourself ]
]

{ #category : #'grammar-statement' }
PP2FortranSrcParser >> stDeclaration [

	" (self prelude: 'StDeclaration')
	, (self parens: typeSpec)
	, (self maybe: (self aList: attribute))
	, (self parens: (self aList: declarator))"

	^ super stDeclaration ==> [ :nodes | 
	  nodes fourth collect: [ :node | 
		  IASTVariable new
			  sourceAnchor: node first;
			  entityName: node second entityName;
			  typeSpec: nodes second;
			  dimension: node fourth;
			  initialValue: node fifth;
			  yourself ] ]
]

{ #category : #'grammar-statement' }
PP2FortranSrcParser >> stExpressionAssign [

	"((self prelude: 'StExpressionAssign') , (self parens: expression) , (self parens: expression))"

	self flag: #FIXME. "StExpressionAssign peut cacher des invocation qui empêche de les traiter plus haut. voir message à moi-même discord."
	^ super stExpressionAssign ==> [ :nodes |
	  { nodes first second . nodes second . nodes third } ]
]

{ #category : #'grammar-metaInfo' }
PP2FortranSrcParser >> stExternal [

	"(self prelude: 'StExternal')
	  , (self parens: (self aList: expression))"

	^ super stExternal ==> [ :nodes | nodes ]
]

{ #category : #'grammar-statement' }
PP2FortranSrcParser >> stFunction [

	"(self prelude: 'StFunction') , (self parens: expression)
	  , (self parens: (self aList: expression))
	  , (self parens: expression)"

	^ super stFunction ==> [ :nodes | 
	  | candidate | 1halt.
	 " candidate := self ensureFunction: nodes second third.
	  (self newEntity: FamixFortranInvocation)
		  addCandidate: candidate;
		  signature: (self getSignature: nodes first second);
		  sourceAnchor: nodes first second;
		  yourself" nodes ]
]

{ #category : #'grammar-statement' }
PP2FortranSrcParser >> stIfLogical [
	"(self prelude: 'StIfLogical') , (self parens: expression) , (self parens: statement)"

	^ super stIfLogical
	==> [ :nodes | 1halt.
			nodes
		 ]
]

{ #category : #'grammar-statement' }
PP2FortranSrcParser >> stPrint [
	" (self prelude: 'StPrint')
	, (self parens: expression)
	, (self justAList: expression)"
	
	^ super stPrint ==> [ :nodes | 1halt. nodes ]
]

{ #category : #'accessing - tests' }
PP2FortranSrcParser >> stack [

	^ stack
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> tkChar [

	" $' asPParser
	, #letter asPParser flatten
	, $' asPParser"

	^ super tkChar ==> [ :nodes | nodes second anyOne ]
]

{ #category : #token }
PP2FortranSrcParser >> tkNothing [

	" self token: 'Nothing'"

	self flag: #FIXME. "transform 'Nothing' to nil or something similar"
	^ super tkNothing ==> [ :nodes | nil ]
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> tkNumber [

	"#digit asPParser plus flatten trim"
	^ super tkNumber ==> [ :nodes | nodes asNumber ]
]

{ #category : #token }
PP2FortranSrcParser >> tkString [

	" $"" asPParser
	, ('\""' asPParser / $"" asPParser negate) star flatten
	, $"" asPParser"

	^ super tkString ==> [ :nodes | nodes second ]
]

{ #category : #'grammar-declaration' }
PP2FortranSrcParser >> typeSpec [

	" (self token: 'TypeSpec')
	, (self token: '{')
	, (self overturedBy: 'typeSpec')
	, (self prefix: 'typeSpecBaseType')
	, baseType
	, tkComma
	, (self prefix: 'typeSpecSelector')
	, (self maybeNoParens: selector)
	, (self token: '}')"

	^ super typeSpec ==> [ :nodes | 
	  | anEntity |
	  anEntity := IASTTypeRef new
		              sourceAnchor: nodes third sixth;
		              entityName: nodes fifth;
		              yourself.
	  nodes eighth = 'Nothing' ifFalse: [ 
		  anEntity addSelector: nodes eighth second ].

	  anEntity ]
]

{ #category : #'grammar-expression' }
PP2FortranSrcParser >> valInteger [

	"(self token: 'ValInteger') , tkString , tkNothing"

	^ super valInteger ==> [ :nodes |
	  { 
		  nodes first.
		  nodes second asNumber.
		  "nodes third" } ]
]

{ #category : #'grammar-expression' }
PP2FortranSrcParser >> valStar [

	"self token: 'ValStar'"

	^ super valStar ==> [ :nodes | nodes ]
]

{ #category : #'grammar-expression' }
PP2FortranSrcParser >> valString [

	"(self token: 'ValString') , tkString"

	^ ((self token: 'ValString') , tkString) ==> [ :nodes | 1halt.
	  { 
		  nodes first.
		  nodes second } ]
]

{ #category : #'grammar-expression' }
PP2FortranSrcParser >> value [

	" valInteger 
	/ valLogical
	/ ((self token: 'ValString') , tkString)
	/ ((self token: 'ValHollerith') , tkString)
	/ ((self token: 'ValVariable') , tkString)
	/ ((self token: 'ValIntrinsic') , tkString)
	/ ((self token: 'ValOperator') , tkString)
	/ ((self token: 'ValType') , tkString)
	""/ valBoz""
	""/ (self token: 'ValStar')""
	""/ valReal / valComplex""
	""/ valAssignment / valColon"""

	^ super value ==> [ :nodes |
	  nodes isArray
		  ifTrue: [ 
			  {  nodes first.
				  nodes second } ]
		  ifFalse: [ nodes ] ]
]
