Class {
	#name : #PP2FortranSrcGrammarTest,
	#superclass : #PP2CompositeNodeTest,
	#category : #FortranSrc
}

{ #category : #accessing }
PP2FortranSrcGrammarTest >> parserClass [
	^ PP2FortranSrcGrammar
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

{ #category : #tests }
PP2FortranSrcGrammarTest >> testBlComment [
	self
		parse: 'BlComment ()
	(4:1)-(4:19)
	(Comment "     some comment  ")'
		rule: #blComment
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testComment [
	self
		parse: '(Comment "     some comment  ")'
		rule: #comment
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testCommonGroup [

	self
		parse: 'CommonGroup ()
			(64:13)-(65:55)
			(Just ExpValue ()
			      (64:13)-(64:20)
			      (ValVariable "ooocom"))
			(AList ()
			       (64:21)-(65:55)
			       [Declarator ()
			       		   (64:21)-(64:23)
						   (ExpValue ()
						   (64:21)-(64:23)
						   (ValVariable "oot"))
						   ScalarDecl
						   Nothing
						   Nothing])'
		rule: #commonGroup
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testDeclarator [

	self
		parse: 'Declarator ()
	(62:15)-(62:18)
	(ExpValue ()
		(62:15)-(62:18)
		(ValVariable "lstg"))
	ScalarDecl
	Nothing
	Nothing'
		rule: #declarator
]

{ #category : #tests }
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

{ #category : #tests }
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

{ #category : #tests }
PP2FortranSrcGrammarTest >> testExpValue [
	self
		parse: 'ExpValue ()
	(3:14)-(3:19)
	(ValVariable "status")'
		rule: #expValue
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testImpCharacter [

	self
		parse: 'ImpCharacter ()
	(52:25)-(52:27)
	"a"'
		rule: #impCharacter
]

{ #category : #tests }
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

{ #category : #tests }
PP2FortranSrcGrammarTest >> testImpRange [

	self
		parse: 'ImpRange ()
	(52:25)-(52:27)
	"a"
	"z"'
		rule: #impRange
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testMetaInfo [
	self
		parse: '(MetaInfo
	{miVersion = Fortran77,
	miFilename = "stgbrk.f"})'
		rule: #metaInfo
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testMiFilename [
	self
		parse: 'miFilename = "somefile.f"'
		rule: #miFilename
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testMiVersion [
	self
		parse: 'miVersion = Fortran77'
		rule: #miVersion
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testPosition [
	self
		parse: '(1:7)'
		rule: #position
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testPuSubroutine [
	self
		parse: 'PUSubroutine ()
	(1:7)-(302:9)
	(Nothing, Nothing)
	"stgbrk"
	(Just AList ()
		(2:8)-(3:19)
		[ExpValue ()
			(3:14)-(3:19)
			(ValVariable "status")])
	[]
	Nothing'
		rule: #puSubroutine
]

{ #category : #tests }
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

{ #category : #tests }
PP2FortranSrcGrammarTest >> testSrcSpan [
	self
		parse: '(1:7)-(302:9)'
		rule: #srcSpan
]

{ #category : #tests }
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
			      (ValVariable "ooocom"))
			(AList ()
			       (64:21)-(65:55)
			       [Declarator ()
			       		   (64:21)-(64:23)
						   (ExpValue ()
						   (64:21)-(64:23)
						   (ValVariable "oot"))
						   ScalarDecl
						   Nothing
						   Nothing])])'
		rule: #statement
]

{ #category : #tests }
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

{ #category : #tests }
PP2FortranSrcGrammarTest >> testStringEmpty [
	self
		parse: '""'
		rule: #tkString
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testStringSimple [
	self
		parse: '"a simple string"'
		rule: #tkString
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testStringWithDoubleQuote [
	self
		parse: '"A \"string\" inside a string"'
		rule: #tkString
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testSubRoutineArguments [

	self
		parse: '(Just AList ()
	(2:8)-(3:19)
	[])'
		rule: #subroutineArguments
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testSubroutineBody [
	self
		parse: '[BlComment ()
	(4:1)-(4:19)
	(Comment "     some comment  ")
	]'
		rule: #subroutineBody
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testSubroutineBodyEmpty [
	self
		parse: '[]'
		rule: #subroutineBody
]

{ #category : #tests }
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

{ #category : #tests }
PP2FortranSrcGrammarTest >> testValInteger [
	self
		parse: 'ValInteger "42" Nothing'
		rule: #value
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testValVariable [
	self
		parse: 'ValVariable "status"'
		rule: #value
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testValue [

	self parse: 'ValVariable "status"' rule: #value
]
