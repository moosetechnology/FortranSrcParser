Class {
	#name : #PP2FortranSrcGrammarTest,
	#superclass : #PP2CompositeNodeTest,
	#category : #FortranSrc
}

{ #category : #accessing }
PP2FortranSrcGrammarTest >> parserClass [
	^ PP2FortranSrcParser
]

{ #category : #'tests-statement' }
PP2FortranSrcGrammarTest >> testArgument [
	self
		parse: 'Argument ()
	(98:22)-(98:22)
	Nothing
	(ArgExpr (ExpValue ()
		(98:22)-(98:22)
		(ValInteger "0" Nothing)))'
		rule: #argument
]

{ #category : #'tests-expression' }
PP2FortranSrcGrammarTest >> testArgumentExpression [
	self
		parse: 'ArgExpr (ExpValue ()
	(98:22)-(98:22)
	(ValInteger "0" Nothing))' 
		rule: #argumentExpression
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testAttribute [

	self parse: 'AttrAllocatable () (1:5)-(1:10)' rule: #attribute.
	self parse: 'AttrAsynchronous () (1:5)-(1:10)' rule: #attribute.
	"self parse: 'AttrDimension () (1:5)-(1:10)' rule: #attribute."
	self parse: 'AttrExternal () (1:5)-(1:10)' rule: #attribute.
	"self parse: 'AttrIntent () (1:5)-(1:10)' rule: #attribute."
	self parse: 'AttrIntrinsic () (1:5)-(1:10)' rule: #attribute.
	self parse: 'AttrOptional () (1:5)-(1:10)' rule: #attribute.
	self parse: 'AttrParameter () (1:5)-(1:10)' rule: #attribute.
	self parse: 'AttrPointer () (1:5)-(1:10)' rule: #attribute.
	self parse: 'AttrPrivate () (1:5)-(1:10)' rule: #attribute.
	self parse: 'AttrProtected () (1:5)-(1:10)' rule: #attribute.
	self parse: 'AttrPublic () (1:5)-(1:10)' rule: #attribute.
	self parse: 'AttrSave () (1:5)-(1:10)' rule: #attribute.
	"self parse: 'AttrSuffix () (1:5)-(1:10)' rule: #attribute."
	self parse: 'AttrTarget () (1:5)-(1:10)' rule: #attribute.
	self parse: 'AttrValue () (1:5)-(1:10)' rule: #attribute.
	self parse: 'AttrVolatile () (1:5)-(1:10)' rule: #attribute
]

{ #category : #'tests-block' }
PP2FortranSrcGrammarTest >> testBlComment [
	self
		parse: 'BlComment ()
	(4:1)-(4:19)
	(Comment "     some comment  ")'
		rule: #blComment
]

{ #category : #'tests-block' }
PP2FortranSrcGrammarTest >> testBlDo [
	self
		parse: 'BlDo ()
	(116:7)-(288:11)
	Nothing
	Nothing
	(Just ExpValue ()
		(116:9)-(116:13)
		(ValInteger "99999" Nothing))
	(Just DoSpecification ()
		(116:14)-(116:48)
		(StExpressionAssign ()
			(116:14)-(116:17)
			(ExpValue ()
				(116:14)-(116:15)
				(ValVariable "var1"))
			(ExpValue ()
				(116:17)-(116:17)
			(ValInteger "1" Nothing)))
		(ExpValue ()
			(116:19)-(116:24)
			(ValVariable "var2"))
		Nothing)
		[BlComment ()
			   (117:1)-(117:31)
			   (Comment "do body")]
		(Just ExpValue ()
			(289:1)-(289:5)
			(ValInteger "99999" Nothing))'
		rule: #blDo
]

{ #category : #'tests-block' }
PP2FortranSrcGrammarTest >> testBlIf [
	self
		parse: 'BlIf ()
	(126:9)-(283:13)
	Nothing
	Nothing
	[Just ExpBinary ()
		(126:12)-(126:19)
		EQ
		(ExpValue ()
			(126:12)-(126:14)
			(ValVariable "lxs"))
		(ExpValue ()
			(126:19)-(126:19)
			(ValInteger "0" Nothing)),
		Nothing]
	[[BlComment ()
		(127:1)-(127:44)
		(Comment "	 then part")],
	[BlComment ()
		(130:1)-(130:50)
		(Comment "	 else part")]]
	Nothing'
		rule: #blIf
]

{ #category : #'tests-block' }
PP2FortranSrcGrammarTest >> testBlStatement [
	self
		parse: 'BlStatement ()
	(62:7)-(62:18)
	Nothing
	(StDeclaration ()
		(62:7)-(62:18)
		(TypeSpec ()
			(62:7)-(62:13)
			TypeInteger
			Nothing)
		Nothing
		(AList ()
			(62:15)-(62:18)
			[Declarator ()
				(62:15)-(62:18)
				(ExpValue ()
					(62:15)-(62:18)
					(ValVariable "var"))
				ScalarDecl
				Nothing
				Nothing]))'
		rule: #blStatement
]

{ #category : #'tests-block' }
PP2FortranSrcGrammarTest >> testBlStatementContinue [
	self
		parse: 'BlStatement ()
	(135:2)-(135:18)
	(Just ExpValue ()
		(135:2)-(135:4)
		(ValInteger "100" Nothing))
	(StContinue ()
		(135:11)-(135:18))'
		rule: #blStatement
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testComment [
	self
		parse: '(Comment "     some comment  ")'
		rule: #comment
]

{ #category : #'tests-declaration' }
PP2FortranSrcGrammarTest >> testCommonGroup [

	self
		parse: 'CommonGroup ()
			(64:13)-(65:55)
			(Just ExpValue ()
			      (64:13)-(64:20)
			      (ValVariable "value"))
			(AList ()
			       (64:21)-(65:55)
			       [Declarator ()
			       		   (64:21)-(64:23)
						   (ExpValue ()
						   (64:21)-(64:23)
						   (ValVariable "val"))
						   ScalarDecl
						   Nothing
						   Nothing])'
		rule: #commonGroup
]

{ #category : #'tests-declaration' }
PP2FortranSrcGrammarTest >> testDeclarator [

	self
		parse: 'Declarator ()
	(62:15)-(62:18)
	(ExpValue ()
		(62:15)-(62:18)
		(ValVariable "val"))
	ScalarDecl
	Nothing
	Nothing'
		rule: #declarator
]

{ #category : #'tests-declaration' }
PP2FortranSrcGrammarTest >> testDeclaratorType [
	self
		parse: 'ScalarDecl'
		rule: #declaratorType.

	self
		parse: '(ArrayDecl (AList ()
	(64:29)-(64:29)
	[DimensionDeclarator ()
		(64:29)-(64:29)
		Nothing
		(Just ExpValue ()
			(64:29)-(64:29)
			(ValInteger "2" Nothing))]))'
		rule: #declaratorType
]

{ #category : #'tests-declaration' }
PP2FortranSrcGrammarTest >> testDimensionDeclarator [

	self
		parse: 'DimensionDeclarator ()
	(64:29)-(64:29)
	Nothing
	(Just ExpValue ()
		(64:29)-(64:29)
		(ValInteger "2" Nothing))'
		rule: #dimensionDeclarator
]

{ #category : #'tests-block' }
PP2FortranSrcGrammarTest >> testDoSpecification [
	self
		parse: 'DoSpecification ()
	(116:14)-(116:48)
	(StExpressionAssign ()
		(116:14)-(116:17)
		(ExpValue ()
			(116:14)-(116:15)
			(ValVariable "var1"))
		(ExpValue ()
			(116:17)-(116:17)
		(ValInteger "1" Nothing)))
	(ExpValue ()
		(116:19)-(116:24)
		(ValVariable "var2"))
	Nothing'
		rule: #doSpecification
]

{ #category : #'tests-expression' }
PP2FortranSrcGrammarTest >> testExpBinary [
	self
		parse: 'ExpBinary ()
	(157:45)-(157:52)
	Addition
	(ExpValue ()
		(157:45)-(157:47)
		(ValVariable "var"))
	(ExpValue ()
		(157:52)-(157:52)
		(ValInteger "4" Nothing))'
		rule: #expBinary
]

{ #category : #'tests-expression' }
PP2FortranSrcGrammarTest >> testExpBinaryLTE [
	self
		parse: 'ExpBinary ()
	(144:10)-(144:47)
	LTE
	(ExpValue ()
		(144:10)-(144:10)
		(ValVariable "i"))
	(ExpValue ()
		(144:16)-(144:21)
		(ValVariable "oo_006"))'
		rule: #expBinary
]

{ #category : #'tests-expression' }
PP2FortranSrcGrammarTest >> testExpFunctionCall [
	self
		parse: 'ExpFunctionCall ()
	(118:10)-(118:47)
	(ExpValue ()
		(118:10)-(118:12)
		(ValIntrinsic "abs"))
	(Just AList ()
		(118:14)-(118:46)
		[Argument ()
			(118:14)-(118:46)
			Nothing
			(ArgExpr (ExpValue ()
				(118:14)-(118:19)
				(ValVariable "var")))])'
		rule: #expFunctionCall
]

{ #category : #'tests-expression' }
PP2FortranSrcGrammarTest >> testExpSubscript [
	self
		parse: 'ExpSubscript ()
	(157:45)-(157:50)
	(ExpValue ()
		(157:45)-(157:47)
		(ValVariable "var"))
	(AList ()
		(157:49)-(157:49)
		[IxSingle ()
			(157:49)-(157:49)
			Nothing
			(ExpValue ()
				(157:49)-(157:49)
				(ValInteger "2" Nothing))])'
		rule: #expSubscript
]

{ #category : #'tests-expression' }
PP2FortranSrcGrammarTest >> testExpUnary [
	self
		parse: 'ExpUnary ()
	(99:14)-(99:18)
	Minus
	(ExpValue ()
		(99:15)-(99:18)
		(ValInteger "0002" Nothing))'
		rule: #expUnary
]

{ #category : #'tests-expression' }
PP2FortranSrcGrammarTest >> testExpValue [
	self
		parse: 'ExpValue ()
	(3:14)-(3:19)
	(ValVariable "status")'
		rule: #expValue
]

{ #category : #'tests-declaration' }
PP2FortranSrcGrammarTest >> testImpCharacter [

	self
		parse: 'ImpCharacter ()
	(52:25)-(52:27)
	"a"'
		rule: #impCharacter
]

{ #category : #'tests-declaration' }
PP2FortranSrcGrammarTest >> testImpList [

	self
		parse: 'ImpList ()
	(52:16)-(52:28)
	(TypeSpec ()
		(52:16)-(52:22)
		TypeLogical
		Nothing)
	(AList ()
		(52:25)-(52:27)
		[ImpRange ()
			(52:25)-(52:27)
			"a"
			"z"])'
		rule: #impList
]

{ #category : #'tests-declaration' }
PP2FortranSrcGrammarTest >> testImpRange [

	self
		parse: 'ImpRange ()
	(52:25)-(52:27)
	"a"
	"z"'
		rule: #impRange
]

{ #category : #'tests-expression' }
PP2FortranSrcGrammarTest >> testIxRange [
	self
		parse: 'IxRange ()
	(157:45)-(157:72)
	(Just ExpValue ()
		(157:45)-(157:47)
		(ValVariable "var1"))
	(Just ExpValue ()
		(157:64)-(157:64)
		(ValInteger "2"
			Nothing))
	Nothing'
		rule: #ixRange
]

{ #category : #'tests-expression' }
PP2FortranSrcGrammarTest >> testIxSingle [
	self
		parse: 'IxSingle ()
	(72:23)-(72:23)
	Nothing
	(ExpValue ()
		(72:23)-(72:23)
		(ValInteger "1" Nothing))'
		rule: #ixSingle
]

{ #category : #'tests-metaInfo' }
PP2FortranSrcGrammarTest >> testMetaInfo [
	self
		parse: '(MetaInfo
	{miVersion = Fortran77,
	miFilename = "sourceFile.f"})'
		rule: #metaInfo
]

{ #category : #'tests-metaInfo' }
PP2FortranSrcGrammarTest >> testMiFilename [
	self
		parse: 'miFilename = "sourceFile.f"'
		rule: #miFilename
]

{ #category : #'tests-metaInfo' }
PP2FortranSrcGrammarTest >> testMiVersion [
	self
		parse: 'miVersion = Fortran77'
		rule: #miVersion
]

{ #category : #'tests-programUnit' }
PP2FortranSrcGrammarTest >> testPosition [
	self
		parse: '(1:7)'
		rule: #position
]

{ #category : #'tests-programUnit' }
PP2FortranSrcGrammarTest >> testProgramFileEmpty [

	self
		parse: 'ProgramFile (MetaInfo
	{miVersion = Fortran77,
	miFilename = "emptyFile.f"})
	[]'
		rule: #programFile
]

{ #category : #'tests-programUnit' }
PP2FortranSrcGrammarTest >> testProgramFilePUComment [

	self
		parse: 'ProgramFile (MetaInfo
	{miVersion = Fortran77,
	miFilename = "singleComment.f"})
	[PUComment  ()
	(4:1)-(4:19)
	(Comment "== entrees ==")]'
		rule: #programFile
]

{ #category : #'tests-programUnit' }
PP2FortranSrcGrammarTest >> testProgramFilePUSubRoutine [

	self
		parse: 'ProgramFile (MetaInfo
	{miVersion = Fortran77,
	miFilename = "singleSubroutine.f"})
	[PUSubroutine ()
		(1:7)-(302:9)
		(Nothing, Nothing)
		"subrtn"
		(Just AList ()
			(2:8)-(3:19)
			[ExpValue ()
				(3:14)-(3:19)
				(ValVariable "status")])
		[]
		Nothing]'
		rule: #programFile
]

{ #category : #'tests-programUnit' }
PP2FortranSrcGrammarTest >> testPuComment [

	self
		parse: 'PUComment  ()
	(4:1)-(4:19)
	(Comment "== entrees ==")'
		rule: #puComment
]

{ #category : #'tests-programUnit' }
PP2FortranSrcGrammarTest >> testPuSubroutine [
	self
		parse: 'PUSubroutine ()
	(1:7)-(302:9)
	(Nothing, Nothing)
	"subrtn"
	(Just AList ()
		(2:8)-(3:19)
		[ExpValue ()
			(3:14)-(3:19)
			(ValVariable "status")])
	[]
	Nothing'
		rule: #puSubroutine
]

{ #category : #'tests-declaration' }
PP2FortranSrcGrammarTest >> testSelector [

	self
		parse: 'Selector ()
	(66:15)-(66:16)
	Nothing
	(Just ExpValue ()
		(66:16)-(66:16)
		(ValInteger "8" Nothing))'
		rule: #selector
]

{ #category : #'tests-programUnit' }
PP2FortranSrcGrammarTest >> testSrcSpan [
	self
		parse: '(1:7)-(302:9)'
		rule: #srcSpan
]

{ #category : #'tests-statement' }
PP2FortranSrcGrammarTest >> testStCall [
	self
		parse: 'StCall ()
	(98:7)-(98:54)
	(ExpValue ()
		(98:11)-(98:16)
		(ValVariable "ooowin"))
	(Just AList ()
		(98:17)-(98:54)
		[Argument ()
			(98:18)-(98:20)
			Nothing
			(ArgExpr (ExpValue ()
				(98:18)-(98:20)
				(ValVariable "var1")))])'
		rule: #stCall
]

{ #category : #'tests-statement' }
PP2FortranSrcGrammarTest >> testStCommon [

	self
		parse: 'StCommon ()
	(64:7)-(65:55)
	(AList ()
	       (64:13)-(65:55)
	       	[CommonGroup ()
			(64:13)-(65:55)
			(Just ExpValue ()
			      (64:13)-(64:20)
			      (ValVariable "val1"))
			(AList ()
			       (64:21)-(65:55)
			       [Declarator ()
			       		   (64:21)-(64:23)
						   (ExpValue ()
						   (64:21)-(64:23)
						   (ValVariable "val2"))
						   ScalarDecl
						   Nothing
						   Nothing])])'
		rule: #statement
]

{ #category : #'tests-statement' }
PP2FortranSrcGrammarTest >> testStDeclaration [
	self
		parse: 'StDeclaration ()
	(62:7)-(62:18)
	(TypeSpec ()
		(62:7)-(62:13)
		TypeInteger
		Nothing)
	Nothing
	(AList ()
		(62:15)-(62:18)
		[Declarator ()
			(62:15)-(62:18)
			(ExpValue ()
				(62:15)-(62:18)
				(ValVariable "var"))
			ScalarDecl
			Nothing
			Nothing])'
		rule: #stDeclaration
]

{ #category : #'tests-statement' }
PP2FortranSrcGrammarTest >> testStEquivalence [
	"not a realistic input, but the content of [] is #expression, already tested"

	self
		parse: 'StEquivalence ()
					 (72:7)-(72:46)
					 (AList ()
						(72:18)-(72:46)
						[AList ()
						    (72:18)-(72:46)
						    []])'
		rule: #statement
]

{ #category : #'tests-statement' }
PP2FortranSrcGrammarTest >> testStExpressionAssign [

	self
		parse: 'StExpressionAssign ()
	(95:7)-(95:14)
	(ExpValue ()
		(95:7)-(95:12)
		(ValVariable "status"))
	(ExpValue ()
		(95:14)-(95:14)
		(ValInteger "0" Nothing))'
		rule: #statement.

]

{ #category : #'tests-statement' }
PP2FortranSrcGrammarTest >> testStGotoUnconditional [

	self
		parse: 'StGotoUnconditional ()
	(172:17)-(172:24)
	(ExpValue ()
		(172:22)-(172:24)
		(ValInteger "120"
			Nothing))'
		rule: #statement
]

{ #category : #'tests-statement' }
PP2FortranSrcGrammarTest >> testStIfLogical [

	self
		parse: 'StIfLogical ()
	(163:19)-(163:40)
	(ExpBinary ()
		(163:22)-(163:31)
		EQ
		(ExpValue ()
			(163:22)-(163:25)
			(ValVariable "var"))
		(ExpValue ()
			(163:31)-(163:31)
			(ValInteger "1" Nothing)))
	(StExpressionAssign ()
		(163:33)-(163:40)
		(ExpValue ()
			(163:33)-(163:36)
			(ValVariable "var"))
		(ExpValue ()
			(163:38)-(163:40)
			(ValVariable "var2")))'
		rule: #statement
]

{ #category : #'tests-statement' }
PP2FortranSrcGrammarTest >> testStImplicit [
	"not a realistic input, but the content of the AList is ImpList which is already tested"

	self
		parse: 'StImplicit ()
	(52:7)-(52:28)
	(Just AList ()
		(52:16)-(52:28)
		[])'
		rule: #statement
]

{ #category : #'tests-statement' }
PP2FortranSrcGrammarTest >> testStReturn [

	self
		parse: 'StReturn () (301:7)-(301:12) Nothing'
		rule: #statement.

	"not sure the input is correct '(Just ExpValue ...)'"
	self
		parse: 'StReturn ()
	(301:7)-(301:12)
	(Just ExpValue ()
		(300:44)-(300:46)
		(ValVariable "var"))'
		rule: #statement
]

{ #category : #'tests-token' }
PP2FortranSrcGrammarTest >> testTkStringEmpty [
	self
		parse: '""'
		rule: #tkString
]

{ #category : #'tests-token' }
PP2FortranSrcGrammarTest >> testTkStringSimple [
	self
		parse: '"a simple string"'
		rule: #tkString
]

{ #category : #'tests-token' }
PP2FortranSrcGrammarTest >> testTkStringWithDoubleQuote [
	self
		parse: '"A \"string\" inside a string"'
		rule: #tkString
]

{ #category : #'tests-declaration' }
PP2FortranSrcGrammarTest >> testTypeSpec [

	self
		parse: 'TypeSpec () (1:5)-(1:10) TypeInteger Nothing'
		rule: #typeSpec.
	self
		parse: 'TypeSpec () (1:5)-(1:10) TypeReal Nothing'
		rule: #typeSpec.
	self
		parse: 'TypeSpec () (1:5)-(1:10) TypeDoublePrecision Nothing'
		rule: #typeSpec.
	self
		parse: 'TypeSpec () (1:5)-(1:10) TypeComplex Nothing'
		rule: #typeSpec.
	self
		parse: 'TypeSpec () (1:5)-(1:10) TypeDoubleComplex Nothing'
		rule: #typeSpec.
	self
		parse: 'TypeSpec () (1:5)-(1:10) TypeLogical Nothing'
		rule: #typeSpec.
	self
		parse: 'TypeSpec () (1:5)-(1:10) TypeCharacter Nothing'
		rule: #typeSpec.
	self
		parse: 'TypeSpec () (1:5)-(1:10) TypeCustom "abc" Nothing'
		rule: #typeSpec.
	self
		parse: 'TypeSpec () (1:5)-(1:10) ClassStar Nothing'
		rule: #typeSpec.
	self
		parse: 'TypeSpec () (1:5)-(1:10) ClassCustom "abc" Nothing'
		rule: #typeSpec.
	self
		parse: 'TypeSpec () (1:5)-(1:10) TypeByte Nothing'
		rule: #typeSpec.
]

{ #category : #'tests-expression' }
PP2FortranSrcGrammarTest >> testValInteger [
	self
		parse: 'ValInteger "42" Nothing'
		rule: #value
]

{ #category : #'tests-expression' }
PP2FortranSrcGrammarTest >> testValString [
	self
		parse: 'ValString "a string"'
		rule: #value
]

{ #category : #'tests-expression' }
PP2FortranSrcGrammarTest >> testValVariable [
	self
		parse: 'ValVariable "status"'
		rule: #value
]
