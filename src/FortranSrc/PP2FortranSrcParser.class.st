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

	"(self prelude: 'BlComment') , comment"
	
	^ super blComment
	==> [ :nodes |
			FamixFortranBlComment new
				positions: nodes third;
				comments: nodes fourth;
				yourself
		 ]
]

{ #category : #'grammar-block' }
PP2FortranSrcParser >> blDo [
	"(self prelude: 'BlDo') , (self maybe: expression) , (self maybe: tkString) , (self maybe: expression) , (self maybe: doSpecification) , (self haskellList: block) , (self maybe: expression)"
	
	^ super blDo
	==> [ :nodes |
			FamixFortranBlDo new
				yourself
		 ]
]

{ #category : #'grammar-block' }
PP2FortranSrcParser >> blIf [
	" (self prelude: 'BlIf') , (self maybe: expression) , (self maybe: tkString) , (self haskellList: (self maybeNoParens: expression))	, (self haskellList: (self haskellList: block)) , (self maybe: expression)"

	^ super blIf
	==> [ :nodes |
			FamixFortranBlIf new
				yourself
		 ]
]

{ #category : #'grammar-block' }
PP2FortranSrcParser >> blStatement [

	"(self prelude: 'BlStatement') , (self maybe: expression) , (self parens: statement)"
	
	^ super blStatement
	==> [ :nodes |
			FamixFortranBlStatement new
				positions: nodes third;
				label: nodes fourth;
				statements: nodes fifth;
				yourself 
		 ]
]

{ #category : #'grammar-block' }
PP2FortranSrcParser >> block1 [
	"blStatement ""/ blForAll"" / blIf ""/ blCase"" / blDo "" / blDoWhile / blAssociate / blInterface"" / blComment"

	^ super block
	==> [ :nodes |
			FamixFortranBlock new
				yourself
		 ]
]

{ #category : #'grammar-block' }
PP2FortranSrcParser >> comment [
	"self parens: (self token: 'Comment') , tkString"
	^ super comment
	==> [ :nodes |
			FamixFortranComment new
				comment: (nodes second second second joinUsing: '')
				yourself
		 ]
]

{ #category : #'grammar-block' }
PP2FortranSrcParser >> doSpecification [
	"(self prelude: 'DoSpecification') , (self parens: statement) , (self parens: expression) , (self maybe: expression)"

	^ super doSpecification
	==> [ :nodes|
			FamixFortranDoSpecification new
				yourself
				
		 ]
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> expression [
	"expValue / expBinary / expUnary / expSubscript / expFunctionCall / expDataRef
	/ expImpliedDo / expInitialisation / expReturnSpec"
	
	^ super expression ==> [ :nodes | 1halt. ]
]

{ #category : #'grammar-helper' }
PP2FortranSrcParser >> haskellList: aRule [

	"(self token: '[') , (aRule separatedBy: tkComma) optional
	  , (self token: ']')"

	^ (super haskellList: aRule)
	  ==> [ :nodes | 
	  nodes second ifNil: [ #(  ) ] ifNotNil: [ nodes second select: [:node | node isArray ] thenCollect: [ :array | array second ]]]
]

{ #category : #initialization }
PP2FortranSrcParser >> initialize [
	super initialize.
	
	stack := Stack new.
	model := FamixFortranModel new.
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

	^ super programFile ==> [ :nodes | 
	  | prog |
	  prog := FamixFortranProgramFile new
		          mooseModel: model;
		          version: (nodes second at: 'miVersion' ifAbsent: [ '' ]);
		          filename: (nodes second at: 'miFilename' ifAbsent: [ '' ] );
			          yourself.
			nodes third do: [ :progUnit | prog addProgramUnit: progUnit ] ]
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> puSubroutine [

	"#prelude: return 3 nodes."

	"(self prelude: 'PUSubroutine') , prefixSuffix , tkString , ((self token: 'Nothing') / (self justAList: expression)) , (self haskellList: block) , (self maybe: programUnit)"

	^ super puSubroutine ==> [ :nodes | 
	  | subroutine |
	  subroutine := FamixFortranSubroutine new
		                mooseModel: model;
		                name: nodes fifth value;
		                yourself.
	  nodes sixth isToken ifFalse: [ 1 halt ] ]
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
