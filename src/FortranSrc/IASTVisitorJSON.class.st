Class {
	#name : #IASTVisitorJSON,
	#superclass : #Object,
	#instVars : [
		'f77sourcefile'
	],
	#category : #'FortranSrc-Visitor'
}

{ #category : #visiting }
IASTVisitorJSON >> accept: aNode [
	aNode isAssociation ifTrue: [ ^self visitJSONNode: aNode key value: aNode value ].
	aNode isDictionary  ifTrue: [ ^self visitJSONDictionary: aNode ].
	aNode isArray  ifTrue: [ ^self visitJSONArray: aNode ].
]

{ #category : #visiting }
IASTVisitorJSON >> doesNotUnderstand: message [
	(message selector beginsWith: 'visit') ifTrue:  [ |code|
		code := message selector asString , ' aNode
		self flag: #TODO.
		self shouldBeImplemented'.
		IASTVisitorJSON compile: code  classified: 'visiting'
	]. 
]

{ #category : #testing }
IASTVisitorJSON >> isESOPEFunction: aNode [
	^#(esoat esoar esosl) includes: (self valueNodeContent: aNode)
]

{ #category : #'as yet unclassified' }
IASTVisitorJSON >> valueNodeContent: aValueNode [
	^((aValueNode at: 'value') at: 'contents')
]

{ #category : #testing }
IASTVisitorJSON >> valueNodeIsVariable: aValueNode [
	^((aValueNode at: 'value') at: 'tag') = 'variable'
]

{ #category : #visiting }
IASTVisitorJSON >> visitArguments: anArgumentsNode [
	anArgumentsNode ifNil: [ ^#() ].
		^(self visitJSONArray: (anArgumentsNode at: 'list')) collect: [ :varAcces |
				IASTParameter new
					entityName: varAcces entityName ;
					sourceAnchor: varAcces sourceAnchor ;
					yourself
		]
]

{ #category : #visiting }
IASTVisitorJSON >> visitBlocks: aJSONArray [
		^(self visitJSONArray: aJSONArray) flatten 
]

{ #category : #visiting }
IASTVisitorJSON >> visitFunction: aFunctionNode [
	| astLhsNode arguments astRhsNode |
	(self isESOPEFunction: (aFunctionNode at: 'name')) ifFalse: [ ^nil ].

	astLhsNode := IASTVarEso newFrom: (self valueNodeContent: (aFunctionNode at: 'name')).
	astLhsNode isWrite: true.
	arguments := (aFunctionNode at: 'arguments') at: 'list'.
	astLhsNode entities: (arguments collect: [:arg | self accept: arg]).
	
	astRhsNode := self accept: (aFunctionNode at: 'body').

	^astRhsNode ifNil: [ { astLhsNode } ] ifNotNil: [ { astLhsNode . astRhsNode } ]
]

{ #category : #visiting }
IASTVisitorJSON >> visitJSONArray: aNode [
	^aNode collect: [ :each | self accept: each ]
]

{ #category : #visiting }
IASTVisitorJSON >> visitJSONDictionary: jsonDictionary [
	^jsonDictionary
		at: 'tag'
		ifPresent: [ :key | self visitJSONNode: key value: jsonDictionary ]
		ifAbsent: [ 	jsonDictionary keysAndValuesDo: [ :key :value |
			self visitJSONNode: key value: value ]
		]

]

{ #category : #visiting }
IASTVisitorJSON >> visitJSONNode: key value: aValue [
	| selector |
	selector := 'visit' , key capitalized , ':'.
	^self perform: selector asSymbol with: aValue 
]

{ #category : #visiting }
IASTVisitorJSON >> visitMeta: aNode [
		self visitJSONDictionary: aNode
]

{ #category : #visiting }
IASTVisitorJSON >> visitMiFilename: aString [
		f77sourcefile := aString
]

{ #category : #visiting }
IASTVisitorJSON >> visitMiVersion: aNode [
		
]

{ #category : #visiting }
IASTVisitorJSON >> visitProgramFile: aNode [
		self visitMeta: (aNode at: 'meta').
		^self visitProgram_units: (aNode at: 'program_units')
]

{ #category : #visiting }
IASTVisitorJSON >> visitProgram_units: aNode [
		^self visitJSONArray: aNode
]

{ #category : #visiting }
IASTVisitorJSON >> visitSpan: aSpanString [
	| one two three four colon dash |
	colon := aSpanString indexOf: $:.
	one := aSpanString copyFrom: 2 to: colon-1.
	
	dash := aSpanString indexOf: $-.
	two := aSpanString copyFrom: colon+1 to: dash-1.
	
	colon := aSpanString indexOf: $: startingAt: dash.
	three := aSpanString copyFrom: dash+1 to: colon-1.
	
	four := aSpanString copyFrom: colon+1 to: aSpanString size-1.
	
	^ FamixFortran77IndexedFileAnchor new
		  startLine: one asInteger ;
		  startColumn: two asInteger ;
		  endLine: three asInteger;
		  endColumn: four asInteger + 1;
		  fileName: f77sourcefile;
		  yourself
]

{ #category : #visiting }
IASTVisitorJSON >> visitStatement: aStatementNode [
	^self accept: (aStatementNode at: 'statement')
]

{ #category : #visiting }
IASTVisitorJSON >> visitSubroutine: aSubroutineNode [
	^IASTSubroutine new
		entityName: (aSubroutineNode at: 'name') ;
		sourceAnchor: (self visitSpan: (aSubroutineNode at: 'span')) ;
		parameters: (self visitArguments: (aSubroutineNode at: 'arguments')) ;
		body: (self visitBlocks: (aSubroutineNode at: 'blocks')) ;
		yourself
]

{ #category : #visiting }
IASTVisitorJSON >> visitValue: aValueNode [
	^(self valueNodeIsVariable: aValueNode)
		ifTrue: [ IASTVarAccess new
			isWrite: false ;
			entityName: (self valueNodeContent: aValueNode) ;
			sourceAnchor: (self visitSpan: (aValueNode at: 'span')) ]
		ifFalse: [ nil ]
]
