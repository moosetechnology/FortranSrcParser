Class {
	#name : #PP2FortranSrcParserTest,
	#superclass : #PP2FortranSrcGrammarTest,
	#category : #'FortranSrc-Tests'
}

{ #category : #accessing }
PP2FortranSrcParserTest >> parserClass [
	^ PP2FortranSrcParser 
]

{ #category : #tests }
PP2FortranSrcParserTest >> testProgramFileEmpty [

	self
		parse: 'ProgramFile (MetaInfo
	{miVersion = Fortran77,
	miFilename = "emptyFile.f"})
	[]'
		rule: #programFile.

	self
		assert: (parser model allWithType: FamixFortranProgramFile) size
		equals: 1.

	self
		assert:
			(parser model allWithType: FamixFortranProgramFile) first version
				value
		equals: 'Fortran77'.
		
	"self
		assert:
			(parser model allWithType: FamixFortranProgramFile) first filename
				value
		equals: 'emptyFile.f'."
]
