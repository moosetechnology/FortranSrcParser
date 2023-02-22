Class {
	#name : #PP2FortranSrcGrammarTest,
	#superclass : #PP2CompositeNodeTest,
	#category : #'FortranSrc-Tests'
}

{ #category : #'filesytem-inmemory' }
PP2FortranSrcGrammarTest class >> borbk [

	^ (self workDir / 'borbk.0.e.f') ensureCreateFile writeStreamDo: [ 
		  :stream | stream << self borbkFortran ]
]

{ #category : #'AST-fortranSrc' }
PP2FortranSrcGrammarTest class >> borbkAST [

	^ 'ProgramFile (MetaInfo
                     {miVersion = Fortran77,
                      miFilename = "/demo-bib/build/borbk.0.e.f"})
            [PUSubroutine ()
                          (1:7)-(113:9)
                          (Nothing, Nothing)
                          "borbk"
                          (Just AList ()
                                      (1:24)-(1:37)
                                      [ExpValue ()
                                                (1:24)-(1:26)
                                                (ValVariable "lib"),
                                       ExpValue ()
                                                (1:28)-(1:31)
                                                (ValVariable "name"),
                                       ExpValue ()
                                                (1:33)-(1:37)
                                                (ValVariable "title")])
                          [BlStatement ()
                                       (2:7)-(2:19)
                                       Nothing
                                       (StImplicit () (2:7)-(2:19) Nothing),
                           BlComment ()
                                     (5:1)-(5:62)
                                     (Comment "2345678901234567890123456789012345678901234567890123456789012"),
                           BlComment ()
                                     (6:1)-(6:28)
                                     (Comment " bref(brcnt) array of books"),
                           BlComment ()
                                     (7:1)-(7:28)
                                     (Comment " uref(urcnt) array of users"),
                           BlComment ()
                                     (8:1)-(8:47)
                                     (Comment " bstatu(brcnt) logical array of borrowed books"),
                           BlComment ()
                                     (9:1)-(9:49)
                                     (Comment " ubb(ubbcnt) array of books borrowed by the user"),
                           BlComment () (11:1)-(11:12) (Comment ": maillon 1"),
                           BlStatement ()
                                       (12:7)-(12:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (12:7)-(12:19)
                                                      (TypeSpec ()
                                                                (12:7)-(12:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (12:15)-(12:19)
                                                             [Declarator ()
                                                                         (12:15)-(12:19)
                                                                         (ExpValue ()
                                                                                   (12:15)-(12:19)
                                                                                   (ValVariable "brcnt"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (13:7)-(13:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (13:7)-(13:19)
                                                      (TypeSpec ()
                                                                (13:7)-(13:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (13:15)-(13:19)
                                                             [Declarator ()
                                                                         (13:15)-(13:19)
                                                                         (ExpValue ()
                                                                                   (13:15)-(13:19)
                                                                                   (ValVariable "urcnt"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (14:7)-(14:20)
                                       Nothing
                                       (StDeclaration ()
                                                      (14:7)-(14:20)
                                                      (TypeSpec ()
                                                                (14:7)-(14:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (14:15)-(14:20)
                                                             [Declarator ()
                                                                         (14:15)-(14:20)
                                                                         (ExpValue ()
                                                                                   (14:15)-(14:20)
                                                                                   (ValVariable "ubbcnt"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment ()
                                     (16:1)-(16:18)
                                     (Comment " segment de t\227\170te"),
                           BlComment ()
                                     (17:1)-(17:19)
                                     (Comment "eso  segment, tlib"),
                           BlComment ()
                                     (18:1)-(18:27)
                                     (Comment "eso    integer bref(brcnt)"),
                           BlComment ()
                                     (19:1)-(19:29)
                                     (Comment "eso    logical bstatu(brcnt)"),
                           BlComment ()
                                     (20:1)-(20:27)
                                     (Comment "eso    integer uref(urcnt)"),
                           BlComment ()
                                     (21:1)-(21:17)
                                     (Comment "eso  end segment"),
                           BlComment ()
                                     (23:1)-(23:19)
                                     (Comment "eso  segment, book"),
                           BlComment ()
                                     (24:1)-(24:27)
                                     (Comment "eso    character*40 btitle"),
                           BlComment ()
                                     (25:1)-(25:22)
                                     (Comment "eso    integer bpages"),
                           BlComment ()
                                     (26:1)-(26:17)
                                     (Comment "eso    real budc"),
                           BlComment ()
                                     (27:1)-(27:17)
                                     (Comment "eso  end segment"),
                           BlComment ()
                                     (29:1)-(29:19)
                                     (Comment "eso  segment, user"),
                           BlComment ()
                                     (30:1)-(30:26)
                                     (Comment "eso    character*40 uname"),
                           BlComment ()
                                     (31:1)-(31:27)
                                     (Comment "eso    integer ubb(ubbcnt)"),
                           BlComment ()
                                     (32:1)-(32:17)
                                     (Comment "eso  end segment"),
                           BlComment ()
                                     (34:1)-(34:67)
                                     (Comment "******************************************************************"),
                           BlComment ()
                                     (36:1)-(36:62)
                                     (Comment "2345678901234567890123456789012345678901234567890123456789012"),
                           BlComment () (37:1)-(37:6) (Comment "-pstr"),
                           BlComment ()
                                     (38:1)-(38:62)
                                     (Comment ":pstr   segment dentete des structures : nouvelles definition"),
                           BlComment ()
                                     (39:1)-(39:72)
                                     (Comment ":nomcod nom du code auquel appartient la structure (cronos, apollo, ..)"),
                           BlComment ()
                                     (40:1)-(40:29)
                                     (Comment ":date   date de debut de job"),
                           BlComment ()
                                     (41:1)-(41:30)
                                     (Comment ":heure  heure de debut de job"),
                           BlComment ()
                                     (42:1)-(42:54)
                                     (Comment ":typseg type des segments appartenants a la structure"),
                           BlComment ()
                                     (43:1)-(43:53)
                                     (Comment ":typref type des objects references par la structure"),
                           BlComment ()
                                     (44:1)-(44:53)
                                     (Comment ":ibseg  numero max. du segment ajoute a la structure"),
                           BlComment ()
                                     (45:1)-(45:58)
                                     (Comment ":ibref  numero max. de lobject reference par la structure"),
                           BlComment ()
                                     (46:1)-(46:58)
                                     (Comment ":pntseg pointeurs des segments apartenants a la structure"),
                           BlComment ()
                                     (47:1)-(47:58)
                                     (Comment ":pntref pointeurs des objects references par la structure"),
                           BlComment ()
                                     (48:1)-(48:19)
                                     (Comment "eso  segment, pstr"),
                           BlComment ()
                                     (49:1)-(49:70)
                                     (Comment "eso    character*8 nomcode, date, heure, typseg(nbseg), typref(nbref)"),
                           BlComment ()
                                     (50:1)-(50:70)
                                     (Comment "eso    integer     ibseg, ibref,         pntseg(nbseg), pntref(nbref)"),
                           BlComment ()
                                     (51:1)-(51:16)
                                     (Comment "eso  endsegment"),
                           BlComment ()
                                     (52:1)-(52:62)
                                     (Comment "-------------------------------------------------------------"),
                           BlComment ()
                                     (55:1)-(55:17)
                                     (Comment " dummy arguments"),
                           BlComment ()
                                     (56:1)-(56:23)
                                     (Comment "eso  pointeur lib.pstr"),
                           BlStatement ()
                                       (57:7)-(57:25)
                                       Nothing
                                       (StDeclaration ()
                                                      (57:7)-(57:25)
                                                      (TypeSpec ()
                                                                (57:7)-(57:20)
                                                                TypeCharacter
                                                                (Just Selector ()
                                                                               (57:17)-(57:20)
                                                                               (Just ExpValue ()
                                                                                              (57:19)-(57:19)
                                                                                              ValStar)
                                                                               Nothing))
                                                      Nothing
                                                      (AList ()
                                                             (57:22)-(57:25)
                                                             [Declarator ()
                                                                         (57:22)-(57:25)
                                                                         (ExpValue ()
                                                                                   (57:22)-(57:25)
                                                                                   (ValVariable "name"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (58:7)-(58:26)
                                       Nothing
                                       (StDeclaration ()
                                                      (58:7)-(58:26)
                                                      (TypeSpec ()
                                                                (58:7)-(58:20)
                                                                TypeCharacter
                                                                (Just Selector ()
                                                                               (58:17)-(58:20)
                                                                               (Just ExpValue ()
                                                                                              (58:19)-(58:19)
                                                                                              ValStar)
                                                                               Nothing))
                                                      Nothing
                                                      (AList ()
                                                             (58:22)-(58:26)
                                                             [Declarator ()
                                                                         (58:22)-(58:26)
                                                                         (ExpValue ()
                                                                                   (58:22)-(58:26)
                                                                                   (ValVariable "title"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment ()
                                     (60:1)-(60:31)
                                     (Comment " use of external for functions"),
                           BlStatement ()
                                       (61:7)-(61:20)
                                       Nothing
                                       (StExternal ()
                                                   (61:7)-(61:20)
                                                   (AList ()
                                                          (61:16)-(61:20)
                                                          [ExpValue ()
                                                                    (61:16)-(61:20)
                                                                    (ValVariable "mypnt")])),
                           BlStatement ()
                                       (62:7)-(62:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (62:7)-(62:19)
                                                      (TypeSpec ()
                                                                (62:7)-(62:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (62:15)-(62:19)
                                                             [Declarator ()
                                                                         (62:15)-(62:19)
                                                                         (ExpValue ()
                                                                                   (62:15)-(62:19)
                                                                                   (ValVariable "mypnt"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (63:7)-(63:21)
                                       Nothing
                                       (StExternal ()
                                                   (63:7)-(63:21)
                                                   (AList ()
                                                          (63:16)-(63:21)
                                                          [ExpValue ()
                                                                    (63:16)-(63:21)
                                                                    (ValVariable "findbk")])),
                           BlStatement ()
                                       (64:7)-(64:20)
                                       Nothing
                                       (StDeclaration ()
                                                      (64:7)-(64:20)
                                                      (TypeSpec ()
                                                                (64:7)-(64:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (64:15)-(64:20)
                                                             [Declarator ()
                                                                         (64:15)-(64:20)
                                                                         (ExpValue ()
                                                                                   (64:15)-(64:20)
                                                                                   (ValVariable "findbk"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (65:7)-(65:21)
                                       Nothing
                                       (StExternal ()
                                                   (65:7)-(65:21)
                                                   (AList ()
                                                          (65:16)-(65:21)
                                                          [ExpValue ()
                                                                    (65:16)-(65:21)
                                                                    (ValVariable "findur")])),
                           BlStatement ()
                                       (66:7)-(66:20)
                                       Nothing
                                       (StDeclaration ()
                                                      (66:7)-(66:20)
                                                      (TypeSpec ()
                                                                (66:7)-(66:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (66:15)-(66:20)
                                                             [Declarator ()
                                                                         (66:15)-(66:20)
                                                                         (ExpValue ()
                                                                                   (66:15)-(66:20)
                                                                                   (ValVariable "findur"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment ()
                                     (68:1)-(68:17)
                                     (Comment " local variables"),
                           BlComment ()
                                     (69:1)-(69:22)
                                     (Comment "eso  pointeur lb.tlib"),
                           BlComment ()
                                     (70:1)-(70:22)
                                     (Comment "eso  pointeur ur.user"),
                           BlStatement ()
                                       (71:7)-(71:21)
                                       Nothing
                                       (StDeclaration ()
                                                      (71:7)-(71:21)
                                                      (TypeSpec ()
                                                                (71:7)-(71:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (71:15)-(71:21)
                                                             [Declarator ()
                                                                         (71:15)-(71:17)
                                                                         (ExpValue ()
                                                                                   (71:15)-(71:17)
                                                                                   (ValVariable "ibk"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (71:19)-(71:21)
                                                                         (ExpValue ()
                                                                                   (71:19)-(71:21)
                                                                                   (ValVariable "iur"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (73:7)-(73:31)
                                       Nothing
                                       (StWrite ()
                                                (73:7)-(73:31)
                                                (AList ()
                                                       (73:12)-(73:16)
                                                       [ControlPair ()
                                                                    (73:13)-(73:13)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (73:13)-(73:13)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (73:15)-(73:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (73:15)-(73:15)
                                                                              ValStar)])
                                                (Just AList ()
                                                            (73:18)-(73:31)
                                                            [ExpValue ()
                                                                      (73:18)-(73:31)
                                                                      (ValString "borbk: begin")])),
                           BlComment ()
                                     (75:1)-(75:62)
                                     (Comment " activate structure get the first segment and sizes of arrays"),
                           BlStatement ()
                                       (76:7)-(76:22)
                                       Nothing
                                       (StCall ()
                                               (76:7)-(76:22)
                                               (ExpValue ()
                                                         (76:12)-(76:17)
                                                         (ValVariable "actstr"))
                                               (Just AList ()
                                                           (76:18)-(76:22)
                                                           [Argument ()
                                                                     (76:19)-(76:21)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (76:19)-(76:21)
                                                                                        (ValVariable "lib")))])),
                           BlStatement ()
                                       (77:7)-(77:23)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (77:7)-(77:23)
                                                           (ExpValue ()
                                                                     (77:7)-(77:8)
                                                                     (ValVariable "lb"))
                                                           (ExpFunctionCall ()
                                                                            (77:12)-(77:23)
                                                                            (ExpValue ()
                                                                                      (77:12)-(77:16)
                                                                                      (ValVariable "mypnt"))
                                                                            (Just AList ()
                                                                                        (77:18)-(77:22)
                                                                                        [Argument ()
                                                                                                  (77:18)-(77:20)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (77:18)-(77:20)
                                                                                                                     (ValVariable "lib"))),
                                                                                         Argument ()
                                                                                                  (77:22)-(77:22)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (77:22)-(77:22)
                                                                                                                     (ValInteger "1"
                                                                                                                                 Nothing)))]))),
                           BlComment ()
                                     (78:1)-(78:16)
                                     (Comment "eso  segact, lb"),
                           BlStatement ()
                                       (79:7)-(79:37)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (79:7)-(79:37)
                                                           (ExpValue ()
                                                                     (79:7)-(79:11)
                                                                     (ValVariable "brcnt"))
                                                           (ExpFunctionCall ()
                                                                            (79:15)-(79:37)
                                                                            (ExpValue ()
                                                                                      (79:15)-(79:19)
                                                                                      (ValVariable "esosl"))
                                                                            (Just AList ()
                                                                                        (79:21)-(79:36)
                                                                                        [Argument ()
                                                                                                  (79:21)-(79:34)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpFunctionCall ()
                                                                                                                            (79:21)-(79:34)
                                                                                                                            (ExpValue ()
                                                                                                                                      (79:21)-(79:25)
                                                                                                                                      (ValVariable "esoat"))
                                                                                                                            (Just AList ()
                                                                                                                                        (79:27)-(79:33)
                                                                                                                                        [Argument ()
                                                                                                                                                  (79:27)-(79:28)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (79:27)-(79:28)
                                                                                                                                                                     (ValVariable "lb"))),
                                                                                                                                         Argument ()
                                                                                                                                                  (79:30)-(79:33)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (79:30)-(79:33)
                                                                                                                                                                     (ValVariable "bref")))]))),
                                                                                         Argument ()
                                                                                                  (79:36)-(79:36)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (79:36)-(79:36)
                                                                                                                     (ValInteger "1"
                                                                                                                                 Nothing)))]))),
                           BlStatement ()
                                       (80:7)-(80:37)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (80:7)-(80:37)
                                                           (ExpValue ()
                                                                     (80:7)-(80:11)
                                                                     (ValVariable "urcnt"))
                                                           (ExpFunctionCall ()
                                                                            (80:15)-(80:37)
                                                                            (ExpValue ()
                                                                                      (80:15)-(80:19)
                                                                                      (ValVariable "esosl"))
                                                                            (Just AList ()
                                                                                        (80:21)-(80:36)
                                                                                        [Argument ()
                                                                                                  (80:21)-(80:34)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpFunctionCall ()
                                                                                                                            (80:21)-(80:34)
                                                                                                                            (ExpValue ()
                                                                                                                                      (80:21)-(80:25)
                                                                                                                                      (ValVariable "esoat"))
                                                                                                                            (Just AList ()
                                                                                                                                        (80:27)-(80:33)
                                                                                                                                        [Argument ()
                                                                                                                                                  (80:27)-(80:28)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (80:27)-(80:28)
                                                                                                                                                                     (ValVariable "lb"))),
                                                                                                                                         Argument ()
                                                                                                                                                  (80:30)-(80:33)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (80:30)-(80:33)
                                                                                                                                                                     (ValVariable "uref")))]))),
                                                                                         Argument ()
                                                                                                  (80:36)-(80:36)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (80:36)-(80:36)
                                                                                                                     (ValInteger "1"
                                                                                                                                 Nothing)))]))),
                           BlComment ()
                                     (82:1)-(82:65)
                                     (Comment " see whether the user and the book exist in the structure       "),
                           BlStatement ()
                                       (83:7)-(83:28)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (83:7)-(83:28)
                                                           (ExpValue ()
                                                                     (83:7)-(83:9)
                                                                     (ValVariable "iur"))
                                                           (ExpFunctionCall ()
                                                                            (83:13)-(83:28)
                                                                            (ExpValue ()
                                                                                      (83:13)-(83:18)
                                                                                      (ValVariable "findur"))
                                                                            (Just AList ()
                                                                                        (83:20)-(83:27)
                                                                                        [Argument ()
                                                                                                  (83:20)-(83:22)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (83:20)-(83:22)
                                                                                                                     (ValVariable "lib"))),
                                                                                         Argument ()
                                                                                                  (83:24)-(83:27)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (83:24)-(83:27)
                                                                                                                     (ValVariable "name")))]))),
                           BlIf ()
                                (84:7)-(87:12)
                                Nothing
                                Nothing
                                [Just ExpBinary ()
                                                (84:11)-(84:20)
                                                EQ
                                                (ExpValue ()
                                                          (84:11)-(84:13)
                                                          (ValVariable "iur"))
                                                (ExpValue ()
                                                          (84:20)-(84:20)
                                                          (ValInteger "0"
                                                                      Nothing))]
                                [[BlStatement ()
                                              (85:10)-(85:50)
                                              Nothing
                                              (StWrite ()
                                                       (85:10)-(85:50)
                                                       (AList ()
                                                              (85:15)-(85:19)
                                                              [ControlPair ()
                                                                           (85:16)-(85:16)
                                                                           Nothing
                                                                           (ExpValue ()
                                                                                     (85:16)-(85:16)
                                                                                     ValStar),
                                                               ControlPair ()
                                                                           (85:18)-(85:18)
                                                                           Nothing
                                                                           (ExpValue ()
                                                                                     (85:18)-(85:18)
                                                                                     ValStar)])
                                                       (Just AList ()
                                                                   (85:21)-(85:50)
                                                                   [ExpValue ()
                                                                             (85:21)-(85:27)
                                                                             (ValString " user"),
                                                                    ExpValue ()
                                                                             (85:29)-(85:32)
                                                                             (ValVariable "name"),
                                                                    ExpValue ()
                                                                             (85:34)-(85:50)
                                                                             (ValString " does not exist")])),
                                  BlStatement ()
                                              (86:10)-(86:15)
                                              Nothing
                                              (StReturn ()
                                                        (86:10)-(86:15)
                                                        Nothing)]]
                                Nothing,
                           BlStatement ()
                                       (88:7)-(88:29)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (88:7)-(88:29)
                                                           (ExpValue ()
                                                                     (88:7)-(88:9)
                                                                     (ValVariable "ibk"))
                                                           (ExpFunctionCall ()
                                                                            (88:13)-(88:29)
                                                                            (ExpValue ()
                                                                                      (88:13)-(88:18)
                                                                                      (ValVariable "findbk"))
                                                                            (Just AList ()
                                                                                        (88:20)-(88:28)
                                                                                        [Argument ()
                                                                                                  (88:20)-(88:22)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (88:20)-(88:22)
                                                                                                                     (ValVariable "lib"))),
                                                                                         Argument ()
                                                                                                  (88:24)-(88:28)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (88:24)-(88:28)
                                                                                                                     (ValVariable "title")))]))),
                           BlIf ()
                                (89:7)-(92:12)
                                Nothing
                                Nothing
                                [Just ExpBinary ()
                                                (89:11)-(89:20)
                                                EQ
                                                (ExpValue ()
                                                          (89:11)-(89:13)
                                                          (ValVariable "ibk"))
                                                (ExpValue ()
                                                          (89:20)-(89:20)
                                                          (ValInteger "0"
                                                                      Nothing))]
                                [[BlStatement ()
                                              (90:10)-(90:51)
                                              Nothing
                                              (StWrite ()
                                                       (90:10)-(90:51)
                                                       (AList ()
                                                              (90:15)-(90:19)
                                                              [ControlPair ()
                                                                           (90:16)-(90:16)
                                                                           Nothing
                                                                           (ExpValue ()
                                                                                     (90:16)-(90:16)
                                                                                     ValStar),
                                                               ControlPair ()
                                                                           (90:18)-(90:18)
                                                                           Nothing
                                                                           (ExpValue ()
                                                                                     (90:18)-(90:18)
                                                                                     ValStar)])
                                                       (Just AList ()
                                                                   (90:21)-(90:51)
                                                                   [ExpValue ()
                                                                             (90:21)-(90:27)
                                                                             (ValString " book"),
                                                                    ExpValue ()
                                                                             (90:29)-(90:33)
                                                                             (ValVariable "title"),
                                                                    ExpValue ()
                                                                             (90:35)-(90:51)
                                                                             (ValString " does not exist")])),
                                  BlStatement ()
                                              (91:10)-(91:15)
                                              Nothing
                                              (StReturn ()
                                                        (91:10)-(91:15)
                                                        Nothing)]]
                                Nothing,
                           BlComment ()
                                     (94:1)-(94:43)
                                     (Comment " set flag true if the book is borrowed    "),
                           BlStatement ()
                                       (95:7)-(95:44)
                                       Nothing
                                       (StFunction ()
                                                   (95:7)-(95:44)
                                                   (ExpValue ()
                                                             (95:7)-(95:11)
                                                             (ValVariable "esoar"))
                                                   (AList ()
                                                          (95:13)-(95:34)
                                                          [ExpFunctionCall ()
                                                                           (95:13)-(95:28)
                                                                           (ExpValue ()
                                                                                     (95:13)-(95:17)
                                                                                     (ValVariable "esoat"))
                                                                           (Just AList ()
                                                                                       (95:19)-(95:27)
                                                                                       [Argument ()
                                                                                                 (95:19)-(95:20)
                                                                                                 Nothing
                                                                                                 (ArgExpr (ExpValue ()
                                                                                                                    (95:19)-(95:20)
                                                                                                                    (ValVariable "lb"))),
                                                                                        Argument ()
                                                                                                 (95:22)-(95:27)
                                                                                                 Nothing
                                                                                                 (ArgExpr (ExpValue ()
                                                                                                                    (95:22)-(95:27)
                                                                                                                    (ValVariable "bstatu")))]),
                                                           ExpValue ()
                                                                    (95:30)-(95:34)
                                                                    (ValVariable "brcnt")])
                                                   (ExpValue ()
                                                             (95:39)-(95:44)
                                                             (ValLogical True
                                                                         Nothing))),
                           BlComment ()
                                     (97:1)-(97:38)
                                     (Comment " add the book borrowed to the array  "),
                           BlStatement ()
                                       (98:7)-(98:25)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (98:7)-(98:25)
                                                           (ExpValue ()
                                                                     (98:7)-(98:8)
                                                                     (ValVariable "ur"))
                                                           (ExpFunctionCall ()
                                                                            (98:12)-(98:25)
                                                                            (ExpValue ()
                                                                                      (98:12)-(98:16)
                                                                                      (ValVariable "mypnt"))
                                                                            (Just AList ()
                                                                                        (98:18)-(98:24)
                                                                                        [Argument ()
                                                                                                  (98:18)-(98:20)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (98:18)-(98:20)
                                                                                                                     (ValVariable "lib"))),
                                                                                         Argument ()
                                                                                                  (98:22)-(98:24)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (98:22)-(98:24)
                                                                                                                     (ValVariable "iur")))]))),
                           BlComment ()
                                     (99:1)-(99:16)
                                     (Comment "eso  segact, ur"),
                           BlStatement ()
                                       (100:7)-(100:37)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (100:7)-(100:37)
                                                           (ExpValue ()
                                                                     (100:7)-(100:12)
                                                                     (ValVariable "ubbcnt"))
                                                           (ExpFunctionCall ()
                                                                            (100:16)-(100:37)
                                                                            (ExpValue ()
                                                                                      (100:16)-(100:20)
                                                                                      (ValVariable "esosl"))
                                                                            (Just AList ()
                                                                                        (100:22)-(100:36)
                                                                                        [Argument ()
                                                                                                  (100:22)-(100:34)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpFunctionCall ()
                                                                                                                            (100:22)-(100:34)
                                                                                                                            (ExpValue ()
                                                                                                                                      (100:22)-(100:26)
                                                                                                                                      (ValVariable "esoat"))
                                                                                                                            (Just AList ()
                                                                                                                                        (100:28)-(100:33)
                                                                                                                                        [Argument ()
                                                                                                                                                  (100:28)-(100:29)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (100:28)-(100:29)
                                                                                                                                                                     (ValVariable "ur"))),
                                                                                                                                         Argument ()
                                                                                                                                                  (100:31)-(100:33)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (100:31)-(100:33)
                                                                                                                                                                     (ValVariable "ubb")))]))),
                                                                                         Argument ()
                                                                                                  (100:36)-(100:36)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (100:36)-(100:36)
                                                                                                                     (ValInteger "1"
                                                                                                                                 Nothing)))]))),
                           BlStatement ()
                                       (101:7)-(101:25)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (101:7)-(101:25)
                                                           (ExpValue ()
                                                                     (101:7)-(101:12)
                                                                     (ValVariable "ubbcnt"))
                                                           (ExpBinary ()
                                                                      (101:16)-(101:25)
                                                                      Addition
                                                                      (ExpValue ()
                                                                                (101:16)-(101:21)
                                                                                (ValVariable "ubbcnt"))
                                                                      (ExpValue ()
                                                                                (101:25)-(101:25)
                                                                                (ValInteger "1"
                                                                                            Nothing)))),
                           BlComment ()
                                     (102:1)-(102:16)
                                     (Comment "eso  segadj, ur"),
                           BlStatement ()
                                       (103:7)-(103:39)
                                       Nothing
                                       (StFunction ()
                                                   (103:7)-(103:39)
                                                   (ExpValue ()
                                                             (103:7)-(103:11)
                                                             (ValVariable "esoar"))
                                                   (AList ()
                                                          (103:13)-(103:32)
                                                          [ExpFunctionCall ()
                                                                           (103:13)-(103:25)
                                                                           (ExpValue ()
                                                                                     (103:13)-(103:17)
                                                                                     (ValVariable "esoat"))
                                                                           (Just AList ()
                                                                                       (103:19)-(103:24)
                                                                                       [Argument ()
                                                                                                 (103:19)-(103:20)
                                                                                                 Nothing
                                                                                                 (ArgExpr (ExpValue ()
                                                                                                                    (103:19)-(103:20)
                                                                                                                    (ValVariable "ur"))),
                                                                                        Argument ()
                                                                                                 (103:22)-(103:24)
                                                                                                 Nothing
                                                                                                 (ArgExpr (ExpValue ()
                                                                                                                    (103:22)-(103:24)
                                                                                                                    (ValVariable "ubb")))]),
                                                           ExpValue ()
                                                                    (103:27)-(103:32)
                                                                    (ValVariable "ubbcnt")])
                                                   (ExpValue ()
                                                             (103:37)-(103:39)
                                                             (ValVariable "ibk"))),
                           BlComment ()
                                     (104:1)-(104:20)
                                     (Comment "eso  segdes, ur*mod"),
                           BlComment ()
                                     (106:1)-(106:28)
                                     (Comment " desactivate head segment  "),
                           BlComment ()
                                     (107:1)-(107:19)
                                     (Comment "eso  segdes,lb*mod"),
                           BlComment ()
                                     (109:1)-(109:23)
                                     (Comment " desactivate structure"),
                           BlStatement ()
                                       (110:7)-(110:29)
                                       Nothing
                                       (StCall ()
                                               (110:7)-(110:29)
                                               (ExpValue ()
                                                         (110:12)-(110:17)
                                                         (ValVariable "desstr"))
                                               (Just AList ()
                                                           (110:18)-(110:29)
                                                           [Argument ()
                                                                     (110:19)-(110:21)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (110:19)-(110:21)
                                                                                        (ValVariable "lib"))),
                                                            Argument ()
                                                                     (110:24)-(110:28)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (110:24)-(110:28)
                                                                                        (ValString "mod")))])),
                           BlStatement ()
                                       (111:7)-(111:29)
                                       Nothing
                                       (StWrite ()
                                                (111:7)-(111:29)
                                                (AList ()
                                                       (111:12)-(111:16)
                                                       [ControlPair ()
                                                                    (111:13)-(111:13)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (111:13)-(111:13)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (111:15)-(111:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (111:15)-(111:15)
                                                                              ValStar)])
                                                (Just AList ()
                                                            (111:18)-(111:29)
                                                            [ExpValue ()
                                                                      (111:18)-(111:29)
                                                                      (ValString "borbk: end")]))]
                          Nothing]
'
]

{ #category : #'fortran77-annoted' }
PP2FortranSrcGrammarTest class >> borbkFortran [

	^ '      subroutine borbk(lib,name,title)
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

c use of external for functions
      external mypnt
      integer mypnt
      external findbk 
      integer findbk
      external findur
      integer findur

c local variables
cESO  pointeur lb.tlib
cESO  pointeur ur.user
      integer ibk,iur
       
      write(*,*) ''borbk: begin''

c activate structure get the first segment and sizes of arrays
      call actstr(lib)
      lb = mypnt(lib,1)
cESO  segact, lb
      brcnt = ESOsl(ESOat(lb,bref),1)
      urcnt = ESOsl(ESOat(lb,uref),1) 

c see whether the user and the book exist in the structure       
      iur = findur(lib,name)
      if (iur .eq. 0) then 
         write(*,*) '' user'',name,'' does not exist''
         return
      end if 
      ibk = findbk(lib,title)
      if (ibk .eq. 0) then 
         write(*,*) '' book'',title,'' does not exist''
         return
      end if 

c set flag true if the book is borrowed    
      ESOar(ESOat(lb,bstatu),brcnt) = .true.

c add the book borrowed to the array  
      ur = mypnt(lib,iur)    
cESO  segact, ur
      ubbcnt = ESOsl(ESOat(ur,ubb),1)
      ubbcnt = ubbcnt + 1
cESO  segadj, ur
      ESOar(ESOat(ur,ubb),ubbcnt) = ibk       
cESO  segdes, ur*mod

c desactivate head segment  
cESO  segdes,lb*mod

c desactivate structure
      call desstr(lib, ''mod'')
      write(*,*) ''borbk: end''
                    
      end 

'
]

{ #category : #'filesytem-inmemory' }
PP2FortranSrcGrammarTest class >> example [

	^ (self workDir / '/demo-bib/build/example.e.f') ensureCreateFile writeStreamDo: [ 
		  :stream | stream << self exampleFortran ]
]

{ #category : #'AST-fortranSrc' }
PP2FortranSrcGrammarTest class >> exampleAST [

	^ 'ProgramFile (MetaInfo
                     {miVersion = Fortran77,
                      miFilename = "/demo-bib/build/example.f"})
            [PUComment ()
                       (1:1)-(1:72)
                       (Comment "23456789012345678901234567890123456789012345678901234567890123456789012"),
             PUSubroutine ()
                          (2:7)-(28:9)
                          (Nothing, Nothing)
                          "mynew"
                          (Just AList ()
                                      (2:24)-(2:44)
                                      [ExpValue ()
                                                (2:24)-(2:25)
                                                (ValVariable "t1"),
                                       ExpValue ()
                                                (2:28)-(2:32)
                                                (ValVariable "sizea"),
                                       ExpValue ()
                                                (2:35)-(2:39)
                                                (ValVariable "start"),
                                       ExpValue ()
                                                (2:41)-(2:44)
                                                (ValVariable "step")])
                          [BlStatement ()
                                       (3:7)-(3:19)
                                       Nothing
                                       (StImplicit () (3:7)-(3:19) Nothing),
                           BlComment ()
                                     (5:1)-(5:20)
                                     (Comment "eso  segment, mytab"),
                           BlComment ()
                                     (6:1)-(6:19)
                                     (Comment "eso    real tab(n)"),
                           BlComment ()
                                     (7:1)-(7:16)
                                     (Comment "eso  endsegment"),
                           BlComment ()
                                     (8:1)-(8:23)
                                     (Comment "eso  pointeur t1.mytab"),
                           BlStatement ()
                                       (9:7)-(9:15)
                                       Nothing
                                       (StDeclaration ()
                                                      (9:7)-(9:15)
                                                      (TypeSpec ()
                                                                (9:7)-(9:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (9:15)-(9:15)
                                                             [Declarator ()
                                                                         (9:15)-(9:15)
                                                                         (ExpValue ()
                                                                                   (9:15)-(9:15)
                                                                                   (ValVariable "n"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (10:7)-(10:15)
                                       Nothing
                                       (StDeclaration ()
                                                      (10:7)-(10:15)
                                                      (TypeSpec ()
                                                                (10:7)-(10:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (10:15)-(10:15)
                                                             [Declarator ()
                                                                         (10:15)-(10:15)
                                                                         (ExpValue ()
                                                                                   (10:15)-(10:15)
                                                                                   (ValVariable "i"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (11:7)-(11:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (11:7)-(11:19)
                                                      (TypeSpec ()
                                                                (11:7)-(11:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (11:15)-(11:19)
                                                             [Declarator ()
                                                                         (11:15)-(11:19)
                                                                         (ExpValue ()
                                                                                   (11:15)-(11:19)
                                                                                   (ValVariable "sizea"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (12:7)-(12:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (12:7)-(12:19)
                                                      (TypeSpec ()
                                                                (12:7)-(12:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (12:15)-(12:19)
                                                             [Declarator ()
                                                                         (12:15)-(12:19)
                                                                         (ExpValue ()
                                                                                   (12:15)-(12:19)
                                                                                   (ValVariable "start"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (13:7)-(13:18)
                                       Nothing
                                       (StDeclaration ()
                                                      (13:7)-(13:18)
                                                      (TypeSpec ()
                                                                (13:7)-(13:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (13:15)-(13:18)
                                                             [Declarator ()
                                                                         (13:15)-(13:18)
                                                                         (ExpValue ()
                                                                                   (13:15)-(13:18)
                                                                                   (ValVariable "step"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (14:7)-(14:17)
                                       Nothing
                                       (StDeclaration ()
                                                      (14:7)-(14:17)
                                                      (TypeSpec ()
                                                                (14:7)-(14:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (14:15)-(14:17)
                                                             [Declarator ()
                                                                         (14:15)-(14:17)
                                                                         (ExpValue ()
                                                                                   (14:15)-(14:17)
                                                                                   (ValVariable "tmp"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (16:7)-(16:16)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (16:7)-(16:16)
                                                           (ExpValue ()
                                                                     (16:7)-(16:9)
                                                                     (ValVariable "tmp"))
                                                           (ExpValue ()
                                                                     (16:13)-(16:16)
                                                                     (ValVariable "step"))),
                           BlStatement ()
                                       (18:7)-(18:15)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (18:7)-(18:15)
                                                           (ExpValue ()
                                                                     (18:7)-(18:7)
                                                                     (ValVariable "n"))
                                                           (ExpValue ()
                                                                     (18:11)-(18:15)
                                                                     (ValVariable "sizea"))),
                           BlComment ()
                                     (19:1)-(19:16)
                                     (Comment "eso  segini, t1"),
                           BlDo ()
                                (21:7)-(24:12)
                                Nothing
                                Nothing
                                Nothing
                                (Just DoSpecification ()
                                                      (21:10)-(21:19)
                                                      (StExpressionAssign ()
                                                                          (21:10)-(21:12)
                                                                          (ExpValue ()
                                                                                    (21:10)-(21:10)
                                                                                    (ValVariable "i"))
                                                                          (ExpValue ()
                                                                                    (21:12)-(21:12)
                                                                                    (ValInteger "1"
                                                                                                Nothing)))
                                                      (ExpValue ()
                                                                (21:15)-(21:19)
                                                                (ValVariable "sizea"))
                                                      Nothing)
                                [BlStatement ()
                                             (22:9)-(22:45)
                                             Nothing
                                             (StFunction ()
                                                         (22:9)-(22:45)
                                                         (ExpValue ()
                                                                   (22:9)-(22:13)
                                                                   (ValVariable "esoat"))
                                                         (AList ()
                                                                (22:15)-(22:29)
                                                                [ExpValue ()
                                                                          (22:15)-(22:16)
                                                                          (ValVariable "t1"),
                                                                 ExpFunctionCall ()
                                                                                 (22:18)-(22:29)
                                                                                 (ExpValue ()
                                                                                           (22:18)-(22:22)
                                                                                           (ValVariable "esoar"))
                                                                                 (Just AList ()
                                                                                             (22:24)-(22:28)
                                                                                             [Argument ()
                                                                                                       (22:24)-(22:26)
                                                                                                       Nothing
                                                                                                       (ArgExpr (ExpValue ()
                                                                                                                          (22:24)-(22:26)
                                                                                                                          (ValVariable "tab"))),
                                                                                              Argument ()
                                                                                                       (22:28)-(22:28)
                                                                                                       Nothing
                                                                                                       (ArgExpr (ExpValue ()
                                                                                                                          (22:28)-(22:28)
                                                                                                                          (ValVariable "i")))])])
                                                         (ExpBinary ()
                                                                    (22:34)-(22:45)
                                                                    Addition
                                                                    (ExpValue ()
                                                                              (22:34)-(22:38)
                                                                              (ValVariable "start"))
                                                                    (ExpValue ()
                                                                              (22:42)-(22:45)
                                                                              (ValVariable "step")))),
                                 BlStatement ()
                                             (23:9)-(23:25)
                                             Nothing
                                             (StExpressionAssign ()
                                                                 (23:9)-(23:25)
                                                                 (ExpValue ()
                                                                           (23:9)-(23:12)
                                                                           (ValVariable "step"))
                                                                 (ExpBinary ()
                                                                            (23:16)-(23:25)
                                                                            Addition
                                                                            (ExpValue ()
                                                                                      (23:16)-(23:19)
                                                                                      (ValVariable "step"))
                                                                            (ExpValue ()
                                                                                      (23:23)-(23:25)
                                                                                      (ValVariable "tmp"))))]
                                Nothing,
                           BlComment ()
                                     (26:1)-(26:16)
                                     (Comment "eso  segsup, t1")]
                          Nothing]
'
]

{ #category : #'fortran77-annoted' }
PP2FortranSrcGrammarTest class >> exampleFortran [

	^ 'c23456789012345678901234567890123456789012345678901234567890123456789012
      subroutine mynew(t1, sizea, start,step)
      implicit none

cESO  segment, mytab
cESO    real tab(n)
cESO  endsegment
cESO  pointeur t1.mytab
      integer n
      integer i
      integer sizea
      integer start
      integer step
      integer tmp

      tmp = step

      n = sizea
cESO  segini, t1

      do i=1, sizea
        ESOat(t1,ESOar(tab,i)) = start + step
        step = step + tmp
      end do

cESO  segsup, t1

      end

'
]

{ #category : #'filesytem-inmemory' }
PP2FortranSrcGrammarTest class >> exampleWithMultipleProgUnit [

	^ (self workDir / '/demo-bib/build/example.f') ensureCreateFile writeStreamDo: [ 
		  :stream | stream << self exampleWithMultipleProgUnitFortran ]
]

{ #category : #'AST-fortranSrc' }
PP2FortranSrcGrammarTest class >> exampleWithMultipleProgUnitAST [

	^ 'ProgramFile (MetaInfo
                     {miVersion = Fortran77,
                      miFilename = "/demo-bib/build/example.f"})
            [PUComment ()
                       (1:1)-(1:51)
                       (Comment " npac f77 example 001, showing source code layout."),
             PUComment ()
                       (2:1)-(2:70)
                       (Comment "        1         2         3         4         5         6         7"),
             PUComment ()
                       (3:1)-(3:73)
                       (Comment "---------------this is a comment---------------------------------------v"),
             PUComment ()
                       (4:1)-(4:47)
                       (Comment "ol. 1    : blank, or a \"c\" or \"*\" for comments"),
             PUComment ()
                       (5:1)-(5:38)
                       (Comment "ol. 1-5  : statement label (optional)"),
             PUComment ()
                       (6:1)-(6:52)
                       (Comment "ol. 6    : continuation of previous line (optional)"),
             PUComment ()
                       (7:1)-(7:22)
                       (Comment "ol. 7-72 : statements"),
             PUComment ()
                       (8:1)-(8:57)
                       (Comment "ol. 73-80: sequence number (optional, rarely used today)"),
             PUComment ()
                       (9:1)-(9:17)
                       (Comment " program layout:"),
             PUComment ()
                       (10:1)-(10:72)
                       (Comment "----------------------------------------------------------------------+"),
             PUComment ()
                       (11:1)-(11:72)
                       (Comment " block data, function program, subroutine                             |"),
             PUComment ()
                       (12:1)-(12:72)
                       (Comment "-----------------+----------------+-----------------------------------+"),
             PUComment ()
                       (13:1)-(13:72)
                       (Comment " format          | parameter      | implicit                          |"),
             PUComment ()
                       (14:1)-(14:72)
                       (Comment "                 |                +-----------------------------------+"),
             PUComment ()
                       (15:1)-(15:72)
                       (Comment "                 |                | type declarations and other spec  |"),
             PUComment ()
                       (16:1)-(16:72)
                       (Comment "                 |                | statement: common, dimension, save|"),
             PUComment ()
                       (17:1)-(17:72)
                       (Comment "                 |                | equivalence, external, intrinsic  |"),
             PUComment ()
                       (18:1)-(18:73)
                       (Comment "                 +----------------+-----------------------------------+ "),
             PUComment ()
                       (19:1)-(19:74)
                       (Comment "                 | data           | statement functions               |  "),
             PUComment ()
                       (20:1)-(20:72)
                       (Comment "                 |                +-----------------------------------+"),
             PUComment ()
                       (21:1)-(21:72)
                       (Comment "                 |                | executable statements             |"),
             PUComment ()
                       (22:1)-(22:88)
                       (Comment "-----------------+----------------+-----------------------------------+                "),
             PUComment ()
                       (23:1)-(23:74)
                       (Comment " end                                                                  |  "),
             PUComment ()
                       (24:1)-(24:72)
                       (Comment "----------------------------------------------------------------------+"),
             PUComment ()
                       (25:1)-(25:73)
                       (Comment "234567890123456789012345678901234567890123456789012345678901234567890123"),
             PUMain ()
                    (26:7)-(36:9)
                    (Just "myprog")
                    [BlStatement ()
                                 (27:7)-(27:22)
                                 Nothing
                                 (StDeclaration ()
                                                (27:7)-(27:22)
                                                (TypeSpec ()
                                                          (27:7)-(27:13)
                                                          TypeInteger
                                                          Nothing)
                                                Nothing
                                                (AList ()
                                                       (27:15)-(27:22)
                                                       [Declarator ()
                                                                   (27:15)-(27:15)
                                                                   (ExpValue ()
                                                                             (27:15)-(27:15)
                                                                             (ValVariable "i"))
                                                                   ScalarDecl
                                                                   Nothing
                                                                   Nothing,
                                                        Declarator ()
                                                                   (27:18)-(27:22)
                                                                   (ExpValue ()
                                                                             (27:18)-(27:22)
                                                                             (ValVariable "ifunc"))
                                                                   ScalarDecl
                                                                   Nothing
                                                                   Nothing])),
                     BlStatement ()
                                 (28:7)-(28:22)
                                 Nothing
                                 (StCommon ()
                                           (28:7)-(28:22)
                                           (AList ()
                                                  (28:14)-(28:22)
                                                  [CommonGroup ()
                                                               (28:14)-(28:22)
                                                               (Just ExpValue ()
                                                                              (28:14)-(28:20)
                                                                              (ValVariable "mycom"))
                                                               (AList ()
                                                                      (28:22)-(28:22)
                                                                      [Declarator ()
                                                                                  (28:22)-(28:22)
                                                                                  (ExpValue ()
                                                                                            (28:22)-(28:22)
                                                                                            (ValVariable "i"))
                                                                                  ScalarDecl
                                                                                  Nothing
                                                                                  Nothing])])),
                     BlStatement ()
                                 (29:7)-(29:30)
                                 Nothing
                                 (StWrite ()
                                          (29:7)-(29:30)
                                          (AList ()
                                                 (29:12)-(29:18)
                                                 [ControlPair ()
                                                              (29:13)-(29:13)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (29:13)-(29:13)
                                                                        (ValInteger "6"
                                                                                    Nothing)),
                                                  ControlPair ()
                                                              (29:15)-(29:17)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (29:15)-(29:17)
                                                                        (ValInteger "100"
                                                                                    Nothing))])
                                          (Just AList ()
                                                      (29:20)-(29:30)
                                                      [ExpValue ()
                                                                (29:20)-(29:30)
                                                                (ValString "Hello Ken")])),
                     BlStatement ()
                                 (30:3)-(30:18)
                                 (Just ExpValue ()
                                                (30:3)-(30:5)
                                                (ValInteger "100" Nothing))
                                 (StFormatBogus () (30:7)-(30:18) "(1x,a)"),
                     BlStatement ()
                                 (31:7)-(31:18)
                                 Nothing
                                 (StExpressionAssign ()
                                                     (31:7)-(31:18)
                                                     (ExpValue ()
                                                               (31:7)-(31:7)
                                                               (ValVariable "i"))
                                                     (ExpBinary ()
                                                                (31:11)-(31:18)
                                                                Addition
                                                                (ExpValue ()
                                                                          (31:11)-(31:11)
                                                                          (ValVariable "i"))
                                                                (ExpValue ()
                                                                          (31:15)-(31:18)
                                                                          (ValInteger "1000"
                                                                                      Nothing)))),
                     BlStatement ()
                                 (32:7)-(32:16)
                                 Nothing
                                 (StCall ()
                                         (32:7)-(32:16)
                                         (ExpValue ()
                                                   (32:12)-(32:16)
                                                   (ValVariable "mysub"))
                                         Nothing),
                     BlStatement ()
                                 (33:7)-(33:20)
                                 Nothing
                                 (StExpressionAssign ()
                                                     (33:7)-(33:20)
                                                     (ExpValue ()
                                                               (33:7)-(33:7)
                                                               (ValVariable "i"))
                                                     (ExpFunctionCall ()
                                                                      (33:11)-(33:20)
                                                                      (ExpValue ()
                                                                                (33:11)-(33:15)
                                                                                (ValVariable "ifunc"))
                                                                      (Just AList ()
                                                                                  (33:18)-(33:18)
                                                                                  [Argument ()
                                                                                            (33:18)-(33:18)
                                                                                            Nothing
                                                                                            (ArgExpr (ExpValue ()
                                                                                                               (33:18)-(33:18)
                                                                                                               (ValVariable "i")))]))),
                     BlStatement ()
                                 (34:7)-(34:18)
                                 Nothing
                                 (StWrite ()
                                          (34:7)-(34:18)
                                          (AList ()
                                                 (34:12)-(34:16)
                                                 [ControlPair ()
                                                              (34:13)-(34:13)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (34:13)-(34:13)
                                                                        (ValInteger "6"
                                                                                    Nothing)),
                                                  ControlPair ()
                                                              (34:15)-(34:15)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (34:15)-(34:15)
                                                                        ValStar)])
                                          (Just AList ()
                                                      (34:18)-(34:18)
                                                      [ExpValue ()
                                                                (34:18)-(34:18)
                                                                (ValVariable "i")])),
                     BlStatement ()
                                 (35:7)-(35:10)
                                 Nothing
                                 (StStop () (35:7)-(35:10) Nothing)]
                    Nothing,
             PUSubroutine ()
                          (38:7)-(43:9)
                          (Nothing, Nothing)
                          "mysub"
                          Nothing
                          [BlStatement ()
                                       (39:7)-(39:15)
                                       Nothing
                                       (StDeclaration ()
                                                      (39:7)-(39:15)
                                                      (TypeSpec ()
                                                                (39:7)-(39:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (39:15)-(39:15)
                                                             [Declarator ()
                                                                         (39:15)-(39:15)
                                                                         (ExpValue ()
                                                                                   (39:15)-(39:15)
                                                                                   (ValVariable "i"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (40:7)-(40:22)
                                       Nothing
                                       (StCommon ()
                                                 (40:7)-(40:22)
                                                 (AList ()
                                                        (40:14)-(40:22)
                                                        [CommonGroup ()
                                                                     (40:14)-(40:22)
                                                                     (Just ExpValue ()
                                                                                    (40:14)-(40:20)
                                                                                    (ValVariable "mycom"))
                                                                     (AList ()
                                                                            (40:22)-(40:22)
                                                                            [Declarator ()
                                                                                        (40:22)-(40:22)
                                                                                        (ExpValue ()
                                                                                                  (40:22)-(40:22)
                                                                                                  (ValVariable "i"))
                                                                                        ScalarDecl
                                                                                        Nothing
                                                                                        Nothing])])),
                           BlStatement ()
                                       (41:7)-(41:15)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (41:7)-(41:15)
                                                           (ExpValue ()
                                                                     (41:7)-(41:7)
                                                                     (ValVariable "i"))
                                                           (ExpBinary ()
                                                                      (41:11)-(41:15)
                                                                      Addition
                                                                      (ExpValue ()
                                                                                (41:11)-(41:11)
                                                                                (ValVariable "i"))
                                                                      (ExpValue ()
                                                                                (41:15)-(41:15)
                                                                                (ValInteger "1"
                                                                                            Nothing)))),
                           BlStatement ()
                                       (42:7)-(42:12)
                                       Nothing
                                       (StReturn () (42:7)-(42:12) Nothing)]
                          Nothing,
             PUFunction ()
                        (45:7)-(49:9)
                        (Just TypeSpec () (45:7)-(45:13) TypeInteger Nothing)
                        (Nothing, Nothing)
                        "ifunc"
                        (Just AList ()
                                    (45:31)-(45:31)
                                    [ExpValue ()
                                              (45:31)-(45:31)
                                              (ValVariable "k")])
                        Nothing
                        [BlStatement ()
                                     (46:7)-(46:15)
                                     Nothing
                                     (StDeclaration ()
                                                    (46:7)-(46:15)
                                                    (TypeSpec ()
                                                              (46:7)-(46:13)
                                                              TypeInteger
                                                              Nothing)
                                                    Nothing
                                                    (AList ()
                                                           (46:15)-(46:15)
                                                           [Declarator ()
                                                                       (46:15)-(46:15)
                                                                       (ExpValue ()
                                                                                 (46:15)-(46:15)
                                                                                 (ValVariable "k"))
                                                                       ScalarDecl
                                                                       Nothing
                                                                       Nothing])),
                         BlStatement ()
                                     (47:7)-(47:19)
                                     Nothing
                                     (StExpressionAssign ()
                                                         (47:7)-(47:19)
                                                         (ExpValue ()
                                                                   (47:7)-(47:11)
                                                                   (ValVariable "ifunc"))
                                                         (ExpBinary ()
                                                                    (47:15)-(47:19)
                                                                    Multiplication
                                                                    (ExpValue ()
                                                                              (47:15)-(47:15)
                                                                              (ValVariable "k"))
                                                                    (ExpValue ()
                                                                              (47:19)-(47:19)
                                                                              (ValVariable "k")))),
                         BlStatement ()
                                     (48:7)-(48:12)
                                     Nothing
                                     (StReturn () (48:7)-(48:12) Nothing)]
                        Nothing,
             PUBlockData ()
                         (51:7)-(54:9)
                         (Just "myblck")
                         [BlStatement ()
                                      (52:7)-(52:22)
                                      Nothing
                                      (StCommon ()
                                                (52:7)-(52:22)
                                                (AList ()
                                                       (52:14)-(52:22)
                                                       [CommonGroup ()
                                                                    (52:14)-(52:22)
                                                                    (Just ExpValue ()
                                                                                   (52:14)-(52:20)
                                                                                   (ValVariable "mycom"))
                                                                    (AList ()
                                                                           (52:22)-(52:22)
                                                                           [Declarator ()
                                                                                       (52:22)-(52:22)
                                                                                       (ExpValue ()
                                                                                                 (52:22)-(52:22)
                                                                                                 (ValVariable "i"))
                                                                                       ScalarDecl
                                                                                       Nothing
                                                                                       Nothing])])),
                          BlStatement ()
                                      (53:7)-(53:20)
                                      Nothing
                                      (StData ()
                                              (53:7)-(53:20)
                                              (AList ()
                                                     (53:12)-(53:20)
                                                     [DataGroup ()
                                                                (53:12)-(53:20)
                                                                (AList ()
                                                                       (53:12)-(53:12)
                                                                       [ExpValue ()
                                                                                 (53:12)-(53:12)
                                                                                 (ValVariable "i")])
                                                                (AList ()
                                                                       (53:15)-(53:19)
                                                                       [ExpValue ()
                                                                                 (53:15)-(53:19)
                                                                                 (ValInteger "12345"
                                                                                             Nothing)])]))],
             PUComment ()
                       (55:1)-(55:72)
                       (Comment "----------------------------------------------------------------------^")]
'
]

{ #category : #'fortran77-annoted' }
PP2FortranSrcGrammarTest class >> exampleWithMultipleProgUnitFortran [

	^ 'C NPAC F77 EXAMPLE 001, SHOWING SOURCE CODE LAYOUT.
C        1         2         3         4         5         6         7
C---------------THIS IS A COMMENT---------------------------------------V
Col. 1    : Blank, or a "c" or "*" for comments
Col. 1-5  : Statement label (optional)
Col. 6    : Continuation of previous line (optional)
Col. 7-72 : Statements
Col. 73-80: Sequence number (optional, rarely used today)
C Program Layout:
C----------------------------------------------------------------------+
C Block data, function program, subroutine                             |
C-----------------+----------------+-----------------------------------+
C FORMAT          | PARAMETER      | IMPLICIT                          |
C                 |                +-----------------------------------+
C                 |                | type declarations and other spec  |
C                 |                | statement: COMMON, DIMENSION, SAVE|
C                 |                | EQUIVALENCE, EXTERNAL, INTRINSIC  |
C                 +----------------+-----------------------------------+ 
C                 | DATA           | statement functions               |  
C                 |                +-----------------------------------+
C                 |                | executable statements             |
C-----------------+----------------+-----------------------------------+                
C END                                                                  |  
C----------------------------------------------------------------------+
C234567890123456789012345678901234567890123456789012345678901234567890123
      program myprog
      integer i, ifunc
      common /mycom/ i
      write(6,100) ''Hello Ken''
  100 format(1x,A)
      i = i + 1000
      call mysub
      i = ifunc( i )
      write(6,*) i
      stop
      end

      subroutine mysub
      integer i
      common /mycom/ i
      i = i + 1
      return
      end

      integer function ifunc( k )
      integer k
      ifunc = k * k
      return
      end
   
      block data myblck
      common /mycom/ i
      data i /12345/
      end
C----------------------------------------------------------------------^
'
]

{ #category : #'filesytem-inmemory' }
PP2FortranSrcGrammarTest class >> findbk [

	^ (self workDir / 'findbk.0.e.f') ensureCreateFile writeStreamDo: [ 
		  :stream | stream << self findbkFortran ]
]

{ #category : #'AST-fortranSrc' }
PP2FortranSrcGrammarTest class >> findbkAST [

	^ 'ProgramFile (MetaInfo
                     {miVersion = Fortran77,
                      miFilename = "/demo-bib/build/findbk.0.e.f"})
            [PUFunction ()
                        (1:7)-(103:9)
                        (Just TypeSpec () (1:7)-(1:13) TypeInteger Nothing)
                        (Nothing, Nothing)
                        "findbk"
                        (Just AList ()
                                    (1:31)-(1:39)
                                    [ExpValue ()
                                              (1:31)-(1:33)
                                              (ValVariable "lib"),
                                     ExpValue ()
                                              (1:35)-(1:39)
                                              (ValVariable "title")])
                        Nothing
                        [BlStatement ()
                                     (2:7)-(2:19)
                                     Nothing
                                     (StImplicit () (2:7)-(2:19) Nothing),
                         BlComment ()
                                   (5:1)-(5:62)
                                   (Comment "2345678901234567890123456789012345678901234567890123456789012"),
                         BlComment ()
                                   (6:1)-(6:28)
                                   (Comment " bref(brcnt) array of books"),
                         BlComment ()
                                   (7:1)-(7:28)
                                   (Comment " uref(urcnt) array of users"),
                         BlComment ()
                                   (8:1)-(8:47)
                                   (Comment " bstatu(brcnt) logical array of borrowed books"),
                         BlComment ()
                                   (9:1)-(9:49)
                                   (Comment " ubb(ubbcnt) array of books borrowed by the user"),
                         BlComment () (11:1)-(11:12) (Comment ": maillon 1"),
                         BlStatement ()
                                     (12:7)-(12:19)
                                     Nothing
                                     (StDeclaration ()
                                                    (12:7)-(12:19)
                                                    (TypeSpec ()
                                                              (12:7)-(12:13)
                                                              TypeInteger
                                                              Nothing)
                                                    Nothing
                                                    (AList ()
                                                           (12:15)-(12:19)
                                                           [Declarator ()
                                                                       (12:15)-(12:19)
                                                                       (ExpValue ()
                                                                                 (12:15)-(12:19)
                                                                                 (ValVariable "brcnt"))
                                                                       ScalarDecl
                                                                       Nothing
                                                                       Nothing])),
                         BlStatement ()
                                     (13:7)-(13:19)
                                     Nothing
                                     (StDeclaration ()
                                                    (13:7)-(13:19)
                                                    (TypeSpec ()
                                                              (13:7)-(13:13)
                                                              TypeInteger
                                                              Nothing)
                                                    Nothing
                                                    (AList ()
                                                           (13:15)-(13:19)
                                                           [Declarator ()
                                                                       (13:15)-(13:19)
                                                                       (ExpValue ()
                                                                                 (13:15)-(13:19)
                                                                                 (ValVariable "urcnt"))
                                                                       ScalarDecl
                                                                       Nothing
                                                                       Nothing])),
                         BlStatement ()
                                     (14:7)-(14:20)
                                     Nothing
                                     (StDeclaration ()
                                                    (14:7)-(14:20)
                                                    (TypeSpec ()
                                                              (14:7)-(14:13)
                                                              TypeInteger
                                                              Nothing)
                                                    Nothing
                                                    (AList ()
                                                           (14:15)-(14:20)
                                                           [Declarator ()
                                                                       (14:15)-(14:20)
                                                                       (ExpValue ()
                                                                                 (14:15)-(14:20)
                                                                                 (ValVariable "ubbcnt"))
                                                                       ScalarDecl
                                                                       Nothing
                                                                       Nothing])),
                         BlComment ()
                                   (16:1)-(16:18)
                                   (Comment " segment de t\227\170te"),
                         BlComment ()
                                   (17:1)-(17:19)
                                   (Comment "eso  segment, tlib"),
                         BlComment ()
                                   (18:1)-(18:27)
                                   (Comment "eso    integer bref(brcnt)"),
                         BlComment ()
                                   (19:1)-(19:29)
                                   (Comment "eso    logical bstatu(brcnt)"),
                         BlComment ()
                                   (20:1)-(20:27)
                                   (Comment "eso    integer uref(urcnt)"),
                         BlComment ()
                                   (21:1)-(21:17)
                                   (Comment "eso  end segment"),
                         BlComment ()
                                   (23:1)-(23:19)
                                   (Comment "eso  segment, book"),
                         BlComment ()
                                   (24:1)-(24:27)
                                   (Comment "eso    character*40 btitle"),
                         BlComment ()
                                   (25:1)-(25:22)
                                   (Comment "eso    integer bpages"),
                         BlComment ()
                                   (26:1)-(26:17)
                                   (Comment "eso    real budc"),
                         BlComment ()
                                   (27:1)-(27:17)
                                   (Comment "eso  end segment"),
                         BlComment ()
                                   (29:1)-(29:19)
                                   (Comment "eso  segment, user"),
                         BlComment ()
                                   (30:1)-(30:26)
                                   (Comment "eso    character*40 uname"),
                         BlComment ()
                                   (31:1)-(31:27)
                                   (Comment "eso    integer ubb(ubbcnt)"),
                         BlComment ()
                                   (32:1)-(32:17)
                                   (Comment "eso  end segment"),
                         BlComment ()
                                   (34:1)-(34:67)
                                   (Comment "******************************************************************"),
                         BlComment ()
                                   (36:1)-(36:62)
                                   (Comment "2345678901234567890123456789012345678901234567890123456789012"),
                         BlComment () (37:1)-(37:6) (Comment "-pstr"),
                         BlComment ()
                                   (38:1)-(38:62)
                                   (Comment ":pstr   segment dentete des structures : nouvelles definition"),
                         BlComment ()
                                   (39:1)-(39:72)
                                   (Comment ":nomcod nom du code auquel appartient la structure (cronos, apollo, ..)"),
                         BlComment ()
                                   (40:1)-(40:29)
                                   (Comment ":date   date de debut de job"),
                         BlComment ()
                                   (41:1)-(41:30)
                                   (Comment ":heure  heure de debut de job"),
                         BlComment ()
                                   (42:1)-(42:54)
                                   (Comment ":typseg type des segments appartenants a la structure"),
                         BlComment ()
                                   (43:1)-(43:53)
                                   (Comment ":typref type des objects references par la structure"),
                         BlComment ()
                                   (44:1)-(44:53)
                                   (Comment ":ibseg  numero max. du segment ajoute a la structure"),
                         BlComment ()
                                   (45:1)-(45:58)
                                   (Comment ":ibref  numero max. de lobject reference par la structure"),
                         BlComment ()
                                   (46:1)-(46:58)
                                   (Comment ":pntseg pointeurs des segments apartenants a la structure"),
                         BlComment ()
                                   (47:1)-(47:58)
                                   (Comment ":pntref pointeurs des objects references par la structure"),
                         BlComment ()
                                   (48:1)-(48:19)
                                   (Comment "eso  segment, pstr"),
                         BlComment ()
                                   (49:1)-(49:70)
                                   (Comment "eso    character*8 nomcode, date, heure, typseg(nbseg), typref(nbref)"),
                         BlComment ()
                                   (50:1)-(50:70)
                                   (Comment "eso    integer     ibseg, ibref,         pntseg(nbseg), pntref(nbref)"),
                         BlComment ()
                                   (51:1)-(51:16)
                                   (Comment "eso  endsegment"),
                         BlComment ()
                                   (52:1)-(52:62)
                                   (Comment "-------------------------------------------------------------"),
                         BlComment ()
                                   (55:1)-(55:17)
                                   (Comment " dummy arguments"),
                         BlComment ()
                                   (56:1)-(56:23)
                                   (Comment "eso  pointeur lib.pstr"),
                         BlStatement ()
                                     (57:7)-(57:25)
                                     Nothing
                                     (StDeclaration ()
                                                    (57:7)-(57:25)
                                                    (TypeSpec ()
                                                              (57:7)-(57:19)
                                                              TypeCharacter
                                                              (Just Selector ()
                                                                             (57:16)-(57:19)
                                                                             (Just ExpValue ()
                                                                                            (57:18)-(57:18)
                                                                                            ValStar)
                                                                             Nothing))
                                                    Nothing
                                                    (AList ()
                                                           (57:21)-(57:25)
                                                           [Declarator ()
                                                                       (57:21)-(57:25)
                                                                       (ExpValue ()
                                                                                 (57:21)-(57:25)
                                                                                 (ValVariable "title"))
                                                                       ScalarDecl
                                                                       Nothing
                                                                       Nothing])),
                         BlComment ()
                                   (59:1)-(59:50)
                                   (Comment " use of external for mypnt since it is a function"),
                         BlStatement ()
                                     (60:7)-(60:20)
                                     Nothing
                                     (StExternal ()
                                                 (60:7)-(60:20)
                                                 (AList ()
                                                        (60:16)-(60:20)
                                                        [ExpValue ()
                                                                  (60:16)-(60:20)
                                                                  (ValVariable "mypnt")])),
                         BlStatement ()
                                     (61:7)-(61:19)
                                     Nothing
                                     (StDeclaration ()
                                                    (61:7)-(61:19)
                                                    (TypeSpec ()
                                                              (61:7)-(61:13)
                                                              TypeInteger
                                                              Nothing)
                                                    Nothing
                                                    (AList ()
                                                           (61:15)-(61:19)
                                                           [Declarator ()
                                                                       (61:15)-(61:19)
                                                                       (ExpValue ()
                                                                                 (61:15)-(61:19)
                                                                                 (ValVariable "mypnt"))
                                                                       ScalarDecl
                                                                       Nothing
                                                                       Nothing])),
                         BlComment ()
                                   (64:1)-(64:17)
                                   (Comment " local variables"),
                         BlComment ()
                                   (66:1)-(66:22)
                                   (Comment "eso  pointeur bk.book"),
                         BlComment ()
                                   (67:1)-(67:22)
                                   (Comment "eso  pointeur lb.tlib"),
                         BlStatement ()
                                     (68:7)-(68:17)
                                     Nothing
                                     (StDeclaration ()
                                                    (68:7)-(68:17)
                                                    (TypeSpec ()
                                                              (68:7)-(68:13)
                                                              TypeInteger
                                                              Nothing)
                                                    Nothing
                                                    (AList ()
                                                           (68:15)-(68:17)
                                                           [Declarator ()
                                                                       (68:15)-(68:17)
                                                                       (ExpValue ()
                                                                                 (68:15)-(68:17)
                                                                                 (ValVariable "ibk"))
                                                                       ScalarDecl
                                                                       Nothing
                                                                       Nothing])),
                         BlStatement ()
                                     (69:7)-(69:26)
                                     Nothing
                                     (StDeclaration ()
                                                    (69:7)-(69:26)
                                                    (TypeSpec ()
                                                              (69:7)-(69:19)
                                                              TypeCharacter
                                                              (Just Selector ()
                                                                             (69:16)-(69:19)
                                                                             (Just ExpValue ()
                                                                                            (69:17)-(69:19)
                                                                                            (ValInteger "200"
                                                                                                        Nothing))
                                                                             Nothing))
                                                    Nothing
                                                    (AList ()
                                                           (69:21)-(69:26)
                                                           [Declarator ()
                                                                       (69:21)-(69:26)
                                                                       (ExpValue ()
                                                                                 (69:21)-(69:26)
                                                                                 (ValVariable "fndnam"))
                                                                       ScalarDecl
                                                                       Nothing
                                                                       Nothing])),
                         BlStatement ()
                                     (70:7)-(70:20)
                                     Nothing
                                     (StDeclaration ()
                                                    (70:7)-(70:20)
                                                    (TypeSpec ()
                                                              (70:7)-(70:13)
                                                              TypeLogical
                                                              Nothing)
                                                    Nothing
                                                    (AList ()
                                                           (70:15)-(70:20)
                                                           [Declarator ()
                                                                       (70:15)-(70:20)
                                                                       (ExpValue ()
                                                                                 (70:15)-(70:20)
                                                                                 (ValVariable "bkflag"))
                                                                       ScalarDecl
                                                                       Nothing
                                                                       Nothing])),
                         BlStatement ()
                                     (72:7)-(72:22)
                                     Nothing
                                     (StExpressionAssign ()
                                                         (72:7)-(72:22)
                                                         (ExpValue ()
                                                                   (72:7)-(72:12)
                                                                   (ValVariable "bkflag"))
                                                         (ExpValue ()
                                                                   (72:16)-(72:22)
                                                                   (ValLogical False
                                                                               Nothing))),
                         BlStatement ()
                                     (74:7)-(74:22)
                                     Nothing
                                     (StCall ()
                                             (74:7)-(74:22)
                                             (ExpValue ()
                                                       (74:12)-(74:17)
                                                       (ValVariable "actstr"))
                                             (Just AList ()
                                                         (74:18)-(74:22)
                                                         [Argument ()
                                                                   (74:19)-(74:21)
                                                                   Nothing
                                                                   (ArgExpr (ExpValue ()
                                                                                      (74:19)-(74:21)
                                                                                      (ValVariable "lib")))])),
                         BlStatement ()
                                     (75:7)-(75:23)
                                     Nothing
                                     (StExpressionAssign ()
                                                         (75:7)-(75:23)
                                                         (ExpValue ()
                                                                   (75:7)-(75:8)
                                                                   (ValVariable "lb"))
                                                         (ExpFunctionCall ()
                                                                          (75:12)-(75:23)
                                                                          (ExpValue ()
                                                                                    (75:12)-(75:16)
                                                                                    (ValVariable "mypnt"))
                                                                          (Just AList ()
                                                                                      (75:18)-(75:22)
                                                                                      [Argument ()
                                                                                                (75:18)-(75:20)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (75:18)-(75:20)
                                                                                                                   (ValVariable "lib"))),
                                                                                       Argument ()
                                                                                                (75:22)-(75:22)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (75:22)-(75:22)
                                                                                                                   (ValInteger "1"
                                                                                                                               Nothing)))]))),
                         BlComment ()
                                   (76:1)-(76:23)
                                   (Comment "eso  segact, lb       "),
                         BlStatement ()
                                     (77:7)-(77:37)
                                     Nothing
                                     (StExpressionAssign ()
                                                         (77:7)-(77:37)
                                                         (ExpValue ()
                                                                   (77:7)-(77:11)
                                                                   (ValVariable "urcnt"))
                                                         (ExpFunctionCall ()
                                                                          (77:15)-(77:37)
                                                                          (ExpValue ()
                                                                                    (77:15)-(77:19)
                                                                                    (ValVariable "esosl"))
                                                                          (Just AList ()
                                                                                      (77:21)-(77:36)
                                                                                      [Argument ()
                                                                                                (77:21)-(77:34)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpFunctionCall ()
                                                                                                                          (77:21)-(77:34)
                                                                                                                          (ExpValue ()
                                                                                                                                    (77:21)-(77:25)
                                                                                                                                    (ValVariable "esoat"))
                                                                                                                          (Just AList ()
                                                                                                                                      (77:27)-(77:33)
                                                                                                                                      [Argument ()
                                                                                                                                                (77:27)-(77:28)
                                                                                                                                                Nothing
                                                                                                                                                (ArgExpr (ExpValue ()
                                                                                                                                                                   (77:27)-(77:28)
                                                                                                                                                                   (ValVariable "lb"))),
                                                                                                                                       Argument ()
                                                                                                                                                (77:30)-(77:33)
                                                                                                                                                Nothing
                                                                                                                                                (ArgExpr (ExpValue ()
                                                                                                                                                                   (77:30)-(77:33)
                                                                                                                                                                   (ValVariable "uref")))]))),
                                                                                       Argument ()
                                                                                                (77:36)-(77:36)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (77:36)-(77:36)
                                                                                                                   (ValInteger "1"
                                                                                                                               Nothing)))]))),
                         BlStatement ()
                                     (78:7)-(78:37)
                                     Nothing
                                     (StExpressionAssign ()
                                                         (78:7)-(78:37)
                                                         (ExpValue ()
                                                                   (78:7)-(78:11)
                                                                   (ValVariable "brcnt"))
                                                         (ExpFunctionCall ()
                                                                          (78:15)-(78:37)
                                                                          (ExpValue ()
                                                                                    (78:15)-(78:19)
                                                                                    (ValVariable "esosl"))
                                                                          (Just AList ()
                                                                                      (78:21)-(78:36)
                                                                                      [Argument ()
                                                                                                (78:21)-(78:34)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpFunctionCall ()
                                                                                                                          (78:21)-(78:34)
                                                                                                                          (ExpValue ()
                                                                                                                                    (78:21)-(78:25)
                                                                                                                                    (ValVariable "esoat"))
                                                                                                                          (Just AList ()
                                                                                                                                      (78:27)-(78:33)
                                                                                                                                      [Argument ()
                                                                                                                                                (78:27)-(78:28)
                                                                                                                                                Nothing
                                                                                                                                                (ArgExpr (ExpValue ()
                                                                                                                                                                   (78:27)-(78:28)
                                                                                                                                                                   (ValVariable "lb"))),
                                                                                                                                       Argument ()
                                                                                                                                                (78:30)-(78:33)
                                                                                                                                                Nothing
                                                                                                                                                (ArgExpr (ExpValue ()
                                                                                                                                                                   (78:30)-(78:33)
                                                                                                                                                                   (ValVariable "bref")))]))),
                                                                                       Argument ()
                                                                                                (78:36)-(78:36)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (78:36)-(78:36)
                                                                                                                   (ValInteger "1"
                                                                                                                               Nothing)))]))),
                         BlDo ()
                              (80:7)-(91:12)
                              Nothing
                              Nothing
                              Nothing
                              (Just DoSpecification ()
                                                    (80:10)-(80:21)
                                                    (StExpressionAssign ()
                                                                        (80:10)-(80:14)
                                                                        (ExpValue ()
                                                                                  (80:10)-(80:12)
                                                                                  (ValVariable "ibk"))
                                                                        (ExpValue ()
                                                                                  (80:14)-(80:14)
                                                                                  (ValInteger "1"
                                                                                              Nothing)))
                                                    (ExpValue ()
                                                              (80:17)-(80:21)
                                                              (ValVariable "brcnt"))
                                                    Nothing)
                              [BlStatement ()
                                           (81:9)-(81:49)
                                           Nothing
                                           (StExpressionAssign ()
                                                               (81:9)-(81:49)
                                                               (ExpValue ()
                                                                         (81:9)-(81:10)
                                                                         (ValVariable "bk"))
                                                               (ExpFunctionCall ()
                                                                                (81:14)-(81:49)
                                                                                (ExpValue ()
                                                                                          (81:14)-(81:18)
                                                                                          (ValVariable "mypnt"))
                                                                                (Just AList ()
                                                                                            (81:20)-(81:48)
                                                                                            [Argument ()
                                                                                                      (81:20)-(81:22)
                                                                                                      Nothing
                                                                                                      (ArgExpr (ExpValue ()
                                                                                                                         (81:20)-(81:22)
                                                                                                                         (ValVariable "lib"))),
                                                                                             Argument ()
                                                                                                      (81:24)-(81:48)
                                                                                                      Nothing
                                                                                                      (ArgExpr (ExpFunctionCall ()
                                                                                                                                (81:24)-(81:48)
                                                                                                                                (ExpValue ()
                                                                                                                                          (81:24)-(81:28)
                                                                                                                                          (ValVariable "esoar"))
                                                                                                                                (Just AList ()
                                                                                                                                            (81:30)-(81:47)
                                                                                                                                            [Argument ()
                                                                                                                                                      (81:30)-(81:43)
                                                                                                                                                      Nothing
                                                                                                                                                      (ArgExpr (ExpFunctionCall ()
                                                                                                                                                                                (81:30)-(81:43)
                                                                                                                                                                                (ExpValue ()
                                                                                                                                                                                          (81:30)-(81:34)
                                                                                                                                                                                          (ValVariable "esoat"))
                                                                                                                                                                                (Just AList ()
                                                                                                                                                                                            (81:36)-(81:42)
                                                                                                                                                                                            [Argument ()
                                                                                                                                                                                                      (81:36)-(81:37)
                                                                                                                                                                                                      Nothing
                                                                                                                                                                                                      (ArgExpr (ExpValue ()
                                                                                                                                                                                                                         (81:36)-(81:37)
                                                                                                                                                                                                                         (ValVariable "lb"))),
                                                                                                                                                                                             Argument ()
                                                                                                                                                                                                      (81:39)-(81:42)
                                                                                                                                                                                                      Nothing
                                                                                                                                                                                                      (ArgExpr (ExpValue ()
                                                                                                                                                                                                                         (81:39)-(81:42)
                                                                                                                                                                                                                         (ValVariable "bref")))]))),
                                                                                                                                             Argument ()
                                                                                                                                                      (81:45)-(81:47)
                                                                                                                                                      Nothing
                                                                                                                                                      (ArgExpr (ExpValue ()
                                                                                                                                                                         (81:45)-(81:47)
                                                                                                                                                                         (ValVariable "ibk")))])))]))),
                               BlComment ()
                                         (82:1)-(82:18)
                                         (Comment "eso    segact, bk"),
                               BlStatement ()
                                           (83:9)-(83:27)
                                           Nothing
                                           (StWrite ()
                                                    (83:9)-(83:27)
                                                    (AList ()
                                                           (83:14)-(83:18)
                                                           [ControlPair ()
                                                                        (83:15)-(83:15)
                                                                        Nothing
                                                                        (ExpValue ()
                                                                                  (83:15)-(83:15)
                                                                                  ValStar),
                                                            ControlPair ()
                                                                        (83:17)-(83:17)
                                                                        Nothing
                                                                        (ExpValue ()
                                                                                  (83:17)-(83:17)
                                                                                  ValStar)])
                                                    (Just AList ()
                                                                (83:20)-(83:27)
                                                                [ExpValue ()
                                                                          (83:20)-(83:23)
                                                                          (ValString "bk"),
                                                                 ExpValue ()
                                                                          (83:26)-(83:27)
                                                                          (ValVariable "bk")])),
                               BlComment ()
                                         (84:1)-(84:42)
                                         (Comment "       write(*,*) ''book title'', bk.btitle"),
                               BlStatement ()
                                           (85:9)-(85:33)
                                           Nothing
                                           (StExpressionAssign ()
                                                               (85:9)-(85:33)
                                                               (ExpValue ()
                                                                         (85:9)-(85:14)
                                                                         (ValVariable "fndnam"))
                                                               (ExpFunctionCall ()
                                                                                (85:18)-(85:33)
                                                                                (ExpValue ()
                                                                                          (85:18)-(85:22)
                                                                                          (ValVariable "esoat"))
                                                                                (Just AList ()
                                                                                            (85:24)-(85:32)
                                                                                            [Argument ()
                                                                                                      (85:24)-(85:25)
                                                                                                      Nothing
                                                                                                      (ArgExpr (ExpValue ()
                                                                                                                         (85:24)-(85:25)
                                                                                                                         (ValVariable "bk"))),
                                                                                             Argument ()
                                                                                                      (85:27)-(85:32)
                                                                                                      Nothing
                                                                                                      (ArgExpr (ExpValue ()
                                                                                                                         (85:27)-(85:32)
                                                                                                                         (ValVariable "btitle")))]))),
                               BlComment ()
                                         (86:1)-(86:24)
                                         (Comment "eso    segdes, bk*nomod"),
                               BlIf ()
                                    (87:9)-(90:14)
                                    Nothing
                                    Nothing
                                    [Just ExpBinary ()
                                                    (87:13)-(87:41)
                                                    EQ
                                                    (ExpFunctionCall ()
                                                                     (87:13)-(87:24)
                                                                     (ExpValue ()
                                                                               (87:13)-(87:16)
                                                                               (ValVariable "trim"))
                                                                     (Just AList ()
                                                                                 (87:18)-(87:23)
                                                                                 [Argument ()
                                                                                           (87:18)-(87:23)
                                                                                           Nothing
                                                                                           (ArgExpr (ExpValue ()
                                                                                                              (87:18)-(87:23)
                                                                                                              (ValVariable "fndnam")))]))
                                                    (ExpFunctionCall ()
                                                                     (87:31)-(87:41)
                                                                     (ExpValue ()
                                                                               (87:31)-(87:34)
                                                                               (ValVariable "trim"))
                                                                     (Just AList ()
                                                                                 (87:36)-(87:40)
                                                                                 [Argument ()
                                                                                           (87:36)-(87:40)
                                                                                           Nothing
                                                                                           (ArgExpr (ExpValue ()
                                                                                                              (87:36)-(87:40)
                                                                                                              (ValVariable "title")))]))]
                                    [[BlStatement ()
                                                  (88:11)-(88:25)
                                                  Nothing
                                                  (StExpressionAssign ()
                                                                      (88:11)-(88:25)
                                                                      (ExpValue ()
                                                                                (88:11)-(88:16)
                                                                                (ValVariable "bkflag"))
                                                                      (ExpValue ()
                                                                                (88:20)-(88:25)
                                                                                (ValLogical True
                                                                                            Nothing))),
                                      BlStatement ()
                                                  (89:11)-(89:18)
                                                  Nothing
                                                  (StGotoUnconditional ()
                                                                       (89:11)-(89:18)
                                                                       (ExpValue ()
                                                                                 (89:16)-(89:18)
                                                                                 (ValInteger "100"
                                                                                             Nothing)))]]
                                    Nothing]
                              Nothing,
                         BlStatement ()
                                     (93:2)-(93:14)
                                     (Just ExpValue ()
                                                    (93:2)-(93:4)
                                                    (ValInteger "100" Nothing))
                                     (StContinue () (93:7)-(93:14)),
                         BlComment ()
                                   (94:1)-(94:22)
                                   (Comment "eso  segdes, lb*nomod"),
                         BlStatement ()
                                     (95:7)-(95:30)
                                     Nothing
                                     (StCall ()
                                             (95:7)-(95:30)
                                             (ExpValue ()
                                                       (95:12)-(95:17)
                                                       (ValVariable "desstr"))
                                             (Just AList ()
                                                         (95:18)-(95:30)
                                                         [Argument ()
                                                                   (95:19)-(95:21)
                                                                   Nothing
                                                                   (ArgExpr (ExpValue ()
                                                                                      (95:19)-(95:21)
                                                                                      (ValVariable "lib"))),
                                                          Argument ()
                                                                   (95:23)-(95:29)
                                                                   Nothing
                                                                   (ArgExpr (ExpValue ()
                                                                                      (95:23)-(95:29)
                                                                                      (ValString "nomod")))])),
                         BlIf ()
                              (97:7)-(101:12)
                              Nothing
                              Nothing
                              [Just ExpValue ()
                                             (97:11)-(97:16)
                                             (ValVariable "bkflag"),
                               Nothing]
                              [[BlStatement ()
                                            (98:9)-(98:20)
                                            Nothing
                                            (StExpressionAssign ()
                                                                (98:9)-(98:20)
                                                                (ExpValue ()
                                                                          (98:9)-(98:14)
                                                                          (ValVariable "findbk"))
                                                                (ExpValue ()
                                                                          (98:18)-(98:20)
                                                                          (ValVariable "ibk")))],
                               [BlStatement ()
                                            (100:9)-(100:18)
                                            Nothing
                                            (StExpressionAssign ()
                                                                (100:9)-(100:18)
                                                                (ExpValue ()
                                                                          (100:9)-(100:14)
                                                                          (ValVariable "findbk"))
                                                                (ExpValue ()
                                                                          (100:18)-(100:18)
                                                                          (ValInteger "0"
                                                                                      Nothing)))]]
                              Nothing]
                        Nothing]
'
]

{ #category : #'fortran77-annoted' }
PP2FortranSrcGrammarTest class >> findbkFortran [

	^ '      integer function findbk(lib,title)
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
      character*(*) title

c use of external for mypnt since it is a function
      external mypnt
      integer mypnt

     
c local variables

cESO  pointeur bk.book
cESO  pointeur lb.tlib
      integer ibk
      character*200 fndnam
      logical bkflag

      bkflag = .false.

      call actstr(lib)
      lb = mypnt(lib,1)
cESO  segact, lb       
      urcnt = ESOsl(ESOat(lb,uref),1)
      brcnt = ESOsl(ESOat(lb,bref),1)
  
      do ibk=1, brcnt
        bk = mypnt(lib,ESOar(ESOat(lb,bref),ibk))
cESO    segact, bk
        write(*,*) ''bk'', bk
c       write(*,*) ''book title'', bk.btitle
        fndnam = ESOat(bk,btitle)
cESO    segdes, bk*nomod
        if (trim(fndnam) .eq. trim(title)) then
          bkflag = .true.
          goto 100
        end if
      end do

 100  continue
cESO  segdes, lb*nomod
      call desstr(lib,''nomod'')

      if (bkflag) then
        findbk = ibk
      else
        findbk = 0
      end if
 
      end
'
]

{ #category : #'filesytem-inmemory' }
PP2FortranSrcGrammarTest class >> findur [

	^ (self workDir / 'findur.0.e.f') ensureCreateFile writeStreamDo: [ 
		  :stream | stream << self findurFortran ]
]

{ #category : #'AST-fortranSrc' }
PP2FortranSrcGrammarTest class >> findurAST [

	^ 'ProgramFile (MetaInfo
                     {miVersion = Fortran77,
                      miFilename = "/demo-bib/build/findur.0.e.f"})
            [PUFunction ()
                        (1:7)-(103:9)
                        (Just TypeSpec () (1:7)-(1:13) TypeInteger Nothing)
                        (Nothing, Nothing)
                        "findur"
                        (Just AList ()
                                    (1:31)-(1:38)
                                    [ExpValue ()
                                              (1:31)-(1:33)
                                              (ValVariable "lib"),
                                     ExpValue ()
                                              (1:35)-(1:38)
                                              (ValVariable "name")])
                        Nothing
                        [BlStatement ()
                                     (2:7)-(2:19)
                                     Nothing
                                     (StImplicit () (2:7)-(2:19) Nothing),
                         BlComment ()
                                   (5:1)-(5:62)
                                   (Comment "2345678901234567890123456789012345678901234567890123456789012"),
                         BlComment ()
                                   (6:1)-(6:28)
                                   (Comment " bref(brcnt) array of books"),
                         BlComment ()
                                   (7:1)-(7:28)
                                   (Comment " uref(urcnt) array of users"),
                         BlComment ()
                                   (8:1)-(8:47)
                                   (Comment " bstatu(brcnt) logical array of borrowed books"),
                         BlComment ()
                                   (9:1)-(9:49)
                                   (Comment " ubb(ubbcnt) array of books borrowed by the user"),
                         BlComment () (11:1)-(11:12) (Comment ": maillon 1"),
                         BlStatement ()
                                     (12:7)-(12:19)
                                     Nothing
                                     (StDeclaration ()
                                                    (12:7)-(12:19)
                                                    (TypeSpec ()
                                                              (12:7)-(12:13)
                                                              TypeInteger
                                                              Nothing)
                                                    Nothing
                                                    (AList ()
                                                           (12:15)-(12:19)
                                                           [Declarator ()
                                                                       (12:15)-(12:19)
                                                                       (ExpValue ()
                                                                                 (12:15)-(12:19)
                                                                                 (ValVariable "brcnt"))
                                                                       ScalarDecl
                                                                       Nothing
                                                                       Nothing])),
                         BlStatement ()
                                     (13:7)-(13:19)
                                     Nothing
                                     (StDeclaration ()
                                                    (13:7)-(13:19)
                                                    (TypeSpec ()
                                                              (13:7)-(13:13)
                                                              TypeInteger
                                                              Nothing)
                                                    Nothing
                                                    (AList ()
                                                           (13:15)-(13:19)
                                                           [Declarator ()
                                                                       (13:15)-(13:19)
                                                                       (ExpValue ()
                                                                                 (13:15)-(13:19)
                                                                                 (ValVariable "urcnt"))
                                                                       ScalarDecl
                                                                       Nothing
                                                                       Nothing])),
                         BlStatement ()
                                     (14:7)-(14:20)
                                     Nothing
                                     (StDeclaration ()
                                                    (14:7)-(14:20)
                                                    (TypeSpec ()
                                                              (14:7)-(14:13)
                                                              TypeInteger
                                                              Nothing)
                                                    Nothing
                                                    (AList ()
                                                           (14:15)-(14:20)
                                                           [Declarator ()
                                                                       (14:15)-(14:20)
                                                                       (ExpValue ()
                                                                                 (14:15)-(14:20)
                                                                                 (ValVariable "ubbcnt"))
                                                                       ScalarDecl
                                                                       Nothing
                                                                       Nothing])),
                         BlComment ()
                                   (16:1)-(16:18)
                                   (Comment " segment de t\227\170te"),
                         BlComment ()
                                   (17:1)-(17:19)
                                   (Comment "eso  segment, tlib"),
                         BlComment ()
                                   (18:1)-(18:27)
                                   (Comment "eso    integer bref(brcnt)"),
                         BlComment ()
                                   (19:1)-(19:29)
                                   (Comment "eso    logical bstatu(brcnt)"),
                         BlComment ()
                                   (20:1)-(20:27)
                                   (Comment "eso    integer uref(urcnt)"),
                         BlComment ()
                                   (21:1)-(21:17)
                                   (Comment "eso  end segment"),
                         BlComment ()
                                   (23:1)-(23:19)
                                   (Comment "eso  segment, book"),
                         BlComment ()
                                   (24:1)-(24:27)
                                   (Comment "eso    character*40 btitle"),
                         BlComment ()
                                   (25:1)-(25:22)
                                   (Comment "eso    integer bpages"),
                         BlComment ()
                                   (26:1)-(26:17)
                                   (Comment "eso    real budc"),
                         BlComment ()
                                   (27:1)-(27:17)
                                   (Comment "eso  end segment"),
                         BlComment ()
                                   (29:1)-(29:19)
                                   (Comment "eso  segment, user"),
                         BlComment ()
                                   (30:1)-(30:26)
                                   (Comment "eso    character*40 uname"),
                         BlComment ()
                                   (31:1)-(31:27)
                                   (Comment "eso    integer ubb(ubbcnt)"),
                         BlComment ()
                                   (32:1)-(32:17)
                                   (Comment "eso  end segment"),
                         BlComment ()
                                   (34:1)-(34:67)
                                   (Comment "******************************************************************"),
                         BlComment ()
                                   (36:1)-(36:62)
                                   (Comment "2345678901234567890123456789012345678901234567890123456789012"),
                         BlComment () (37:1)-(37:6) (Comment "-pstr"),
                         BlComment ()
                                   (38:1)-(38:62)
                                   (Comment ":pstr   segment dentete des structures : nouvelles definition"),
                         BlComment ()
                                   (39:1)-(39:72)
                                   (Comment ":nomcod nom du code auquel appartient la structure (cronos, apollo, ..)"),
                         BlComment ()
                                   (40:1)-(40:29)
                                   (Comment ":date   date de debut de job"),
                         BlComment ()
                                   (41:1)-(41:30)
                                   (Comment ":heure  heure de debut de job"),
                         BlComment ()
                                   (42:1)-(42:54)
                                   (Comment ":typseg type des segments appartenants a la structure"),
                         BlComment ()
                                   (43:1)-(43:53)
                                   (Comment ":typref type des objects references par la structure"),
                         BlComment ()
                                   (44:1)-(44:53)
                                   (Comment ":ibseg  numero max. du segment ajoute a la structure"),
                         BlComment ()
                                   (45:1)-(45:58)
                                   (Comment ":ibref  numero max. de lobject reference par la structure"),
                         BlComment ()
                                   (46:1)-(46:58)
                                   (Comment ":pntseg pointeurs des segments apartenants a la structure"),
                         BlComment ()
                                   (47:1)-(47:58)
                                   (Comment ":pntref pointeurs des objects references par la structure"),
                         BlComment ()
                                   (48:1)-(48:19)
                                   (Comment "eso  segment, pstr"),
                         BlComment ()
                                   (49:1)-(49:70)
                                   (Comment "eso    character*8 nomcode, date, heure, typseg(nbseg), typref(nbref)"),
                         BlComment ()
                                   (50:1)-(50:70)
                                   (Comment "eso    integer     ibseg, ibref,         pntseg(nbseg), pntref(nbref)"),
                         BlComment ()
                                   (51:1)-(51:16)
                                   (Comment "eso  endsegment"),
                         BlComment ()
                                   (52:1)-(52:62)
                                   (Comment "-------------------------------------------------------------"),
                         BlComment ()
                                   (55:1)-(55:17)
                                   (Comment " dummy arguments"),
                         BlComment ()
                                   (56:1)-(56:23)
                                   (Comment "eso  pointeur lib.pstr"),
                         BlStatement ()
                                     (57:7)-(57:24)
                                     Nothing
                                     (StDeclaration ()
                                                    (57:7)-(57:24)
                                                    (TypeSpec ()
                                                              (57:7)-(57:19)
                                                              TypeCharacter
                                                              (Just Selector ()
                                                                             (57:16)-(57:19)
                                                                             (Just ExpValue ()
                                                                                            (57:18)-(57:18)
                                                                                            ValStar)
                                                                             Nothing))
                                                    Nothing
                                                    (AList ()
                                                           (57:21)-(57:24)
                                                           [Declarator ()
                                                                       (57:21)-(57:24)
                                                                       (ExpValue ()
                                                                                 (57:21)-(57:24)
                                                                                 (ValVariable "name"))
                                                                       ScalarDecl
                                                                       Nothing
                                                                       Nothing])),
                         BlComment ()
                                   (59:1)-(59:50)
                                   (Comment " use of external for mypnt since it is a function"),
                         BlStatement ()
                                     (60:7)-(60:20)
                                     Nothing
                                     (StExternal ()
                                                 (60:7)-(60:20)
                                                 (AList ()
                                                        (60:16)-(60:20)
                                                        [ExpValue ()
                                                                  (60:16)-(60:20)
                                                                  (ValVariable "mypnt")])),
                         BlStatement ()
                                     (61:7)-(61:19)
                                     Nothing
                                     (StDeclaration ()
                                                    (61:7)-(61:19)
                                                    (TypeSpec ()
                                                              (61:7)-(61:13)
                                                              TypeInteger
                                                              Nothing)
                                                    Nothing
                                                    (AList ()
                                                           (61:15)-(61:19)
                                                           [Declarator ()
                                                                       (61:15)-(61:19)
                                                                       (ExpValue ()
                                                                                 (61:15)-(61:19)
                                                                                 (ValVariable "mypnt"))
                                                                       ScalarDecl
                                                                       Nothing
                                                                       Nothing])),
                         BlComment ()
                                   (63:1)-(63:21)
                                   (Comment " local variables    "),
                         BlStatement ()
                                     (64:7)-(64:17)
                                     Nothing
                                     (StDeclaration ()
                                                    (64:7)-(64:17)
                                                    (TypeSpec ()
                                                              (64:7)-(64:13)
                                                              TypeInteger
                                                              Nothing)
                                                    Nothing
                                                    (AList ()
                                                           (64:15)-(64:17)
                                                           [Declarator ()
                                                                       (64:15)-(64:17)
                                                                       (ExpValue ()
                                                                                 (64:15)-(64:17)
                                                                                 (ValVariable "iur"))
                                                                       ScalarDecl
                                                                       Nothing
                                                                       Nothing])),
                         BlStatement ()
                                     (65:7)-(65:26)
                                     Nothing
                                     (StDeclaration ()
                                                    (65:7)-(65:26)
                                                    (TypeSpec ()
                                                              (65:7)-(65:19)
                                                              TypeCharacter
                                                              (Just Selector ()
                                                                             (65:16)-(65:19)
                                                                             (Just ExpValue ()
                                                                                            (65:17)-(65:19)
                                                                                            (ValInteger "200"
                                                                                                        Nothing))
                                                                             Nothing))
                                                    Nothing
                                                    (AList ()
                                                           (65:21)-(65:26)
                                                           [Declarator ()
                                                                       (65:21)-(65:26)
                                                                       (ExpValue ()
                                                                                 (65:21)-(65:26)
                                                                                 (ValVariable "fndnam"))
                                                                       ScalarDecl
                                                                       Nothing
                                                                       Nothing])),
                         BlComment ()
                                   (66:1)-(66:22)
                                   (Comment "eso  pointeur ur.user"),
                         BlComment ()
                                   (67:1)-(67:22)
                                   (Comment "eso  pointeur lb.tlib"),
                         BlStatement ()
                                     (68:7)-(68:20)
                                     Nothing
                                     (StDeclaration ()
                                                    (68:7)-(68:20)
                                                    (TypeSpec ()
                                                              (68:7)-(68:13)
                                                              TypeLogical
                                                              Nothing)
                                                    Nothing
                                                    (AList ()
                                                           (68:15)-(68:20)
                                                           [Declarator ()
                                                                       (68:15)-(68:20)
                                                                       (ExpValue ()
                                                                                 (68:15)-(68:20)
                                                                                 (ValVariable "urflag"))
                                                                       ScalarDecl
                                                                       Nothing
                                                                       Nothing])),
                         BlStatement ()
                                     (70:7)-(70:22)
                                     Nothing
                                     (StExpressionAssign ()
                                                         (70:7)-(70:22)
                                                         (ExpValue ()
                                                                   (70:7)-(70:12)
                                                                   (ValVariable "urflag"))
                                                         (ExpValue ()
                                                                   (70:16)-(70:22)
                                                                   (ValLogical False
                                                                               Nothing))),
                         BlStatement ()
                                     (72:7)-(72:22)
                                     Nothing
                                     (StCall ()
                                             (72:7)-(72:22)
                                             (ExpValue ()
                                                       (72:12)-(72:17)
                                                       (ValVariable "actstr"))
                                             (Just AList ()
                                                         (72:18)-(72:22)
                                                         [Argument ()
                                                                   (72:19)-(72:21)
                                                                   Nothing
                                                                   (ArgExpr (ExpValue ()
                                                                                      (72:19)-(72:21)
                                                                                      (ValVariable "lib")))])),
                         BlStatement ()
                                     (73:7)-(73:23)
                                     Nothing
                                     (StExpressionAssign ()
                                                         (73:7)-(73:23)
                                                         (ExpValue ()
                                                                   (73:7)-(73:8)
                                                                   (ValVariable "lb"))
                                                         (ExpFunctionCall ()
                                                                          (73:12)-(73:23)
                                                                          (ExpValue ()
                                                                                    (73:12)-(73:16)
                                                                                    (ValVariable "mypnt"))
                                                                          (Just AList ()
                                                                                      (73:18)-(73:22)
                                                                                      [Argument ()
                                                                                                (73:18)-(73:20)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (73:18)-(73:20)
                                                                                                                   (ValVariable "lib"))),
                                                                                       Argument ()
                                                                                                (73:22)-(73:22)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (73:22)-(73:22)
                                                                                                                   (ValInteger "1"
                                                                                                                               Nothing)))]))),
                         BlComment ()
                                   (74:1)-(74:23)
                                   (Comment "eso  segact, lb       "),
                         BlStatement ()
                                     (75:7)-(75:37)
                                     Nothing
                                     (StExpressionAssign ()
                                                         (75:7)-(75:37)
                                                         (ExpValue ()
                                                                   (75:7)-(75:11)
                                                                   (ValVariable "urcnt"))
                                                         (ExpFunctionCall ()
                                                                          (75:15)-(75:37)
                                                                          (ExpValue ()
                                                                                    (75:15)-(75:19)
                                                                                    (ValVariable "esosl"))
                                                                          (Just AList ()
                                                                                      (75:21)-(75:36)
                                                                                      [Argument ()
                                                                                                (75:21)-(75:34)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpFunctionCall ()
                                                                                                                          (75:21)-(75:34)
                                                                                                                          (ExpValue ()
                                                                                                                                    (75:21)-(75:25)
                                                                                                                                    (ValVariable "esoat"))
                                                                                                                          (Just AList ()
                                                                                                                                      (75:27)-(75:33)
                                                                                                                                      [Argument ()
                                                                                                                                                (75:27)-(75:28)
                                                                                                                                                Nothing
                                                                                                                                                (ArgExpr (ExpValue ()
                                                                                                                                                                   (75:27)-(75:28)
                                                                                                                                                                   (ValVariable "lb"))),
                                                                                                                                       Argument ()
                                                                                                                                                (75:30)-(75:33)
                                                                                                                                                Nothing
                                                                                                                                                (ArgExpr (ExpValue ()
                                                                                                                                                                   (75:30)-(75:33)
                                                                                                                                                                   (ValVariable "uref")))]))),
                                                                                       Argument ()
                                                                                                (75:36)-(75:36)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (75:36)-(75:36)
                                                                                                                   (ValInteger "1"
                                                                                                                               Nothing)))]))),
                         BlStatement ()
                                     (76:7)-(76:37)
                                     Nothing
                                     (StExpressionAssign ()
                                                         (76:7)-(76:37)
                                                         (ExpValue ()
                                                                   (76:7)-(76:11)
                                                                   (ValVariable "brcnt"))
                                                         (ExpFunctionCall ()
                                                                          (76:15)-(76:37)
                                                                          (ExpValue ()
                                                                                    (76:15)-(76:19)
                                                                                    (ValVariable "esosl"))
                                                                          (Just AList ()
                                                                                      (76:21)-(76:36)
                                                                                      [Argument ()
                                                                                                (76:21)-(76:34)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpFunctionCall ()
                                                                                                                          (76:21)-(76:34)
                                                                                                                          (ExpValue ()
                                                                                                                                    (76:21)-(76:25)
                                                                                                                                    (ValVariable "esoat"))
                                                                                                                          (Just AList ()
                                                                                                                                      (76:27)-(76:33)
                                                                                                                                      [Argument ()
                                                                                                                                                (76:27)-(76:28)
                                                                                                                                                Nothing
                                                                                                                                                (ArgExpr (ExpValue ()
                                                                                                                                                                   (76:27)-(76:28)
                                                                                                                                                                   (ValVariable "lb"))),
                                                                                                                                       Argument ()
                                                                                                                                                (76:30)-(76:33)
                                                                                                                                                Nothing
                                                                                                                                                (ArgExpr (ExpValue ()
                                                                                                                                                                   (76:30)-(76:33)
                                                                                                                                                                   (ValVariable "bref")))]))),
                                                                                       Argument ()
                                                                                                (76:36)-(76:36)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (76:36)-(76:36)
                                                                                                                   (ValInteger "1"
                                                                                                                               Nothing)))]))),
                         BlDo ()
                              (78:7)-(91:12)
                              Nothing
                              Nothing
                              Nothing
                              (Just DoSpecification ()
                                                    (78:10)-(78:21)
                                                    (StExpressionAssign ()
                                                                        (78:10)-(78:14)
                                                                        (ExpValue ()
                                                                                  (78:10)-(78:12)
                                                                                  (ValVariable "iur"))
                                                                        (ExpValue ()
                                                                                  (78:14)-(78:14)
                                                                                  (ValInteger "1"
                                                                                              Nothing)))
                                                    (ExpValue ()
                                                              (78:17)-(78:21)
                                                              (ValVariable "urcnt"))
                                                    Nothing)
                              [BlStatement ()
                                           (79:9)-(79:49)
                                           Nothing
                                           (StExpressionAssign ()
                                                               (79:9)-(79:49)
                                                               (ExpValue ()
                                                                         (79:9)-(79:10)
                                                                         (ValVariable "ur"))
                                                               (ExpFunctionCall ()
                                                                                (79:14)-(79:49)
                                                                                (ExpValue ()
                                                                                          (79:14)-(79:18)
                                                                                          (ValVariable "mypnt"))
                                                                                (Just AList ()
                                                                                            (79:20)-(79:48)
                                                                                            [Argument ()
                                                                                                      (79:20)-(79:22)
                                                                                                      Nothing
                                                                                                      (ArgExpr (ExpValue ()
                                                                                                                         (79:20)-(79:22)
                                                                                                                         (ValVariable "lib"))),
                                                                                             Argument ()
                                                                                                      (79:24)-(79:48)
                                                                                                      Nothing
                                                                                                      (ArgExpr (ExpFunctionCall ()
                                                                                                                                (79:24)-(79:48)
                                                                                                                                (ExpValue ()
                                                                                                                                          (79:24)-(79:28)
                                                                                                                                          (ValVariable "esoar"))
                                                                                                                                (Just AList ()
                                                                                                                                            (79:30)-(79:47)
                                                                                                                                            [Argument ()
                                                                                                                                                      (79:30)-(79:43)
                                                                                                                                                      Nothing
                                                                                                                                                      (ArgExpr (ExpFunctionCall ()
                                                                                                                                                                                (79:30)-(79:43)
                                                                                                                                                                                (ExpValue ()
                                                                                                                                                                                          (79:30)-(79:34)
                                                                                                                                                                                          (ValVariable "esoat"))
                                                                                                                                                                                (Just AList ()
                                                                                                                                                                                            (79:36)-(79:42)
                                                                                                                                                                                            [Argument ()
                                                                                                                                                                                                      (79:36)-(79:37)
                                                                                                                                                                                                      Nothing
                                                                                                                                                                                                      (ArgExpr (ExpValue ()
                                                                                                                                                                                                                         (79:36)-(79:37)
                                                                                                                                                                                                                         (ValVariable "lb"))),
                                                                                                                                                                                             Argument ()
                                                                                                                                                                                                      (79:39)-(79:42)
                                                                                                                                                                                                      Nothing
                                                                                                                                                                                                      (ArgExpr (ExpValue ()
                                                                                                                                                                                                                         (79:39)-(79:42)
                                                                                                                                                                                                                         (ValVariable "uref")))]))),
                                                                                                                                             Argument ()
                                                                                                                                                      (79:45)-(79:47)
                                                                                                                                                      Nothing
                                                                                                                                                      (ArgExpr (ExpValue ()
                                                                                                                                                                         (79:45)-(79:47)
                                                                                                                                                                         (ValVariable "iur")))])))]))),
                               BlComment ()
                                         (80:1)-(80:18)
                                         (Comment "eso    segact, ur"),
                               BlStatement ()
                                           (81:9)-(81:39)
                                           Nothing
                                           (StExpressionAssign ()
                                                               (81:9)-(81:39)
                                                               (ExpValue ()
                                                                         (81:9)-(81:14)
                                                                         (ValVariable "ubbcnt"))
                                                               (ExpFunctionCall ()
                                                                                (81:18)-(81:39)
                                                                                (ExpValue ()
                                                                                          (81:18)-(81:22)
                                                                                          (ValVariable "esosl"))
                                                                                (Just AList ()
                                                                                            (81:24)-(81:38)
                                                                                            [Argument ()
                                                                                                      (81:24)-(81:36)
                                                                                                      Nothing
                                                                                                      (ArgExpr (ExpFunctionCall ()
                                                                                                                                (81:24)-(81:36)
                                                                                                                                (ExpValue ()
                                                                                                                                          (81:24)-(81:28)
                                                                                                                                          (ValVariable "esoat"))
                                                                                                                                (Just AList ()
                                                                                                                                            (81:30)-(81:35)
                                                                                                                                            [Argument ()
                                                                                                                                                      (81:30)-(81:31)
                                                                                                                                                      Nothing
                                                                                                                                                      (ArgExpr (ExpValue ()
                                                                                                                                                                         (81:30)-(81:31)
                                                                                                                                                                         (ValVariable "ur"))),
                                                                                                                                             Argument ()
                                                                                                                                                      (81:33)-(81:35)
                                                                                                                                                      Nothing
                                                                                                                                                      (ArgExpr (ExpValue ()
                                                                                                                                                                         (81:33)-(81:35)
                                                                                                                                                                         (ValVariable "ubb")))]))),
                                                                                             Argument ()
                                                                                                      (81:38)-(81:38)
                                                                                                      Nothing
                                                                                                      (ArgExpr (ExpValue ()
                                                                                                                         (81:38)-(81:38)
                                                                                                                         (ValInteger "1"
                                                                                                                                     Nothing)))]))),
                               BlComment ()
                                         (82:1)-(82:40)
                                         (Comment "       write(*,*) \"user name\", ur.uname"),
                               BlStatement ()
                                           (83:9)-(83:32)
                                           Nothing
                                           (StExpressionAssign ()
                                                               (83:9)-(83:32)
                                                               (ExpValue ()
                                                                         (83:9)-(83:14)
                                                                         (ValVariable "fndnam"))
                                                               (ExpFunctionCall ()
                                                                                (83:18)-(83:32)
                                                                                (ExpValue ()
                                                                                          (83:18)-(83:22)
                                                                                          (ValVariable "esoat"))
                                                                                (Just AList ()
                                                                                            (83:24)-(83:31)
                                                                                            [Argument ()
                                                                                                      (83:24)-(83:25)
                                                                                                      Nothing
                                                                                                      (ArgExpr (ExpValue ()
                                                                                                                         (83:24)-(83:25)
                                                                                                                         (ValVariable "ur"))),
                                                                                             Argument ()
                                                                                                      (83:27)-(83:31)
                                                                                                      Nothing
                                                                                                      (ArgExpr (ExpValue ()
                                                                                                                         (83:27)-(83:31)
                                                                                                                         (ValVariable "uname")))]))),
                               BlComment ()
                                         (84:1)-(84:24)
                                         (Comment "eso    segdes, ur*nomod"),
                               BlIf ()
                                    (87:7)-(90:14)
                                    Nothing
                                    Nothing
                                    [Just ExpBinary ()
                                                    (87:11)-(87:38)
                                                    EQ
                                                    (ExpFunctionCall ()
                                                                     (87:11)-(87:22)
                                                                     (ExpValue ()
                                                                               (87:11)-(87:14)
                                                                               (ValVariable "trim"))
                                                                     (Just AList ()
                                                                                 (87:16)-(87:21)
                                                                                 [Argument ()
                                                                                           (87:16)-(87:21)
                                                                                           Nothing
                                                                                           (ArgExpr (ExpValue ()
                                                                                                              (87:16)-(87:21)
                                                                                                              (ValVariable "fndnam")))]))
                                                    (ExpFunctionCall ()
                                                                     (87:29)-(87:38)
                                                                     (ExpValue ()
                                                                               (87:29)-(87:32)
                                                                               (ValVariable "trim"))
                                                                     (Just AList ()
                                                                                 (87:34)-(87:37)
                                                                                 [Argument ()
                                                                                           (87:34)-(87:37)
                                                                                           Nothing
                                                                                           (ArgExpr (ExpValue ()
                                                                                                              (87:34)-(87:37)
                                                                                                              (ValVariable "name")))]))]
                                    [[BlStatement ()
                                                  (88:11)-(88:25)
                                                  Nothing
                                                  (StExpressionAssign ()
                                                                      (88:11)-(88:25)
                                                                      (ExpValue ()
                                                                                (88:11)-(88:16)
                                                                                (ValVariable "urflag"))
                                                                      (ExpValue ()
                                                                                (88:20)-(88:25)
                                                                                (ValLogical True
                                                                                            Nothing))),
                                      BlStatement ()
                                                  (89:11)-(89:18)
                                                  Nothing
                                                  (StGotoUnconditional ()
                                                                       (89:11)-(89:18)
                                                                       (ExpValue ()
                                                                                 (89:16)-(89:18)
                                                                                 (ValInteger "100"
                                                                                             Nothing)))]]
                                    Nothing]
                              Nothing,
                         BlStatement ()
                                     (93:2)-(93:14)
                                     (Just ExpValue ()
                                                    (93:2)-(93:4)
                                                    (ValInteger "100" Nothing))
                                     (StContinue () (93:7)-(93:14)),
                         BlComment ()
                                   (94:1)-(94:22)
                                   (Comment "eso  segdes, lb*nomod"),
                         BlStatement ()
                                     (95:7)-(95:30)
                                     Nothing
                                     (StCall ()
                                             (95:7)-(95:30)
                                             (ExpValue ()
                                                       (95:12)-(95:17)
                                                       (ValVariable "desstr"))
                                             (Just AList ()
                                                         (95:18)-(95:30)
                                                         [Argument ()
                                                                   (95:19)-(95:21)
                                                                   Nothing
                                                                   (ArgExpr (ExpValue ()
                                                                                      (95:19)-(95:21)
                                                                                      (ValVariable "lib"))),
                                                          Argument ()
                                                                   (95:23)-(95:29)
                                                                   Nothing
                                                                   (ArgExpr (ExpValue ()
                                                                                      (95:23)-(95:29)
                                                                                      (ValString "nomod")))])),
                         BlIf ()
                              (97:7)-(101:12)
                              Nothing
                              Nothing
                              [Just ExpValue ()
                                             (97:11)-(97:16)
                                             (ValVariable "urflag"),
                               Nothing]
                              [[BlStatement ()
                                            (98:9)-(98:20)
                                            Nothing
                                            (StExpressionAssign ()
                                                                (98:9)-(98:20)
                                                                (ExpValue ()
                                                                          (98:9)-(98:14)
                                                                          (ValVariable "findur"))
                                                                (ExpValue ()
                                                                          (98:18)-(98:20)
                                                                          (ValVariable "iur")))],
                               [BlStatement ()
                                            (100:9)-(100:18)
                                            Nothing
                                            (StExpressionAssign ()
                                                                (100:9)-(100:18)
                                                                (ExpValue ()
                                                                          (100:9)-(100:14)
                                                                          (ValVariable "findur"))
                                                                (ExpValue ()
                                                                          (100:18)-(100:18)
                                                                          (ValInteger "0"
                                                                                      Nothing)))]]
                              Nothing]
                        Nothing]
'
]

{ #category : #'fortran77-annoted' }
PP2FortranSrcGrammarTest class >> findurFortran [

	^ '      integer function findur(lib,name) 
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
      character*(*) name

c use of external for mypnt since it is a function
      external mypnt
      integer mypnt

c local variables    
      integer iur 
      character*200 fndnam     
cESO  pointeur ur.user
cESO  pointeur lb.tlib
      logical urflag

      urflag = .false.

      call actstr(lib)
      lb = mypnt(lib,1)
cESO  segact, lb       
      urcnt = ESOsl(ESOat(lb,uref),1)
      brcnt = ESOsl(ESOat(lb,bref),1) 
        
      do iur=1, urcnt
        ur = mypnt(lib,ESOar(ESOat(lb,uref),iur))
cESO    segact, ur
        ubbcnt = ESOsl(ESOat(ur,ubb),1)
c       write(*,*) "user name", ur.uname
        fndnam = ESOat(ur,uname)
cESO    segdes, ur*nomod
     
     
      if (trim(fndnam) .eq. trim(name)) then
          urflag = .true.
          goto 100
        end if
      end do

 100  continue
cESO  segdes, lb*nomod
      call desstr(lib,''nomod'')

      if (urflag) then
        findur = iur
      else
        findur = 0
      end if
 
      end

'
]

{ #category : #'filesytem-inmemory' }
PP2FortranSrcGrammarTest class >> libpnt [

	^ (self workDir / 'libpnt.0.e.f') ensureCreateFile writeStreamDo: [ 
		  :stream | stream << self libpntFortran ]
]

{ #category : #'AST-fortranSrc' }
PP2FortranSrcGrammarTest class >> libpntAST [

	^ 'ProgramFile (MetaInfo
                     {miVersion = Fortran77,
                      miFilename = "/demo-bib/build/libpnt.0.e.f"})
            [PUSubroutine ()
                          (1:7)-(120:9)
                          (Nothing, Nothing)
                          "libprt"
                          (Just AList ()
                                      (1:25)-(1:27)
                                      [ExpValue ()
                                                (1:25)-(1:27)
                                                (ValVariable "lib")])
                          [BlStatement ()
                                       (2:7)-(2:19)
                                       Nothing
                                       (StImplicit () (2:7)-(2:19) Nothing),
                           BlComment ()
                                     (4:1)-(4:62)
                                     (Comment "2345678901234567890123456789012345678901234567890123456789012"),
                           BlComment ()
                                     (5:1)-(5:28)
                                     (Comment " bref(brcnt) array of books"),
                           BlComment ()
                                     (6:1)-(6:28)
                                     (Comment " uref(urcnt) array of users"),
                           BlComment ()
                                     (7:1)-(7:47)
                                     (Comment " bstatu(brcnt) logical array of borrowed books"),
                           BlComment ()
                                     (8:1)-(8:49)
                                     (Comment " ubb(ubbcnt) array of books borrowed by the user"),
                           BlComment () (10:1)-(10:12) (Comment ": maillon 1"),
                           BlStatement ()
                                       (11:7)-(11:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (11:7)-(11:19)
                                                      (TypeSpec ()
                                                                (11:7)-(11:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (11:15)-(11:19)
                                                             [Declarator ()
                                                                         (11:15)-(11:19)
                                                                         (ExpValue ()
                                                                                   (11:15)-(11:19)
                                                                                   (ValVariable "brcnt"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (12:7)-(12:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (12:7)-(12:19)
                                                      (TypeSpec ()
                                                                (12:7)-(12:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (12:15)-(12:19)
                                                             [Declarator ()
                                                                         (12:15)-(12:19)
                                                                         (ExpValue ()
                                                                                   (12:15)-(12:19)
                                                                                   (ValVariable "urcnt"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (13:7)-(13:20)
                                       Nothing
                                       (StDeclaration ()
                                                      (13:7)-(13:20)
                                                      (TypeSpec ()
                                                                (13:7)-(13:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (13:15)-(13:20)
                                                             [Declarator ()
                                                                         (13:15)-(13:20)
                                                                         (ExpValue ()
                                                                                   (13:15)-(13:20)
                                                                                   (ValVariable "ubbcnt"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment ()
                                     (15:1)-(15:18)
                                     (Comment " segment de t\227\170te"),
                           BlComment ()
                                     (16:1)-(16:19)
                                     (Comment "eso  segment, tlib"),
                           BlComment ()
                                     (17:1)-(17:27)
                                     (Comment "eso    integer bref(brcnt)"),
                           BlComment ()
                                     (18:1)-(18:29)
                                     (Comment "eso    logical bstatu(brcnt)"),
                           BlComment ()
                                     (19:1)-(19:27)
                                     (Comment "eso    integer uref(urcnt)"),
                           BlComment ()
                                     (20:1)-(20:17)
                                     (Comment "eso  end segment"),
                           BlComment ()
                                     (22:1)-(22:19)
                                     (Comment "eso  segment, book"),
                           BlComment ()
                                     (23:1)-(23:27)
                                     (Comment "eso    character*40 btitle"),
                           BlComment ()
                                     (24:1)-(24:22)
                                     (Comment "eso    integer bpages"),
                           BlComment ()
                                     (25:1)-(25:17)
                                     (Comment "eso    real budc"),
                           BlComment ()
                                     (26:1)-(26:17)
                                     (Comment "eso  end segment"),
                           BlComment ()
                                     (28:1)-(28:19)
                                     (Comment "eso  segment, user"),
                           BlComment ()
                                     (29:1)-(29:26)
                                     (Comment "eso    character*40 uname"),
                           BlComment ()
                                     (30:1)-(30:27)
                                     (Comment "eso    integer ubb(ubbcnt)"),
                           BlComment ()
                                     (31:1)-(31:17)
                                     (Comment "eso  end segment"),
                           BlComment ()
                                     (33:1)-(33:67)
                                     (Comment "******************************************************************"),
                           BlComment ()
                                     (35:1)-(35:62)
                                     (Comment "2345678901234567890123456789012345678901234567890123456789012"),
                           BlComment () (36:1)-(36:6) (Comment "-pstr"),
                           BlComment ()
                                     (37:1)-(37:62)
                                     (Comment ":pstr   segment dentete des structures : nouvelles definition"),
                           BlComment ()
                                     (38:1)-(38:72)
                                     (Comment ":nomcod nom du code auquel appartient la structure (cronos, apollo, ..)"),
                           BlComment ()
                                     (39:1)-(39:29)
                                     (Comment ":date   date de debut de job"),
                           BlComment ()
                                     (40:1)-(40:30)
                                     (Comment ":heure  heure de debut de job"),
                           BlComment ()
                                     (41:1)-(41:54)
                                     (Comment ":typseg type des segments appartenants a la structure"),
                           BlComment ()
                                     (42:1)-(42:53)
                                     (Comment ":typref type des objects references par la structure"),
                           BlComment ()
                                     (43:1)-(43:53)
                                     (Comment ":ibseg  numero max. du segment ajoute a la structure"),
                           BlComment ()
                                     (44:1)-(44:58)
                                     (Comment ":ibref  numero max. de lobject reference par la structure"),
                           BlComment ()
                                     (45:1)-(45:58)
                                     (Comment ":pntseg pointeurs des segments apartenants a la structure"),
                           BlComment ()
                                     (46:1)-(46:58)
                                     (Comment ":pntref pointeurs des objects references par la structure"),
                           BlComment ()
                                     (47:1)-(47:19)
                                     (Comment "eso  segment, pstr"),
                           BlComment ()
                                     (48:1)-(48:70)
                                     (Comment "eso    character*8 nomcode, date, heure, typseg(nbseg), typref(nbref)"),
                           BlComment ()
                                     (49:1)-(49:70)
                                     (Comment "eso    integer     ibseg, ibref,         pntseg(nbseg), pntref(nbref)"),
                           BlComment ()
                                     (50:1)-(50:16)
                                     (Comment "eso  endsegment"),
                           BlComment ()
                                     (51:1)-(51:62)
                                     (Comment "-------------------------------------------------------------"),
                           BlComment ()
                                     (54:1)-(54:16)
                                     (Comment " dummy argument"),
                           BlComment ()
                                     (55:1)-(55:23)
                                     (Comment "eso  pointeur lib.pstr"),
                           BlComment ()
                                     (57:1)-(57:50)
                                     (Comment " use of external for mypnt since it is a function"),
                           BlStatement ()
                                       (58:7)-(58:20)
                                       Nothing
                                       (StExternal ()
                                                   (58:7)-(58:20)
                                                   (AList ()
                                                          (58:16)-(58:20)
                                                          [ExpValue ()
                                                                    (58:16)-(58:20)
                                                                    (ValVariable "mypnt")])),
                           BlStatement ()
                                       (59:7)-(59:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (59:7)-(59:19)
                                                      (TypeSpec ()
                                                                (59:7)-(59:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (59:15)-(59:19)
                                                             [Declarator ()
                                                                         (59:15)-(59:19)
                                                                         (ExpValue ()
                                                                                   (59:15)-(59:19)
                                                                                   (ValVariable "mypnt"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment ()
                                     (61:1)-(61:22)
                                     (Comment " local variables     "),
                           BlComment ()
                                     (62:1)-(62:22)
                                     (Comment "eso  pointeur lb.tlib"),
                           BlComment ()
                                     (63:1)-(63:22)
                                     (Comment "eso  pointeur bk.book"),
                           BlComment ()
                                     (64:1)-(64:22)
                                     (Comment "eso  pointeur ur.user"),
                           BlComment ()
                                     (66:1)-(66:21)
                                     (Comment " ibk number of books"),
                           BlComment ()
                                     (67:1)-(67:21)
                                     (Comment " iur number of users"),
                           BlComment ()
                                     (68:1)-(68:31)
                                     (Comment " ibor number of borrowed books"),
                           BlStatement ()
                                       (69:7)-(69:26)
                                       Nothing
                                       (StDeclaration ()
                                                      (69:7)-(69:26)
                                                      (TypeSpec ()
                                                                (69:7)-(69:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (69:15)-(69:26)
                                                             [Declarator ()
                                                                         (69:15)-(69:17)
                                                                         (ExpValue ()
                                                                                   (69:15)-(69:17)
                                                                                   (ValVariable "ibk"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (69:19)-(69:21)
                                                                         (ExpValue ()
                                                                                   (69:19)-(69:21)
                                                                                   (ValVariable "iur"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (69:23)-(69:26)
                                                                         (ExpValue ()
                                                                                   (69:23)-(69:26)
                                                                                   (ValVariable "ibor"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (71:7)-(71:22)
                                       Nothing
                                       (StCall ()
                                               (71:7)-(71:22)
                                               (ExpValue ()
                                                         (71:12)-(71:17)
                                                         (ValVariable "actstr"))
                                               (Just AList ()
                                                           (71:18)-(71:22)
                                                           [Argument ()
                                                                     (71:19)-(71:21)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (71:19)-(71:21)
                                                                                        (ValVariable "lib")))])),
                           BlStatement ()
                                       (72:7)-(72:23)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (72:7)-(72:23)
                                                           (ExpValue ()
                                                                     (72:7)-(72:8)
                                                                     (ValVariable "lb"))
                                                           (ExpFunctionCall ()
                                                                            (72:12)-(72:23)
                                                                            (ExpValue ()
                                                                                      (72:12)-(72:16)
                                                                                      (ValVariable "mypnt"))
                                                                            (Just AList ()
                                                                                        (72:18)-(72:22)
                                                                                        [Argument ()
                                                                                                  (72:18)-(72:20)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (72:18)-(72:20)
                                                                                                                     (ValVariable "lib"))),
                                                                                         Argument ()
                                                                                                  (72:22)-(72:22)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (72:22)-(72:22)
                                                                                                                     (ValInteger "1"
                                                                                                                                 Nothing)))]))),
                           BlComment ()
                                     (73:1)-(73:18)
                                     (Comment "eso  segact, lb  "),
                           BlStatement ()
                                       (75:7)-(75:37)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (75:7)-(75:37)
                                                           (ExpValue ()
                                                                     (75:7)-(75:11)
                                                                     (ValVariable "brcnt"))
                                                           (ExpFunctionCall ()
                                                                            (75:15)-(75:37)
                                                                            (ExpValue ()
                                                                                      (75:15)-(75:19)
                                                                                      (ValVariable "esosl"))
                                                                            (Just AList ()
                                                                                        (75:21)-(75:36)
                                                                                        [Argument ()
                                                                                                  (75:21)-(75:34)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpFunctionCall ()
                                                                                                                            (75:21)-(75:34)
                                                                                                                            (ExpValue ()
                                                                                                                                      (75:21)-(75:25)
                                                                                                                                      (ValVariable "esoat"))
                                                                                                                            (Just AList ()
                                                                                                                                        (75:27)-(75:33)
                                                                                                                                        [Argument ()
                                                                                                                                                  (75:27)-(75:28)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (75:27)-(75:28)
                                                                                                                                                                     (ValVariable "lb"))),
                                                                                                                                         Argument ()
                                                                                                                                                  (75:30)-(75:33)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (75:30)-(75:33)
                                                                                                                                                                     (ValVariable "bref")))]))),
                                                                                         Argument ()
                                                                                                  (75:36)-(75:36)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (75:36)-(75:36)
                                                                                                                     (ValInteger "1"
                                                                                                                                 Nothing)))]))),
                           BlStatement ()
                                       (76:7)-(76:37)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (76:7)-(76:37)
                                                           (ExpValue ()
                                                                     (76:7)-(76:11)
                                                                     (ValVariable "urcnt"))
                                                           (ExpFunctionCall ()
                                                                            (76:15)-(76:37)
                                                                            (ExpValue ()
                                                                                      (76:15)-(76:19)
                                                                                      (ValVariable "esosl"))
                                                                            (Just AList ()
                                                                                        (76:21)-(76:36)
                                                                                        [Argument ()
                                                                                                  (76:21)-(76:34)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpFunctionCall ()
                                                                                                                            (76:21)-(76:34)
                                                                                                                            (ExpValue ()
                                                                                                                                      (76:21)-(76:25)
                                                                                                                                      (ValVariable "esoat"))
                                                                                                                            (Just AList ()
                                                                                                                                        (76:27)-(76:33)
                                                                                                                                        [Argument ()
                                                                                                                                                  (76:27)-(76:28)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (76:27)-(76:28)
                                                                                                                                                                     (ValVariable "lb"))),
                                                                                                                                         Argument ()
                                                                                                                                                  (76:30)-(76:33)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (76:30)-(76:33)
                                                                                                                                                                     (ValVariable "uref")))]))),
                                                                                         Argument ()
                                                                                                  (76:36)-(76:36)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (76:36)-(76:36)
                                                                                                                     (ValInteger "1"
                                                                                                                                 Nothing)))]))),
                           BlDo ()
                                (78:7)-(83:12)
                                Nothing
                                Nothing
                                Nothing
                                (Just DoSpecification ()
                                                      (78:10)-(78:21)
                                                      (StExpressionAssign ()
                                                                          (78:10)-(78:14)
                                                                          (ExpValue ()
                                                                                    (78:10)-(78:12)
                                                                                    (ValVariable "ibk"))
                                                                          (ExpValue ()
                                                                                    (78:14)-(78:14)
                                                                                    (ValInteger "1"
                                                                                                Nothing)))
                                                      (ExpValue ()
                                                                (78:17)-(78:21)
                                                                (ValVariable "brcnt"))
                                                      Nothing)
                                [BlStatement ()
                                             (79:9)-(79:49)
                                             Nothing
                                             (StExpressionAssign ()
                                                                 (79:9)-(79:49)
                                                                 (ExpValue ()
                                                                           (79:9)-(79:10)
                                                                           (ValVariable "bk"))
                                                                 (ExpFunctionCall ()
                                                                                  (79:14)-(79:49)
                                                                                  (ExpValue ()
                                                                                            (79:14)-(79:18)
                                                                                            (ValVariable "mypnt"))
                                                                                  (Just AList ()
                                                                                              (79:20)-(79:48)
                                                                                              [Argument ()
                                                                                                        (79:20)-(79:22)
                                                                                                        Nothing
                                                                                                        (ArgExpr (ExpValue ()
                                                                                                                           (79:20)-(79:22)
                                                                                                                           (ValVariable "lib"))),
                                                                                               Argument ()
                                                                                                        (79:24)-(79:48)
                                                                                                        Nothing
                                                                                                        (ArgExpr (ExpFunctionCall ()
                                                                                                                                  (79:24)-(79:48)
                                                                                                                                  (ExpValue ()
                                                                                                                                            (79:24)-(79:28)
                                                                                                                                            (ValVariable "esoar"))
                                                                                                                                  (Just AList ()
                                                                                                                                              (79:30)-(79:47)
                                                                                                                                              [Argument ()
                                                                                                                                                        (79:30)-(79:43)
                                                                                                                                                        Nothing
                                                                                                                                                        (ArgExpr (ExpFunctionCall ()
                                                                                                                                                                                  (79:30)-(79:43)
                                                                                                                                                                                  (ExpValue ()
                                                                                                                                                                                            (79:30)-(79:34)
                                                                                                                                                                                            (ValVariable "esoat"))
                                                                                                                                                                                  (Just AList ()
                                                                                                                                                                                              (79:36)-(79:42)
                                                                                                                                                                                              [Argument ()
                                                                                                                                                                                                        (79:36)-(79:37)
                                                                                                                                                                                                        Nothing
                                                                                                                                                                                                        (ArgExpr (ExpValue ()
                                                                                                                                                                                                                           (79:36)-(79:37)
                                                                                                                                                                                                                           (ValVariable "lb"))),
                                                                                                                                                                                               Argument ()
                                                                                                                                                                                                        (79:39)-(79:42)
                                                                                                                                                                                                        Nothing
                                                                                                                                                                                                        (ArgExpr (ExpValue ()
                                                                                                                                                                                                                           (79:39)-(79:42)
                                                                                                                                                                                                                           (ValVariable "bref")))]))),
                                                                                                                                               Argument ()
                                                                                                                                                        (79:45)-(79:47)
                                                                                                                                                        Nothing
                                                                                                                                                        (ArgExpr (ExpValue ()
                                                                                                                                                                           (79:45)-(79:47)
                                                                                                                                                                           (ValVariable "ibk")))])))]))),
                                 BlComment ()
                                           (80:1)-(80:18)
                                           (Comment "eso    segact, bk"),
                                 BlStatement ()
                                             (81:9)-(81:84)
                                             Nothing
                                             (StWrite ()
                                                      (81:9)-(81:84)
                                                      (AList ()
                                                             (81:14)-(81:18)
                                                             [ControlPair ()
                                                                          (81:15)-(81:15)
                                                                          Nothing
                                                                          (ExpValue ()
                                                                                    (81:15)-(81:15)
                                                                                    ValStar),
                                                              ControlPair ()
                                                                          (81:17)-(81:17)
                                                                          Nothing
                                                                          (ExpValue ()
                                                                                    (81:17)-(81:17)
                                                                                    ValStar)])
                                                      (Just AList ()
                                                                  (81:19)-(81:84)
                                                                  [ExpValue ()
                                                                            (81:19)-(81:28)
                                                                            (ValString "book num"),
                                                                   ExpValue ()
                                                                            (81:30)-(81:32)
                                                                            (ValVariable "ibk"),
                                                                   ExpFunctionCall ()
                                                                                   (81:35)-(81:50)
                                                                                   (ExpValue ()
                                                                                             (81:35)-(81:39)
                                                                                             (ValVariable "esoat"))
                                                                                   (Just AList ()
                                                                                               (81:41)-(81:49)
                                                                                               [Argument ()
                                                                                                         (81:41)-(81:42)
                                                                                                         Nothing
                                                                                                         (ArgExpr (ExpValue ()
                                                                                                                            (81:41)-(81:42)
                                                                                                                            (ValVariable "bk"))),
                                                                                                Argument ()
                                                                                                         (81:44)-(81:49)
                                                                                                         Nothing
                                                                                                         (ArgExpr (ExpValue ()
                                                                                                                            (81:44)-(81:49)
                                                                                                                            (ValVariable "btitle")))]),
                                                                   ExpFunctionCall ()
                                                                                   (81:53)-(81:68)
                                                                                   (ExpValue ()
                                                                                             (81:53)-(81:57)
                                                                                             (ValVariable "esoat"))
                                                                                   (Just AList ()
                                                                                               (81:59)-(81:67)
                                                                                               [Argument ()
                                                                                                         (81:59)-(81:60)
                                                                                                         Nothing
                                                                                                         (ArgExpr (ExpValue ()
                                                                                                                            (81:59)-(81:60)
                                                                                                                            (ValVariable "bk"))),
                                                                                                Argument ()
                                                                                                         (81:62)-(81:67)
                                                                                                         Nothing
                                                                                                         (ArgExpr (ExpValue ()
                                                                                                                            (81:62)-(81:67)
                                                                                                                            (ValVariable "bpages")))]),
                                                                   ExpFunctionCall ()
                                                                                   (81:71)-(81:84)
                                                                                   (ExpValue ()
                                                                                             (81:71)-(81:75)
                                                                                             (ValVariable "esoat"))
                                                                                   (Just AList ()
                                                                                               (81:77)-(81:83)
                                                                                               [Argument ()
                                                                                                         (81:77)-(81:78)
                                                                                                         Nothing
                                                                                                         (ArgExpr (ExpValue ()
                                                                                                                            (81:77)-(81:78)
                                                                                                                            (ValVariable "bk"))),
                                                                                                Argument ()
                                                                                                         (81:80)-(81:83)
                                                                                                         Nothing
                                                                                                         (ArgExpr (ExpValue ()
                                                                                                                            (81:80)-(81:83)
                                                                                                                            (ValVariable "budc")))])])),
                                 BlComment ()
                                           (82:1)-(82:24)
                                           (Comment "eso    segdes, bk*nomod")]
                                Nothing,
                           BlComment ()
                                     (85:1)-(85:60)
                                     (Comment " we search in the structure for users and print their names"),
                           BlComment ()
                                     (86:1)-(86:15)
                                     (Comment " pages and udc"),
                           BlDo ()
                                (87:7)-(103:12)
                                Nothing
                                Nothing
                                Nothing
                                (Just DoSpecification ()
                                                      (87:10)-(87:21)
                                                      (StExpressionAssign ()
                                                                          (87:10)-(87:14)
                                                                          (ExpValue ()
                                                                                    (87:10)-(87:12)
                                                                                    (ValVariable "iur"))
                                                                          (ExpValue ()
                                                                                    (87:14)-(87:14)
                                                                                    (ValInteger "1"
                                                                                                Nothing)))
                                                      (ExpValue ()
                                                                (87:17)-(87:21)
                                                                (ValVariable "urcnt"))
                                                      Nothing)
                                [BlStatement ()
                                             (88:9)-(88:49)
                                             Nothing
                                             (StExpressionAssign ()
                                                                 (88:9)-(88:49)
                                                                 (ExpValue ()
                                                                           (88:9)-(88:10)
                                                                           (ValVariable "ur"))
                                                                 (ExpFunctionCall ()
                                                                                  (88:14)-(88:49)
                                                                                  (ExpValue ()
                                                                                            (88:14)-(88:18)
                                                                                            (ValVariable "mypnt"))
                                                                                  (Just AList ()
                                                                                              (88:20)-(88:48)
                                                                                              [Argument ()
                                                                                                        (88:20)-(88:22)
                                                                                                        Nothing
                                                                                                        (ArgExpr (ExpValue ()
                                                                                                                           (88:20)-(88:22)
                                                                                                                           (ValVariable "lib"))),
                                                                                               Argument ()
                                                                                                        (88:24)-(88:48)
                                                                                                        Nothing
                                                                                                        (ArgExpr (ExpFunctionCall ()
                                                                                                                                  (88:24)-(88:48)
                                                                                                                                  (ExpValue ()
                                                                                                                                            (88:24)-(88:28)
                                                                                                                                            (ValVariable "esoar"))
                                                                                                                                  (Just AList ()
                                                                                                                                              (88:30)-(88:47)
                                                                                                                                              [Argument ()
                                                                                                                                                        (88:30)-(88:43)
                                                                                                                                                        Nothing
                                                                                                                                                        (ArgExpr (ExpFunctionCall ()
                                                                                                                                                                                  (88:30)-(88:43)
                                                                                                                                                                                  (ExpValue ()
                                                                                                                                                                                            (88:30)-(88:34)
                                                                                                                                                                                            (ValVariable "esoat"))
                                                                                                                                                                                  (Just AList ()
                                                                                                                                                                                              (88:36)-(88:42)
                                                                                                                                                                                              [Argument ()
                                                                                                                                                                                                        (88:36)-(88:37)
                                                                                                                                                                                                        Nothing
                                                                                                                                                                                                        (ArgExpr (ExpValue ()
                                                                                                                                                                                                                           (88:36)-(88:37)
                                                                                                                                                                                                                           (ValVariable "lb"))),
                                                                                                                                                                                               Argument ()
                                                                                                                                                                                                        (88:39)-(88:42)
                                                                                                                                                                                                        Nothing
                                                                                                                                                                                                        (ArgExpr (ExpValue ()
                                                                                                                                                                                                                           (88:39)-(88:42)
                                                                                                                                                                                                                           (ValVariable "uref")))]))),
                                                                                                                                               Argument ()
                                                                                                                                                        (88:45)-(88:47)
                                                                                                                                                        Nothing
                                                                                                                                                        (ArgExpr (ExpValue ()
                                                                                                                                                                           (88:45)-(88:47)
                                                                                                                                                                           (ValVariable "iur")))])))]))),
                                 BlComment ()
                                           (89:1)-(89:18)
                                           (Comment "eso    segact, ur"),
                                 BlStatement ()
                                             (90:9)-(90:49)
                                             Nothing
                                             (StWrite ()
                                                      (90:9)-(90:49)
                                                      (AList ()
                                                             (90:14)-(90:18)
                                                             [ControlPair ()
                                                                          (90:15)-(90:15)
                                                                          Nothing
                                                                          (ExpValue ()
                                                                                    (90:15)-(90:15)
                                                                                    ValStar),
                                                              ControlPair ()
                                                                          (90:17)-(90:17)
                                                                          Nothing
                                                                          (ExpValue ()
                                                                                    (90:17)-(90:17)
                                                                                    ValStar)])
                                                      (Just AList ()
                                                                  (90:19)-(90:49)
                                                                  [ExpValue ()
                                                                            (90:19)-(90:28)
                                                                            (ValString "user num"),
                                                                   ExpValue ()
                                                                            (90:30)-(90:32)
                                                                            (ValVariable "iur"),
                                                                   ExpFunctionCall ()
                                                                                   (90:35)-(90:49)
                                                                                   (ExpValue ()
                                                                                             (90:35)-(90:39)
                                                                                             (ValVariable "esoat"))
                                                                                   (Just AList ()
                                                                                               (90:41)-(90:48)
                                                                                               [Argument ()
                                                                                                         (90:41)-(90:42)
                                                                                                         Nothing
                                                                                                         (ArgExpr (ExpValue ()
                                                                                                                            (90:41)-(90:42)
                                                                                                                            (ValVariable "ur"))),
                                                                                                Argument ()
                                                                                                         (90:44)-(90:48)
                                                                                                         Nothing
                                                                                                         (ArgExpr (ExpValue ()
                                                                                                                            (90:44)-(90:48)
                                                                                                                            (ValVariable "uname")))])])),
                                 BlComment ()
                                           (92:1)-(92:41)
                                           (Comment " we print the books borrowed by the user"),
                                 BlStatement ()
                                             (93:9)-(93:39)
                                             Nothing
                                             (StExpressionAssign ()
                                                                 (93:9)-(93:39)
                                                                 (ExpValue ()
                                                                           (93:9)-(93:14)
                                                                           (ValVariable "ubbcnt"))
                                                                 (ExpFunctionCall ()
                                                                                  (93:18)-(93:39)
                                                                                  (ExpValue ()
                                                                                            (93:18)-(93:22)
                                                                                            (ValVariable "esosl"))
                                                                                  (Just AList ()
                                                                                              (93:24)-(93:38)
                                                                                              [Argument ()
                                                                                                        (93:24)-(93:36)
                                                                                                        Nothing
                                                                                                        (ArgExpr (ExpFunctionCall ()
                                                                                                                                  (93:24)-(93:36)
                                                                                                                                  (ExpValue ()
                                                                                                                                            (93:24)-(93:28)
                                                                                                                                            (ValVariable "esoat"))
                                                                                                                                  (Just AList ()
                                                                                                                                              (93:30)-(93:35)
                                                                                                                                              [Argument ()
                                                                                                                                                        (93:30)-(93:31)
                                                                                                                                                        Nothing
                                                                                                                                                        (ArgExpr (ExpValue ()
                                                                                                                                                                           (93:30)-(93:31)
                                                                                                                                                                           (ValVariable "ur"))),
                                                                                                                                               Argument ()
                                                                                                                                                        (93:33)-(93:35)
                                                                                                                                                        Nothing
                                                                                                                                                        (ArgExpr (ExpValue ()
                                                                                                                                                                           (93:33)-(93:35)
                                                                                                                                                                           (ValVariable "ubb")))]))),
                                                                                               Argument ()
                                                                                                        (93:38)-(93:38)
                                                                                                        Nothing
                                                                                                        (ArgExpr (ExpValue ()
                                                                                                                           (93:38)-(93:38)
                                                                                                                           (ValInteger "1"
                                                                                                                                       Nothing)))]))),
                                 BlDo ()
                                      (94:9)-(100:14)
                                      Nothing
                                      Nothing
                                      Nothing
                                      (Just DoSpecification ()
                                                            (94:12)-(94:24)
                                                            (StExpressionAssign ()
                                                                                (94:12)-(94:17)
                                                                                (ExpValue ()
                                                                                          (94:12)-(94:15)
                                                                                          (ValVariable "ibor"))
                                                                                (ExpValue ()
                                                                                          (94:17)-(94:17)
                                                                                          (ValInteger "1"
                                                                                                      Nothing)))
                                                            (ExpValue ()
                                                                      (94:19)-(94:24)
                                                                      (ValVariable "ubbcnt"))
                                                            Nothing)
                                      [BlStatement ()
                                                   (95:11)-(95:40)
                                                   Nothing
                                                   (StExpressionAssign ()
                                                                       (95:11)-(95:40)
                                                                       (ExpValue ()
                                                                                 (95:11)-(95:12)
                                                                                 (ValVariable "bk"))
                                                                       (ExpFunctionCall ()
                                                                                        (95:16)-(95:40)
                                                                                        (ExpValue ()
                                                                                                  (95:16)-(95:20)
                                                                                                  (ValVariable "esoar"))
                                                                                        (Just AList ()
                                                                                                    (95:22)-(95:39)
                                                                                                    [Argument ()
                                                                                                              (95:22)-(95:34)
                                                                                                              Nothing
                                                                                                              (ArgExpr (ExpFunctionCall ()
                                                                                                                                        (95:22)-(95:34)
                                                                                                                                        (ExpValue ()
                                                                                                                                                  (95:22)-(95:26)
                                                                                                                                                  (ValVariable "esoat"))
                                                                                                                                        (Just AList ()
                                                                                                                                                    (95:28)-(95:33)
                                                                                                                                                    [Argument ()
                                                                                                                                                              (95:28)-(95:29)
                                                                                                                                                              Nothing
                                                                                                                                                              (ArgExpr (ExpValue ()
                                                                                                                                                                                 (95:28)-(95:29)
                                                                                                                                                                                 (ValVariable "ur"))),
                                                                                                                                                     Argument ()
                                                                                                                                                              (95:31)-(95:33)
                                                                                                                                                              Nothing
                                                                                                                                                              (ArgExpr (ExpValue ()
                                                                                                                                                                                 (95:31)-(95:33)
                                                                                                                                                                                 (ValVariable "ubb")))]))),
                                                                                                     Argument ()
                                                                                                              (95:36)-(95:39)
                                                                                                              Nothing
                                                                                                              (ArgExpr (ExpValue ()
                                                                                                                                 (95:36)-(95:39)
                                                                                                                                 (ValVariable "ibor")))]))),
                                       BlComment ()
                                                 (96:1)-(96:20)
                                                 (Comment "eso      segact, bk"),
                                       BlStatement ()
                                                   (97:11)-(97:82)
                                                   Nothing
                                                   (StWrite ()
                                                            (97:11)-(97:82)
                                                            (AList ()
                                                                   (97:16)-(97:20)
                                                                   [ControlPair ()
                                                                                (97:17)-(97:17)
                                                                                Nothing
                                                                                (ExpValue ()
                                                                                          (97:17)-(97:17)
                                                                                          ValStar),
                                                                    ControlPair ()
                                                                                (97:19)-(97:19)
                                                                                Nothing
                                                                                (ExpValue ()
                                                                                          (97:19)-(97:19)
                                                                                          ValStar)])
                                                            (Just AList ()
                                                                        (97:22)-(97:82)
                                                                        [ExpValue ()
                                                                                  (97:22)-(97:30)
                                                                                  (ValString ">> book"),
                                                                         ExpFunctionCall ()
                                                                                         (97:33)-(97:48)
                                                                                         (ExpValue ()
                                                                                                   (97:33)-(97:37)
                                                                                                   (ValVariable "esoat"))
                                                                                         (Just AList ()
                                                                                                     (97:39)-(97:47)
                                                                                                     [Argument ()
                                                                                                               (97:39)-(97:40)
                                                                                                               Nothing
                                                                                                               (ArgExpr (ExpValue ()
                                                                                                                                  (97:39)-(97:40)
                                                                                                                                  (ValVariable "bk"))),
                                                                                                      Argument ()
                                                                                                               (97:42)-(97:47)
                                                                                                               Nothing
                                                                                                               (ArgExpr (ExpValue ()
                                                                                                                                  (97:42)-(97:47)
                                                                                                                                  (ValVariable "btitle")))]),
                                                                         ExpFunctionCall ()
                                                                                         (97:51)-(97:66)
                                                                                         (ExpValue ()
                                                                                                   (97:51)-(97:55)
                                                                                                   (ValVariable "esoat"))
                                                                                         (Just AList ()
                                                                                                     (97:57)-(97:65)
                                                                                                     [Argument ()
                                                                                                               (97:57)-(97:58)
                                                                                                               Nothing
                                                                                                               (ArgExpr (ExpValue ()
                                                                                                                                  (97:57)-(97:58)
                                                                                                                                  (ValVariable "bk"))),
                                                                                                      Argument ()
                                                                                                               (97:60)-(97:65)
                                                                                                               Nothing
                                                                                                               (ArgExpr (ExpValue ()
                                                                                                                                  (97:60)-(97:65)
                                                                                                                                  (ValVariable "bpages")))]),
                                                                         ExpFunctionCall ()
                                                                                         (97:69)-(97:82)
                                                                                         (ExpValue ()
                                                                                                   (97:69)-(97:73)
                                                                                                   (ValVariable "esoat"))
                                                                                         (Just AList ()
                                                                                                     (97:75)-(97:81)
                                                                                                     [Argument ()
                                                                                                               (97:75)-(97:76)
                                                                                                               Nothing
                                                                                                               (ArgExpr (ExpValue ()
                                                                                                                                  (97:75)-(97:76)
                                                                                                                                  (ValVariable "bk"))),
                                                                                                      Argument ()
                                                                                                               (97:78)-(97:81)
                                                                                                               Nothing
                                                                                                               (ArgExpr (ExpValue ()
                                                                                                                                  (97:78)-(97:81)
                                                                                                                                  (ValVariable "budc")))])])),
                                       BlComment ()
                                                 (99:1)-(99:26)
                                                 (Comment "eso      segdes, bk*nomod")]
                                      Nothing,
                                 BlComment ()
                                           (102:1)-(102:24)
                                           (Comment "eso    segdes, ur*nomod")]
                                Nothing,
                           BlComment ()
                                     (105:1)-(105:61)
                                     (Comment " we print the user who borrwed books and the number of books"),
                           BlComment ()
                                     (106:1)-(106:14)
                                     (Comment " borrowed    "),
                           BlDo ()
                                (107:7)-(112:12)
                                Nothing
                                Nothing
                                Nothing
                                (Just DoSpecification ()
                                                      (107:10)-(107:22)
                                                      (StExpressionAssign ()
                                                                          (107:10)-(107:15)
                                                                          (ExpValue ()
                                                                                    (107:10)-(107:13)
                                                                                    (ValVariable "ibor"))
                                                                          (ExpValue ()
                                                                                    (107:15)-(107:15)
                                                                                    (ValInteger "1"
                                                                                                Nothing)))
                                                      (ExpValue ()
                                                                (107:18)-(107:22)
                                                                (ValVariable "urcnt"))
                                                      Nothing)
                                [BlStatement ()
                                             (108:9)-(108:50)
                                             Nothing
                                             (StExpressionAssign ()
                                                                 (108:9)-(108:50)
                                                                 (ExpValue ()
                                                                           (108:9)-(108:10)
                                                                           (ValVariable "ur"))
                                                                 (ExpFunctionCall ()
                                                                                  (108:14)-(108:50)
                                                                                  (ExpValue ()
                                                                                            (108:14)-(108:18)
                                                                                            (ValVariable "mypnt"))
                                                                                  (Just AList ()
                                                                                              (108:20)-(108:49)
                                                                                              [Argument ()
                                                                                                        (108:20)-(108:22)
                                                                                                        Nothing
                                                                                                        (ArgExpr (ExpValue ()
                                                                                                                           (108:20)-(108:22)
                                                                                                                           (ValVariable "lib"))),
                                                                                               Argument ()
                                                                                                        (108:24)-(108:49)
                                                                                                        Nothing
                                                                                                        (ArgExpr (ExpFunctionCall ()
                                                                                                                                  (108:24)-(108:49)
                                                                                                                                  (ExpValue ()
                                                                                                                                            (108:24)-(108:28)
                                                                                                                                            (ValVariable "esoar"))
                                                                                                                                  (Just AList ()
                                                                                                                                              (108:30)-(108:48)
                                                                                                                                              [Argument ()
                                                                                                                                                        (108:30)-(108:43)
                                                                                                                                                        Nothing
                                                                                                                                                        (ArgExpr (ExpFunctionCall ()
                                                                                                                                                                                  (108:30)-(108:43)
                                                                                                                                                                                  (ExpValue ()
                                                                                                                                                                                            (108:30)-(108:34)
                                                                                                                                                                                            (ValVariable "esoat"))
                                                                                                                                                                                  (Just AList ()
                                                                                                                                                                                              (108:36)-(108:42)
                                                                                                                                                                                              [Argument ()
                                                                                                                                                                                                        (108:36)-(108:37)
                                                                                                                                                                                                        Nothing
                                                                                                                                                                                                        (ArgExpr (ExpValue ()
                                                                                                                                                                                                                           (108:36)-(108:37)
                                                                                                                                                                                                                           (ValVariable "lb"))),
                                                                                                                                                                                               Argument ()
                                                                                                                                                                                                        (108:39)-(108:42)
                                                                                                                                                                                                        Nothing
                                                                                                                                                                                                        (ArgExpr (ExpValue ()
                                                                                                                                                                                                                           (108:39)-(108:42)
                                                                                                                                                                                                                           (ValVariable "uref")))]))),
                                                                                                                                               Argument ()
                                                                                                                                                        (108:45)-(108:48)
                                                                                                                                                        Nothing
                                                                                                                                                        (ArgExpr (ExpValue ()
                                                                                                                                                                           (108:45)-(108:48)
                                                                                                                                                                           (ValVariable "ibor")))])))]))),
                                 BlComment ()
                                           (109:1)-(109:18)
                                           (Comment "eso    segact, ur"),
                                 BlStatement ()
                                             (110:9)-(110:77)
                                             Nothing
                                             (StWrite ()
                                                      (110:9)-(110:77)
                                                      (AList ()
                                                             (110:14)-(110:18)
                                                             [ControlPair ()
                                                                          (110:15)-(110:15)
                                                                          Nothing
                                                                          (ExpValue ()
                                                                                    (110:15)-(110:15)
                                                                                    ValStar),
                                                              ControlPair ()
                                                                          (110:17)-(110:17)
                                                                          Nothing
                                                                          (ExpValue ()
                                                                                    (110:17)-(110:17)
                                                                                    ValStar)])
                                                      (Just AList ()
                                                                  (110:19)-(110:77)
                                                                  [ExpValue ()
                                                                            (110:19)-(110:28)
                                                                            (ValString "user num"),
                                                                   ExpValue ()
                                                                            (110:30)-(110:32)
                                                                            (ValVariable "iur"),
                                                                   ExpFunctionCall ()
                                                                                   (110:35)-(110:49)
                                                                                   (ExpValue ()
                                                                                             (110:35)-(110:39)
                                                                                             (ValVariable "esoat"))
                                                                                   (Just AList ()
                                                                                               (110:41)-(110:48)
                                                                                               [Argument ()
                                                                                                         (110:41)-(110:42)
                                                                                                         Nothing
                                                                                                         (ArgExpr (ExpValue ()
                                                                                                                            (110:41)-(110:42)
                                                                                                                            (ValVariable "ur"))),
                                                                                                Argument ()
                                                                                                         (110:44)-(110:48)
                                                                                                         Nothing
                                                                                                         (ArgExpr (ExpValue ()
                                                                                                                            (110:44)-(110:48)
                                                                                                                            (ValVariable "uname")))]),
                                                                   ExpFunctionCall ()
                                                                                   (110:53)-(110:77)
                                                                                   (ExpValue ()
                                                                                             (110:53)-(110:57)
                                                                                             (ValVariable "esoar"))
                                                                                   (Just AList ()
                                                                                               (110:59)-(110:76)
                                                                                               [Argument ()
                                                                                                         (110:59)-(110:71)
                                                                                                         Nothing
                                                                                                         (ArgExpr (ExpFunctionCall ()
                                                                                                                                   (110:59)-(110:71)
                                                                                                                                   (ExpValue ()
                                                                                                                                             (110:59)-(110:63)
                                                                                                                                             (ValVariable "esoat"))
                                                                                                                                   (Just AList ()
                                                                                                                                               (110:65)-(110:70)
                                                                                                                                               [Argument ()
                                                                                                                                                         (110:65)-(110:66)
                                                                                                                                                         Nothing
                                                                                                                                                         (ArgExpr (ExpValue ()
                                                                                                                                                                            (110:65)-(110:66)
                                                                                                                                                                            (ValVariable "ur"))),
                                                                                                                                                Argument ()
                                                                                                                                                         (110:68)-(110:70)
                                                                                                                                                         Nothing
                                                                                                                                                         (ArgExpr (ExpValue ()
                                                                                                                                                                            (110:68)-(110:70)
                                                                                                                                                                            (ValVariable "ubb")))]))),
                                                                                                Argument ()
                                                                                                         (110:73)-(110:76)
                                                                                                         Nothing
                                                                                                         (ArgExpr (ExpValue ()
                                                                                                                            (110:73)-(110:76)
                                                                                                                            (ValVariable "ibor")))])])),
                                 BlComment ()
                                           (111:1)-(111:24)
                                           (Comment "eso    segdes, ur*nomod")]
                                Nothing,
                           BlComment ()
                                     (114:1)-(114:26)
                                     (Comment " desactivate head segment"),
                           BlComment ()
                                     (115:1)-(115:22)
                                     (Comment "eso  segdes, lb*nomod"),
                           BlComment ()
                                     (117:1)-(117:23)
                                     (Comment " desactivate structure"),
                           BlStatement ()
                                       (118:7)-(118:30)
                                       Nothing
                                       (StCall ()
                                               (118:7)-(118:30)
                                               (ExpValue ()
                                                         (118:12)-(118:17)
                                                         (ValVariable "desstr"))
                                               (Just AList ()
                                                           (118:18)-(118:30)
                                                           [Argument ()
                                                                     (118:19)-(118:21)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (118:19)-(118:21)
                                                                                        (ValVariable "lib"))),
                                                            Argument ()
                                                                     (118:23)-(118:29)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (118:23)-(118:29)
                                                                                        (ValString "nomod")))]))]
                          Nothing]
'
]

{ #category : #'fortran77-annoted' }
PP2FortranSrcGrammarTest class >> libpntFortran [

	^ '      subroutine libprt(lib)
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


c dummy argument
cESO  pointeur lib.pstr

c use of external for mypnt since it is a function
      external mypnt
      integer mypnt

c local variables     
cESO  pointeur lb.tlib
cESO  pointeur bk.book
cESO  pointeur ur.user

c ibk number of books
c iur number of users
c ibor number of borrowed books
      integer ibk,iur,ibor

      call actstr(lib)
      lb = mypnt(lib,1)
cESO  segact, lb  
  
      brcnt = ESOsl(ESOat(lb,bref),1)
      urcnt = ESOsl(ESOat(lb,uref),1) 
  
      do ibk=1, brcnt
        bk = mypnt(lib,ESOar(ESOat(lb,bref),ibk))
cESO    segact, bk
        write(*,*)''book num'',ibk, ESOat(bk,btitle), ESOat(bk,bpages), ESOat(bk,budc)
cESO    segdes, bk*nomod
      end do

c we search in the structure for users and print their names
c pages and udc
      do iur=1, urcnt
        ur = mypnt(lib,ESOar(ESOat(lb,uref),iur))
cESO    segact, ur
        write(*,*)''user num'',iur, ESOat(ur,uname)

c we print the books borrowed by the user
        ubbcnt = ESOsl(ESOat(ur,ubb),1)
        do ibor=1,ubbcnt
          bk = ESOar(ESOat(ur,ubb),ibor)
cESO      segact, bk
          write(*,*) ''>> book'', ESOat(bk,btitle), ESOat(bk,bpages), ESOat(bk,budc)

cESO      segdes, bk*nomod
        end do

cESO    segdes, ur*nomod
      end do

c we print the user who borrwed books and the number of books
c borrowed    
      do ibor=1, urcnt
        ur = mypnt(lib,ESOar(ESOat(lb,uref),ibor))
cESO    segact, ur
        write(*,*)''user num'',iur, ESOat(ur,uname) , ESOar(ESOat(ur,ubb),ibor)
cESO    segdes, ur*nomod
      end do     

c desactivate head segment
cESO  segdes, lb*nomod

c desactivate structure
      call desstr(lib,''nomod'')

      end


'
]

{ #category : #'filesytem-inmemory' }
PP2FortranSrcGrammarTest class >> main [

	^ (self workDir / 'main.0.e.f') ensureCreateFile writeStreamDo: [ 
		  :stream | stream << self libpntFortran ]
]

{ #category : #'AST-fortranSrc' }
PP2FortranSrcGrammarTest class >> mainAST [

	^ 'ProgramFile (MetaInfo
                     {miVersion = Fortran77,
                      miFilename = "/demo-bib/build/main.0.e.f"})
            [PUMain ()
                    (1:7)-(82:9)
                    (Just "main")
                    [BlStatement ()
                                 (2:7)-(2:19)
                                 Nothing
                                 (StImplicit () (2:7)-(2:19) Nothing),
                     BlComment ()
                               (5:1)-(5:62)
                               (Comment "2345678901234567890123456789012345678901234567890123456789012"),
                     BlComment ()
                               (6:1)-(6:28)
                               (Comment " bref(brcnt) array of books"),
                     BlComment ()
                               (7:1)-(7:28)
                               (Comment " uref(urcnt) array of users"),
                     BlComment ()
                               (8:1)-(8:47)
                               (Comment " bstatu(brcnt) logical array of borrowed books"),
                     BlComment ()
                               (9:1)-(9:49)
                               (Comment " ubb(ubbcnt) array of books borrowed by the user"),
                     BlComment () (11:1)-(11:12) (Comment ": maillon 1"),
                     BlStatement ()
                                 (12:7)-(12:19)
                                 Nothing
                                 (StDeclaration ()
                                                (12:7)-(12:19)
                                                (TypeSpec ()
                                                          (12:7)-(12:13)
                                                          TypeInteger
                                                          Nothing)
                                                Nothing
                                                (AList ()
                                                       (12:15)-(12:19)
                                                       [Declarator ()
                                                                   (12:15)-(12:19)
                                                                   (ExpValue ()
                                                                             (12:15)-(12:19)
                                                                             (ValVariable "brcnt"))
                                                                   ScalarDecl
                                                                   Nothing
                                                                   Nothing])),
                     BlStatement ()
                                 (13:7)-(13:19)
                                 Nothing
                                 (StDeclaration ()
                                                (13:7)-(13:19)
                                                (TypeSpec ()
                                                          (13:7)-(13:13)
                                                          TypeInteger
                                                          Nothing)
                                                Nothing
                                                (AList ()
                                                       (13:15)-(13:19)
                                                       [Declarator ()
                                                                   (13:15)-(13:19)
                                                                   (ExpValue ()
                                                                             (13:15)-(13:19)
                                                                             (ValVariable "urcnt"))
                                                                   ScalarDecl
                                                                   Nothing
                                                                   Nothing])),
                     BlStatement ()
                                 (14:7)-(14:20)
                                 Nothing
                                 (StDeclaration ()
                                                (14:7)-(14:20)
                                                (TypeSpec ()
                                                          (14:7)-(14:13)
                                                          TypeInteger
                                                          Nothing)
                                                Nothing
                                                (AList ()
                                                       (14:15)-(14:20)
                                                       [Declarator ()
                                                                   (14:15)-(14:20)
                                                                   (ExpValue ()
                                                                             (14:15)-(14:20)
                                                                             (ValVariable "ubbcnt"))
                                                                   ScalarDecl
                                                                   Nothing
                                                                   Nothing])),
                     BlComment ()
                               (16:1)-(16:18)
                               (Comment " segment de t\227\170te"),
                     BlComment ()
                               (17:1)-(17:19)
                               (Comment "eso  segment, tlib"),
                     BlComment ()
                               (18:1)-(18:27)
                               (Comment "eso    integer bref(brcnt)"),
                     BlComment ()
                               (19:1)-(19:29)
                               (Comment "eso    logical bstatu(brcnt)"),
                     BlComment ()
                               (20:1)-(20:27)
                               (Comment "eso    integer uref(urcnt)"),
                     BlComment ()
                               (21:1)-(21:17)
                               (Comment "eso  end segment"),
                     BlComment ()
                               (23:1)-(23:19)
                               (Comment "eso  segment, book"),
                     BlComment ()
                               (24:1)-(24:27)
                               (Comment "eso    character*40 btitle"),
                     BlComment ()
                               (25:1)-(25:22)
                               (Comment "eso    integer bpages"),
                     BlComment ()
                               (26:1)-(26:17)
                               (Comment "eso    real budc"),
                     BlComment ()
                               (27:1)-(27:17)
                               (Comment "eso  end segment"),
                     BlComment ()
                               (29:1)-(29:19)
                               (Comment "eso  segment, user"),
                     BlComment ()
                               (30:1)-(30:26)
                               (Comment "eso    character*40 uname"),
                     BlComment ()
                               (31:1)-(31:27)
                               (Comment "eso    integer ubb(ubbcnt)"),
                     BlComment ()
                               (32:1)-(32:17)
                               (Comment "eso  end segment"),
                     BlComment ()
                               (34:1)-(34:67)
                               (Comment "******************************************************************"),
                     BlComment ()
                               (36:1)-(36:62)
                               (Comment "2345678901234567890123456789012345678901234567890123456789012"),
                     BlComment () (37:1)-(37:6) (Comment "-pstr"),
                     BlComment ()
                               (38:1)-(38:62)
                               (Comment ":pstr   segment dentete des structures : nouvelles definition"),
                     BlComment ()
                               (39:1)-(39:72)
                               (Comment ":nomcod nom du code auquel appartient la structure (cronos, apollo, ..)"),
                     BlComment ()
                               (40:1)-(40:29)
                               (Comment ":date   date de debut de job"),
                     BlComment ()
                               (41:1)-(41:30)
                               (Comment ":heure  heure de debut de job"),
                     BlComment ()
                               (42:1)-(42:54)
                               (Comment ":typseg type des segments appartenants a la structure"),
                     BlComment ()
                               (43:1)-(43:53)
                               (Comment ":typref type des objects references par la structure"),
                     BlComment ()
                               (44:1)-(44:53)
                               (Comment ":ibseg  numero max. du segment ajoute a la structure"),
                     BlComment ()
                               (45:1)-(45:58)
                               (Comment ":ibref  numero max. de lobject reference par la structure"),
                     BlComment ()
                               (46:1)-(46:58)
                               (Comment ":pntseg pointeurs des segments apartenants a la structure"),
                     BlComment ()
                               (47:1)-(47:58)
                               (Comment ":pntref pointeurs des objects references par la structure"),
                     BlComment ()
                               (48:1)-(48:19)
                               (Comment "eso  segment, pstr"),
                     BlComment ()
                               (49:1)-(49:70)
                               (Comment "eso    character*8 nomcode, date, heure, typseg(nbseg), typref(nbref)"),
                     BlComment ()
                               (50:1)-(50:70)
                               (Comment "eso    integer     ibseg, ibref,         pntseg(nbseg), pntref(nbref)"),
                     BlComment ()
                               (51:1)-(51:16)
                               (Comment "eso  endsegment"),
                     BlComment ()
                               (52:1)-(52:62)
                               (Comment "-------------------------------------------------------------"),
                     BlComment ()
                               (55:1)-(55:26)
                               (Comment " lib structure pstr      "),
                     BlComment ()
                               (56:1)-(56:23)
                               (Comment "eso  pointeur lib.pstr"),
                     BlStatement ()
                                 (59:7)-(59:30)
                                 Nothing
                                 (StWrite ()
                                          (59:7)-(59:30)
                                          (AList ()
                                                 (59:12)-(59:16)
                                                 [ControlPair ()
                                                              (59:13)-(59:13)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (59:13)-(59:13)
                                                                        ValStar),
                                                  ControlPair ()
                                                              (59:15)-(59:15)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (59:15)-(59:15)
                                                                        ValStar)])
                                          (Just AList ()
                                                      (59:18)-(59:30)
                                                      [ExpValue ()
                                                                (59:18)-(59:30)
                                                                (ValString "main: begin")])),
                     BlStatement ()
                                 (61:7)-(61:17)
                                 Nothing
                                 (StCall ()
                                         (61:7)-(61:17)
                                         (ExpValue ()
                                                   (61:12)-(61:17)
                                                   (ValVariable "ooossg"))
                                         Nothing),
                     BlStatement ()
                                 (63:7)-(63:22)
                                 Nothing
                                 (StCall ()
                                         (63:7)-(63:22)
                                         (ExpValue ()
                                                   (63:12)-(63:17)
                                                   (ValVariable "newlib"))
                                         (Just AList ()
                                                     (63:18)-(63:22)
                                                     [Argument ()
                                                               (63:19)-(63:21)
                                                               Nothing
                                                               (ArgExpr (ExpValue ()
                                                                                  (63:19)-(63:21)
                                                                                  (ValVariable "lib")))])),
                     BlStatement ()
                                 (65:7)-(65:64)
                                 Nothing
                                 (StCall ()
                                         (65:7)-(65:64)
                                         (ExpValue ()
                                                   (65:12)-(65:18)
                                                   (ValVariable "newbook"))
                                         (Just AList ()
                                                     (65:19)-(65:64)
                                                     [Argument ()
                                                               (65:20)-(65:22)
                                                               Nothing
                                                               (ArgExpr (ExpValue ()
                                                                                  (65:20)-(65:22)
                                                                                  (ValVariable "lib"))),
                                                      Argument ()
                                                               (65:24)-(65:48)
                                                               Nothing
                                                               (ArgExpr (ExpValue ()
                                                                                  (65:24)-(65:48)
                                                                                  (ValString "le petit chaperon rouge"))),
                                                      Argument ()
                                                               (65:50)-(65:51)
                                                               Nothing
                                                               (ArgExpr (ExpValue ()
                                                                                  (65:50)-(65:51)
                                                                                  (ValInteger "10"
                                                                                              Nothing))),
                                                      Argument ()
                                                               (65:53)-(65:63)
                                                               Nothing
                                                               (ArgExpr (ExpFunctionCall ()
                                                                                         (65:53)-(65:63)
                                                                                         (ExpValue ()
                                                                                                   (65:53)-(65:57)
                                                                                                   (ValVariable "esoat"))
                                                                                         (Just AList ()
                                                                                                     (65:59)-(65:62)
                                                                                                     [Argument ()
                                                                                                               (65:59)-(65:59)
                                                                                                               Nothing
                                                                                                               (ArgExpr (ExpValue ()
                                                                                                                                  (65:59)-(65:59)
                                                                                                                                  (ValInteger "2"
                                                                                                                                              Nothing))),
                                                                                                      Argument ()
                                                                                                               (65:61)-(65:62)
                                                                                                               Nothing
                                                                                                               (ArgExpr (ExpValue ()
                                                                                                                                  (65:61)-(65:62)
                                                                                                                                  (ValInteger "12"
                                                                                                                                              Nothing)))])))])),
                     BlStatement ()
                                 (67:7)-(67:52)
                                 Nothing
                                 (StCall ()
                                         (67:7)-(67:52)
                                         (ExpValue ()
                                                   (67:12)-(67:18)
                                                   (ValVariable "newbook"))
                                         (Just AList ()
                                                     (67:19)-(67:52)
                                                     [Argument ()
                                                               (67:20)-(67:22)
                                                               Nothing
                                                               (ArgExpr (ExpValue ()
                                                                                  (67:20)-(67:22)
                                                                                  (ValVariable "lib"))),
                                                      Argument ()
                                                               (67:24)-(67:35)
                                                               Nothing
                                                               (ArgExpr (ExpValue ()
                                                                                  (67:24)-(67:35)
                                                                                  (ValString "croc blanc"))),
                                                      Argument ()
                                                               (67:37)-(67:39)
                                                               Nothing
                                                               (ArgExpr (ExpValue ()
                                                                                  (67:37)-(67:39)
                                                                                  (ValInteger "100"
                                                                                              Nothing))),
                                                      Argument ()
                                                               (67:41)-(67:51)
                                                               Nothing
                                                               (ArgExpr (ExpFunctionCall ()
                                                                                         (67:41)-(67:51)
                                                                                         (ExpValue ()
                                                                                                   (67:41)-(67:45)
                                                                                                   (ValVariable "esoat"))
                                                                                         (Just AList ()
                                                                                                     (67:47)-(67:50)
                                                                                                     [Argument ()
                                                                                                               (67:47)-(67:47)
                                                                                                               Nothing
                                                                                                               (ArgExpr (ExpValue ()
                                                                                                                                  (67:47)-(67:47)
                                                                                                                                  (ValInteger "4"
                                                                                                                                              Nothing))),
                                                                                                      Argument ()
                                                                                                               (67:49)-(67:50)
                                                                                                               Nothing
                                                                                                               (ArgExpr (ExpValue ()
                                                                                                                                  (67:49)-(67:50)
                                                                                                                                  (ValInteger "15"
                                                                                                                                              Nothing)))])))])),
                     BlStatement ()
                                 (69:7)-(69:32)
                                 Nothing
                                 (StCall ()
                                         (69:7)-(69:32)
                                         (ExpValue ()
                                                   (69:12)-(69:18)
                                                   (ValVariable "newuser"))
                                         (Just AList ()
                                                     (69:19)-(69:32)
                                                     [Argument ()
                                                               (69:20)-(69:22)
                                                               Nothing
                                                               (ArgExpr (ExpValue ()
                                                                                  (69:20)-(69:22)
                                                                                  (ValVariable "lib"))),
                                                      Argument ()
                                                               (69:24)-(69:31)
                                                               Nothing
                                                               (ArgExpr (ExpValue ()
                                                                                  (69:24)-(69:31)
                                                                                  (ValString "emilie")))])),
                     BlStatement ()
                                 (71:7)-(71:30)
                                 Nothing
                                 (StCall ()
                                         (71:7)-(71:30)
                                         (ExpValue ()
                                                   (71:12)-(71:18)
                                                   (ValVariable "newuser"))
                                         (Just AList ()
                                                     (71:19)-(71:30)
                                                     [Argument ()
                                                               (71:20)-(71:22)
                                                               Nothing
                                                               (ArgExpr (ExpValue ()
                                                                                  (71:20)-(71:22)
                                                                                  (ValVariable "lib"))),
                                                      Argument ()
                                                               (71:24)-(71:29)
                                                               Nothing
                                                               (ArgExpr (ExpValue ()
                                                                                  (71:24)-(71:29)
                                                                                  (ValString "mike")))])),
                     BlStatement ()
                                 (73:7)-(73:43)
                                 Nothing
                                 (StCall ()
                                         (73:7)-(73:43)
                                         (ExpValue ()
                                                   (73:12)-(73:16)
                                                   (ValVariable "borbk"))
                                         (Just AList ()
                                                     (73:18)-(73:43)
                                                     [Argument ()
                                                               (73:19)-(73:21)
                                                               Nothing
                                                               (ArgExpr (ExpValue ()
                                                                                  (73:19)-(73:21)
                                                                                  (ValVariable "lib"))),
                                                      Argument ()
                                                               (73:23)-(73:28)
                                                               Nothing
                                                               (ArgExpr (ExpValue ()
                                                                                  (73:23)-(73:28)
                                                                                  (ValString "mike"))),
                                                      Argument ()
                                                               (73:31)-(73:42)
                                                               Nothing
                                                               (ArgExpr (ExpValue ()
                                                                                  (73:31)-(73:42)
                                                                                  (ValString "croc blanc")))])),
                     BlStatement ()
                                 (75:7)-(75:43)
                                 Nothing
                                 (StCall ()
                                         (75:7)-(75:43)
                                         (ExpValue ()
                                                   (75:12)-(75:16)
                                                   (ValVariable "relbk"))
                                         (Just AList ()
                                                     (75:17)-(75:43)
                                                     [Argument ()
                                                               (75:18)-(75:20)
                                                               Nothing
                                                               (ArgExpr (ExpValue ()
                                                                                  (75:18)-(75:20)
                                                                                  (ValVariable "lib"))),
                                                      Argument ()
                                                               (75:23)-(75:28)
                                                               Nothing
                                                               (ArgExpr (ExpValue ()
                                                                                  (75:23)-(75:28)
                                                                                  (ValString "mike"))),
                                                      Argument ()
                                                               (75:31)-(75:42)
                                                               Nothing
                                                               (ArgExpr (ExpValue ()
                                                                                  (75:31)-(75:42)
                                                                                  (ValString "croc blanc")))])),
                     BlStatement ()
                                 (77:7)-(77:23)
                                 Nothing
                                 (StCall ()
                                         (77:7)-(77:23)
                                         (ExpValue ()
                                                   (77:12)-(77:17)
                                                   (ValVariable "libprt"))
                                         (Just AList ()
                                                     (77:19)-(77:23)
                                                     [Argument ()
                                                               (77:20)-(77:22)
                                                               Nothing
                                                               (ArgExpr (ExpValue ()
                                                                                  (77:20)-(77:22)
                                                                                  (ValVariable "lib")))])),
                     BlStatement ()
                                 (79:7)-(79:17)
                                 Nothing
                                 (StCall ()
                                         (79:7)-(79:17)
                                         (ExpValue ()
                                                   (79:12)-(79:17)
                                                   (ValVariable "ooostp"))
                                         Nothing),
                     BlStatement ()
                                 (81:7)-(81:28)
                                 Nothing
                                 (StWrite ()
                                          (81:7)-(81:28)
                                          (AList ()
                                                 (81:12)-(81:16)
                                                 [ControlPair ()
                                                              (81:13)-(81:13)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (81:13)-(81:13)
                                                                        ValStar),
                                                  ControlPair ()
                                                              (81:15)-(81:15)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (81:15)-(81:15)
                                                                        ValStar)])
                                          (Just AList ()
                                                      (81:18)-(81:28)
                                                      [ExpValue ()
                                                                (81:18)-(81:28)
                                                                (ValString "main: end")]))]
                    Nothing]
'
]

{ #category : #'fortran77-annoted' }
PP2FortranSrcGrammarTest class >> mainFortran [

	^ '      program main
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


c lib structure pstr      
cESO  pointeur lib.pstr
      
     
      write(*,*) ''main: begin''
      
      call ooossg 

      call newlib(lib)  
   
      call newbook(lib,''le petit chaperon rouge'',10,ESOat(2,12))   

      call newbook(lib,''croc blanc'',100,ESOat(4,15)) 

      call newuser(lib,''emilie'')

      call newuser(lib,''mike'')
     
      call borbk (lib,''mike'', ''croc blanc'')
   
      call relbk(lib, ''mike'', ''croc blanc'')

      call libprt (lib)
          
      call ooostp

      write(*,*) ''main: end''
      end


'
]

{ #category : #'filesytem-inmemory' }
PP2FortranSrcGrammarTest class >> newbook [

	^ (self workDir / 'newbook.0.e.f') ensureCreateFile writeStreamDo: [ 
		  :stream | stream << self newbookFortran ]
]

{ #category : #'AST-fortranSrc' }
PP2FortranSrcGrammarTest class >> newbookAST [

	^ 'ProgramFile (MetaInfo
                     {miVersion = Fortran77,
                      miFilename = "/demo-bib/build/newbook.0.e.f"})
            [PUSubroutine ()
                          (1:7)-(101:9)
                          (Nothing, Nothing)
                          "newbook"
                          (Just AList ()
                                      (1:26)-(1:44)
                                      [ExpValue ()
                                                (1:26)-(1:28)
                                                (ValVariable "lib"),
                                       ExpValue ()
                                                (1:30)-(1:34)
                                                (ValVariable "title"),
                                       ExpValue ()
                                                (1:36)-(1:40)
                                                (ValVariable "pages"),
                                       ExpValue ()
                                                (1:42)-(1:44)
                                                (ValVariable "udc")])
                          [BlStatement ()
                                       (2:7)-(2:19)
                                       Nothing
                                       (StImplicit () (2:7)-(2:19) Nothing),
                           BlComment ()
                                     (5:1)-(5:62)
                                     (Comment "2345678901234567890123456789012345678901234567890123456789012"),
                           BlComment ()
                                     (6:1)-(6:28)
                                     (Comment " bref(brcnt) array of books"),
                           BlComment ()
                                     (7:1)-(7:28)
                                     (Comment " uref(urcnt) array of users"),
                           BlComment ()
                                     (8:1)-(8:47)
                                     (Comment " bstatu(brcnt) logical array of borrowed books"),
                           BlComment ()
                                     (9:1)-(9:49)
                                     (Comment " ubb(ubbcnt) array of books borrowed by the user"),
                           BlComment () (11:1)-(11:12) (Comment ": maillon 1"),
                           BlStatement ()
                                       (12:7)-(12:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (12:7)-(12:19)
                                                      (TypeSpec ()
                                                                (12:7)-(12:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (12:15)-(12:19)
                                                             [Declarator ()
                                                                         (12:15)-(12:19)
                                                                         (ExpValue ()
                                                                                   (12:15)-(12:19)
                                                                                   (ValVariable "brcnt"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (13:7)-(13:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (13:7)-(13:19)
                                                      (TypeSpec ()
                                                                (13:7)-(13:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (13:15)-(13:19)
                                                             [Declarator ()
                                                                         (13:15)-(13:19)
                                                                         (ExpValue ()
                                                                                   (13:15)-(13:19)
                                                                                   (ValVariable "urcnt"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (14:7)-(14:20)
                                       Nothing
                                       (StDeclaration ()
                                                      (14:7)-(14:20)
                                                      (TypeSpec ()
                                                                (14:7)-(14:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (14:15)-(14:20)
                                                             [Declarator ()
                                                                         (14:15)-(14:20)
                                                                         (ExpValue ()
                                                                                   (14:15)-(14:20)
                                                                                   (ValVariable "ubbcnt"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment ()
                                     (16:1)-(16:18)
                                     (Comment " segment de t\227\170te"),
                           BlComment ()
                                     (17:1)-(17:19)
                                     (Comment "eso  segment, tlib"),
                           BlComment ()
                                     (18:1)-(18:27)
                                     (Comment "eso    integer bref(brcnt)"),
                           BlComment ()
                                     (19:1)-(19:29)
                                     (Comment "eso    logical bstatu(brcnt)"),
                           BlComment ()
                                     (20:1)-(20:27)
                                     (Comment "eso    integer uref(urcnt)"),
                           BlComment ()
                                     (21:1)-(21:17)
                                     (Comment "eso  end segment"),
                           BlComment ()
                                     (23:1)-(23:19)
                                     (Comment "eso  segment, book"),
                           BlComment ()
                                     (24:1)-(24:27)
                                     (Comment "eso    character*40 btitle"),
                           BlComment ()
                                     (25:1)-(25:22)
                                     (Comment "eso    integer bpages"),
                           BlComment ()
                                     (26:1)-(26:17)
                                     (Comment "eso    real budc"),
                           BlComment ()
                                     (27:1)-(27:17)
                                     (Comment "eso  end segment"),
                           BlComment ()
                                     (29:1)-(29:19)
                                     (Comment "eso  segment, user"),
                           BlComment ()
                                     (30:1)-(30:26)
                                     (Comment "eso    character*40 uname"),
                           BlComment ()
                                     (31:1)-(31:27)
                                     (Comment "eso    integer ubb(ubbcnt)"),
                           BlComment ()
                                     (32:1)-(32:17)
                                     (Comment "eso  end segment"),
                           BlComment ()
                                     (34:1)-(34:67)
                                     (Comment "******************************************************************"),
                           BlComment ()
                                     (36:1)-(36:62)
                                     (Comment "2345678901234567890123456789012345678901234567890123456789012"),
                           BlComment () (37:1)-(37:6) (Comment "-pstr"),
                           BlComment ()
                                     (38:1)-(38:62)
                                     (Comment ":pstr   segment dentete des structures : nouvelles definition"),
                           BlComment ()
                                     (39:1)-(39:72)
                                     (Comment ":nomcod nom du code auquel appartient la structure (cronos, apollo, ..)"),
                           BlComment ()
                                     (40:1)-(40:29)
                                     (Comment ":date   date de debut de job"),
                           BlComment ()
                                     (41:1)-(41:30)
                                     (Comment ":heure  heure de debut de job"),
                           BlComment ()
                                     (42:1)-(42:54)
                                     (Comment ":typseg type des segments appartenants a la structure"),
                           BlComment ()
                                     (43:1)-(43:53)
                                     (Comment ":typref type des objects references par la structure"),
                           BlComment ()
                                     (44:1)-(44:53)
                                     (Comment ":ibseg  numero max. du segment ajoute a la structure"),
                           BlComment ()
                                     (45:1)-(45:58)
                                     (Comment ":ibref  numero max. de lobject reference par la structure"),
                           BlComment ()
                                     (46:1)-(46:58)
                                     (Comment ":pntseg pointeurs des segments apartenants a la structure"),
                           BlComment ()
                                     (47:1)-(47:58)
                                     (Comment ":pntref pointeurs des objects references par la structure"),
                           BlComment ()
                                     (48:1)-(48:19)
                                     (Comment "eso  segment, pstr"),
                           BlComment ()
                                     (49:1)-(49:70)
                                     (Comment "eso    character*8 nomcode, date, heure, typseg(nbseg), typref(nbref)"),
                           BlComment ()
                                     (50:1)-(50:70)
                                     (Comment "eso    integer     ibseg, ibref,         pntseg(nbseg), pntref(nbref)"),
                           BlComment ()
                                     (51:1)-(51:16)
                                     (Comment "eso  endsegment"),
                           BlComment ()
                                     (52:1)-(52:62)
                                     (Comment "-------------------------------------------------------------"),
                           BlComment ()
                                     (55:1)-(55:17)
                                     (Comment " dummy arguments"),
                           BlComment ()
                                     (56:1)-(56:23)
                                     (Comment "eso  pointeur lib.pstr"),
                           BlStatement ()
                                       (57:7)-(57:25)
                                       Nothing
                                       (StDeclaration ()
                                                      (57:7)-(57:25)
                                                      (TypeSpec ()
                                                                (57:7)-(57:19)
                                                                TypeCharacter
                                                                (Just Selector ()
                                                                               (57:16)-(57:19)
                                                                               (Just ExpValue ()
                                                                                              (57:18)-(57:18)
                                                                                              ValStar)
                                                                               Nothing))
                                                      Nothing
                                                      (AList ()
                                                             (57:21)-(57:25)
                                                             [Declarator ()
                                                                         (57:21)-(57:25)
                                                                         (ExpValue ()
                                                                                   (57:21)-(57:25)
                                                                                   (ValVariable "title"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (58:7)-(58:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (58:7)-(58:19)
                                                      (TypeSpec ()
                                                                (58:7)-(58:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (58:15)-(58:19)
                                                             [Declarator ()
                                                                         (58:15)-(58:19)
                                                                         (ExpValue ()
                                                                                   (58:15)-(58:19)
                                                                                   (ValVariable "pages"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (59:7)-(59:14)
                                       Nothing
                                       (StDeclaration ()
                                                      (59:7)-(59:14)
                                                      (TypeSpec ()
                                                                (59:7)-(59:10)
                                                                TypeReal
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (59:12)-(59:14)
                                                             [Declarator ()
                                                                         (59:12)-(59:14)
                                                                         (ExpValue ()
                                                                                   (59:12)-(59:14)
                                                                                   (ValVariable "udc"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment ()
                                     (61:1)-(61:50)
                                     (Comment " use of external for mypnt since it is a function"),
                           BlStatement ()
                                       (62:7)-(62:20)
                                       Nothing
                                       (StExternal ()
                                                   (62:7)-(62:20)
                                                   (AList ()
                                                          (62:16)-(62:20)
                                                          [ExpValue ()
                                                                    (62:16)-(62:20)
                                                                    (ValVariable "mypnt")])),
                           BlStatement ()
                                       (63:7)-(63:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (63:7)-(63:19)
                                                      (TypeSpec ()
                                                                (63:7)-(63:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (63:15)-(63:19)
                                                             [Declarator ()
                                                                         (63:15)-(63:19)
                                                                         (ExpValue ()
                                                                                   (63:15)-(63:19)
                                                                                   (ValVariable "mypnt"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment ()
                                     (65:1)-(65:23)
                                     (Comment " local vriables       "),
                           BlStatement ()
                                       (66:7)-(66:18)
                                       Nothing
                                       (StDeclaration ()
                                                      (66:7)-(66:18)
                                                      (TypeSpec ()
                                                                (66:7)-(66:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (66:15)-(66:18)
                                                             [Declarator ()
                                                                         (66:15)-(66:18)
                                                                         (ExpValue ()
                                                                                   (66:15)-(66:18)
                                                                                   (ValVariable "jord"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment ()
                                     (67:1)-(67:22)
                                     (Comment "eso  pointeur lb.tlib"),
                           BlComment ()
                                     (68:1)-(68:22)
                                     (Comment "eso  pointeur bk.book"),
                           BlStatement ()
                                       (71:7)-(71:33)
                                       Nothing
                                       (StWrite ()
                                                (71:7)-(71:33)
                                                (AList ()
                                                       (71:12)-(71:16)
                                                       [ControlPair ()
                                                                    (71:13)-(71:13)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (71:13)-(71:13)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (71:15)-(71:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (71:15)-(71:15)
                                                                              ValStar)])
                                                (Just AList ()
                                                            (71:18)-(71:33)
                                                            [ExpValue ()
                                                                      (71:18)-(71:33)
                                                                      (ValString "newbook: begin")])),
                           BlComment ()
                                     (73:1)-(73:17)
                                     (Comment " activate struct"),
                           BlStatement ()
                                       (74:7)-(74:22)
                                       Nothing
                                       (StCall ()
                                               (74:7)-(74:22)
                                               (ExpValue ()
                                                         (74:12)-(74:17)
                                                         (ValVariable "actstr"))
                                               (Just AList ()
                                                           (74:18)-(74:22)
                                                           [Argument ()
                                                                     (74:19)-(74:21)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (74:19)-(74:21)
                                                                                        (ValVariable "lib")))])),
                           BlComment ()
                                     (76:1)-(76:32)
                                     (Comment " segini book segment           "),
                           BlComment ()
                                     (77:1)-(77:16)
                                     (Comment "eso  segini, bk"),
                           BlStatement ()
                                       (78:7)-(78:29)
                                       Nothing
                                       (StWrite ()
                                                (78:7)-(78:29)
                                                (AList ()
                                                       (78:12)-(78:16)
                                                       [ControlPair ()
                                                                    (78:13)-(78:13)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (78:13)-(78:13)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (78:15)-(78:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (78:15)-(78:15)
                                                                              ValStar)])
                                                (Just AList ()
                                                            (78:18)-(78:29)
                                                            [ExpValue ()
                                                                      (78:18)-(78:29)
                                                                      (ValString "newlib: bk")])),
                           BlStatement ()
                                       (79:7)-(79:30)
                                       Nothing
                                       (StFunction ()
                                                   (79:7)-(79:30)
                                                   (ExpValue ()
                                                             (79:7)-(79:11)
                                                             (ValVariable "esoat"))
                                                   (AList ()
                                                          (79:13)-(79:21)
                                                          [ExpValue ()
                                                                    (79:13)-(79:14)
                                                                    (ValVariable "bk"),
                                                           ExpValue ()
                                                                    (79:16)-(79:21)
                                                                    (ValVariable "btitle")])
                                                   (ExpValue ()
                                                             (79:26)-(79:30)
                                                             (ValVariable "title"))),
                           BlStatement ()
                                       (80:7)-(80:30)
                                       Nothing
                                       (StFunction ()
                                                   (80:7)-(80:30)
                                                   (ExpValue ()
                                                             (80:7)-(80:11)
                                                             (ValVariable "esoat"))
                                                   (AList ()
                                                          (80:13)-(80:21)
                                                          [ExpValue ()
                                                                    (80:13)-(80:14)
                                                                    (ValVariable "bk"),
                                                           ExpValue ()
                                                                    (80:16)-(80:21)
                                                                    (ValVariable "bpages")])
                                                   (ExpValue ()
                                                             (80:26)-(80:30)
                                                             (ValVariable "pages"))),
                           BlStatement ()
                                       (81:7)-(81:28)
                                       Nothing
                                       (StFunction ()
                                                   (81:7)-(81:28)
                                                   (ExpValue ()
                                                             (81:7)-(81:11)
                                                             (ValVariable "esoat"))
                                                   (AList ()
                                                          (81:13)-(81:19)
                                                          [ExpValue ()
                                                                    (81:13)-(81:14)
                                                                    (ValVariable "bk"),
                                                           ExpValue ()
                                                                    (81:16)-(81:19)
                                                                    (ValVariable "budc")])
                                                   (ExpValue ()
                                                             (81:26)-(81:28)
                                                             (ValVariable "udc"))),
                           BlComment ()
                                     (82:1)-(82:20)
                                     (Comment "eso  segdes, bk*mod"),
                           BlComment ()
                                     (84:1)-(84:36)
                                     (Comment " add the segment to the structure  "),
                           BlStatement ()
                                       (85:7)-(85:39)
                                       Nothing
                                       (StCall ()
                                               (85:7)-(85:39)
                                               (ExpValue ()
                                                         (85:12)-(85:16)
                                                         (ValVariable "ajpnt"))
                                               (Just AList ()
                                                           (85:17)-(85:39)
                                                           [Argument ()
                                                                     (85:18)-(85:20)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (85:18)-(85:20)
                                                                                        (ValVariable "lib"))),
                                                            Argument ()
                                                                     (85:22)-(85:23)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (85:22)-(85:23)
                                                                                        (ValVariable "bk"))),
                                                            Argument ()
                                                                     (85:25)-(85:31)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (85:25)-(85:31)
                                                                                        (ValString "book "))),
                                                            Argument ()
                                                                     (85:33)-(85:33)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (85:33)-(85:33)
                                                                                        (ValInteger "0"
                                                                                                    Nothing))),
                                                            Argument ()
                                                                     (85:35)-(85:38)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (85:35)-(85:38)
                                                                                        (ValVariable "jord")))])),
                           BlComment ()
                                     (87:1)-(87:25)
                                     (Comment " get pointeur of segment"),
                           BlStatement ()
                                       (88:7)-(88:23)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (88:7)-(88:23)
                                                           (ExpValue ()
                                                                     (88:7)-(88:8)
                                                                     (ValVariable "lb"))
                                                           (ExpFunctionCall ()
                                                                            (88:12)-(88:23)
                                                                            (ExpValue ()
                                                                                      (88:12)-(88:16)
                                                                                      (ValVariable "mypnt"))
                                                                            (Just AList ()
                                                                                        (88:18)-(88:22)
                                                                                        [Argument ()
                                                                                                  (88:18)-(88:20)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (88:18)-(88:20)
                                                                                                                     (ValVariable "lib"))),
                                                                                         Argument ()
                                                                                                  (88:22)-(88:22)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (88:22)-(88:22)
                                                                                                                     (ValInteger "1"
                                                                                                                                 Nothing)))]))),
                           BlComment ()
                                     (89:1)-(89:16)
                                     (Comment "eso  segact, lb"),
                           BlStatement ()
                                       (90:7)-(90:37)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (90:7)-(90:37)
                                                           (ExpValue ()
                                                                     (90:7)-(90:11)
                                                                     (ValVariable "brcnt"))
                                                           (ExpFunctionCall ()
                                                                            (90:15)-(90:37)
                                                                            (ExpValue ()
                                                                                      (90:15)-(90:19)
                                                                                      (ValVariable "esosl"))
                                                                            (Just AList ()
                                                                                        (90:21)-(90:36)
                                                                                        [Argument ()
                                                                                                  (90:21)-(90:34)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpFunctionCall ()
                                                                                                                            (90:21)-(90:34)
                                                                                                                            (ExpValue ()
                                                                                                                                      (90:21)-(90:25)
                                                                                                                                      (ValVariable "esoat"))
                                                                                                                            (Just AList ()
                                                                                                                                        (90:27)-(90:33)
                                                                                                                                        [Argument ()
                                                                                                                                                  (90:27)-(90:28)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (90:27)-(90:28)
                                                                                                                                                                     (ValVariable "lb"))),
                                                                                                                                         Argument ()
                                                                                                                                                  (90:30)-(90:33)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (90:30)-(90:33)
                                                                                                                                                                     (ValVariable "bref")))]))),
                                                                                         Argument ()
                                                                                                  (90:36)-(90:36)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (90:36)-(90:36)
                                                                                                                     (ValInteger "1"
                                                                                                                                 Nothing)))]))),
                           BlStatement ()
                                       (91:7)-(91:37)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (91:7)-(91:37)
                                                           (ExpValue ()
                                                                     (91:7)-(91:11)
                                                                     (ValVariable "urcnt"))
                                                           (ExpFunctionCall ()
                                                                            (91:15)-(91:37)
                                                                            (ExpValue ()
                                                                                      (91:15)-(91:19)
                                                                                      (ValVariable "esosl"))
                                                                            (Just AList ()
                                                                                        (91:21)-(91:36)
                                                                                        [Argument ()
                                                                                                  (91:21)-(91:34)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpFunctionCall ()
                                                                                                                            (91:21)-(91:34)
                                                                                                                            (ExpValue ()
                                                                                                                                      (91:21)-(91:25)
                                                                                                                                      (ValVariable "esoat"))
                                                                                                                            (Just AList ()
                                                                                                                                        (91:27)-(91:33)
                                                                                                                                        [Argument ()
                                                                                                                                                  (91:27)-(91:28)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (91:27)-(91:28)
                                                                                                                                                                     (ValVariable "lb"))),
                                                                                                                                         Argument ()
                                                                                                                                                  (91:30)-(91:33)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (91:30)-(91:33)
                                                                                                                                                                     (ValVariable "uref")))]))),
                                                                                         Argument ()
                                                                                                  (91:36)-(91:36)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (91:36)-(91:36)
                                                                                                                     (ValInteger "1"
                                                                                                                                 Nothing)))]))),
                           BlStatement ()
                                       (92:7)-(92:23)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (92:7)-(92:23)
                                                           (ExpValue ()
                                                                     (92:7)-(92:11)
                                                                     (ValVariable "brcnt"))
                                                           (ExpBinary ()
                                                                      (92:15)-(92:23)
                                                                      Addition
                                                                      (ExpValue ()
                                                                                (92:15)-(92:19)
                                                                                (ValVariable "brcnt"))
                                                                      (ExpValue ()
                                                                                (92:23)-(92:23)
                                                                                (ValInteger "1"
                                                                                            Nothing)))),
                           BlComment ()
                                     (93:1)-(93:16)
                                     (Comment "eso  segadj, lb"),
                           BlStatement ()
                                       (94:7)-(94:40)
                                       Nothing
                                       (StFunction ()
                                                   (94:7)-(94:40)
                                                   (ExpValue ()
                                                             (94:7)-(94:11)
                                                             (ValVariable "esoar"))
                                                   (AList ()
                                                          (94:13)-(94:32)
                                                          [ExpFunctionCall ()
                                                                           (94:13)-(94:26)
                                                                           (ExpValue ()
                                                                                     (94:13)-(94:17)
                                                                                     (ValVariable "esoat"))
                                                                           (Just AList ()
                                                                                       (94:19)-(94:25)
                                                                                       [Argument ()
                                                                                                 (94:19)-(94:20)
                                                                                                 Nothing
                                                                                                 (ArgExpr (ExpValue ()
                                                                                                                    (94:19)-(94:20)
                                                                                                                    (ValVariable "lb"))),
                                                                                        Argument ()
                                                                                                 (94:22)-(94:25)
                                                                                                 Nothing
                                                                                                 (ArgExpr (ExpValue ()
                                                                                                                    (94:22)-(94:25)
                                                                                                                    (ValVariable "bref")))]),
                                                           ExpValue ()
                                                                    (94:28)-(94:32)
                                                                    (ValVariable "brcnt")])
                                                   (ExpValue ()
                                                             (94:37)-(94:40)
                                                             (ValVariable "jord"))),
                           BlStatement ()
                                       (95:7)-(95:45)
                                       Nothing
                                       (StFunction ()
                                                   (95:7)-(95:45)
                                                   (ExpValue ()
                                                             (95:7)-(95:11)
                                                             (ValVariable "esoar"))
                                                   (AList ()
                                                          (95:13)-(95:34)
                                                          [ExpFunctionCall ()
                                                                           (95:13)-(95:28)
                                                                           (ExpValue ()
                                                                                     (95:13)-(95:17)
                                                                                     (ValVariable "esoat"))
                                                                           (Just AList ()
                                                                                       (95:19)-(95:27)
                                                                                       [Argument ()
                                                                                                 (95:19)-(95:20)
                                                                                                 Nothing
                                                                                                 (ArgExpr (ExpValue ()
                                                                                                                    (95:19)-(95:20)
                                                                                                                    (ValVariable "lb"))),
                                                                                        Argument ()
                                                                                                 (95:22)-(95:27)
                                                                                                 Nothing
                                                                                                 (ArgExpr (ExpValue ()
                                                                                                                    (95:22)-(95:27)
                                                                                                                    (ValVariable "bstatu")))]),
                                                           ExpValue ()
                                                                    (95:30)-(95:34)
                                                                    (ValVariable "brcnt")])
                                                   (ExpValue ()
                                                             (95:39)-(95:45)
                                                             (ValLogical False
                                                                         Nothing))),
                           BlComment ()
                                     (96:1)-(96:20)
                                     (Comment "eso  segdes, lb*mod"),
                           BlComment ()
                                     (98:1)-(98:27)
                                     (Comment " desactivate struct       "),
                           BlStatement ()
                                       (99:7)-(99:28)
                                       Nothing
                                       (StCall ()
                                               (99:7)-(99:28)
                                               (ExpValue ()
                                                         (99:12)-(99:17)
                                                         (ValVariable "desstr"))
                                               (Just AList ()
                                                           (99:18)-(99:28)
                                                           [Argument ()
                                                                     (99:19)-(99:21)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (99:19)-(99:21)
                                                                                        (ValVariable "lib"))),
                                                            Argument ()
                                                                     (99:23)-(99:27)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (99:23)-(99:27)
                                                                                        (ValString "mod")))]))]
                          Nothing]
'
]

{ #category : #'fortran77-annoted' }
PP2FortranSrcGrammarTest class >> newbookFortran [

	^ '      subroutine newbook(lib,title,pages,udc)
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
      character*(*) title
      integer pages
      real udc

c use of external for mypnt since it is a function
      external mypnt
      integer mypnt

c local vriables       
      integer jord    
cESO  pointeur lb.tlib
cESO  pointeur bk.book

            
      write(*,*) ''newbook: begin''

c activate struct
      call actstr(lib) 

c segini book segment           
cESO  segini, bk
      write(*,*) ''newlib: bk''
      ESOat(bk,btitle) = title
      ESOat(bk,bpages) = pages
      ESOat(bk,budc)   = udc
cESO  segdes, bk*mod

c add the segment to the structure  
      call ajpnt(lib,bk,''book '',0,jord)

c get pointeur of segment
      lb = mypnt(lib,1)
cESO  segact, lb
      brcnt = ESOsl(ESOat(lb,bref),1)
      urcnt = ESOsl(ESOat(lb,uref),1) 
      brcnt = brcnt + 1
cESO  segadj, lb
      ESOar(ESOat(lb,bref),brcnt) = jord
      ESOar(ESOat(lb,bstatu),brcnt) = .false.
cESO  segdes, lb*mod

c desactivate struct       
      call desstr(lib,''mod'') 

      end 
'
]

{ #category : #'filesytem-inmemory' }
PP2FortranSrcGrammarTest class >> newlib [

	^ (self workDir / 'newlib.0.e.f') ensureCreateFile writeStreamDo: [ 
		  :stream | stream << self newlibFortran ]
]

{ #category : #'AST-fortranSrc' }
PP2FortranSrcGrammarTest class >> newlibAST [

	^ 'ProgramFile (MetaInfo
                     {miVersion = Fortran77,
                      miFilename = "/demo-bib/build/newlib.0.e.f"})
            [PUSubroutine ()
                          (1:7)-(87:9)
                          (Nothing, Nothing)
                          "newlib"
                          (Just AList ()
                                      (1:25)-(1:27)
                                      [ExpValue ()
                                                (1:25)-(1:27)
                                                (ValVariable "lib")])
                          [BlStatement ()
                                       (2:7)-(2:19)
                                       Nothing
                                       (StImplicit () (2:7)-(2:19) Nothing),
                           BlComment ()
                                     (5:1)-(5:62)
                                     (Comment "2345678901234567890123456789012345678901234567890123456789012"),
                           BlComment ()
                                     (6:1)-(6:28)
                                     (Comment " bref(brcnt) array of books"),
                           BlComment ()
                                     (7:1)-(7:28)
                                     (Comment " uref(urcnt) array of users"),
                           BlComment ()
                                     (8:1)-(8:47)
                                     (Comment " bstatu(brcnt) logical array of borrowed books"),
                           BlComment ()
                                     (9:1)-(9:49)
                                     (Comment " ubb(ubbcnt) array of books borrowed by the user"),
                           BlComment () (11:1)-(11:12) (Comment ": maillon 1"),
                           BlStatement ()
                                       (12:7)-(12:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (12:7)-(12:19)
                                                      (TypeSpec ()
                                                                (12:7)-(12:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (12:15)-(12:19)
                                                             [Declarator ()
                                                                         (12:15)-(12:19)
                                                                         (ExpValue ()
                                                                                   (12:15)-(12:19)
                                                                                   (ValVariable "brcnt"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (13:7)-(13:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (13:7)-(13:19)
                                                      (TypeSpec ()
                                                                (13:7)-(13:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (13:15)-(13:19)
                                                             [Declarator ()
                                                                         (13:15)-(13:19)
                                                                         (ExpValue ()
                                                                                   (13:15)-(13:19)
                                                                                   (ValVariable "urcnt"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (14:7)-(14:20)
                                       Nothing
                                       (StDeclaration ()
                                                      (14:7)-(14:20)
                                                      (TypeSpec ()
                                                                (14:7)-(14:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (14:15)-(14:20)
                                                             [Declarator ()
                                                                         (14:15)-(14:20)
                                                                         (ExpValue ()
                                                                                   (14:15)-(14:20)
                                                                                   (ValVariable "ubbcnt"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment ()
                                     (16:1)-(16:18)
                                     (Comment " segment de t\227\170te"),
                           BlComment ()
                                     (17:1)-(17:19)
                                     (Comment "eso  segment, tlib"),
                           BlComment ()
                                     (18:1)-(18:27)
                                     (Comment "eso    integer bref(brcnt)"),
                           BlComment ()
                                     (19:1)-(19:29)
                                     (Comment "eso    logical bstatu(brcnt)"),
                           BlComment ()
                                     (20:1)-(20:27)
                                     (Comment "eso    integer uref(urcnt)"),
                           BlComment ()
                                     (21:1)-(21:17)
                                     (Comment "eso  end segment"),
                           BlComment ()
                                     (23:1)-(23:19)
                                     (Comment "eso  segment, book"),
                           BlComment ()
                                     (24:1)-(24:27)
                                     (Comment "eso    character*40 btitle"),
                           BlComment ()
                                     (25:1)-(25:22)
                                     (Comment "eso    integer bpages"),
                           BlComment ()
                                     (26:1)-(26:17)
                                     (Comment "eso    real budc"),
                           BlComment ()
                                     (27:1)-(27:17)
                                     (Comment "eso  end segment"),
                           BlComment ()
                                     (29:1)-(29:19)
                                     (Comment "eso  segment, user"),
                           BlComment ()
                                     (30:1)-(30:26)
                                     (Comment "eso    character*40 uname"),
                           BlComment ()
                                     (31:1)-(31:27)
                                     (Comment "eso    integer ubb(ubbcnt)"),
                           BlComment ()
                                     (32:1)-(32:17)
                                     (Comment "eso  end segment"),
                           BlComment ()
                                     (34:1)-(34:67)
                                     (Comment "******************************************************************"),
                           BlComment ()
                                     (36:1)-(36:62)
                                     (Comment "2345678901234567890123456789012345678901234567890123456789012"),
                           BlComment () (37:1)-(37:6) (Comment "-pstr"),
                           BlComment ()
                                     (38:1)-(38:62)
                                     (Comment ":pstr   segment dentete des structures : nouvelles definition"),
                           BlComment ()
                                     (39:1)-(39:72)
                                     (Comment ":nomcod nom du code auquel appartient la structure (cronos, apollo, ..)"),
                           BlComment ()
                                     (40:1)-(40:29)
                                     (Comment ":date   date de debut de job"),
                           BlComment ()
                                     (41:1)-(41:30)
                                     (Comment ":heure  heure de debut de job"),
                           BlComment ()
                                     (42:1)-(42:54)
                                     (Comment ":typseg type des segments appartenants a la structure"),
                           BlComment ()
                                     (43:1)-(43:53)
                                     (Comment ":typref type des objects references par la structure"),
                           BlComment ()
                                     (44:1)-(44:53)
                                     (Comment ":ibseg  numero max. du segment ajoute a la structure"),
                           BlComment ()
                                     (45:1)-(45:58)
                                     (Comment ":ibref  numero max. de lobject reference par la structure"),
                           BlComment ()
                                     (46:1)-(46:58)
                                     (Comment ":pntseg pointeurs des segments apartenants a la structure"),
                           BlComment ()
                                     (47:1)-(47:58)
                                     (Comment ":pntref pointeurs des objects references par la structure"),
                           BlComment ()
                                     (48:1)-(48:19)
                                     (Comment "eso  segment, pstr"),
                           BlComment ()
                                     (49:1)-(49:70)
                                     (Comment "eso    character*8 nomcode, date, heure, typseg(nbseg), typref(nbref)"),
                           BlComment ()
                                     (50:1)-(50:70)
                                     (Comment "eso    integer     ibseg, ibref,         pntseg(nbseg), pntref(nbref)"),
                           BlComment ()
                                     (51:1)-(51:16)
                                     (Comment "eso  endsegment"),
                           BlComment ()
                                     (52:1)-(52:62)
                                     (Comment "-------------------------------------------------------------"),
                           BlComment ()
                                     (55:1)-(55:23)
                                     (Comment "eso  pointeur lib.pstr"),
                           BlComment ()
                                     (56:1)-(56:22)
                                     (Comment "eso  pointeur lb.tlib"),
                           BlStatement ()
                                       (57:7)-(57:18)
                                       Nothing
                                       (StDeclaration ()
                                                      (57:7)-(57:18)
                                                      (TypeSpec ()
                                                                (57:7)-(57:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (57:15)-(57:18)
                                                             [Declarator ()
                                                                         (57:15)-(57:18)
                                                                         (ExpValue ()
                                                                                   (57:15)-(57:18)
                                                                                   (ValVariable "jord"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (59:7)-(59:16)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (59:7)-(59:16)
                                                           (ExpValue ()
                                                                     (59:7)-(59:11)
                                                                     (ValVariable "brcnt"))
                                                           (ExpValue ()
                                                                     (59:16)-(59:16)
                                                                     (ValInteger "0"
                                                                                 Nothing))),
                           BlStatement ()
                                       (60:7)-(60:16)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (60:7)-(60:16)
                                                           (ExpValue ()
                                                                     (60:7)-(60:11)
                                                                     (ValVariable "urcnt"))
                                                           (ExpValue ()
                                                                     (60:16)-(60:16)
                                                                     (ValInteger "0"
                                                                                 Nothing))),
                           BlStatement ()
                                       (62:7)-(62:32)
                                       Nothing
                                       (StWrite ()
                                                (62:7)-(62:32)
                                                (AList ()
                                                       (62:12)-(62:16)
                                                       [ControlPair ()
                                                                    (62:13)-(62:13)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (62:13)-(62:13)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (62:15)-(62:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (62:15)-(62:15)
                                                                              ValStar)])
                                                (Just AList ()
                                                            (62:18)-(62:32)
                                                            [ExpValue ()
                                                                      (62:18)-(62:32)
                                                                      (ValString "newlib: begin")])),
                           BlComment ()
                                     (64:1)-(64:19)
                                     (Comment " initialize struct"),
                           BlStatement ()
                                       (65:7)-(65:33)
                                       Nothing
                                       (StCall ()
                                               (65:7)-(65:33)
                                               (ExpValue ()
                                                         (65:12)-(65:17)
                                                         (ValVariable "inistr"))
                                               (Just AList ()
                                                           (65:18)-(65:33)
                                                           [Argument ()
                                                                     (65:19)-(65:21)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (65:19)-(65:21)
                                                                                        (ValVariable "lib"))),
                                                            Argument ()
                                                                     (65:23)-(65:28)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (65:23)-(65:28)
                                                                                        (ValString "test"))),
                                                            Argument ()
                                                                     (65:30)-(65:30)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (65:30)-(65:30)
                                                                                        (ValInteger "3"
                                                                                                    Nothing))),
                                                            Argument ()
                                                                     (65:32)-(65:32)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (65:32)-(65:32)
                                                                                        (ValInteger "0"
                                                                                                    Nothing)))])),
                           BlComment ()
                                     (67:1)-(67:17)
                                     (Comment " activate struct"),
                           BlStatement ()
                                       (68:7)-(68:22)
                                       Nothing
                                       (StCall ()
                                               (68:7)-(68:22)
                                               (ExpValue ()
                                                         (68:12)-(68:17)
                                                         (ValVariable "actstr"))
                                               (Just AList ()
                                                           (68:18)-(68:22)
                                                           [Argument ()
                                                                     (68:19)-(68:21)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (68:19)-(68:21)
                                                                                        (ValVariable "lib")))])),
                           BlStatement ()
                                       (70:7)-(70:33)
                                       Nothing
                                       (StWrite ()
                                                (70:7)-(70:33)
                                                (AList ()
                                                       (70:12)-(70:16)
                                                       [ControlPair ()
                                                                    (70:13)-(70:13)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (70:13)-(70:13)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (70:15)-(70:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (70:15)-(70:15)
                                                                              ValStar)])
                                                (Just AList ()
                                                            (70:18)-(70:33)
                                                            [ExpValue ()
                                                                      (70:18)-(70:33)
                                                                      (ValString "newlib: inistr")])),
                           BlComment ()
                                     (72:1)-(72:21)
                                     (Comment " segini head segment"),
                           BlComment ()
                                     (73:1)-(73:16)
                                     (Comment "eso  segini, lb"),
                           BlComment ()
                                     (74:1)-(74:20)
                                     (Comment "eso  segdes, lb*mod"),
                           BlStatement ()
                                       (75:7)-(75:31)
                                       Nothing
                                       (StWrite ()
                                                (75:7)-(75:31)
                                                (AList ()
                                                       (75:12)-(75:16)
                                                       [ControlPair ()
                                                                    (75:13)-(75:13)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (75:13)-(75:13)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (75:15)-(75:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (75:15)-(75:15)
                                                                              ValStar)])
                                                (Just AList ()
                                                            (75:18)-(75:31)
                                                            [ExpValue ()
                                                                      (75:18)-(75:31)
                                                                      (ValString "newlib: tlib")])),
                           BlComment ()
                                     (77:1)-(77:36)
                                     (Comment " add the segment to the structure  "),
                           BlStatement ()
                                       (78:7)-(78:38)
                                       Nothing
                                       (StCall ()
                                               (78:7)-(78:38)
                                               (ExpValue ()
                                                         (78:12)-(78:16)
                                                         (ValVariable "ajpnt"))
                                               (Just AList ()
                                                           (78:17)-(78:38)
                                                           [Argument ()
                                                                     (78:18)-(78:20)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (78:18)-(78:20)
                                                                                        (ValVariable "lib"))),
                                                            Argument ()
                                                                     (78:22)-(78:23)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (78:22)-(78:23)
                                                                                        (ValVariable "lb"))),
                                                            Argument ()
                                                                     (78:25)-(78:30)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (78:25)-(78:30)
                                                                                        (ValString "tlib"))),
                                                            Argument ()
                                                                     (78:32)-(78:32)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (78:32)-(78:32)
                                                                                        (ValInteger "1"
                                                                                                    Nothing))),
                                                            Argument ()
                                                                     (78:34)-(78:37)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (78:34)-(78:37)
                                                                                        (ValVariable "jord")))])),
                           BlStatement ()
                                       (79:7)-(79:37)
                                       Nothing
                                       (StWrite ()
                                                (79:7)-(79:37)
                                                (AList ()
                                                       (79:12)-(79:16)
                                                       [ControlPair ()
                                                                    (79:13)-(79:13)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (79:13)-(79:13)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (79:15)-(79:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (79:15)-(79:15)
                                                                              ValStar)])
                                                (Just AList ()
                                                            (79:18)-(79:37)
                                                            [ExpValue ()
                                                                      (79:18)-(79:31)
                                                                      (ValString "newlib: jord"),
                                                             ExpValue ()
                                                                      (79:34)-(79:37)
                                                                      (ValVariable "jord")])),
                           BlComment ()
                                     (81:1)-(81:20)
                                     (Comment " desactivate struct"),
                           BlStatement ()
                                       (82:7)-(82:28)
                                       Nothing
                                       (StCall ()
                                               (82:7)-(82:28)
                                               (ExpValue ()
                                                         (82:12)-(82:17)
                                                         (ValVariable "desstr"))
                                               (Just AList ()
                                                           (82:18)-(82:28)
                                                           [Argument ()
                                                                     (82:19)-(82:21)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (82:19)-(82:21)
                                                                                        (ValVariable "lib"))),
                                                            Argument ()
                                                                     (82:23)-(82:27)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (82:23)-(82:27)
                                                                                        (ValString "mod")))])),
                           BlStatement ()
                                       (84:7)-(84:30)
                                       Nothing
                                       (StWrite ()
                                                (84:7)-(84:30)
                                                (AList ()
                                                       (84:12)-(84:16)
                                                       [ControlPair ()
                                                                    (84:13)-(84:13)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (84:13)-(84:13)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (84:15)-(84:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (84:15)-(84:15)
                                                                              ValStar)])
                                                (Just AList ()
                                                            (84:18)-(84:30)
                                                            [ExpValue ()
                                                                      (84:18)-(84:30)
                                                                      (ValString "newlib: end")]))]
                          Nothing]
'
]

{ #category : #'fortran77-annoted' }
PP2FortranSrcGrammarTest class >> newlibFortran [

	^ '      subroutine newlib(lib)
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


cESO  pointeur lib.pstr
cESO  pointeur lb.tlib
      integer jord

      brcnt  = 0
      urcnt  = 0
    
      write(*,*) ''newlib: begin''
       
c initialize struct
      call inistr(lib,''test'',3,0)

c activate struct
      call actstr(lib)

      write(*,*) ''newlib: inistr''

c segini head segment
cESO  segini, lb
cESO  segdes, lb*mod
      write(*,*) ''newlib: tlib''

c add the segment to the structure  
      call ajpnt(lib,lb,''tlib'',1,jord)
      write(*,*) ''newlib: jord'', jord

c desactivate struct
      call desstr(lib,''mod'') 
    
      write(*,*) ''newlib: end''

      
      end

'
]

{ #category : #'filesytem-inmemory' }
PP2FortranSrcGrammarTest class >> newuser [

	^ (self workDir / 'newuser.0.e.f') ensureCreateFile writeStreamDo: [ 
		  :stream | stream << self newuserFortran ]
]

{ #category : #'AST-fortranSrc' }
PP2FortranSrcGrammarTest class >> newuserAST [

	^ 'ProgramFile (MetaInfo
                     {miVersion = Fortran77,
                      miFilename = "/demo-bib/build/newuser.0.e.f"})
            [PUSubroutine ()
                          (1:7)-(101:9)
                          (Nothing, Nothing)
                          "newuser"
                          (Just AList ()
                                      (1:26)-(1:33)
                                      [ExpValue ()
                                                (1:26)-(1:28)
                                                (ValVariable "lib"),
                                       ExpValue ()
                                                (1:30)-(1:33)
                                                (ValVariable "name")])
                          [BlStatement ()
                                       (2:7)-(2:19)
                                       Nothing
                                       (StImplicit () (2:7)-(2:19) Nothing),
                           BlComment ()
                                     (5:1)-(5:62)
                                     (Comment "2345678901234567890123456789012345678901234567890123456789012"),
                           BlComment ()
                                     (6:1)-(6:28)
                                     (Comment " bref(brcnt) array of books"),
                           BlComment ()
                                     (7:1)-(7:28)
                                     (Comment " uref(urcnt) array of users"),
                           BlComment ()
                                     (8:1)-(8:47)
                                     (Comment " bstatu(brcnt) logical array of borrowed books"),
                           BlComment ()
                                     (9:1)-(9:49)
                                     (Comment " ubb(ubbcnt) array of books borrowed by the user"),
                           BlComment () (11:1)-(11:12) (Comment ": maillon 1"),
                           BlStatement ()
                                       (12:7)-(12:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (12:7)-(12:19)
                                                      (TypeSpec ()
                                                                (12:7)-(12:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (12:15)-(12:19)
                                                             [Declarator ()
                                                                         (12:15)-(12:19)
                                                                         (ExpValue ()
                                                                                   (12:15)-(12:19)
                                                                                   (ValVariable "brcnt"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (13:7)-(13:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (13:7)-(13:19)
                                                      (TypeSpec ()
                                                                (13:7)-(13:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (13:15)-(13:19)
                                                             [Declarator ()
                                                                         (13:15)-(13:19)
                                                                         (ExpValue ()
                                                                                   (13:15)-(13:19)
                                                                                   (ValVariable "urcnt"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (14:7)-(14:20)
                                       Nothing
                                       (StDeclaration ()
                                                      (14:7)-(14:20)
                                                      (TypeSpec ()
                                                                (14:7)-(14:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (14:15)-(14:20)
                                                             [Declarator ()
                                                                         (14:15)-(14:20)
                                                                         (ExpValue ()
                                                                                   (14:15)-(14:20)
                                                                                   (ValVariable "ubbcnt"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment ()
                                     (16:1)-(16:18)
                                     (Comment " segment de t\227\170te"),
                           BlComment ()
                                     (17:1)-(17:19)
                                     (Comment "eso  segment, tlib"),
                           BlComment ()
                                     (18:1)-(18:27)
                                     (Comment "eso    integer bref(brcnt)"),
                           BlComment ()
                                     (19:1)-(19:29)
                                     (Comment "eso    logical bstatu(brcnt)"),
                           BlComment ()
                                     (20:1)-(20:27)
                                     (Comment "eso    integer uref(urcnt)"),
                           BlComment ()
                                     (21:1)-(21:17)
                                     (Comment "eso  end segment"),
                           BlComment ()
                                     (23:1)-(23:19)
                                     (Comment "eso  segment, book"),
                           BlComment ()
                                     (24:1)-(24:27)
                                     (Comment "eso    character*40 btitle"),
                           BlComment ()
                                     (25:1)-(25:22)
                                     (Comment "eso    integer bpages"),
                           BlComment ()
                                     (26:1)-(26:17)
                                     (Comment "eso    real budc"),
                           BlComment ()
                                     (27:1)-(27:17)
                                     (Comment "eso  end segment"),
                           BlComment ()
                                     (29:1)-(29:19)
                                     (Comment "eso  segment, user"),
                           BlComment ()
                                     (30:1)-(30:26)
                                     (Comment "eso    character*40 uname"),
                           BlComment ()
                                     (31:1)-(31:27)
                                     (Comment "eso    integer ubb(ubbcnt)"),
                           BlComment ()
                                     (32:1)-(32:17)
                                     (Comment "eso  end segment"),
                           BlComment ()
                                     (34:1)-(34:67)
                                     (Comment "******************************************************************"),
                           BlComment ()
                                     (36:1)-(36:62)
                                     (Comment "2345678901234567890123456789012345678901234567890123456789012"),
                           BlComment () (37:1)-(37:6) (Comment "-pstr"),
                           BlComment ()
                                     (38:1)-(38:62)
                                     (Comment ":pstr   segment dentete des structures : nouvelles definition"),
                           BlComment ()
                                     (39:1)-(39:72)
                                     (Comment ":nomcod nom du code auquel appartient la structure (cronos, apollo, ..)"),
                           BlComment ()
                                     (40:1)-(40:29)
                                     (Comment ":date   date de debut de job"),
                           BlComment ()
                                     (41:1)-(41:30)
                                     (Comment ":heure  heure de debut de job"),
                           BlComment ()
                                     (42:1)-(42:54)
                                     (Comment ":typseg type des segments appartenants a la structure"),
                           BlComment ()
                                     (43:1)-(43:53)
                                     (Comment ":typref type des objects references par la structure"),
                           BlComment ()
                                     (44:1)-(44:53)
                                     (Comment ":ibseg  numero max. du segment ajoute a la structure"),
                           BlComment ()
                                     (45:1)-(45:58)
                                     (Comment ":ibref  numero max. de lobject reference par la structure"),
                           BlComment ()
                                     (46:1)-(46:58)
                                     (Comment ":pntseg pointeurs des segments apartenants a la structure"),
                           BlComment ()
                                     (47:1)-(47:58)
                                     (Comment ":pntref pointeurs des objects references par la structure"),
                           BlComment ()
                                     (48:1)-(48:19)
                                     (Comment "eso  segment, pstr"),
                           BlComment ()
                                     (49:1)-(49:70)
                                     (Comment "eso    character*8 nomcode, date, heure, typseg(nbseg), typref(nbref)"),
                           BlComment ()
                                     (50:1)-(50:70)
                                     (Comment "eso    integer     ibseg, ibref,         pntseg(nbseg), pntref(nbref)"),
                           BlComment ()
                                     (51:1)-(51:16)
                                     (Comment "eso  endsegment"),
                           BlComment ()
                                     (52:1)-(52:62)
                                     (Comment "-------------------------------------------------------------"),
                           BlComment ()
                                     (55:1)-(55:18)
                                     (Comment " pointeur segment"),
                           BlComment ()
                                     (56:1)-(56:23)
                                     (Comment "eso  pointeur lib.pstr"),
                           BlStatement ()
                                       (57:7)-(57:25)
                                       Nothing
                                       (StDeclaration ()
                                                      (57:7)-(57:25)
                                                      (TypeSpec ()
                                                                (57:7)-(57:20)
                                                                TypeCharacter
                                                                (Just Selector ()
                                                                               (57:17)-(57:20)
                                                                               (Just ExpValue ()
                                                                                              (57:19)-(57:19)
                                                                                              ValStar)
                                                                               Nothing))
                                                      Nothing
                                                      (AList ()
                                                             (57:22)-(57:25)
                                                             [Declarator ()
                                                                         (57:22)-(57:25)
                                                                         (ExpValue ()
                                                                                   (57:22)-(57:25)
                                                                                   (ValVariable "name"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment ()
                                     (59:1)-(59:50)
                                     (Comment " use of external for mypnt since it is a function"),
                           BlStatement ()
                                       (60:7)-(60:20)
                                       Nothing
                                       (StExternal ()
                                                   (60:7)-(60:20)
                                                   (AList ()
                                                          (60:16)-(60:20)
                                                          [ExpValue ()
                                                                    (60:16)-(60:20)
                                                                    (ValVariable "mypnt")])),
                           BlStatement ()
                                       (61:7)-(61:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (61:7)-(61:19)
                                                      (TypeSpec ()
                                                                (61:7)-(61:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (61:15)-(61:19)
                                                             [Declarator ()
                                                                         (61:15)-(61:19)
                                                                         (ExpValue ()
                                                                                   (61:15)-(61:19)
                                                                                   (ValVariable "mypnt"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment ()
                                     (64:1)-(64:25)
                                     (Comment " number of segment added"),
                           BlStatement ()
                                       (65:7)-(65:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (65:7)-(65:19)
                                                      (TypeSpec ()
                                                                (65:7)-(65:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (65:16)-(65:19)
                                                             [Declarator ()
                                                                         (65:16)-(65:19)
                                                                         (ExpValue ()
                                                                                   (65:16)-(65:19)
                                                                                   (ValVariable "jord"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment ()
                                     (66:1)-(66:22)
                                     (Comment "eso  pointeur lb.tlib"),
                           BlComment ()
                                     (67:1)-(67:22)
                                     (Comment "eso  pointeur ur.user"),
                           BlStatement ()
                                       (69:7)-(69:33)
                                       Nothing
                                       (StWrite ()
                                                (69:7)-(69:33)
                                                (AList ()
                                                       (69:12)-(69:16)
                                                       [ControlPair ()
                                                                    (69:13)-(69:13)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (69:13)-(69:13)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (69:15)-(69:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (69:15)-(69:15)
                                                                              ValStar)])
                                                (Just AList ()
                                                            (69:18)-(69:33)
                                                            [ExpValue ()
                                                                      (69:18)-(69:33)
                                                                      (ValString "newuser: begin")])),
                           BlComment ()
                                     (71:1)-(71:24)
                                     (Comment " activate the structure"),
                           BlStatement ()
                                       (72:7)-(72:22)
                                       Nothing
                                       (StCall ()
                                               (72:7)-(72:22)
                                               (ExpValue ()
                                                         (72:12)-(72:17)
                                                         (ValVariable "actstr"))
                                               (Just AList ()
                                                           (72:18)-(72:22)
                                                           [Argument ()
                                                                     (72:19)-(72:21)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (72:19)-(72:21)
                                                                                        (ValVariable "lib")))])),
                           BlComment ()
                                     (74:1)-(74:34)
                                     (Comment " the user doesnt have a book yet "),
                           BlStatement ()
                                       (75:7)-(75:16)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (75:7)-(75:16)
                                                           (ExpValue ()
                                                                     (75:7)-(75:12)
                                                                     (ValVariable "ubbcnt"))
                                                           (ExpValue ()
                                                                     (75:16)-(75:16)
                                                                     (ValInteger "0"
                                                                                 Nothing))),
                           BlComment ()
                                     (76:1)-(76:21)
                                     (Comment " segini user segment"),
                           BlComment ()
                                     (77:1)-(77:16)
                                     (Comment "eso  segini, ur"),
                           BlStatement ()
                                       (78:7)-(78:30)
                                       Nothing
                                       (StWrite ()
                                                (78:7)-(78:30)
                                                (AList ()
                                                       (78:12)-(78:16)
                                                       [ControlPair ()
                                                                    (78:13)-(78:13)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (78:13)-(78:13)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (78:15)-(78:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (78:15)-(78:15)
                                                                              ValStar)])
                                                (Just AList ()
                                                            (78:18)-(78:30)
                                                            [ExpValue ()
                                                                      (78:18)-(78:30)
                                                                      (ValString "newlib: usr")])),
                           BlComment ()
                                     (80:1)-(80:26)
                                     (Comment " add the name of the user"),
                           BlStatement ()
                                       (81:7)-(81:28)
                                       Nothing
                                       (StFunction ()
                                                   (81:7)-(81:28)
                                                   (ExpValue ()
                                                             (81:7)-(81:11)
                                                             (ValVariable "esoat"))
                                                   (AList ()
                                                          (81:13)-(81:20)
                                                          [ExpValue ()
                                                                    (81:13)-(81:14)
                                                                    (ValVariable "ur"),
                                                           ExpValue ()
                                                                    (81:16)-(81:20)
                                                                    (ValVariable "uname")])
                                                   (ExpValue ()
                                                             (81:25)-(81:28)
                                                             (ValVariable "name"))),
                           BlComment ()
                                     (82:1)-(82:20)
                                     (Comment "eso  segdes, ur*mod"),
                           BlComment ()
                                     (84:1)-(84:36)
                                     (Comment " add the segment to the structure  "),
                           BlStatement ()
                                       (85:7)-(85:40)
                                       Nothing
                                       (StCall ()
                                               (85:7)-(85:40)
                                               (ExpValue ()
                                                         (85:12)-(85:16)
                                                         (ValVariable "ajpnt"))
                                               (Just AList ()
                                                           (85:17)-(85:40)
                                                           [Argument ()
                                                                     (85:18)-(85:20)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (85:18)-(85:20)
                                                                                        (ValVariable "lib"))),
                                                            Argument ()
                                                                     (85:22)-(85:23)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (85:22)-(85:23)
                                                                                        (ValVariable "ur"))),
                                                            Argument ()
                                                                     (85:25)-(85:32)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (85:25)-(85:32)
                                                                                        (ValString "user  "))),
                                                            Argument ()
                                                                     (85:34)-(85:34)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (85:34)-(85:34)
                                                                                        (ValInteger "0"
                                                                                                    Nothing))),
                                                            Argument ()
                                                                     (85:36)-(85:39)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (85:36)-(85:39)
                                                                                        (ValVariable "jord")))])),
                           BlComment ()
                                     (87:1)-(87:25)
                                     (Comment " get pointeur of segment"),
                           BlStatement ()
                                       (88:7)-(88:23)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (88:7)-(88:23)
                                                           (ExpValue ()
                                                                     (88:7)-(88:8)
                                                                     (ValVariable "lb"))
                                                           (ExpFunctionCall ()
                                                                            (88:12)-(88:23)
                                                                            (ExpValue ()
                                                                                      (88:12)-(88:16)
                                                                                      (ValVariable "mypnt"))
                                                                            (Just AList ()
                                                                                        (88:18)-(88:22)
                                                                                        [Argument ()
                                                                                                  (88:18)-(88:20)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (88:18)-(88:20)
                                                                                                                     (ValVariable "lib"))),
                                                                                         Argument ()
                                                                                                  (88:22)-(88:22)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (88:22)-(88:22)
                                                                                                                     (ValInteger "1"
                                                                                                                                 Nothing)))]))),
                           BlComment ()
                                     (89:1)-(89:16)
                                     (Comment "eso  segact, lb"),
                           BlStatement ()
                                       (90:7)-(90:37)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (90:7)-(90:37)
                                                           (ExpValue ()
                                                                     (90:7)-(90:11)
                                                                     (ValVariable "urcnt"))
                                                           (ExpFunctionCall ()
                                                                            (90:15)-(90:37)
                                                                            (ExpValue ()
                                                                                      (90:15)-(90:19)
                                                                                      (ValVariable "esosl"))
                                                                            (Just AList ()
                                                                                        (90:21)-(90:36)
                                                                                        [Argument ()
                                                                                                  (90:21)-(90:34)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpFunctionCall ()
                                                                                                                            (90:21)-(90:34)
                                                                                                                            (ExpValue ()
                                                                                                                                      (90:21)-(90:25)
                                                                                                                                      (ValVariable "esoat"))
                                                                                                                            (Just AList ()
                                                                                                                                        (90:27)-(90:33)
                                                                                                                                        [Argument ()
                                                                                                                                                  (90:27)-(90:28)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (90:27)-(90:28)
                                                                                                                                                                     (ValVariable "lb"))),
                                                                                                                                         Argument ()
                                                                                                                                                  (90:30)-(90:33)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (90:30)-(90:33)
                                                                                                                                                                     (ValVariable "uref")))]))),
                                                                                         Argument ()
                                                                                                  (90:36)-(90:36)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (90:36)-(90:36)
                                                                                                                     (ValInteger "1"
                                                                                                                                 Nothing)))]))),
                           BlStatement ()
                                       (91:7)-(91:37)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (91:7)-(91:37)
                                                           (ExpValue ()
                                                                     (91:7)-(91:11)
                                                                     (ValVariable "brcnt"))
                                                           (ExpFunctionCall ()
                                                                            (91:15)-(91:37)
                                                                            (ExpValue ()
                                                                                      (91:15)-(91:19)
                                                                                      (ValVariable "esosl"))
                                                                            (Just AList ()
                                                                                        (91:21)-(91:36)
                                                                                        [Argument ()
                                                                                                  (91:21)-(91:34)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpFunctionCall ()
                                                                                                                            (91:21)-(91:34)
                                                                                                                            (ExpValue ()
                                                                                                                                      (91:21)-(91:25)
                                                                                                                                      (ValVariable "esoat"))
                                                                                                                            (Just AList ()
                                                                                                                                        (91:27)-(91:33)
                                                                                                                                        [Argument ()
                                                                                                                                                  (91:27)-(91:28)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (91:27)-(91:28)
                                                                                                                                                                     (ValVariable "lb"))),
                                                                                                                                         Argument ()
                                                                                                                                                  (91:30)-(91:33)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (91:30)-(91:33)
                                                                                                                                                                     (ValVariable "bref")))]))),
                                                                                         Argument ()
                                                                                                  (91:36)-(91:36)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (91:36)-(91:36)
                                                                                                                     (ValInteger "1"
                                                                                                                                 Nothing)))]))),
                           BlStatement ()
                                       (92:7)-(92:23)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (92:7)-(92:23)
                                                           (ExpValue ()
                                                                     (92:7)-(92:11)
                                                                     (ValVariable "urcnt"))
                                                           (ExpBinary ()
                                                                      (92:15)-(92:23)
                                                                      Addition
                                                                      (ExpValue ()
                                                                                (92:15)-(92:19)
                                                                                (ValVariable "urcnt"))
                                                                      (ExpValue ()
                                                                                (92:23)-(92:23)
                                                                                (ValInteger "1"
                                                                                            Nothing)))),
                           BlComment ()
                                     (93:1)-(93:16)
                                     (Comment "eso  segadj, lb"),
                           BlStatement ()
                                       (94:7)-(94:40)
                                       Nothing
                                       (StFunction ()
                                                   (94:7)-(94:40)
                                                   (ExpValue ()
                                                             (94:7)-(94:11)
                                                             (ValVariable "esoar"))
                                                   (AList ()
                                                          (94:13)-(94:32)
                                                          [ExpFunctionCall ()
                                                                           (94:13)-(94:26)
                                                                           (ExpValue ()
                                                                                     (94:13)-(94:17)
                                                                                     (ValVariable "esoat"))
                                                                           (Just AList ()
                                                                                       (94:19)-(94:25)
                                                                                       [Argument ()
                                                                                                 (94:19)-(94:20)
                                                                                                 Nothing
                                                                                                 (ArgExpr (ExpValue ()
                                                                                                                    (94:19)-(94:20)
                                                                                                                    (ValVariable "lb"))),
                                                                                        Argument ()
                                                                                                 (94:22)-(94:25)
                                                                                                 Nothing
                                                                                                 (ArgExpr (ExpValue ()
                                                                                                                    (94:22)-(94:25)
                                                                                                                    (ValVariable "uref")))]),
                                                           ExpValue ()
                                                                    (94:28)-(94:32)
                                                                    (ValVariable "urcnt")])
                                                   (ExpValue ()
                                                             (94:37)-(94:40)
                                                             (ValVariable "jord"))),
                           BlComment ()
                                     (95:1)-(95:20)
                                     (Comment "eso  segdes, lb*mod"),
                           BlComment ()
                                     (97:1)-(97:27)
                                     (Comment " desactivate struct       "),
                           BlStatement ()
                                       (98:7)-(98:28)
                                       Nothing
                                       (StCall ()
                                               (98:7)-(98:28)
                                               (ExpValue ()
                                                         (98:12)-(98:17)
                                                         (ValVariable "desstr"))
                                               (Just AList ()
                                                           (98:18)-(98:28)
                                                           [Argument ()
                                                                     (98:19)-(98:21)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (98:19)-(98:21)
                                                                                        (ValVariable "lib"))),
                                                            Argument ()
                                                                     (98:23)-(98:27)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (98:23)-(98:27)
                                                                                        (ValString "mod")))])),
                           BlStatement ()
                                       (100:7)-(100:31)
                                       Nothing
                                       (StWrite ()
                                                (100:7)-(100:31)
                                                (AList ()
                                                       (100:12)-(100:16)
                                                       [ControlPair ()
                                                                    (100:13)-(100:13)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (100:13)-(100:13)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (100:15)-(100:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (100:15)-(100:15)
                                                                              ValStar)])
                                                (Just AList ()
                                                            (100:18)-(100:31)
                                                            [ExpValue ()
                                                                      (100:18)-(100:31)
                                                                      (ValString "newuser: end")]))]
                          Nothing]
'
]

{ #category : #'fortran77-annoted' }
PP2FortranSrcGrammarTest class >> newuserFortran [

	^ '      subroutine newuser(lib,name)
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


c pointeur segment
cESO  pointeur lib.pstr
      character *(*) name 

c use of external for mypnt since it is a function
      external mypnt
      integer mypnt

          
c number of segment added
      integer  jord
cESO  pointeur lb.tlib
cESO  pointeur ur.user
     
      write(*,*) ''newuser: begin''

c activate the structure
      call actstr(lib)   

c the user doesnt have a book yet 
      ubbcnt = 0
c segini user segment
cESO  segini, ur
      write(*,*) ''newlib: usr''

c add the name of the user
      ESOat(ur,uname) = name
cESO  segdes, ur*mod

c add the segment to the structure  
      call ajpnt(lib,ur,''user  '',0,jord)

c get pointeur of segment
      lb = mypnt(lib,1)
cESO  segact, lb
      urcnt = ESOsl(ESOat(lb,uref),1)
      brcnt = ESOsl(ESOat(lb,bref),1)
      urcnt = urcnt + 1
cESO  segadj, lb
      ESOar(ESOat(lb,uref),urcnt) = jord
cESO  segdes, lb*mod

c desactivate struct       
      call desstr(lib,''mod'') 

      write(*,*) ''newuser: end''
      end 

'
]

{ #category : #'filesytem-inmemory' }
PP2FortranSrcGrammarTest class >> relbk [

	^ (self workDir / 'relbk.0.e.f') ensureCreateFile writeStreamDo: [ 
		  :stream | stream << self relbkFortran ]
]

{ #category : #'AST-fortranSrc' }
PP2FortranSrcGrammarTest class >> relbkAST [

	^ 'ProgramFile (MetaInfo
                     {miVersion = Fortran77,
                      miFilename = "/demo-bib/build/relbk.0.e.f"})
            [PUSubroutine ()
                          (1:7)-(128:9)
                          (Nothing, Nothing)
                          "relbk"
                          (Just AList ()
                                      (1:24)-(1:37)
                                      [ExpValue ()
                                                (1:24)-(1:26)
                                                (ValVariable "lib"),
                                       ExpValue ()
                                                (1:28)-(1:31)
                                                (ValVariable "name"),
                                       ExpValue ()
                                                (1:33)-(1:37)
                                                (ValVariable "title")])
                          [BlStatement ()
                                       (2:7)-(2:19)
                                       Nothing
                                       (StImplicit () (2:7)-(2:19) Nothing),
                           BlComment ()
                                     (3:1)-(3:62)
                                     (Comment "2345678901234567890123456789012345678901234567890123456789012"),
                           BlComment ()
                                     (4:1)-(4:28)
                                     (Comment " bref(brcnt) array of books"),
                           BlComment ()
                                     (5:1)-(5:28)
                                     (Comment " uref(urcnt) array of users"),
                           BlComment ()
                                     (6:1)-(6:47)
                                     (Comment " bstatu(brcnt) logical array of borrowed books"),
                           BlComment ()
                                     (7:1)-(7:49)
                                     (Comment " ubb(ubbcnt) array of books borrowed by the user"),
                           BlComment () (9:1)-(9:12) (Comment ": maillon 1"),
                           BlStatement ()
                                       (10:7)-(10:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (10:7)-(10:19)
                                                      (TypeSpec ()
                                                                (10:7)-(10:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (10:15)-(10:19)
                                                             [Declarator ()
                                                                         (10:15)-(10:19)
                                                                         (ExpValue ()
                                                                                   (10:15)-(10:19)
                                                                                   (ValVariable "brcnt"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (11:7)-(11:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (11:7)-(11:19)
                                                      (TypeSpec ()
                                                                (11:7)-(11:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (11:15)-(11:19)
                                                             [Declarator ()
                                                                         (11:15)-(11:19)
                                                                         (ExpValue ()
                                                                                   (11:15)-(11:19)
                                                                                   (ValVariable "urcnt"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (12:7)-(12:20)
                                       Nothing
                                       (StDeclaration ()
                                                      (12:7)-(12:20)
                                                      (TypeSpec ()
                                                                (12:7)-(12:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (12:15)-(12:20)
                                                             [Declarator ()
                                                                         (12:15)-(12:20)
                                                                         (ExpValue ()
                                                                                   (12:15)-(12:20)
                                                                                   (ValVariable "ubbcnt"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment ()
                                     (14:1)-(14:18)
                                     (Comment " segment de t\227\170te"),
                           BlComment ()
                                     (15:1)-(15:19)
                                     (Comment "eso  segment, tlib"),
                           BlComment ()
                                     (16:1)-(16:27)
                                     (Comment "eso    integer bref(brcnt)"),
                           BlComment ()
                                     (17:1)-(17:29)
                                     (Comment "eso    logical bstatu(brcnt)"),
                           BlComment ()
                                     (18:1)-(18:27)
                                     (Comment "eso    integer uref(urcnt)"),
                           BlComment ()
                                     (19:1)-(19:17)
                                     (Comment "eso  end segment"),
                           BlComment ()
                                     (21:1)-(21:19)
                                     (Comment "eso  segment, book"),
                           BlComment ()
                                     (22:1)-(22:27)
                                     (Comment "eso    character*40 btitle"),
                           BlComment ()
                                     (23:1)-(23:22)
                                     (Comment "eso    integer bpages"),
                           BlComment ()
                                     (24:1)-(24:17)
                                     (Comment "eso    real budc"),
                           BlComment ()
                                     (25:1)-(25:17)
                                     (Comment "eso  end segment"),
                           BlComment ()
                                     (27:1)-(27:19)
                                     (Comment "eso  segment, user"),
                           BlComment ()
                                     (28:1)-(28:26)
                                     (Comment "eso    character*40 uname"),
                           BlComment ()
                                     (29:1)-(29:27)
                                     (Comment "eso    integer ubb(ubbcnt)"),
                           BlComment ()
                                     (30:1)-(30:17)
                                     (Comment "eso  end segment"),
                           BlComment ()
                                     (32:1)-(32:67)
                                     (Comment "******************************************************************"),
                           BlComment ()
                                     (34:1)-(34:62)
                                     (Comment "2345678901234567890123456789012345678901234567890123456789012"),
                           BlComment () (35:1)-(35:6) (Comment "-pstr"),
                           BlComment ()
                                     (36:1)-(36:62)
                                     (Comment ":pstr   segment dentete des structures : nouvelles definition"),
                           BlComment ()
                                     (37:1)-(37:72)
                                     (Comment ":nomcod nom du code auquel appartient la structure (cronos, apollo, ..)"),
                           BlComment ()
                                     (38:1)-(38:29)
                                     (Comment ":date   date de debut de job"),
                           BlComment ()
                                     (39:1)-(39:30)
                                     (Comment ":heure  heure de debut de job"),
                           BlComment ()
                                     (40:1)-(40:54)
                                     (Comment ":typseg type des segments appartenants a la structure"),
                           BlComment ()
                                     (41:1)-(41:53)
                                     (Comment ":typref type des objects references par la structure"),
                           BlComment ()
                                     (42:1)-(42:53)
                                     (Comment ":ibseg  numero max. du segment ajoute a la structure"),
                           BlComment ()
                                     (43:1)-(43:58)
                                     (Comment ":ibref  numero max. de lobject reference par la structure"),
                           BlComment ()
                                     (44:1)-(44:58)
                                     (Comment ":pntseg pointeurs des segments apartenants a la structure"),
                           BlComment ()
                                     (45:1)-(45:58)
                                     (Comment ":pntref pointeurs des objects references par la structure"),
                           BlComment ()
                                     (46:1)-(46:19)
                                     (Comment "eso  segment, pstr"),
                           BlComment ()
                                     (47:1)-(47:70)
                                     (Comment "eso    character*8 nomcode, date, heure, typseg(nbseg), typref(nbref)"),
                           BlComment ()
                                     (48:1)-(48:70)
                                     (Comment "eso    integer     ibseg, ibref,         pntseg(nbseg), pntref(nbref)"),
                           BlComment ()
                                     (49:1)-(49:16)
                                     (Comment "eso  endsegment"),
                           BlComment ()
                                     (50:1)-(50:62)
                                     (Comment "-------------------------------------------------------------"),
                           BlComment ()
                                     (53:1)-(53:17)
                                     (Comment " dummy arguments"),
                           BlComment ()
                                     (54:1)-(54:23)
                                     (Comment "eso  pointeur lib.pstr"),
                           BlStatement ()
                                       (55:7)-(55:25)
                                       Nothing
                                       (StDeclaration ()
                                                      (55:7)-(55:25)
                                                      (TypeSpec ()
                                                                (55:7)-(55:20)
                                                                TypeCharacter
                                                                (Just Selector ()
                                                                               (55:17)-(55:20)
                                                                               (Just ExpValue ()
                                                                                              (55:19)-(55:19)
                                                                                              ValStar)
                                                                               Nothing))
                                                      Nothing
                                                      (AList ()
                                                             (55:22)-(55:25)
                                                             [Declarator ()
                                                                         (55:22)-(55:25)
                                                                         (ExpValue ()
                                                                                   (55:22)-(55:25)
                                                                                   (ValVariable "name"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (56:7)-(56:26)
                                       Nothing
                                       (StDeclaration ()
                                                      (56:7)-(56:26)
                                                      (TypeSpec ()
                                                                (56:7)-(56:20)
                                                                TypeCharacter
                                                                (Just Selector ()
                                                                               (56:17)-(56:20)
                                                                               (Just ExpValue ()
                                                                                              (56:19)-(56:19)
                                                                                              ValStar)
                                                                               Nothing))
                                                      Nothing
                                                      (AList ()
                                                             (56:22)-(56:26)
                                                             [Declarator ()
                                                                         (56:22)-(56:26)
                                                                         (ExpValue ()
                                                                                   (56:22)-(56:26)
                                                                                   (ValVariable "title"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment ()
                                     (58:1)-(58:50)
                                     (Comment " use of external for mypnt since it is a function"),
                           BlStatement ()
                                       (59:7)-(59:20)
                                       Nothing
                                       (StExternal ()
                                                   (59:7)-(59:20)
                                                   (AList ()
                                                          (59:16)-(59:20)
                                                          [ExpValue ()
                                                                    (59:16)-(59:20)
                                                                    (ValVariable "mypnt")])),
                           BlStatement ()
                                       (60:7)-(60:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (60:7)-(60:19)
                                                      (TypeSpec ()
                                                                (60:7)-(60:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (60:15)-(60:19)
                                                             [Declarator ()
                                                                         (60:15)-(60:19)
                                                                         (ExpValue ()
                                                                                   (60:15)-(60:19)
                                                                                   (ValVariable "mypnt"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (61:7)-(61:21)
                                       Nothing
                                       (StExternal ()
                                                   (61:7)-(61:21)
                                                   (AList ()
                                                          (61:16)-(61:21)
                                                          [ExpValue ()
                                                                    (61:16)-(61:21)
                                                                    (ValVariable "findbk")])),
                           BlStatement ()
                                       (62:7)-(62:20)
                                       Nothing
                                       (StDeclaration ()
                                                      (62:7)-(62:20)
                                                      (TypeSpec ()
                                                                (62:7)-(62:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (62:15)-(62:20)
                                                             [Declarator ()
                                                                         (62:15)-(62:20)
                                                                         (ExpValue ()
                                                                                   (62:15)-(62:20)
                                                                                   (ValVariable "findbk"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (63:7)-(63:21)
                                       Nothing
                                       (StExternal ()
                                                   (63:7)-(63:21)
                                                   (AList ()
                                                          (63:16)-(63:21)
                                                          [ExpValue ()
                                                                    (63:16)-(63:21)
                                                                    (ValVariable "findur")])),
                           BlStatement ()
                                       (64:7)-(64:20)
                                       Nothing
                                       (StDeclaration ()
                                                      (64:7)-(64:20)
                                                      (TypeSpec ()
                                                                (64:7)-(64:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (64:15)-(64:20)
                                                             [Declarator ()
                                                                         (64:15)-(64:20)
                                                                         (ExpValue ()
                                                                                   (64:15)-(64:20)
                                                                                   (ValVariable "findur"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment ()
                                     (66:1)-(66:23)
                                     (Comment " local vriables       "),
                           BlComment ()
                                     (67:1)-(67:22)
                                     (Comment "eso  pointeur lb.tlib"),
                           BlComment ()
                                     (68:1)-(68:22)
                                     (Comment "eso  pointeur ur.user"),
                           BlComment ()
                                     (69:1)-(69:22)
                                     (Comment "eso  pointeur bk.book"),
                           BlStatement ()
                                       (70:7)-(70:16)
                                       Nothing
                                       (StDeclaration ()
                                                      (70:7)-(70:16)
                                                      (TypeSpec ()
                                                                (70:7)-(70:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (70:15)-(70:16)
                                                             [Declarator ()
                                                                         (70:15)-(70:16)
                                                                         (ExpValue ()
                                                                                   (70:15)-(70:16)
                                                                                   (ValVariable "ir"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (71:7)-(71:17)
                                       Nothing
                                       (StDeclaration ()
                                                      (71:7)-(71:17)
                                                      (TypeSpec ()
                                                                (71:7)-(71:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (71:15)-(71:17)
                                                             [Declarator ()
                                                                         (71:15)-(71:17)
                                                                         (ExpValue ()
                                                                                   (71:15)-(71:17)
                                                                                   (ValVariable "ibk"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (73:7)-(73:31)
                                       Nothing
                                       (StWrite ()
                                                (73:7)-(73:31)
                                                (AList ()
                                                       (73:12)-(73:16)
                                                       [ControlPair ()
                                                                    (73:13)-(73:13)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (73:13)-(73:13)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (73:15)-(73:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (73:15)-(73:15)
                                                                              ValStar)])
                                                (Just AList ()
                                                            (73:18)-(73:31)
                                                            [ExpValue ()
                                                                      (73:18)-(73:31)
                                                                      (ValString "relbk: begin")])),
                           BlComment ()
                                     (75:1)-(75:17)
                                     (Comment " activate struct"),
                           BlStatement ()
                                       (76:7)-(76:22)
                                       Nothing
                                       (StCall ()
                                               (76:7)-(76:22)
                                               (ExpValue ()
                                                         (76:12)-(76:17)
                                                         (ValVariable "actstr"))
                                               (Just AList ()
                                                           (76:18)-(76:22)
                                                           [Argument ()
                                                                     (76:19)-(76:21)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (76:19)-(76:21)
                                                                                        (ValVariable "lib")))])),
                           BlStatement ()
                                       (77:7)-(77:23)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (77:7)-(77:23)
                                                           (ExpValue ()
                                                                     (77:7)-(77:8)
                                                                     (ValVariable "lb"))
                                                           (ExpFunctionCall ()
                                                                            (77:12)-(77:23)
                                                                            (ExpValue ()
                                                                                      (77:12)-(77:16)
                                                                                      (ValVariable "mypnt"))
                                                                            (Just AList ()
                                                                                        (77:18)-(77:22)
                                                                                        [Argument ()
                                                                                                  (77:18)-(77:20)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (77:18)-(77:20)
                                                                                                                     (ValVariable "lib"))),
                                                                                         Argument ()
                                                                                                  (77:22)-(77:22)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (77:22)-(77:22)
                                                                                                                     (ValInteger "1"
                                                                                                                                 Nothing)))]))),
                           BlComment ()
                                     (78:1)-(78:16)
                                     (Comment "eso  segact, lb"),
                           BlStatement ()
                                       (79:7)-(79:37)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (79:7)-(79:37)
                                                           (ExpValue ()
                                                                     (79:7)-(79:11)
                                                                     (ValVariable "brcnt"))
                                                           (ExpFunctionCall ()
                                                                            (79:15)-(79:37)
                                                                            (ExpValue ()
                                                                                      (79:15)-(79:19)
                                                                                      (ValVariable "esosl"))
                                                                            (Just AList ()
                                                                                        (79:21)-(79:36)
                                                                                        [Argument ()
                                                                                                  (79:21)-(79:34)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpFunctionCall ()
                                                                                                                            (79:21)-(79:34)
                                                                                                                            (ExpValue ()
                                                                                                                                      (79:21)-(79:25)
                                                                                                                                      (ValVariable "esoat"))
                                                                                                                            (Just AList ()
                                                                                                                                        (79:27)-(79:33)
                                                                                                                                        [Argument ()
                                                                                                                                                  (79:27)-(79:28)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (79:27)-(79:28)
                                                                                                                                                                     (ValVariable "lb"))),
                                                                                                                                         Argument ()
                                                                                                                                                  (79:30)-(79:33)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (79:30)-(79:33)
                                                                                                                                                                     (ValVariable "bref")))]))),
                                                                                         Argument ()
                                                                                                  (79:36)-(79:36)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (79:36)-(79:36)
                                                                                                                     (ValInteger "1"
                                                                                                                                 Nothing)))]))),
                           BlStatement ()
                                       (80:7)-(80:37)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (80:7)-(80:37)
                                                           (ExpValue ()
                                                                     (80:7)-(80:11)
                                                                     (ValVariable "urcnt"))
                                                           (ExpFunctionCall ()
                                                                            (80:15)-(80:37)
                                                                            (ExpValue ()
                                                                                      (80:15)-(80:19)
                                                                                      (ValVariable "esosl"))
                                                                            (Just AList ()
                                                                                        (80:21)-(80:36)
                                                                                        [Argument ()
                                                                                                  (80:21)-(80:34)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpFunctionCall ()
                                                                                                                            (80:21)-(80:34)
                                                                                                                            (ExpValue ()
                                                                                                                                      (80:21)-(80:25)
                                                                                                                                      (ValVariable "esoat"))
                                                                                                                            (Just AList ()
                                                                                                                                        (80:27)-(80:33)
                                                                                                                                        [Argument ()
                                                                                                                                                  (80:27)-(80:28)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (80:27)-(80:28)
                                                                                                                                                                     (ValVariable "lb"))),
                                                                                                                                         Argument ()
                                                                                                                                                  (80:30)-(80:33)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (80:30)-(80:33)
                                                                                                                                                                     (ValVariable "uref")))]))),
                                                                                         Argument ()
                                                                                                  (80:36)-(80:36)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (80:36)-(80:36)
                                                                                                                     (ValInteger "1"
                                                                                                                                 Nothing)))]))),
                           BlComment ()
                                     (82:1)-(82:59)
                                     (Comment " call of the function that find the user and check whether"),
                           BlComment ()
                                     (83:1)-(83:75)
                                     (Comment " it belongs to the structure or not and the same thing for the book       "),
                           BlStatement ()
                                       (84:7)-(84:27)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (84:7)-(84:27)
                                                           (ExpValue ()
                                                                     (84:7)-(84:8)
                                                                     (ValVariable "ur"))
                                                           (ExpFunctionCall ()
                                                                            (84:12)-(84:27)
                                                                            (ExpValue ()
                                                                                      (84:12)-(84:17)
                                                                                      (ValVariable "findur"))
                                                                            (Just AList ()
                                                                                        (84:19)-(84:26)
                                                                                        [Argument ()
                                                                                                  (84:19)-(84:21)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (84:19)-(84:21)
                                                                                                                     (ValVariable "lib"))),
                                                                                         Argument ()
                                                                                                  (84:23)-(84:26)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (84:23)-(84:26)
                                                                                                                     (ValVariable "name")))]))),
                           BlIf ()
                                (85:7)-(88:12)
                                Nothing
                                Nothing
                                [Just ExpBinary ()
                                                (85:11)-(85:19)
                                                EQ
                                                (ExpValue ()
                                                          (85:11)-(85:12)
                                                          (ValVariable "ur"))
                                                (ExpValue ()
                                                          (85:19)-(85:19)
                                                          (ValInteger "0"
                                                                      Nothing))]
                                [[BlStatement ()
                                              (86:10)-(86:50)
                                              Nothing
                                              (StWrite ()
                                                       (86:10)-(86:50)
                                                       (AList ()
                                                              (86:15)-(86:19)
                                                              [ControlPair ()
                                                                           (86:16)-(86:16)
                                                                           Nothing
                                                                           (ExpValue ()
                                                                                     (86:16)-(86:16)
                                                                                     ValStar),
                                                               ControlPair ()
                                                                           (86:18)-(86:18)
                                                                           Nothing
                                                                           (ExpValue ()
                                                                                     (86:18)-(86:18)
                                                                                     ValStar)])
                                                       (Just AList ()
                                                                   (86:21)-(86:50)
                                                                   [ExpValue ()
                                                                             (86:21)-(86:27)
                                                                             (ValString " user"),
                                                                    ExpValue ()
                                                                             (86:29)-(86:32)
                                                                             (ValVariable "name"),
                                                                    ExpValue ()
                                                                             (86:34)-(86:50)
                                                                             (ValString " does not exist")])),
                                  BlStatement ()
                                              (87:10)-(87:15)
                                              Nothing
                                              (StReturn ()
                                                        (87:10)-(87:15)
                                                        Nothing)]]
                                Nothing,
                           BlStatement ()
                                       (89:7)-(89:29)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (89:7)-(89:29)
                                                           (ExpValue ()
                                                                     (89:7)-(89:9)
                                                                     (ValVariable "ibk"))
                                                           (ExpFunctionCall ()
                                                                            (89:13)-(89:29)
                                                                            (ExpValue ()
                                                                                      (89:13)-(89:18)
                                                                                      (ValVariable "findbk"))
                                                                            (Just AList ()
                                                                                        (89:20)-(89:28)
                                                                                        [Argument ()
                                                                                                  (89:20)-(89:22)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (89:20)-(89:22)
                                                                                                                     (ValVariable "lib"))),
                                                                                         Argument ()
                                                                                                  (89:24)-(89:28)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (89:24)-(89:28)
                                                                                                                     (ValVariable "title")))]))),
                           BlIf ()
                                (90:7)-(93:12)
                                Nothing
                                Nothing
                                [Just ExpBinary ()
                                                (90:11)-(90:20)
                                                EQ
                                                (ExpValue ()
                                                          (90:11)-(90:13)
                                                          (ValVariable "ibk"))
                                                (ExpValue ()
                                                          (90:20)-(90:20)
                                                          (ValInteger "0"
                                                                      Nothing))]
                                [[BlStatement ()
                                              (91:10)-(91:51)
                                              Nothing
                                              (StWrite ()
                                                       (91:10)-(91:51)
                                                       (AList ()
                                                              (91:15)-(91:19)
                                                              [ControlPair ()
                                                                           (91:16)-(91:16)
                                                                           Nothing
                                                                           (ExpValue ()
                                                                                     (91:16)-(91:16)
                                                                                     ValStar),
                                                               ControlPair ()
                                                                           (91:18)-(91:18)
                                                                           Nothing
                                                                           (ExpValue ()
                                                                                     (91:18)-(91:18)
                                                                                     ValStar)])
                                                       (Just AList ()
                                                                   (91:21)-(91:51)
                                                                   [ExpValue ()
                                                                             (91:21)-(91:27)
                                                                             (ValString " book"),
                                                                    ExpValue ()
                                                                             (91:29)-(91:33)
                                                                             (ValVariable "title"),
                                                                    ExpValue ()
                                                                             (91:35)-(91:51)
                                                                             (ValString " does not exist")])),
                                  BlStatement ()
                                              (92:10)-(92:15)
                                              Nothing
                                              (StReturn ()
                                                        (92:10)-(92:15)
                                                        Nothing)]]
                                Nothing,
                           BlComment ()
                                     (95:1)-(95:68)
                                     (Comment " activate the segment user and get the size of the array ubb       "),
                           BlComment ()
                                     (96:1)-(96:16)
                                     (Comment "eso  segact, ur"),
                           BlStatement ()
                                       (97:7)-(97:37)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (97:7)-(97:37)
                                                           (ExpValue ()
                                                                     (97:7)-(97:12)
                                                                     (ValVariable "ubbcnt"))
                                                           (ExpFunctionCall ()
                                                                            (97:16)-(97:37)
                                                                            (ExpValue ()
                                                                                      (97:16)-(97:20)
                                                                                      (ValVariable "esosl"))
                                                                            (Just AList ()
                                                                                        (97:22)-(97:36)
                                                                                        [Argument ()
                                                                                                  (97:22)-(97:34)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpFunctionCall ()
                                                                                                                            (97:22)-(97:34)
                                                                                                                            (ExpValue ()
                                                                                                                                      (97:22)-(97:26)
                                                                                                                                      (ValVariable "esoat"))
                                                                                                                            (Just AList ()
                                                                                                                                        (97:28)-(97:33)
                                                                                                                                        [Argument ()
                                                                                                                                                  (97:28)-(97:29)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (97:28)-(97:29)
                                                                                                                                                                     (ValVariable "ur"))),
                                                                                                                                         Argument ()
                                                                                                                                                  (97:31)-(97:33)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (97:31)-(97:33)
                                                                                                                                                                     (ValVariable "ubb")))]))),
                                                                                         Argument ()
                                                                                                  (97:36)-(97:36)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (97:36)-(97:36)
                                                                                                                     (ValInteger "1"
                                                                                                                                 Nothing)))]))),
                           BlComment ()
                                     (99:1)-(99:56)
                                     (Comment " search for the the element that we want to remove from"),
                           BlComment () (100:1)-(100:11) (Comment " the array"),
                           BlDo ()
                                (101:7)-(105:12)
                                Nothing
                                Nothing
                                Nothing
                                (Just DoSpecification ()
                                                      (101:10)-(101:21)
                                                      (StExpressionAssign ()
                                                                          (101:10)-(101:13)
                                                                          (ExpValue ()
                                                                                    (101:10)-(101:11)
                                                                                    (ValVariable "ir"))
                                                                          (ExpValue ()
                                                                                    (101:13)-(101:13)
                                                                                    (ValInteger "1"
                                                                                                Nothing)))
                                                      (ExpValue ()
                                                                (101:16)-(101:21)
                                                                (ValVariable "ubbcnt"))
                                                      Nothing)
                                [BlIf ()
                                      (102:10)-(104:15)
                                      Nothing
                                      Nothing
                                      [Just ExpBinary ()
                                                      (102:14)-(102:45)
                                                      EQ
                                                      (ExpFunctionCall ()
                                                                       (102:14)-(102:36)
                                                                       (ExpValue ()
                                                                                 (102:14)-(102:18)
                                                                                 (ValVariable "esoar"))
                                                                       (Just AList ()
                                                                                   (102:20)-(102:35)
                                                                                   [Argument ()
                                                                                             (102:20)-(102:32)
                                                                                             Nothing
                                                                                             (ArgExpr (ExpFunctionCall ()
                                                                                                                       (102:20)-(102:32)
                                                                                                                       (ExpValue ()
                                                                                                                                 (102:20)-(102:24)
                                                                                                                                 (ValVariable "esoat"))
                                                                                                                       (Just AList ()
                                                                                                                                   (102:26)-(102:31)
                                                                                                                                   [Argument ()
                                                                                                                                             (102:26)-(102:27)
                                                                                                                                             Nothing
                                                                                                                                             (ArgExpr (ExpValue ()
                                                                                                                                                                (102:26)-(102:27)
                                                                                                                                                                (ValVariable "ur"))),
                                                                                                                                    Argument ()
                                                                                                                                             (102:29)-(102:31)
                                                                                                                                             Nothing
                                                                                                                                             (ArgExpr (ExpValue ()
                                                                                                                                                                (102:29)-(102:31)
                                                                                                                                                                (ValVariable "ubb")))]))),
                                                                                    Argument ()
                                                                                             (102:34)-(102:35)
                                                                                             Nothing
                                                                                             (ArgExpr (ExpValue ()
                                                                                                                (102:34)-(102:35)
                                                                                                                (ValVariable "ir")))]))
                                                      (ExpValue ()
                                                                (102:43)-(102:45)
                                                                (ValVariable "ibk"))]
                                      [[BlStatement ()
                                                    (103:12)-(103:15)
                                                    Nothing
                                                    (StExit ()
                                                            (103:12)-(103:15)
                                                            Nothing)]]
                                      Nothing]
                                Nothing,
                           BlComment ()
                                     (107:1)-(107:19)
                                     (Comment " adjust the array "),
                           BlDo ()
                                (108:7)-(111:12)
                                Nothing
                                Nothing
                                Nothing
                                (Just DoSpecification ()
                                                      (108:10)-(108:25)
                                                      (StExpressionAssign ()
                                                                          (108:10)-(108:14)
                                                                          (ExpValue ()
                                                                                    (108:10)-(108:11)
                                                                                    (ValVariable "jr"))
                                                                          (ExpValue ()
                                                                                    (108:13)-(108:14)
                                                                                    (ValVariable "ir")))
                                                      (ExpBinary ()
                                                                 (108:18)-(108:25)
                                                                 Subtraction
                                                                 (ExpValue ()
                                                                           (108:18)-(108:23)
                                                                           (ValVariable "ubbcnt"))
                                                                 (ExpValue ()
                                                                           (108:25)-(108:25)
                                                                           (ValInteger "1"
                                                                                       Nothing)))
                                                      Nothing)
                                [BlComment ()
                                           (109:1)-(109:62)
                                           (Comment "        ur.ubb(jr) == ur.ubb(jr + 1) -> erreur parsing normal"),
                                 BlStatement ()
                                             (110:10)-(110:56)
                                             Nothing
                                             (StFunction ()
                                                         (110:10)-(110:56)
                                                         (ExpValue ()
                                                                   (110:10)-(110:14)
                                                                   (ValVariable "esoar"))
                                                         (AList ()
                                                                (110:16)-(110:31)
                                                                [ExpFunctionCall ()
                                                                                 (110:16)-(110:28)
                                                                                 (ExpValue ()
                                                                                           (110:16)-(110:20)
                                                                                           (ValVariable "esoat"))
                                                                                 (Just AList ()
                                                                                             (110:22)-(110:27)
                                                                                             [Argument ()
                                                                                                       (110:22)-(110:23)
                                                                                                       Nothing
                                                                                                       (ArgExpr (ExpValue ()
                                                                                                                          (110:22)-(110:23)
                                                                                                                          (ValVariable "ur"))),
                                                                                              Argument ()
                                                                                                       (110:25)-(110:27)
                                                                                                       Nothing
                                                                                                       (ArgExpr (ExpValue ()
                                                                                                                          (110:25)-(110:27)
                                                                                                                          (ValVariable "ubb")))]),
                                                                 ExpValue ()
                                                                          (110:30)-(110:31)
                                                                          (ValVariable "jr")])
                                                         (ExpSubscript ()
                                                                       (110:36)-(110:56)
                                                                       (ExpFunctionCall ()
                                                                                        (110:36)-(110:48)
                                                                                        (ExpValue ()
                                                                                                  (110:36)-(110:40)
                                                                                                  (ValVariable "esoat"))
                                                                                        (Just AList ()
                                                                                                    (110:42)-(110:47)
                                                                                                    [Argument ()
                                                                                                              (110:42)-(110:43)
                                                                                                              Nothing
                                                                                                              (ArgExpr (ExpValue ()
                                                                                                                                 (110:42)-(110:43)
                                                                                                                                 (ValVariable "ur"))),
                                                                                                     Argument ()
                                                                                                              (110:45)-(110:47)
                                                                                                              Nothing
                                                                                                              (ArgExpr (ExpValue ()
                                                                                                                                 (110:45)-(110:47)
                                                                                                                                 (ValVariable "ubb")))]))
                                                                       (AList ()
                                                                              (110:50)-(110:55)
                                                                              [IxSingle ()
                                                                                        (110:50)-(110:55)
                                                                                        Nothing
                                                                                        (ExpBinary ()
                                                                                                   (110:50)-(110:55)
                                                                                                   Addition
                                                                                                   (ExpValue ()
                                                                                                             (110:50)-(110:51)
                                                                                                             (ValVariable "jr"))
                                                                                                   (ExpValue ()
                                                                                                             (110:55)-(110:55)
                                                                                                             (ValInteger "1"
                                                                                                                         Nothing)))])))]
                                Nothing,
                           BlStatement ()
                                       (113:7)-(113:25)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (113:7)-(113:25)
                                                           (ExpValue ()
                                                                     (113:7)-(113:12)
                                                                     (ValVariable "ubbcnt"))
                                                           (ExpBinary ()
                                                                      (113:16)-(113:25)
                                                                      Subtraction
                                                                      (ExpValue ()
                                                                                (113:16)-(113:21)
                                                                                (ValVariable "ubbcnt"))
                                                                      (ExpValue ()
                                                                                (113:25)-(113:25)
                                                                                (ValInteger "1"
                                                                                            Nothing)))),
                           BlComment ()
                                     (114:1)-(114:16)
                                     (Comment "eso  segadj, ur"),
                           BlComment ()
                                     (115:1)-(115:20)
                                     (Comment "eso  segdes, ur*mod"),
                           BlComment ()
                                     (117:1)-(117:54)
                                     (Comment " since the book is no more borrowed set flag on false"),
                           BlStatement ()
                                       (118:7)-(118:45)
                                       Nothing
                                       (StFunction ()
                                                   (118:7)-(118:45)
                                                   (ExpValue ()
                                                             (118:7)-(118:11)
                                                             (ValVariable "esoar"))
                                                   (AList ()
                                                          (118:13)-(118:34)
                                                          [ExpFunctionCall ()
                                                                           (118:13)-(118:28)
                                                                           (ExpValue ()
                                                                                     (118:13)-(118:17)
                                                                                     (ValVariable "esoat"))
                                                                           (Just AList ()
                                                                                       (118:19)-(118:27)
                                                                                       [Argument ()
                                                                                                 (118:19)-(118:20)
                                                                                                 Nothing
                                                                                                 (ArgExpr (ExpValue ()
                                                                                                                    (118:19)-(118:20)
                                                                                                                    (ValVariable "lb"))),
                                                                                        Argument ()
                                                                                                 (118:22)-(118:27)
                                                                                                 Nothing
                                                                                                 (ArgExpr (ExpValue ()
                                                                                                                    (118:22)-(118:27)
                                                                                                                    (ValVariable "bstatu")))]),
                                                           ExpValue ()
                                                                    (118:30)-(118:34)
                                                                    (ValVariable "brcnt")])
                                                   (ExpValue ()
                                                             (118:39)-(118:45)
                                                             (ValLogical False
                                                                         Nothing))),
                           BlComment ()
                                     (120:1)-(120:32)
                                     (Comment " desactivate the head segment  "),
                           BlComment ()
                                     (121:1)-(121:19)
                                     (Comment "eso  segdes,lb*mod"),
                           BlComment ()
                                     (123:1)-(123:23)
                                     (Comment " desactivate structure"),
                           BlStatement ()
                                       (124:7)-(124:29)
                                       Nothing
                                       (StCall ()
                                               (124:7)-(124:29)
                                               (ExpValue ()
                                                         (124:12)-(124:17)
                                                         (ValVariable "desstr"))
                                               (Just AList ()
                                                           (124:18)-(124:29)
                                                           [Argument ()
                                                                     (124:19)-(124:21)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (124:19)-(124:21)
                                                                                        (ValVariable "lib"))),
                                                            Argument ()
                                                                     (124:24)-(124:28)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (124:24)-(124:28)
                                                                                        (ValString "mod")))])),
                           BlStatement ()
                                       (126:7)-(126:29)
                                       Nothing
                                       (StWrite ()
                                                (126:7)-(126:29)
                                                (AList ()
                                                       (126:12)-(126:16)
                                                       [ControlPair ()
                                                                    (126:13)-(126:13)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (126:13)-(126:13)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (126:15)-(126:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (126:15)-(126:15)
                                                                              ValStar)])
                                                (Just AList ()
                                                            (126:18)-(126:29)
                                                            [ExpValue ()
                                                                      (126:18)-(126:29)
                                                                      (ValString "borbk: end")]))]
                          Nothing]
'
]

{ #category : #'fortran77-annoted' }
PP2FortranSrcGrammarTest class >> relbkFortran [

	^ '      subroutine relbk(lib,name,title)
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

      ubbcnt = ubbcnt - 1   
cESO  segadj, ur
cESO  segdes, ur*mod

c since the book is no more borrowed set flag on false
      ESOar(ESOat(lb,bstatu),brcnt) = .false.

c desactivate the head segment  
cESO  segdes,lb*mod

c desactivate structure
      call desstr(lib, ''mod'')

      write(*,*) ''borbk: end''
                    
      end

'
]

{ #category : #'filesytem-inmemory' }
PP2FortranSrcGrammarTest class >> workDir [
	^ FileSystem memory workingDirectory / '/demo-bib/build'
]

{ #category : #accessing }
PP2FortranSrcGrammarTest >> parserClass [
	^ PP2FortranSrcGrammar 
]

{ #category : #running }
PP2FortranSrcGrammarTest >> setUp [

	super setUp.
	parser := self parserInstance
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
		rule: #blStatement.

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
		rule: #comment.

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

{ #category : #'tests-expression' }
PP2FortranSrcGrammarTest >> testControlPair [
	self
		parse: 'ControlPair ()
	(73:13)-(73:13)
	Nothing
	(ExpValue ()
		(73:13)-(73:13)
		ValStar)'
		rule: #controlPair.

]

{ #category : #'tests-expression' }
PP2FortranSrcGrammarTest >> testDataGroup [

	self
		parse: 'DataGroup ()
	(53:12)-(53:20)
	(AList ()
		(53:12)-(53:12)
		[ExpValue ()
			(53:12)-(53:12)
			(ValVariable "i")])
	(AList ()
		(53:15)-(53:19)
		[ExpValue ()
			(53:15)-(53:19)
			(ValInteger "12345" Nothing)])'
		rule: #dataGroup
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
		rule: #expUnary.

]

{ #category : #'tests-expression' }
PP2FortranSrcGrammarTest >> testExpValue [
	self
		parse: 'ExpValue ()
	(3:14)-(3:19)
	(ValVariable "status")'
		rule: #expValue.

]

{ #category : #'tests-expression' }
PP2FortranSrcGrammarTest >> testExpValueWithValStarWithJust [
	self
		parse: 'ExpValue ()
	(3:14)-(3:19)
	ValStar'
		rule: #expValue.
	self flag: #FIXME. "'Just ExpValue ()
	(3:14)-(3:19)
	ValStar' --> not working"

]

{ #category : #'tests-expression' }
PP2FortranSrcGrammarTest >> testExpValueWithValStarWithoutJust [
	self
		parse: 'ExpValue ()
	(83:17)-(83:17)
	ValStar'
		rule: #expValue.

]

{ #category : #'tests - allnodes' }
PP2FortranSrcGrammarTest >> testFullFileBorbk [

	self class borbk.
	self parse: self class borbkAST rule: #start.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcGrammarTest >> testFullFileExample [

	self class example.
	self parse: self class exampleAST rule: #start.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcGrammarTest >> testFullFileExampleWithMultipleProgUnit [

	self class exampleWithMultipleProgUnit.
	self parse: self class exampleWithMultipleProgUnitAST rule: #start.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcGrammarTest >> testFullFileFindbk [

	self class findbk.
	self parse: self class findbkAST rule: #start.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcGrammarTest >> testFullFileFindur [

	self class findur.
	self parse: self class findurAST rule: #start.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcGrammarTest >> testFullFileLibpnt [

	self class libpnt.
	self parse: self class libpntAST rule: #start.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcGrammarTest >> testFullFileMain [

	self class main.
	self parse: self class mainAST rule: #start.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcGrammarTest >> testFullFileNewbook [

	self class newbook. 
	self parse: self class newbookAST rule: #start.

]

{ #category : #'tests - allnodes' }
PP2FortranSrcGrammarTest >> testFullFileNewlib [

	self class newlib.
	self parse: self class newlibAST rule: #start.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcGrammarTest >> testFullFileNewuser [

	self class newuser.
	self parse: self class newuserAST rule: #start.
]

{ #category : #'tests - allnodes' }
PP2FortranSrcGrammarTest >> testFullFileRelbk [

	self class relbk.
	self parse: self class relbkAST rule: #start.
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
		rule: #impList.

	self
		parse: 'ImpList ()
	(52:16)-(52:28)
	(TypeSpec ()
		(52:16)-(52:22)
		TypeLogical
		Nothing)
	(AList ()
		(52:25)-(52:27)
		[ImpCharacter ()
			(52:25)-(52:27)
			"a"])'
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
PP2FortranSrcGrammarTest >> testProgramFilePUMain [

	self
		parse: 'ProgramFile (MetaInfo
                     {miVersion = Fortran77,
                      miFilename = "/tmp/toto/file.f"})
            [PUMain ()
                    (1:7)-(48:9)
                    (Just "main")
                    []
				Nothing]'
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

{ #category : #'tests-programFile' }
PP2FortranSrcGrammarTest >> testProgramFileWithPuMain [

	self parse: 'ProgramFile (MetaInfo
	{miVersion = Fortran77,
	miFilename = "file.f"})	
	[PUMain ()
	(1:7)-(13:9)
	(Just "circle")
	[]
	Nothing]' rule: #programFile.
]

{ #category : #'tests-programUnit' }
PP2FortranSrcGrammarTest >> testPuBlockData [

	| ast  |
	ast := self parse: 'PUBlockData ()
		(51:7)-(54:9)
		(Just "myblck")
		[]' rule: #puBlockData.
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
PP2FortranSrcGrammarTest >> testPuFunction [
	self
		parse: 'PUFunction ()
	(1:7)-(103:9)
	(Just TypeSpec () (1:7)-(1:13) TypeInteger Nothing)
	(Nothing, Nothing)
	"findbk"
	(Just AList ()
		(1:31)-(1:39)
		[ExpValue ()
			(1:31)-(1:33)
			(ValVariable "lib"),
		ExpValue ()
			(1:35)-(1:39)
			(ValVariable "title")])
	Nothing
	[]
	Nothing'
		rule: #puFunction
]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testPuMain [

	self
		       parse: 'PUMain ()
	(1:7)-(13:9)
	(Just "circle")
	[]
	Nothing'
		       rule: #puMain.
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

{ #category : #'tests-expression' }
PP2FortranSrcGrammarTest >> testStData [

	self
		parse: 'StData ()
	(53:7)-(53:20)
	(AList ()
	(53:12)-(53:20)
	[DataGroup ()
		(53:12)-(53:20)
		(AList ()
			(53:12)-(53:12)
			[ExpValue ()
				(53:12)-(53:12)
				(ValVariable "i")])
		(AList ()
			(53:15)-(53:19)
			[ExpValue ()
				(53:15)-(53:19)
				(ValInteger "12345" Nothing)])])'
		rule: #stData
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

{ #category : #'tests-metaInfo' }
PP2FortranSrcGrammarTest >> testStExit [
	self
		parse: 'StExit ()
	(103:12)-(103:15)
	Nothing'
		rule: #stExit
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

{ #category : #'tests-expression' }
PP2FortranSrcGrammarTest >> testStExternal [
	self
		parse: 'StExternal ()
	(61:7)-(61:20)
	(AList ()
		(61:16)-(61:20)
		[ExpValue ()
			(61:16)-(61:20)
			(ValVariable "mypnt")])'
		rule: #stExternal.

]

{ #category : #tests }
PP2FortranSrcGrammarTest >> testStFormatBogus [
	self
		parse: 'StFormatBogus () (30:7)-(30:18) "(1x,a)"'
		rule: #stFormatBogus.

]

{ #category : #'tests-statement' }
PP2FortranSrcGrammarTest >> testStFunction [

	self
		parse: 'StFunction ()
	(100:7)-(100:26)
	(ExpValue ()
		(100:7)-(100:11)
 		(ValVariable "esoat"))
	(AList ()
		(100:13)-(100:23)
		[ExpValue ()
			(100:13)-(100:17)
			(ValVariable "rlist"),
		ExpValue ()
			(100:19)-(100:23)
			(ValVariable "ilist")])
	(ExpValue ()
		(100:26)-(100:26)
		(ValInteger "0" Nothing))'
		rule: #statement
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

{ #category : #'tests-expression' }
PP2FortranSrcGrammarTest >> testStStop [

	self parse: 'StStop () (35:7)-(35:10) Nothing' rule: #stStop
]

{ #category : #'tests-expression' }
PP2FortranSrcGrammarTest >> testStWrite [
	self
		parse: 'StWrite ()
      (73:7)-(73:31)
      (AList ()
             (73:12)-(73:16)
             [ControlPair ()
                          (73:13)-(73:13)
                          Nothing
                          (ExpValue ()
                                    (73:13)-(73:13)
                                    ValStar),
              ControlPair ()
                          (73:15)-(73:15)
                          Nothing
                          (ExpValue ()
                                    (73:15)-(73:15)
                                    ValStar)])
      (Just AList ()
                  (73:18)-(73:31)
                  [ExpValue ()
                            (73:18)-(73:31)
                            (ValString "borbk: begin")])'
		rule: #stWrite.

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
