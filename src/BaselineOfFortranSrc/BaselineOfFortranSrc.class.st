Class {
	#name : #BaselineOfFortranSrc,
	#superclass : #BaselineOf,
	#category : #BaselineOfFortranSrc
}

{ #category : #baselines }
BaselineOfFortranSrc >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec description: 'Fortran77 model creation from camfort/Fortran-src'.
			self defineDependencies: spec.
			self definePackages: spec ]
]

{ #category : #'as yet unclassified' }
BaselineOfFortranSrc >> defineDependencies: spec [
	spec
		baseline: 'PetitParser2' with: [ spec repository: 'github://kursjan/petitparser2' ] ;
		baseline: 'FamixFortran77' with: [ spec repository: 'github://uNouss/FortranMetamodelGenerator' ] ;
		baseline: 'Neo-JSON' with: [ spec repository: 'github://svenvc/NeoJSON' ]
]

{ #category : #'as yet unclassified' }
BaselineOfFortranSrc >> definePackages: spec [
	spec
		repository: 'https://github.com/uNouss/FortranSrcParser';
		package: 'FortranSrc' with: [ spec requires: #(PetitParser2 'FamixFortran77' 'Neo-JSON') ];
		package: 'FortranSrc-Tests'

]
