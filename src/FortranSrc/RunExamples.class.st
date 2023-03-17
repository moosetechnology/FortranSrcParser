Class {
	#name : #RunExamples,
	#superclass : #Object,
	#classVars : [
		'Counter'
	],
	#category : #'FortranSrc-runExamples'
}

{ #category : #'class initialization' }
RunExamples class >> counter [

	Counter := Counter + 10
]

{ #category : #'class initialization' }
RunExamples class >> initialize [

	Counter := 1000
]

{ #category : #example }
RunExamples class >> runBorbk [

	<script>
	self runner: EsopeCodeExample borbk
]

{ #category : #example }
RunExamples class >> runFindbk [

	<script>
	self runner: EsopeCodeExample findbk
]

{ #category : #example }
RunExamples class >> runFindur [

	<script>
	self runner: EsopeCodeExample findur
]

{ #category : #example }
RunExamples class >> runLibpnt [

	<script>
	self runner: EsopeCodeExample libpnt
]

{ #category : #example }
RunExamples class >> runMain [

	<script>
	self runner: EsopeCodeExample main
]

{ #category : #example }
RunExamples class >> runNewbook [

	<script>
	self runner: EsopeCodeExample newbook
]

{ #category : #example }
RunExamples class >> runNewlib [

	<script>
	self runner: EsopeCodeExample newlib
]

{ #category : #example }
RunExamples class >> runNewuser [

	<script>
	self runner: EsopeCodeExample newuser
]

{ #category : #example }
RunExamples class >> runPlainExample [

	<script>
	self runner: EsopeCodeExample plainExample
]

{ #category : #example }
RunExamples class >> runPureF77 [

	<script>
	self runner: EsopeCodeExample pureF77
]

{ #category : #example }
RunExamples class >> runRelbk [

	<script>
	self runner: EsopeCodeExample relbk
]

{ #category : #example }
RunExamples class >> runner: anEsopeSourceCode [

	<script>
	| rewriter parser ir irModel visitorForIr famixModel |
	rewriter := PPEsopeRewriter new.
	rewriter parse: anEsopeSourceCode.

	parser := PP2FortranSrcParser new.
	ir := parser parse: rewriter output.

	irModel := parser model.

	visitorForIr := IASTVisitorF77 new.
	visitorForIr model
		rootFolder: FileSystem workingDirectory;
		name: 'mooseModelF77-' , self counter asString.

	irModel do: [ :cu | cu accept: visitorForIr ].

	famixModel := visitorForIr model.

	visitorForIr model inspect
]
