Class {
	#name : #PP2FortranSrcParser,
	#superclass : #PP2FortranSrcGrammar,
	#category : #'FortranSrc-Parser'
}

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

{ #category : #'grammar-metaInfo' }
PP2FortranSrcParser >> metaInfo [
	"self parens: (self token: 'MetaInfo') , (self token: '{') , (miParameters delimitedBy: tkComma) , (self token: '}')
	  "
	^ super metaInfo 
	==> [ :nodes |
		String withAll: (nodes second third detect: [ :each | each isAssociation and: [ each key = 'miFilename' ] ])
			value second
	]
]

{ #category : #'grammar-metaInfo' }
PP2FortranSrcParser >> miFilename [

	"(self token: 'miFilename') , (self token: '=') , tkString"
	^ super miFilename 
	==> [ :nodes |
		nodes first -> nodes third
	]
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

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> programFile [

	"(self token: 'ProgramFile') , metaInfo , (self haskellList: programUnit)"
	^ super programFile 
	==> [ :nodes |
		FamixFortranProgramFile new
			filename: nodes second;
			body: nodes third ;
			yourself
	]
]

{ #category : #'grammar-programUnit' }
PP2FortranSrcParser >> puSubroutine [
   "(self prelude: 'PUSubroutine') , prefixSuffix , tkString , ((self token: 'Nothing') / (self justAList: expression)) , (self haskellList: block) , (self maybe: programUnit)"
	
	^ super puSubroutine
	==> [ :nodes |
			FamixFortranPUSubroutine new
				position: nodes third;
				name: (String withAll: nodes fifth second);
				arguments: nodes sixth;
				body: nodes seventh;
				subProgram: nodes eighth;
				yourself
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

{ #category : #token }
PP2FortranSrcParser >> tkStringTmp [
	self flag: #FIXME. "Erreur de parsing"
	^ super tkString
	==> [ :nodes | String withAll: nodes second ]
]
