Class {
	#name : #PP2FortranSrcParserFromCodeTest,
	#superclass : #PP2FortranSrcGrammarTest,
	#category : #'FortranSrc-Tests'
}

{ #category : #running }
PP2FortranSrcParserFromCodeTest >> parse: sourceCode rule: aRule [

	self astHaskell: sourceCode.
	^ super
		  parse: ('./output.f.ast' asFileReference readStream contents
				   replaceAll: Character lf
				   with: Character cr)
		  rule: aRule
]

{ #category : #running }
PP2FortranSrcParserFromCodeTest >> parserClass [
	^ PP2FortranSrcParser 
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testFunctionWithInvocation [

	| ast |
	ast := self
		       parse: '       program myprog
      i = ifunc (i)
      end

      integer function ifunc( k )
      return
      end
 '
		       rule: #start.


	self assert: ast second name equals: 'ifunc'.
	self assert: ast second parameters size equals: 1.
	self assert: ast second parameters first name equals: #k
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserFromCodeTest >> testMainProgramHelloWorld [
	| iast node |
	iast := self
		parse: 'C23456789
      program myprog
         write(*,*) ''Hello World!''
      end
C----------------------------------------------------------------------^
'
		rule: #start.
		
	self assert: iast class equals: IASTProgramFile.
	self assert: iast filename equals: './codeToParse.f'.
	self assert: iast version equals: 'Fortran77'.
	self assert: iast progUnits size equals: 3.

	node := iast progUnits first.
	self assert: node class equals: IASTComment.
	self assert: node text equals: '23456789'.

	node := iast progUnits second.
	self assert: node class equals: IASTMainProgram.
	self assert: node name equals: 'myprog'.
	self assert: node body size equals: 1.

	node := iast progUnits third.
	self assert: node class equals: IASTComment.
	self assert: node text equals: '----------------------------------------------------------------------^'.

]
