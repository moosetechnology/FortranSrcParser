Class {
	#name : #FortranProjectImporter,
	#superclass : #Object,
	#classVars : [
		'Directory',
		'EsopeModel',
		'Parser'
	],
	#category : #'FortranSrc-Esope'
}

{ #category : #'element - annotated' }
FortranProjectImporter class >> annotateEsopeSources [

	self esopeFiles do: [ :inputFile | 
		self getEsopeRewriter
			rewriteFrom:
			(self getEsopeRewriter getSourceFromFile: inputFile pathString)
			to: self buildDirectory / (inputFile basename , '.f') ]
]

{ #category : #'element - annotated' }
FortranProjectImporter class >> annotatedFortranFiles [

	^ self buildDirectory allChildrenMatching: '*.f'
]

{ #category : #'element - annotated' }
FortranProjectImporter class >> buildDirectory [

	^ (self directory / 'build')  asFileReference  ensureCreateDirectory
]

{ #category : #creation }
FortranProjectImporter class >> createModelFromAst [

	(self buildDirectory allChildrenMatching: '*.f.ast') do: [ :inputFile | 
		self parser parse: inputFile asFileReference contents ]
]

{ #category : #'element - annotated' }
FortranProjectImporter class >> defaultPath [

	^ FileLocator home / 'Public' / 'demo'
]

{ #category : #'element - annotated' }
FortranProjectImporter class >> directory [

	^ Directory ifNil: [ Directory := self defaultPath asFileReference ]
]

{ #category : #'element - annotated' }
FortranProjectImporter class >> directory: aDirectory [

	Directory := aDirectory
]

{ #category : #'element - annotated' }
FortranProjectImporter class >> esopeFiles [

	^ self srcDirectory allChildrenMatching: '*.e'
]

{ #category : #'element - annotated' }
FortranProjectImporter class >> fortranSrc [

	^ self parserDirectory pathString,  '/fortran-src '
]

{ #category : #'instance creation' }
FortranProjectImporter class >> fromPath: aPath [

	aPath asFileReference exists
		ifTrue: [ self directory: aPath ]
		ifFalse: [ self defaultPath ]
]

{ #category : #'instance creation' }
FortranProjectImporter class >> fromPath: aPath ifNone: aDefaultPath [

]

{ #category : #'element - annotated' }
FortranProjectImporter class >> getEsopeRewriter [

	^ PPEsopeRewriter
]

{ #category : #creation }
FortranProjectImporter class >> getModel [

	^ self parser model
]

{ #category : #'element - annotated' }
FortranProjectImporter class >> model [

	^ EsopeModel ifNil: [ EsopeModel := FamixEsopeModel new ]
]

{ #category : #initialization }
FortranProjectImporter class >> newWithPath: aPathString [
	
	self flag: #TODO. "complete this method"
]

{ #category : #'element - annotated' }
FortranProjectImporter class >> parseAnnotatedFortranSources [

	self annotatedFortranFiles do: [ :input | 
		| output error |
		output := (self buildDirectory / (input basename , '.ast'))
			          pathString.
		error := (self buildDirectory / (input basename , '.err'))
			         pathString.
		LibC runCommand:
			self fortranSrc , input pathString , ' >' , output , ' 2>' , error.
		output asFileReference writeStream.
		error asFileReference writeStream ]
]

{ #category : #'element - annotated' }
FortranProjectImporter class >> parser [

	^ Parser ifNil: [ Parser := PP2FortranSrcParser new model: self model ]
]

{ #category : #'element - annotated' }
FortranProjectImporter class >> parserDirectory [

	^ self directory / 'parser'
]

{ #category : #'element - annotated' }
FortranProjectImporter class >> path [

	^ self directory pathString , '/'
]

{ #category : #'element - annotated' }
FortranProjectImporter class >> rootFolder [

	^ self directory pathString
]

{ #category : #'element - annotated' }
FortranProjectImporter class >> srcDirectory [

	^ (self directory / 'src') asFileReference  ensureCreateDirectory
]
