Class {
	#name : #PP2FortranSrcParser,
	#superclass : #PP2FortranSrcGrammar,
	#instVars : [
		'stack',
		'model'
	],
	#category : #'FortranSrc-Parser'
}

{ #category : #accessing }
PP2FortranSrcParser class >> ignoredNames [

	^ super ignoredNames , #( stack model )
]

{ #category : #'as yet unclassified' }
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

	"(self prelude: 'AList') , (self haskellList: aRule)"

	^ (super aList: aRule) ==> [ :nodes |
	  { 
		  nodes first second.
		  nodes second } ]
]

{ #category : #'grammar-statement' }
PP2FortranSrcParser >> argument [
	"(self prelude: 'Argument') , (self maybe: tkString) , (self parens: argumentExpression)"

	^ super argument
	==> [ :nodes |
			nodes
		 ]
]

{ #category : #'grammar-block' }
PP2FortranSrcParser >> blComment [

	" (self prelude: 'BlComment')
	, comment"

	^ super blComment ==> [ :nodes | 
	  (self newEntity: FamixFortranComment)
		  content: nodes second second;
		  yourself ]
]

{ #category : #'grammar-block' }
PP2FortranSrcParser >> blStatement [

	"(self prelude: 'BlStatement') , (self maybe: expression)
	  , (self parens: statement)"

	^ super blStatement ==> [ :nodes | nodes ]
]

{ #category : #'grammar-expression' }
PP2FortranSrcParser >> expUnary [

	"(self prelude: 'ExpUnary') , unaryOp , (self parens: expression)"

	^ super expUnary ==> [ :nodes | 
	  { 
		  nodes first first.
		  nodes first second.
		  nodes second.
		  nodes third second.
		  nodes third third } ]
]

{ #category : #'grammar-expression' }
PP2FortranSrcParser >> expValue [

	"(self prelude: 'ExpValue') , (self parens: value)"

	^ super expValue ==> [ :nodes | 
	  { 
		  nodes first second.
		  nodes second first.
		  nodes second second } ]
]

{ #category : #'grammar-helper' }
PP2FortranSrcParser >> haskellList: aRule [

	"(self token: '[') , (aRule separatedBy: tkComma) optional
	  , (self token: ']')"

	^ (super haskellList: aRule)
	  ==> [ :nodes | 
	  nodes second ifNil: [ #(  ) ] ifNotNil: [ (1 to: nodes second size by: 2) collect: [ :i | nodes second at: i  ] ] ]
]

{ #category : #initialization }
PP2FortranSrcParser >> initialize [

	super initialize.

	stack := Stack new.
	model := FamixFortranModel new
]

{ #category : #'grammar-helper' }
PP2FortranSrcParser >> justAList: aRule [

	"self parens: (self token: 'Just') , (self aList: aRule)"

	^ (super justAList: aRule) ==> [ :nodes | nodes second ]
]

{ #category : #'grammar-helper' }
PP2FortranSrcParser >> maybe: aRule [

	"Maybe  -> Nothing / (Just aRule)"

	"tkNothing / (self parens: (self token: 'Just') , aRule)"

	^ (super maybe: aRule) ==> [ :nodes | 
	  nodes = 'Nothing'
		  ifTrue: [ nodes ]
		  ifFalse: [ nodes second ] ]
]

{ #category : #'grammar-metaInfo' }
PP2FortranSrcParser >> metaInfo [

	"self parens: (self token: 'MetaInfo') , (self token: '{') , (miParameters delimitedBy: tkComma) , (self token: '}')
	  "

	^ super metaInfo
	  ==> [ :nodes | 
	  (nodes third select: [ :each | each isAssociation ]) asDictionary ]
]

{ #category : #'grammar-metaInfo' }
PP2FortranSrcParser >> miFilename [

	"(self token: 'miFilename') , (self token: '=') , tkString"

	^ super miFilename ==> [ :nodes | nodes first -> nodes third ]
]

{ #category : #'grammar-metaInfo' }
PP2FortranSrcParser >> miParameters [
	"miVersion / miFilename"
	^ super miParameters
"	==> [ :nodes |
		1halt
	]"
]

{ #category : #'grammar-metaInfo' }
PP2FortranSrcParser >> miVersion [

	"(self token: 'miVersion') , (self token: '=') , tkIdentifier"
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

{ #category : #'private - creation' }
PP2FortranSrcParser >> newEntity: aClass [
	^ aClass new mooseModel: model; yourself
]

{ #category : #'grammar-helper' }
PP2FortranSrcParser >> parens: aRule [

	"(self token: '(') , aRule , (self token: ')')"

	^ (super parens: aRule) ==> [ :nodes | nodes second ]
]

{ #category : #grammar }
PP2FortranSrcParser >> position [

	"self parens: tkNumber , (self token: ':') , tkNumber"

	^ super position
	  ==> [ :nodes | nodes first @ nodes third ]
]

{ #category : #'grammar-helper' }
PP2FortranSrcParser >> prelude: aString [

	"aString asPParser trim , emptyTuple , srcSpan"
	^ (super prelude: aString) ==> [ :nodes | { nodes first. nodes third } ]
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> programFile [

	"(self token: 'ProgramFile') , metaInfo , (self haskellList: programUnit)"

	^ super programFile ==> [ :nodes | 
	  | progFile |
	  progFile := (self newEntity: FamixFortranProgramFile)
		              version:
			              (nodes second at: 'miVersion' ifAbsent: [ '' ]);
		              filename: (nodes second
				               at: 'miFilename'
				               ifPresent: [ :node | node ]
				               ifAbsent: [ '' ]);
		              yourself.
	  nodes third do: [ :progUnit | progFile addProgramUnit: progUnit ] ]
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> puComment [

	"(self prelude: 'PUComment') , comment"

	^ super puComment ==> [ :nodes | 
	  (self newEntity: FamixFortranComment)
		  content: nodes fourth second second;
		  yourself ]
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> puMain [

	"(self prelude: 'PUMain') , (self maybe: tkString)
	  , (self haskellList: block) , (self maybe: programUnit)"

	^ super puMain ==> [ :nodes | 
	  | program |
	  program := (self newEntity: FamixFortranProgram)
		             name: (nodes second = 'Nothing'
				              ifTrue: [ '' ]
				              ifFalse: [ nodes second ]);
		             yourself.
	  self flag: #TODO. "gerer les élements du block"
	  nodes fourth = 'Nothing' ifFalse: [ 
		  nodes fourth do: [ :progUnit | progUnit container: program ] ].
	  program ]
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> puSubroutine [

	" (self prelude: 'PUSubroutine')
	, prefixSuffix
	, tkString
	, ((self token: 'Nothing') / (self justAList: expression))
	, (self haskellList: block)
	, (self maybe: programUnit)"

	^ super puSubroutine ==> [ :nodes | 
	  | subroutine |
	  subroutine := (self newEntity: FamixFortranSubroutine)
		                name: nodes third;
		                yourself.
	  nodes fourth = 'Nothing' ifFalse: [ 
		  nodes fourth second do: [ :node | 
			  subroutine addParameter:
				  ((self newEntity: FamixFortranParameter)
					   name: node third value;
					   yourself) ] ].
	  self flag: #FIXME. "verifier ce qu'on a dans le block."
	  "nodes fifth do: [ :cmt | cmt container: subroutine ]."
	  nodes fifth do: [ :inv |
		  (self newEntity: FamixFortranInvocation)
			  sender: subroutine;
			  addCandidate: ((self newEntity: FamixFortranExternalProcedure)
					   name: inv third second;
					   yourself);
			  yourself ].
	  subroutine ]
]

{ #category : #accessing }
PP2FortranSrcParser >> srcSpan [

	"position , (self token: '-') , position"
	"NB: super srcSpan à une regle de production. Pour éviter le bug, mettre directement la définition plutôt que d'appeler srcSpan de la superclass"
	^ position , (self token: '-') , position ==> [ :nodes | 
	  { 
		  nodes first.
		  nodes last } ]
]

{ #category : #'grammar-statement' }
PP2FortranSrcParser >> stCall [

	"(self prelude: 'StCall') , (self parens: expression)
	  , (self maybe: (self aList: argument))"

	^ super stCall ==> [ :nodes | 
	  { 
		  nodes first.
		  nodes second third.
		  nodes third }]
]

{ #category : #'grammar-statement' }
PP2FortranSrcParser >> stDeclaration [
	"(self prelude: 'StDeclaration') , (self parens: typeSpec) , (self maybe: (self aList: attribute)) , (self parens: (self aList: declarator))"

	^ super stDeclaration
	==> [ :nodes |
			nodes
		 ]
]

{ #category : #'grammar-statement' }
PP2FortranSrcParser >> stExpressionAssign [
	"((self prelude: 'StExpressionAssign') , (self parens: expression) , (self parens: expression))"

	^ super stExpressionAssign
	==> [ :nodes |
			nodes
		 ]
]

{ #category : #'grammar-statement' }
PP2FortranSrcParser >> stIfLogical [
	"(self prelude: 'StIfLogical') , (self parens: expression) , (self parens: statement)"

	^ super stIfLogical
	==> [ :nodes |
			nodes
		 ]
]

{ #category : #'accessing - tests' }
PP2FortranSrcParser >> stack [

	^ stack
]

{ #category : #'grammar-statement' }
PP2FortranSrcParser >> statement [
	"stDeclaration
	""/ stStructure / stIntent / stOptional / stPublic / stPrivate / stProtected / stSave""
	/ (self prelude: 'StDimension' aList: declarator)
	/ (self prelude: 'StAllocatable' aList: declarator)
	""/ stAsynchronous / stPointer / stTarget / stValue / stVolatile / stData / stAutomatic / ststatic / stNamelist / stParameter / stExternal / stIntrinsic""
	/ (self prelude: 'StCommon' aList: commonGroup)
	/ (self prelude: 'StEquivalence' aList: (self aList: expression))
	""/ stFormat""
	/ (self prelude: 'StImplicit' maybe: (self aList: impList))
	
	""/ stEntry / stInclude / stDo / stDoWhile / stEnddo / stCycle / stExit ""
	/ stIfLogical
	"" / stIfArithmetic / stSelectCase / stCase / stEndcase / stFunction""
	/ stExpressionAssign
	"" / stPointerAssign / stLabelAssign""
	/ ((self prelude: 'StGotoUnconditional'), (self parens: expression ))
	"" / stGotoAssigned / stGotoComputed""
	/ stCall
	/ (self prelude: 'StReturn' maybe: expression)
	/ (self prelude: 'StContinue')
	""/ ststop / stPause / stRead / stRead2 / stWrite / stPrint / stTypePrint / stOpen / stClose / stFlush / stInquire / stRewind / stRewind2 / stBackspace / stBackspace2 / stEndfile / stEndfile2 / stAllocate / stNullify / stDeallocate / stWhere / stWhereConstruct / stElsewhere / stEndWhere / stUse / stModuleProcedure / stProcedure / stType / stEndType / stSequence / stForall / stForallstatement / stEndForall / stImport / stEnum / stEnumerator / stEndEnum / stFormatBogus"""
	
	^ super statement
	==> [ :nodes |
			nodes
		 ]
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> tkNumber [

	"#digit asPParser plus flatten trim"
	^ super tkNumber ==> [ :nodes | nodes asNumber ]
]

{ #category : #token }
PP2FortranSrcParser >> tkString [

	"$"" asPParser , ('\""' asPParser / $"" asPParser negate) star flatten
	  , $"" asPParser"

	^ super tkString ==> [ :nodes | nodes second]
]

{ #category : #'grammar-expression' }
PP2FortranSrcParser >> valInteger [

	"(self token: 'ValInteger') , tkString , tkNothing"

	^ super valInteger ==> [ :nodes | 
	  { 
		  nodes first.
		  nodes second asNumber. } ]
]

{ #category : #'grammar-expression' }
PP2FortranSrcParser >> valString [

	"(self token: 'ValString') , tkString"

	^ ((self token: 'ValString') , tkString) ==> [ :nodes | 
	  { 
		  nodes first.
		  nodes second } ]
]

{ #category : #'grammar-expression' }
PP2FortranSrcParser >> value [

	"valInteger / ((self token: 'ValString') , tkString)
	  / ((self token: 'ValHollerith') , tkString)
	  / ((self token: 'ValVariable') , tkString)
	  / ((self token: 'ValIntrinsic') , tkString)
	  / ((self token: 'ValOperator') , tkString)
	  / ((self token: 'ValType') , tkString)
	/ valReal / valComplex
	/ valBoz
	/ valLogical
	/ valAssignment
	/ valStar / valColon"

	^ super value ==> [ :nodes | {nodes first. nodes second} ]
]
