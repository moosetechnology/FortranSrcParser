Class {
	#name : #PP2FortranSrcParserFromCodeTest,
	#superclass : #PP2FortranSrcGrammarTest,
	#category : #'FortranSrc-Tests'
}

{ #category : #running }
PP2FortranSrcParserFromCodeTest >> parse: sourceCode [

	self astHaskell: sourceCode.
	^ super
		  parse: ('./fortran77.f.ast' asFileReference readStream contents
				   replaceAll: Character lf
				   with: Character cr)
		  rule: #start
]

{ #category : #running }
PP2FortranSrcParserFromCodeTest >> parse: sourceCode rule: aRule [

	self astHaskell: sourceCode.
	^ super
		  parse: ('./fortran77.f.ast' asFileReference readStream contents
				   replaceAll: Character lf
				   with: Character cr)
		  rule: aRule
]

{ #category : #running }
PP2FortranSrcParserFromCodeTest >> parserClass [

	^ PP2FortranSrcParser 
]

{ #category : #running }
PP2FortranSrcParserFromCodeTest >> setUp [

	super setUp.
	parser := self parserInstance
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testBlockData [

	| iast node |
	iast := self
		       parse: '      block data myblck
      common /mycom/ i
      data i /12345/
      end
 '
		       rule: #start.

	self assert: iast progUnits size equals: 1.
	
	node := iast progUnits first.

	self assert: node class equals: IASTBlockData.
	self assert: node entityName equals: 'myblck'.
	self assert: node body size equals: 3.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testFindbkEsopeF77Annotated [

	| iast node |
	iast := self
		       parse: self class findbkFortran.

	self assert: iast progUnits size equals: 1.
	
	node := iast progUnits first.

	self assert: node class equals: IASTFunction.
	self assert: node entityName equals: 'findbk'.
	self assert: node body size equals: 3.
	self assert: node comments size equals: 30.
	self assert: node localVariables size equals: 7.
	self assert: node accesses size equals: 10.
	self assert: node invocations size equals: 10.

	parser model halt halt.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testFortran77DotF [

	| iast node |
	iast := self parse: 'C234567
      subroutine hello(name)
      character*(*) name
      write(*,*) ''hello '', name
      end
      program main
      character*20 fname
      write(*,*)''Enter your name:''
      read(*,*) fname
      call hello(fname)
      end
'.

	self assert: iast progUnits size equals: 3.

	node := iast progUnits first.
	self assert: node class equals: IASTComment.
	self assert: node text equals: '234567'.

	node := iast progUnits second.
	self assert: node class equals: IASTSubroutine.
	self assert: node entityName equals: 'hello'.
	self assert: node body size equals: 2.
	self assert: node parameters size equals: 1.
	self assert: node parameters first entityName equals: 'name'.

	node := iast progUnits third.
	self assert: node class equals: IASTMainProgram.
	self assert: node entityName equals: 'main'.
	self assert: node body size equals: 4.
	self assert: node localVariables size equals: 1.
	self assert: node accesses size equals: 1.
	self assert: node invocations size equals: 1.

	parser model halt
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testFortran77DotFWithImplicitNone [

	| iast node |
	iast := self
		        parse: 'C234567
      subroutine hello(cname)
      implicit none
      character*(*) cname
      write(*,*) ''hello '', cname
      end
      program main
      implicit none
      character*20 sname
      write(*,*)''Enter your name:''
      read(*,*) sname
      call hello(sname)
      end
'
		        rule: #start.

	self assert: iast progUnits size equals: 3.
	
	node := iast progUnits first.
	self assert: node class equals: IASTComment.
	self assert: node text equals: '234567'.

	node := iast progUnits second.
	self assert: node class equals: IASTSubroutine.
	self assert: node entityName equals: 'hello'.
	self assert: node body size equals: 2.
	self assert: node parameters size equals: 1.
	self assert: node parameters first entityName equals: 'cname'.
	self assert: node accesses size equals: 1.
	self assert: node invocations size equals: 0.
	self assert: node localVariables size equals: 1.
	
	node := iast progUnits third.
	self assert: node class equals: IASTMainProgram.
	self assert: node entityName equals: 'main'.
	self assert: node body size equals: 4.
	self assert: node localVariables size equals: 1.
	self assert: node accesses size equals: 1.
	self assert: node invocations size equals: 1.
	
	parser model halt.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testFortran77DotFWithImplicitType [

	| iast node |
	iast := self
		        parse: 'C234567
      subroutine hello(cname)
      implicit character*(*)(c, s)
      write(*,*) ''hello '', cname
      end
      program main
      implicit character*20 (c, s)
      write(*,*)''Enter your name:''
      read(*,*) sname
      call hello(sname)
      end
'
		        rule: #start.

	self assert: iast progUnits size equals: 3.
	
	node := iast progUnits first.
	self assert: node class equals: IASTComment.
	self assert: node text equals: '234567'.

	node := iast progUnits second.
	self assert: node class equals: IASTSubroutine.
	self assert: node entityName equals: 'hello'.
	self assert: node body size equals: 2.
	self assert: node parameters size equals: 1.
	self assert: node parameters first entityName equals: 'cname'.
	self assert: node accesses size equals: 1.
	self assert: node invocations size equals: 0.
	self assert: node localVariables size equals: 1.
	
	node := iast progUnits third.
	self assert: node class equals: IASTMainProgram.
	self assert: node entityName equals: 'main'.
	self assert: node body size equals: 4.
	self assert: node localVariables size equals: 1.
	self assert: node accesses size equals: 1.
	self assert: node invocations size equals: 1.
	
	parser model halt.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testFullASTTemp [

	self
		        parse: self class relbkFortran
		        rule: #start.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testFullBorbk [

	self
		        parse: '      PROGRAM MYPROG
         IF ( A ) THEN
            I = 1
         ELSE IF ( B ) THEN
            I = 2
         ELSE
            I = 3
         END IF
      END
'
		        rule: #start.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testFunction [

	| iast node |
	iast := self
		        parse: '      function ifunc( k, l )
      ifunc = k
      end
c --- end ---
'
		        rule: #start.

	self assert: iast progUnits size equals: 2.

	node := iast progUnits first.

	self assert: node class equals: IASTFunction.
	self assert: node entityName equals: 'ifunc'.
	self assert: node body size equals: 1.
	self assert: node parameters size equals: 2.
	self assert: node parameters first entityName equals: 'k'.
	self assert: node parameters second entityName equals: 'l'.
	self assert: node invocations size equals: 0.
	self assert: node localVariables size equals: 0.
	self assert: node accesses size equals: 2
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testFunctionOracle1 [

	| iast node |
	iast := self
		        parse: '      FUNCTION F ( X ) 
      INTEGER F, X 
      F = X + 1 
      RETURN 
      END
'
		        rule: #start.

	self assert: iast progUnits size equals: 1.

	node := iast progUnits first.

	self assert: node class equals: IASTFunction.
	self assert: node entityName equals: 'f'.
	self assert: node body size equals: 2.
	self assert: node parameters size equals: 1.
	self assert: node parameters first entityName equals: 'x'.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testFunctionOracle2 [

	| iast node |
	iast := self
		        parse: '      INTEGER FUNCTION F ( X ) 
      INTEGER X 
      F = X + 1 
      RETURN 
      END
'
		        rule: #start.

	self assert: iast progUnits size equals: 1.

	node := iast progUnits first.

	self assert: node class equals: IASTFunction.
	self assert: node entityName equals: 'f'.
	self assert: node body size equals: 2.
	self assert: node parameters size equals: 1.
	self assert: node parameters first entityName equals: 'x'.
	self assert: node returnType entityName equals: 'TypeInteger'
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testFunctionOracle3 [

	| iast node |
	iast := self
		        parse: '      FUNCTION NXT ( X ) 
      INTEGER X 
      NXT = X + 1 
      RETURN 
      END
'
		        rule: #start.

	self assert: iast progUnits size equals: 1.

	node := iast progUnits first.

	self assert: node class equals: IASTFunction.
	self assert: node entityName equals: 'nxt'.
	self assert: node body size equals: 2.
	self assert: node parameters size equals: 1.
	self assert: node parameters first entityName equals: 'x'.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testFunctionWithAccesses [

	| iast node |
	iast := self
		       parse: '      function ifunc( k, l )
      ifunc = k + l
      end
'
		       rule: #start.

	self assert: iast progUnits size equals: 1.
	
	node := iast progUnits first.
	self assert: node class equals: IASTFunction.
	self assert: node parameters size equals: 2.
	self assert: node parameters first entityName equals: 'k'.
	self assert: node parameters second entityName equals: 'l'.
	
	self assert: node body first entityName equals: 'ifunc'.
	self assert: node body second entityName equals: 'k'.
	self assert: node body third entityName equals: 'l'.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testFunctionWithInvocation [

	| iast main function |
	iast := self
		       parse: '       program myprog
      i = ifunc (i, j)
      end

      integer function ifunc( k, l )
      return
      end
 '
		       rule: #start.

	self assert: iast progUnits size equals: 2.
	
	main := iast progUnits first. 
	function := iast progUnits second.

	self assert: main class equals: IASTMainProgram.
	self assert: main entityName equals: 'myprog'.
	self assert: main body size equals: 2.

	self assert: function class equals: IASTFunction.
	self assert: function parameters size equals: 2.
	self assert: function parameters first entityName equals: #k.
	self assert: function parameters second entityName equals: #l
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testHelloWorldEsope [

	| iast node |
	iast := self
		        parse: 'C234567
      program main
cESO   segment, pers
        character*20 fname,lname
        integer      age
cESO  end segment
cESO  pointeur p1.pers
cESO  segini, p1
      EsoSl(p1,fname) = ''John''
      EsoSl(p1,lname) = ''Doe''
      EsoSl(p1,age) = 42
      id1 = p1
      call hello(id1)
cESO  segsup, p1
      end
      subroutine hello(idp)
cESO  segment, pers
        character*20 fname,lname
        integer      age
cESO  end segment
cESO  pointeur p1.pers
      p1 = idp
      write(*,*) ''hello: '', EsoSl(p1,fname), '' '',
     + EsoSl(p1,lname), '', '', EsoSl(p1,age)
cESO  segsup ,p1
      end
'
		        rule: #start.

	self assert: iast progUnits size equals: 3.

	node := iast progUnits first.
	
	self assert: node class equals: IASTComment.
	self assert: node text equals: '234567'.

	node := iast progUnits second.
	self assert: node class equals: IASTMainProgram.
	self assert: node entityName equals: 'main'.
	self assert: node body size equals: 12.
	self assert: node invocations size equals: 4.
	self assert: node localVariables size equals: 3.
	self assert: node accesses size equals: 2.
	
	node := iast progUnits third.
	self assert: node class equals: IASTSubroutine.
	self assert: node entityName equals: 'hello'.
	self assert: node body size equals: 8.
	self assert: node parameters size equals: 1.
	self assert: node parameters first entityName equals: 'idp'.
	self assert: node invocations size equals: 3.
	self assert: node localVariables size equals: 3.
	self assert: node accesses size equals: 2
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testImplicit [

	| iast node |
	iast := self
		       parse: '      PROGRAM MAIN
      IMPLICIT INTEGER (A-Z)
      IMPLICIT REAL (A-C)
      END
'
		       rule: #start.

	self assert: iast progUnits size equals: 1.
	
	node := iast progUnits first.

	self assert: node class equals: IASTMainProgram.
	self assert: node entityName equals: 'main'.
	self assert: node body size equals: 0.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testMainAndSubroutineHelloName [

	self
		        parse: '      subroutine hello( name )
      character*(*) name
      write(*,*) ''hello '', name
      end
      program main
      character*20 fname
      write(*,*) ''type your name: ''
      read(*,*) fname
      call hello(fname)
      end
'
		        rule: #start.
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
	self assert: iast filename equals: './fortran77.f'.
	self assert: iast version equals: 'Fortran77'.
	self assert: iast progUnits size equals: 3.

	node := iast progUnits first.
	self assert: node class equals: IASTComment.
	self assert: node text equals: '23456789'.

	node := iast progUnits second.
	self assert: node class equals: IASTMainProgram.
	self assert: node entityName equals: 'myprog'.
	self assert: node body size equals: 0.

	node := iast progUnits third.
	self assert: node class equals: IASTComment.
	self assert: node text equals: '----------------------------------------------------------------------^'.

]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testProgramWithMultipleProgUnitsWithInvocation [

	| iast node |
	iast := self
		       parse: '      program myprog
      i = ifunc (i, j)
      call mysub (name)
      end

      function ifunc( k, l )
      ifunc = k + l
      end

      subroutine mysub (msg)
      write(*,*) msg
      end
 '
		       rule: #start.

	self assert: iast progUnits size equals: 3.
	
	node := iast progUnits first.
	self assert: node class equals: IASTMainProgram.
	self assert: node entityName equals: 'myprog'.
	self assert: node body size equals: 3.
	
	node := iast progUnits second.
	self assert: node class equals: IASTFunction.
	self assert: node parameters size equals: 2.
	self assert: node parameters first entityName equals: #k.
	self assert: node parameters second entityName equals: #l.

	node := iast progUnits third.
	self assert: node class equals: IASTSubroutine.
	self assert: node parameters size equals: 1.
	self assert: node parameters first entityName equals: 'msg'.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testProgramWithMultipleProgUnitsWithInvocation2 [

	| iast node |
	iast := self
		       parse: '      program myprog
      i = ifunc (i)
      end

      function ifunc( k )
      end
'
		       rule: #start.

	self assert: iast progUnits size equals: 2.
	
	node := iast progUnits first.
	self assert: node class equals: IASTMainProgram.
	self assert: node entityName equals: 'myprog'.
	self assert: node body size equals: 2.
	
	node := iast progUnits second.
	self assert: node class equals: IASTFunction.
	self assert: node parameters size equals: 1.
	self assert: node parameters first entityName equals: 'k'.
	self assert: node body size equals: 0.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testRelbkWithDeclarationOnly [

	" :| "
	| iast |
	iast := self
		        parse: 'C234567890----
      subroutine relbk(lib,name,title)
      integer brcnt
      integer urcnt
      integer ubbcnt
      character *(*) name
      character *(*) title
      external mypnt
      integer mypnt
      external findbk 
      integer findbk
      external findur
      integer findur
      integer ir
      integer ibk
      end

'
		        rule: #start.
	parser model  halt.
	iast halt.
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserFromCodeTest >> testSubroutine [

	| iast node accesses invocations |
	iast := self
		       parse: '      subroutine hello( name )
        write(*,*) name
      end
'
		       rule: #start.

	self assert: iast progUnits size equals: 1.

	node := iast progUnits first.

	self assert: node class equals: IASTSubroutine.
	self assert: node parameters size equals: 1.
	self assert: node parameters first entityName equals: 'name'.

	accesses := node body select: [ :entity | 
		            entity class = IASTVarAccess ].
	invocations := node body select: [ :entity | 
		               entity class = IASTInvocation ].

	self assert: accesses size equals: 1.
	self
		assertCollection:
		(accesses collect: [ :entity | entity entityName ])
		hasSameElements: #( 'name' ).
		
	self assert: invocations size equals: 0
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserFromCodeTest >> testSubroutine2 [

	| iast node accesses invocations |
	iast := self
		        parse: '      subroutine hello( fname, lname )
        write(*,*) fname, lname
      end
'
		        rule: #start.

	self assert: iast progUnits size equals: 1.

	node := iast progUnits first.

	self assert: node class equals: IASTSubroutine.
	self assert: node parameters size equals: 2.
	self assert: node parameters first entityName equals: 'fname'.
	self assert: node parameters second entityName equals: 'lname'.
	self assert: node body size equals: 2.

	accesses := node body select: [ :entity | 
		            entity class = IASTVarAccess ].
	invocations := node body select: [ :entity | 
		               entity class = IASTInvocation ].

	self assert: accesses size equals: 2.
	self
		assertCollection:
		(accesses collect: [ :entity | entity entityName ])
		hasSameElements: #( 'fname' 'lname' ).

	self assert: invocations size equals: 0
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserFromCodeTest >> testSubroutine3 [

	| iast node |
	iast := self
		       parse: '      subroutine hello( fn, ln )
        character*20 n
        integer*4i
        n = fn // ln
        write(*,*) i, ''first='', fn, '', last='', ln, '' and name='', n
      end
'
		       rule: #start.

	self assert: iast class equals: IASTProgramFile.
	self assert: iast progUnits size equals: 1.
	
	parser model halt.

	node := iast progUnits first.

	self assert: node class equals: IASTSubroutine.
	self assert: node parameters size equals: 2.
	self assert: node parameters first entityName equals: 'fn'.
	self assert: node parameters second entityName equals: 'ln'.
	self assert: node body size equals: 9.
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserFromCodeTest >> testSubroutine4BugWithDeclarationAndInitialization [

	| iast node |
	iast := self
		       parse: '      subroutine hello( fn, ln )
        character*20 n
        integer i = 20
        n = fn // ln
        write(*,*) i, ''first='', fn, '', last='', ln, '' and name='', n
      end
'
		       rule: #start.

	self assert: iast progUnits size equals: 1.

	node := iast progUnits first.

	self assert: node class equals: IASTSubroutine.
	self assert: node parameters size equals: 2.
	self assert: node parameters first entityName equals: 'fn'.
	self assert: node parameters second entityName equals: 'ln'.
]

{ #category : #'tests - temp' }
PP2FortranSrcParserFromCodeTest >> testSubroutineEmpty [

	| iast node |
	iast := self
		       parse: '      subroutine hello
      end
'
		       rule: #start.

	self assert: iast progUnits size equals: 1.

	node := iast progUnits first.

	self assert: node class equals: IASTSubroutine.
	self assert: node entityName equals: 'hello'.
	self assert: node parameters size equals: 0.
	self assert: node body size equals: 0.
]

{ #category : #'tests-programUnit' }
PP2FortranSrcParserFromCodeTest >> testSubroutineWithInvocation [

	| iast node |
	iast := self
		       parse: '      subroutine hello( name )
c subroutine comment
        write(*,*) name
      end
'
		       rule: #start.

	self assert: iast progUnits size equals: 1.

	node := iast progUnits first.

	self assert: node class equals: IASTSubroutine.
	self assert: node entityName equals: 'hello'.
	self assert: node parameters size equals: 1.
	self assert: node parameters first entityName equals: 'name'.
	self assert: node body size equals: 1.

	self assert: node comments size equals: 1.
	self assert: node comments anyOne text equals: ' subroutine comment'.
	
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testTemp [

	" :| "
	| iast |
	iast := self
		        parse: '      subroutine relbk(lib,name,title)
      implicit none
c2345678901234567890123456789012345678901234567890123456789012
c bref(brcnt) array of books
c uref(urcnt) array of users
c bstatu(brcnt) logical array of borrowed books
c ubb(ubbcnt) array of books borrowed by the user

c: MAILLON 1
      integer brcnt
      integer urcnt
      integer ubbcnt

c segment de tête
cESO  segment, tlib
cESO    integer bref(brcnt)
cESO    logical bstatu(brcnt)
cESO    integer uref(urcnt)
cESO  end segment

cESO  segment, book
cESO    character*40 btitle
cESO    integer bpages
cESO    real budc
cESO  end segment

cESO  segment, user
cESO    character*40 uname
cESO    integer ubb(ubbcnt)
cESO  end segment

c******************************************************************

c2345678901234567890123456789012345678901234567890123456789012
c-pstr
c:pstr   segment dentete des structures : nouvelles definition
*:nomcod nom du code auquel appartient la structure (cronos, apollo, ..)
*:date   date de debut de job
*:heure  heure de debut de job
*:typseg type des segments appartenants a la structure
*:typref type des objects references par la structure
*:ibseg  numero max. du segment ajoute a la structure
*:ibref  numero max. de lobject reference par la structure
*:pntseg pointeurs des segments apartenants a la structure
*:pntref pointeurs des objects references par la structure
cESO  segment, pstr
cESO    character*8 nomcode, date, heure, typseg(nbseg), typref(nbref)
cESO    integer     ibseg, ibref,         pntseg(nbseg), pntref(nbref)
cESO  endsegment
*-------------------------------------------------------------


c dummy arguments
cESO  pointeur lib.pstr
      character *(*) name
      character *(*) title

c use of external for mypnt since it is a function
      external mypnt
      integer mypnt
      external findbk 
      integer findbk
      external findur
      integer findur

c local vriables       
cESO  pointeur lb.tlib
cESO  pointeur ur.user
cESO  pointeur bk.book
      integer ir
      integer ibk

      write(*,*) ''relbk: begin''

c activate struct
      call actstr(lib)
      lb = mypnt(lib,1)
cESO  segact, lb
      brcnt = ESOsl(ESOat(lb,bref),1)
      urcnt = ESOsl(ESOat(lb,uref),1) 

c call of the function that find the user and check whether
c it belongs to the structure or not and the same thing for the book       
      ur = findur(lib,name)
      if (ur .eq. 0) then 
         write(*,*) '' user'',name,'' does not exist''
         return
      end if 
      ibk = findbk(lib,title)
      if (ibk .eq. 0) then 
         write(*,*) '' book'',title,'' does not exist''
         return
      end if 

c activate the segment user and get the size of the array ubb       
cESO  segact, ur
      ubbcnt = ESOsl(ESOat(ur,ubb),1)

c search for the the element that we want to remove from
c the array
      do ir=1, ubbcnt
         if (ESOar(ESOat(ur,ubb),ir) .eq. ibk) then 
           exit                      
         end if  
      end do

c adjust the array 
      do jr=ir , ubbcnt-1
c        ur.ubb(jr) == ur.ubb(jr + 1) -> erreur parsing normal
         ESOar(ESOat(ur,ubb),jr) = ESOat(ur,ubb)(jr + 1)
      end do
                    
      end

'
		        rule: #start.
		iast halt.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testTemp2ElseIfs [

	" :| "
	self
		        parse: '      PROGRAM MYPROG
         IF ( A ) THEN
            I = 1
         else if ( b ) then
            i = 2
         else if ( c ) then
            i = 3         
         ELSE
            I = 4
         END IF
      END
'
		        rule: #start.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testTempBugChar [

	" :| "
	self
		        parse: '      PROGRAM MYPROG
         IF ( A ) THEN
            I = 1
         ELSE
            I = 3
         END IF
      END
'
		        rule: #start.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testTempBugCharAndBlock [

	" :| "
	self
		        parse: '      PROGRAM MYPROG
         IF ( A ) THEN
            I = 1
         ELSE IF ( B ) THEN
            I = 2
         ELSE
            I = 3
         END IF
      END
'
		        rule: #start.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcParserFromCodeTest >> testTempFunctionStatementAndExternalStatement [

	| iast |
	iast := self
		        parse: '      subroutine relbk(lib,name,title)
      implicit none
c2345678901234567890123456789012345678901234567890123456789012
c bref(brcnt) array of books
c uref(urcnt) array of users
c bstatu(brcnt) logical array of borrowed books
c ubb(ubbcnt) array of books borrowed by the user

c: MAILLON 1
      integer brcnt
      integer urcnt
      integer ubbcnt

c segment de tête
cESO  segment, tlib
cESO    integer bref(brcnt)
cESO    logical bstatu(brcnt)
cESO    integer uref(urcnt)
cESO  end segment

cESO  segment, book
cESO    character*40 btitle
cESO    integer bpages
cESO    real budc
cESO  end segment

cESO  segment, user
cESO    character*40 uname
cESO    integer ubb(ubbcnt)
cESO  end segment

c******************************************************************

c2345678901234567890123456789012345678901234567890123456789012
c-pstr
c:pstr   segment dentete des structures : nouvelles definition
*:nomcod nom du code auquel appartient la structure (cronos, apollo, ..)
*:date   date de debut de job
*:heure  heure de debut de job
*:typseg type des segments appartenants a la structure
*:typref type des objects references par la structure
*:ibseg  numero max. du segment ajoute a la structure
*:ibref  numero max. de lobject reference par la structure
*:pntseg pointeurs des segments apartenants a la structure
*:pntref pointeurs des objects references par la structure
cESO  segment, pstr
cESO    character*8 nomcode, date, heure, typseg(nbseg), typref(nbref)
cESO    integer     ibseg, ibref,         pntseg(nbseg), pntref(nbref)
cESO  endsegment
*-------------------------------------------------------------


c dummy arguments
cESO  pointeur lib.pstr
      character *(*) name
      character *(*) title

c use of external for mypnt since it is a function
      external mypnt
      integer mypnt
      external findbk 
      integer findbk
      external findur
      integer findur

c local vriables       
cESO  pointeur lb.tlib
cESO  pointeur ur.user
cESO  pointeur bk.book
      integer ir
      integer ibk

      write(*,*) ''relbk: begin''

c activate struct
      call actstr(lib)
      lb = mypnt(lib,1)
cESO  segact, lb
      brcnt = ESOsl(ESOat(lb,bref),1)
      urcnt = ESOsl(ESOat(lb,uref),1) 

c call of the function that find the user and check whether
c it belongs to the structure or not and the same thing for the book       
      ur = findur(lib,name)
      if (ur .eq. 0) then 
         write(*,*) '' user'',name,'' does not exist''
         return
      end if 
      ibk = findbk(lib,title)
      if (ibk .eq. 0) then 
         write(*,*) '' book'',title,'' does not exist''
         return
      end if 

c activate the segment user and get the size of the array ubb       
cESO  segact, ur
      ubbcnt = ESOsl(ESOat(ur,ubb),1)

c search for the the element that we want to remove from
c the array
      do ir=1, ubbcnt
         if (ESOar(ESOat(ur,ubb),ir) .eq. ibk) then 
           exit                      
         end if  
      end do

c adjust the array 
      do jr=ir , ubbcnt-1
c        ur.ubb(jr) == ur.ubb(jr + 1) -> erreur parsing normal
         ESOar(ESOat(ur,ubb),jr) = ESOat(ur,ubb)(jr + 1)
      end do
                    
      end

'
		        rule: #start.
		iast halt.
]
