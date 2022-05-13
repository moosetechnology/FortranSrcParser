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
		  nodes third.
		  nodes fourth } ]
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

	^ super blComment ==> [ :nodes | {nodes third . nodes fourth} ]
]

{ #category : #'grammar-block' }
PP2FortranSrcParser >> comment [

	"self parens: (self token: 'Comment') , tkString"

	^ super comment ==> [ :nodes |
	  { 
		  nodes second first value.
		  nodes second second second value } ]
]

{ #category : #accessing }
PP2FortranSrcParser >> expValue [

	"(self prelude: 'ExpValue') , (self parens: value)"

	^ super expValue ==> [ :nodes |
	  { 
		  nodes third.
		  nodes fourth second first.
		  nodes fourth second second second } ]
]

{ #category : #'grammar-helper' }
PP2FortranSrcParser >> haskellList: aRule [

	"(self token: '[') , (aRule separatedBy: tkComma) optional
	  , (self token: ']')"

	^ (super haskellList: aRule) ==> [ :nodes |
	  nodes second ifNil: [ #(  ) ] ifNotNil: [ 
		  nodes second
			  select: [ :node | node isArray ]
			  thenCollect: [ :array | array second ] ] ]
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

	^ (super justAList: aRule) ==> [ :nodes |
	  nodes second second ]
]

{ #category : #'grammar-metaInfo' }
PP2FortranSrcParser >> metaInfo [

	"self parens: (self token: 'MetaInfo') , (self token: '{') , (miParameters delimitedBy: tkComma) , (self token: '}')
	  "

	^ super metaInfo
	  ==> [ :nodes | 
	  (nodes second third select: [ :each | each isAssociation ]) asDictionary ]
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

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> programFile [

	"(self token: 'ProgramFile') , metaInfo , (self haskellList: programUnit)"

	^ super programFile ==> [ :nodes | | prog |
	  prog := FamixFortranProgramFile new
		          mooseModel: model;
		          version: (nodes second at: 'miVersion' ifAbsent: [ '' ]);
		          filename: (nodes second at: 'miFilename' ifAbsent: [ '' ]);
		          yourself.

	  nodes third do: [ :progUnit | prog addProgramUnit: progUnit ] ]
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> puSubroutine [

	"#prelude: return 3 nodes."

	" (self prelude: 'PUSubroutine')
	, prefixSuffix
	, tkString
	, ((self token: 'Nothing') / (self justAList: expression))
	, (self haskellList: block)
	, (self maybe: programUnit)"

	^ super puSubroutine ==> [ :nodes | 
	  | subroutine |
	  subroutine := FamixFortranSubroutine new
		                mooseModel: model;
		                name: nodes fifth value trim;
		                yourself.
	  1 halt.
	  nodes sixth = 'Nothing' ifFalse: [ 
		  nodes sixth second do: [ :node | 
			  | parameter |
			  parameter := FamixFortranParameter new
				               name: node value;
				               yourself.
			  subroutine addParameter: parameter ] ].
	  self flag: #FIXME "Comment traiter si j'ai des instructions et/ou commentaire dans un block ? les differencier" ]
]

{ #category : #accessing }
PP2FortranSrcParser >> srcSpan [

	"position , (self token: '-') , position"
	^ super srcSpan ==> [ :nodes |
			{(nodes first second first asNumber)@(nodes first second last asNumber) . (nodes last second first asNumber) @ (nodes last second last asNumber) }
		]
]

{ #category : #'grammar-statement' }
PP2FortranSrcParser >> stCall [
	"((self prelude: 'StCall') , (self parens: expression) , (self maybe: (self aList:  argument)))"

	^ super stCall
	==> [ :nodes |
			nodes
		 ]
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
