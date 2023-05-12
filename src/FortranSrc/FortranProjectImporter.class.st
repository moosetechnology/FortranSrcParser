Class {
	#name : #FortranProjectImporter,
	#superclass : #Object,
	#instVars : [
		'rootFolder',
		'parser',
		'model',
		'rewriter',
		'astParser'
	],
	#category : #'FortranSrc-Esope'
}

{ #category : #'private - accessing' }
FortranProjectImporter class >> defaultASTParser [

	^ PP2FortranSrcParser
]

{ #category : #'private - accessing' }
FortranProjectImporter class >> defaultEsopeRewriter [

	^ PPEsopeRewriter
]

{ #category : #'private - accessing' }
FortranProjectImporter class >> defaultFortranParser [

	^ (self defaultRootFolder / 'parser' / 'fortran-src') pathString
]

{ #category : #'private - accessing' }
FortranProjectImporter class >> defaultRootFolder [

	^ (FileLocator home / 'Public' / 'demo') asFileReference
]

{ #category : #'instance creation' }
FortranProjectImporter class >> newFromPath: anAbsolutePath [

	| importer |
	importer := self new.
	^ importer changeDefaultFolderTo: anAbsolutePath
]

{ #category : #'instance creation' }
FortranProjectImporter class >> newFromPathString: aString [ 
	^ self newFromPath: aString asPath.
]

{ #category : #'element - annotated' }
FortranProjectImporter >> annotateEsopeSources [

	self esopeFiles do: [ :inputFile | 
		self rewriter
			rewriteFrom:
			(self rewriter getSourceFromFile: inputFile pathString)
			to: self buildDirectory / ('' join: {inputFile basename . '.f'}) ]
]

{ #category : #'element - annotated' }
FortranProjectImporter >> annotatedFortranFiles [

	^ self buildDirectory allChildrenMatching: '*.f'
]

{ #category : #fast }
FortranProjectImporter >> astJSON: sourceCode [

	| filename option |
	option := 'serialize -t json -v77l encode'.
	filename := './fortran77.f'.
	filename asFileReference writeStreamDo: [ :stream | 
		stream truncate.
		stream
		<< (sourceCode copy replaceAll: Character cr with: Character lf) ].

	LibC runCommand: ('{1} {2} "{3}" > "{3}.json" 2> "{3}.err"' format: { 
				 self fortranSrcPath.
				 option.
				 filename. })
]

{ #category : #accessing }
FortranProjectImporter >> astParser [

	^ astParser ifNil: [ 
		  astParser := self class defaultASTParser new model: self model ]
]

{ #category : #accessing }
FortranProjectImporter >> astParser: anObject [

	astParser := anObject
]

{ #category : #'private - accessing' }
FortranProjectImporter >> buildDirectory [

	^ (self rootFolder / 'build') asFileReference ensureCreateDirectory
]

{ #category : #accessing }
FortranProjectImporter >> changeDefaultFolderTo: anAbsolutePath [

	| aFileReference |
	aFileReference := anAbsolutePath asFileReference.

	aFileReference exists
		ifTrue: [ self rootFolder: aFileReference ]
		ifFalse: [ self rootFolder: self class defaultPath ].
	^ self parser: self parser
]

{ #category : #creation }
FortranProjectImporter >> createModelFromAst [

	(self buildDirectory allChildrenMatching: '*.f.ast') do: [ :inputFile | 
		self astParser parse: inputFile asFileReference contents ]
]

{ #category : #'element - annotated' }
FortranProjectImporter >> esopeFiles [

	^ self srcDirectory allChildrenMatching: '*.e'
]

{ #category : #fast }
FortranProjectImporter >> fortranSrcPath [

	^ 'fortran-src-extras'
]

{ #category : #initialization }
FortranProjectImporter >> from: aFileReference [

	self rootFolder: aFileReference
]

{ #category : #initialization }
FortranProjectImporter >> initialize [

	super initialize.
	"rootFolder := self rootFolder.
	parser := self parser.
	model := self model"
]

{ #category : #accessing }
FortranProjectImporter >> model [

	^ model ifNil: [ 
		  model := FamixEsopeModel new name:
			           'fortran model esope ' , DateAndTime today asString ]
]

{ #category : #accessing }
FortranProjectImporter >> model: anObject [

	model := anObject
]

{ #category : #'element - annotated' }
FortranProjectImporter >> parseAnnotatedFortranSources [

	self annotatedFortranFiles do: [ :input | 
		| output error |
		output := (self buildDirectory / ('' join: { 
				            input basename.
				            '.ast' })) pathString.
		error := (self buildDirectory / ('' join: { 
				           input basename.
				           '.err' })) pathString.
		LibC runCommand: ('{1} "{2}" >"{3}" 2>"{4}"' format: { 
					 self parser.
					 input pathString.
					 output.
					 error }).
		"			self parser , ' ' , input pathString , ' >' , output , ' 2>' , error"
		output asFileReference writeStream.
		error asFileReference writeStream ]
]

{ #category : #accessing }
FortranProjectImporter >> parser [

	^ parser ifNil: [ 
		  parser := (self rootFolder / 'parser' / 'fortran-src') pathString ]
]

{ #category : #accessing }
FortranProjectImporter >> parser: anObject [

	parser := anObject
]

{ #category : #accessing }
FortranProjectImporter >> parserDirectory [
	^ self rootFolder / 'parser'
]

{ #category : #'element - annotated' }
FortranProjectImporter >> rewriter [
	^ rewriter ifNil: [ rewriter := self class defaultEsopeRewriter ]
]

{ #category : #accessing }
FortranProjectImporter >> rootFolder [

	^ rootFolder ifNil: [ rootFolder := self class defaultRootFolder ]
]

{ #category : #accessing }
FortranProjectImporter >> rootFolder: anObject [

	rootFolder := anObject
]

{ #category : #'private - accessing' }
FortranProjectImporter >> srcDirectory [

	^ (self rootFolder / 'src') asFileReference  ensureCreateDirectory
]
