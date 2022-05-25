Class {
	#name : #PP2FortranSrcGrammarTest,
	#superclass : #PP2CompositeNodeTest,
	#category : #'FortranSrc-Tests'
}

{ #category : #'tests - todo' }
PP2FortranSrcGrammarTest class >> stgbrkAst [

	^ 'ProgramFile (MetaInfo
                     {miVersion = Fortran77,
                      miFilename = "/Users/Younoussa/Documents/demoparser/stgbrk.f"})
            [PUSubroutine ()
                          (1:7)-(302:9)
                          (Nothing, Nothing)
                          "stgbrk"
                          (Just AList ()
                                      (2:8)-(3:19)
                                      [ExpValue ()
                                                (2:8)-(2:12)
                                                (ValVariable "alist"),
                                       ExpValue ()
                                                (2:14)-(2:19)
                                                (ValVariable "splist"),
                                       ExpValue ()
                                                (3:8)-(3:12)
                                                (ValVariable "rlist"),
                                       ExpValue ()
                                                (3:14)-(3:19)
                                                (ValVariable "status")])
                          [BlComment ()
                                     (4:1)-(4:19)
                                     (Comment "     == entrees =="),
                           BlComment ()
                                     (5:1)-(5:19)
                                     (Comment "     == sorties =="),
                           BlComment ()
                                     (6:1)-(6:72)
                                     (Comment " xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
                           BlComment ()
                                     (7:1)-(7:39)
                                     (Comment "b  subroutine : stgbrk (langage esope)"),
                           BlComment ()
                                     (8:1)-(8:23)
                                     (Comment "b  module     : string"),
                           BlComment ()
                                     (9:1)-(9:25)
                                     (Comment "b  auteur     : l.brault"),
                           BlComment ()
                                     (10:1)-(10:32)
                                     (Comment "b  date       : 28-octobre-1997"),
                           BlComment ()
                                     (11:1)-(11:21)
                                     (Comment "b  service    : epnc"),
                           BlComment ()
                                     (12:1)-(12:58)
                                     (Comment "b  but        : briser/decouper des chaines de caracteres"),
                           BlComment ()
                                     (13:1)-(13:49)
                                     (Comment "b               d''apres une liste de separateurs"),
                           BlComment ()
                                     (14:1)-(14:72)
                                     (Comment " xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
                           BlComment () (15:1)-(15:1) (Comment ""),
                           BlComment ()
                                     (16:1)-(16:35)
                                     (Comment "ae  alist  : \"la\" liste de chaines"),
                           BlComment ()
                                     (17:1)-(17:39)
                                     (Comment "ae  splist : \"la\" liste de separateurs"),
                           BlComment () (18:1)-(18:1) (Comment ""),
                           BlComment ()
                                     (19:1)-(19:59)
                                     (Comment "as  rlist  : la liste des morceaux/decoupes de \"la\" chaine"),
                           BlComment ()
                                     (20:1)-(20:54)
                                     (Comment "as  status : status d''execution (status=0 <=> succes)"),
                           BlComment () (21:1)-(21:1) (Comment ""),
                           BlComment () (22:1)-(22:1) (Comment ""),
                           BlComment ()
                                     (23:1)-(23:62)
                                     (Comment " fichier a inclure dans tout source pacome, esope ou fortran."),
                           BlComment () (24:1)-(24:1) (Comment ""),
                           BlComment ()
                                     (25:1)-(25:38)
                                     (Comment " utilisation lors de la compilation :"),
                           BlComment () (26:1)-(26:1) (Comment ""),
                           BlComment ()
                                     (27:1)-(27:18)
                                     (Comment " source fortran :"),
                           BlComment ()
                                     (28:1)-(28:57)
                                     (Comment "  f77 -dfortran -c -i{repertoires d''inclusion} fichier.f"),
                           BlComment () (29:1)-(29:1) (Comment ""),
                           BlComment ()
                                     (30:1)-(30:16)
                                     (Comment " source esope :"),
                           BlComment ()
                                     (31:1)-(31:59)
                                     (Comment "  cpp -p -i{repertoires d''inclusion} fichier.e > fichier.e"),
                           BlComment () (32:1)-(32:1) (Comment ""),
                           BlComment ()
                                     (33:1)-(33:40)
                                     (Comment " source fortran et esope pour le cray :"),
                           BlComment ()
                                     (34:1)-(34:72)
                                     (Comment "  cpp -dcray -i{repertoires d''inclusion} fichier.[f,e] > fichier_source"),
                           BlComment () (35:1)-(35:1) (Comment ""),
                           BlComment ()
                                     (36:1)-(36:24)
                                     (Comment "  auteur  : l.caramelle"),
                           BlComment ()
                                     (37:1)-(37:29)
                                     (Comment "  service : serlog systemes."),
                           BlComment ()
                                     (38:1)-(38:22)
                                     (Comment "  date    : 28/03/93."),
                           BlComment () (39:1)-(39:1) (Comment ""),
                           BlComment () (40:1)-(40:1) (Comment ""),
                           BlComment ()
                                     (41:1)-(41:23)
                                     (Comment "  modif   : g.martinez"),
                           BlComment ()
                                     (42:1)-(42:18)
                                     (Comment "  service : epnc."),
                           BlComment ()
                                     (43:1)-(43:22)
                                     (Comment "  date    : 24/08/95."),
                           BlComment ()
                                     (44:1)-(44:30)
                                     (Comment "  sujet   : portage sur cray."),
                           BlComment () (45:1)-(45:1) (Comment ""),
                           BlComment ()
                                     (46:1)-(46:20)
                                     (Comment "  modif   : m.ponce"),
                           BlComment ()
                                     (47:1)-(47:31)
                                     (Comment "            (origine l.brault)"),
                           BlComment ()
                                     (48:1)-(48:17)
                                     (Comment "  service : epdn"),
                           BlComment ()
                                     (49:1)-(49:23)
                                     (Comment "  date    : 19/07/2000"),
                           BlComment ()
                                     (50:1)-(50:32)
                                     (Comment "  sujet   : implicit_h_included"),
                           BlComment () (51:1)-(51:1) (Comment ""),
                           BlStatement ()
                                       (52:7)-(52:28)
                                       Nothing
                                       (StImplicit ()
                                                   (52:7)-(52:28)
                                                   (Just AList ()
                                                               (52:16)-(52:28)
                                                               [ImpList ()
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
                                                                                         "z"])])),
                           BlComment () (53:1)-(53:1) (Comment ""),
                           BlComment ()
                                     (54:1)-(54:53)
                                     (Comment " >> verifier que cette implementation est compatible"),
                           BlComment ()
                                     (55:1)-(55:49)
                                     (Comment " >> avec celle du type chaine de gibiane/acropol"),
                           BlComment () (56:1)-(56:1) (Comment ""),
                           BlComment ()
                                     (57:1)-(57:43)
                                     (Comment " lstg : longueur de la chaine de caractere"),
                           BlComment ()
                                     (58:1)-(58:36)
                                     (Comment " cstg : les caracteres de la chaine"),
                           BlComment () (59:1)-(59:1) (Comment ""),
                           BlComment ()
                                     (60:1)-(60:22)
                                     (Comment " propriete: lstg >= 0"),
                           BlComment () (61:1)-(61:1) (Comment ""),
                           BlStatement ()
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
                                                                                   (ValVariable "lstg"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment ()
                                     (63:1)-(63:20)
                                     (Comment "     segment string"),
                           BlStatement ()
                                       (64:7)-(65:55)
                                       Nothing
                                       (StCommon ()
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
                                                                                        Nothing,
                                                                             Declarator ()
                                                                                        (64:25)-(64:30)
                                                                                        (ExpValue ()
                                                                                                  (64:25)-(64:27)
                                                                                                  (ValVariable "oov"))
                                                                                        (ArrayDecl (AList ()
                                                                                                          (64:29)-(64:29)
                                                                                                          [DimensionDeclarator ()
                                                                                                                               (64:29)-(64:29)
                                                                                                                               Nothing
                                                                                                                               (Just ExpValue ()
                                                                                                                                              (64:29)-(64:29)
                                                                                                                                              (ValInteger "2"
                                                                                                                                                          Nothing))]))
                                                                                        Nothing
                                                                                        Nothing,
                                                                             Declarator ()
                                                                                        (64:32)-(64:37)
                                                                                        (ExpValue ()
                                                                                                  (64:32)-(64:37)
                                                                                                  (ValVariable "oo_001"))
                                                                                        ScalarDecl
                                                                                        Nothing
                                                                                        Nothing,
                                                                             Declarator ()
                                                                                        (64:39)-(64:44)
                                                                                        (ExpValue ()
                                                                                                  (64:39)-(64:44)
                                                                                                  (ValVariable "oo_002"))
                                                                                        ScalarDecl
                                                                                        Nothing
                                                                                        Nothing,
                                                                             Declarator ()
                                                                                        (64:46)-(64:51)
                                                                                        (ExpValue ()
                                                                                                  (64:46)-(64:51)
                                                                                                  (ValVariable "oo_003"))
                                                                                        ScalarDecl
                                                                                        Nothing
                                                                                        Nothing,
                                                                             Declarator ()
                                                                                        (64:53)-(64:58)
                                                                                        (ExpValue ()
                                                                                                  (64:53)-(64:58)
                                                                                                  (ValVariable "oo_004"))
                                                                                        ScalarDecl
                                                                                        Nothing
                                                                                        Nothing,
                                                                             Declarator ()
                                                                                        (64:60)-(64:65)
                                                                                        (ExpValue ()
                                                                                                  (64:60)-(64:65)
                                                                                                  (ValVariable "oo_005"))
                                                                                        ScalarDecl
                                                                                        Nothing
                                                                                        Nothing,
                                                                             Declarator ()
                                                                                        (64:67)-(64:72)
                                                                                        (ExpValue ()
                                                                                                  (64:67)-(64:72)
                                                                                                  (ValVariable "oo_006"))
                                                                                        ScalarDecl
                                                                                        Nothing
                                                                                        Nothing,
                                                                             Declarator ()
                                                                                        (65:8)-(65:13)
                                                                                        (ExpValue ()
                                                                                                  (65:8)-(65:13)
                                                                                                  (ValVariable "oo_007"))
                                                                                        ScalarDecl
                                                                                        Nothing
                                                                                        Nothing,
                                                                             Declarator ()
                                                                                        (65:15)-(65:20)
                                                                                        (ExpValue ()
                                                                                                  (65:15)-(65:20)
                                                                                                  (ValVariable "oo_008"))
                                                                                        ScalarDecl
                                                                                        Nothing
                                                                                        Nothing,
                                                                             Declarator ()
                                                                                        (65:22)-(65:27)
                                                                                        (ExpValue ()
                                                                                                  (65:22)-(65:27)
                                                                                                  (ValVariable "oo_009"))
                                                                                        ScalarDecl
                                                                                        Nothing
                                                                                        Nothing,
                                                                             Declarator ()
                                                                                        (65:29)-(65:34)
                                                                                        (ExpValue ()
                                                                                                  (65:29)-(65:34)
                                                                                                  (ValVariable "oo_010"))
                                                                                        ScalarDecl
                                                                                        Nothing
                                                                                        Nothing,
                                                                             Declarator ()
                                                                                        (65:36)-(65:41)
                                                                                        (ExpValue ()
                                                                                                  (65:36)-(65:41)
                                                                                                  (ValVariable "oo_011"))
                                                                                        ScalarDecl
                                                                                        Nothing
                                                                                        Nothing,
                                                                             Declarator ()
                                                                                        (65:43)-(65:48)
                                                                                        (ExpValue ()
                                                                                                  (65:43)-(65:48)
                                                                                                  (ValVariable "oo_012"))
                                                                                        ScalarDecl
                                                                                        Nothing
                                                                                        Nothing,
                                                                             Declarator ()
                                                                                        (65:50)-(65:55)
                                                                                        (ExpValue ()
                                                                                                  (65:50)-(65:55)
                                                                                                  (ValVariable "oo_013"))
                                                                                        ScalarDecl
                                                                                        Nothing
                                                                                        Nothing])])),
                           BlStatement ()
                                       (66:7)-(66:22)
                                       Nothing
                                       (StDeclaration ()
                                                      (66:7)-(66:22)
                                                      (TypeSpec ()
                                                                (66:7)-(66:16)
                                                                TypeInteger
                                                                (Just Selector ()
                                                                               (66:15)-(66:16)
                                                                               Nothing
                                                                               (Just ExpValue ()
                                                                                              (66:16)-(66:16)
                                                                                              (ValInteger "8"
                                                                                                          Nothing))))
                                                      Nothing
                                                      (AList ()
                                                             (66:17)-(66:22)
                                                             [Declarator ()
                                                                         (66:17)-(66:22)
                                                                         (ExpValue ()
                                                                                   (66:17)-(66:19)
                                                                                   (ValVariable "oow"))
                                                                         (ArrayDecl (AList ()
                                                                                           (66:21)-(66:21)
                                                                                           [DimensionDeclarator ()
                                                                                                                (66:21)-(66:21)
                                                                                                                Nothing
                                                                                                                (Just ExpValue ()
                                                                                                                               (66:21)-(66:21)
                                                                                                                               (ValInteger "1"
                                                                                                                                           Nothing))]))
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (67:7)-(67:59)
                                       Nothing
                                       (StDeclaration ()
                                                      (67:7)-(67:59)
                                                      (TypeSpec ()
                                                                (67:7)-(67:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (67:15)-(67:59)
                                                             [Declarator ()
                                                                         (67:15)-(67:17)
                                                                         (ExpValue ()
                                                                                   (67:15)-(67:17)
                                                                                   (ValVariable "oov"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (67:19)-(67:21)
                                                                         (ExpValue ()
                                                                                   (67:19)-(67:21)
                                                                                   (ValVariable "ooo"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (67:23)-(67:25)
                                                                         (ExpValue ()
                                                                                   (67:23)-(67:25)
                                                                                   (ValVariable "oo1"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (67:27)-(67:29)
                                                                         (ExpValue ()
                                                                                   (67:27)-(67:29)
                                                                                   (ValVariable "oo2"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (67:31)-(67:33)
                                                                         (ExpValue ()
                                                                                   (67:31)-(67:33)
                                                                                   (ValVariable "oo3"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (67:35)-(67:37)
                                                                         (ExpValue ()
                                                                                   (67:35)-(67:37)
                                                                                   (ValVariable "oo4"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (67:39)-(67:44)
                                                                         (ExpValue ()
                                                                                   (67:39)-(67:44)
                                                                                   (ValVariable "string"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (67:46)-(67:48)
                                                                         (ExpValue ()
                                                                                   (67:46)-(67:48)
                                                                                   (ValVariable "oo5"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (67:50)-(67:53)
                                                                         (ExpValue ()
                                                                                   (67:50)-(67:53)
                                                                                   (ValVariable "list"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (67:55)-(67:59)
                                                                         (ExpValue ()
                                                                                   (67:55)-(67:59)
                                                                                   (ValVariable "alist"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (68:7)-(68:41)
                                       Nothing
                                       (StDeclaration ()
                                                      (68:7)-(68:41)
                                                      (TypeSpec ()
                                                                (68:7)-(68:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (68:15)-(68:41)
                                                             [Declarator ()
                                                                         (68:15)-(68:20)
                                                                         (ExpValue ()
                                                                                   (68:15)-(68:20)
                                                                                   (ValVariable "splist"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (68:22)-(68:26)
                                                                         (ExpValue ()
                                                                                   (68:22)-(68:26)
                                                                                   (ValVariable "rlist"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (68:28)-(68:29)
                                                                         (ExpValue ()
                                                                                   (68:28)-(68:29)
                                                                                   (ValVariable "xs"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (68:31)-(68:32)
                                                                         (ExpValue ()
                                                                                   (68:31)-(68:32)
                                                                                   (ValVariable "sp"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (68:34)-(68:35)
                                                                         (ExpValue ()
                                                                                   (68:34)-(68:35)
                                                                                   (ValVariable "ms"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (68:37)-(68:41)
                                                                         (ExpValue ()
                                                                                   (68:37)-(68:38)
                                                                                   (ValVariable "oo"))
                                                                         (ArrayDecl (AList ()
                                                                                           (68:40)-(68:40)
                                                                                           [DimensionDeclarator ()
                                                                                                                (68:40)-(68:40)
                                                                                                                Nothing
                                                                                                                (Just ExpValue ()
                                                                                                                               (68:40)-(68:40)
                                                                                                                               (ValInteger "6"
                                                                                                                                           Nothing))]))
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (69:7)-(69:20)
                                       Nothing
                                       (StDeclaration ()
                                                      (69:7)-(69:20)
                                                      (TypeSpec ()
                                                                (69:7)-(69:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (69:15)-(69:20)
                                                             [Declarator ()
                                                                         (69:15)-(69:20)
                                                                         (ExpValue ()
                                                                                   (69:15)-(69:17)
                                                                                   (ValVariable "ooi"))
                                                                         (ArrayDecl (AList ()
                                                                                           (69:19)-(69:19)
                                                                                           [DimensionDeclarator ()
                                                                                                                (69:19)-(69:19)
                                                                                                                Nothing
                                                                                                                (Just ExpValue ()
                                                                                                                               (69:19)-(69:19)
                                                                                                                               (ValInteger "1"
                                                                                                                                           Nothing))]))
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (70:7)-(70:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (70:7)-(70:19)
                                                      (TypeSpec ()
                                                                (70:7)-(70:16)
                                                                TypeInteger
                                                                (Just Selector ()
                                                                               (70:15)-(70:16)
                                                                               Nothing
                                                                               (Just ExpValue ()
                                                                                              (70:16)-(70:16)
                                                                                              (ValInteger "8"
                                                                                                          Nothing))))
                                                      Nothing
                                                      (AList ()
                                                             (70:17)-(70:19)
                                                             [Declarator ()
                                                                         (70:17)-(70:19)
                                                                         (ExpValue ()
                                                                                   (70:17)-(70:19)
                                                                                   (ValVariable "oot"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (71:7)-(71:23)
                                       Nothing
                                       (StDeclaration ()
                                                      (71:7)-(71:23)
                                                      (TypeSpec ()
                                                                (71:7)-(71:17)
                                                                TypeCharacter
                                                                (Just Selector ()
                                                                               (71:16)-(71:17)
                                                                               (Just ExpValue ()
                                                                                              (71:17)-(71:17)
                                                                                              (ValInteger "4"
                                                                                                          Nothing))
                                                                               Nothing))
                                                      Nothing
                                                      (AList ()
                                                             (71:18)-(71:23)
                                                             [Declarator ()
                                                                         (71:18)-(71:23)
                                                                         (ExpValue ()
                                                                                   (71:18)-(71:20)
                                                                                   (ValVariable "ooh"))
                                                                         (ArrayDecl (AList ()
                                                                                           (71:22)-(71:22)
                                                                                           [DimensionDeclarator ()
                                                                                                                (71:22)-(71:22)
                                                                                                                Nothing
                                                                                                                (Just ExpValue ()
                                                                                                                               (71:22)-(71:22)
                                                                                                                               (ValInteger "1"
                                                                                                                                           Nothing))]))
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (72:7)-(72:46)
                                       Nothing
                                       (StEquivalence ()
                                                      (72:7)-(72:46)
                                                      (AList ()
                                                             (72:18)-(72:46)
                                                             [AList ()
                                                                    (72:18)-(72:46)
                                                                    [ExpSubscript ()
                                                                                  (72:19)-(72:24)
                                                                                  (ExpValue ()
                                                                                            (72:19)-(72:21)
                                                                                            (ValVariable "oov"))
                                                                                  (AList ()
                                                                                         (72:23)-(72:23)
                                                                                         [IxSingle ()
                                                                                                   (72:23)-(72:23)
                                                                                                   Nothing
                                                                                                   (ExpValue ()
                                                                                                             (72:23)-(72:23)
                                                                                                             (ValInteger "1"
                                                                                                                         Nothing))]),
                                                                     ExpSubscript ()
                                                                                  (72:26)-(72:31)
                                                                                  (ExpValue ()
                                                                                            (72:26)-(72:28)
                                                                                            (ValVariable "oow"))
                                                                                  (AList ()
                                                                                         (72:30)-(72:30)
                                                                                         [IxSingle ()
                                                                                                   (72:30)-(72:30)
                                                                                                   Nothing
                                                                                                   (ExpValue ()
                                                                                                             (72:30)-(72:30)
                                                                                                             (ValInteger "1"
                                                                                                                         Nothing))]),
                                                                     ExpSubscript ()
                                                                                  (72:33)-(72:38)
                                                                                  (ExpValue ()
                                                                                            (72:33)-(72:35)
                                                                                            (ValVariable "ooi"))
                                                                                  (AList ()
                                                                                         (72:37)-(72:37)
                                                                                         [IxSingle ()
                                                                                                   (72:37)-(72:37)
                                                                                                   Nothing
                                                                                                   (ExpValue ()
                                                                                                             (72:37)-(72:37)
                                                                                                             (ValInteger "1"
                                                                                                                         Nothing))]),
                                                                     ExpSubscript ()
                                                                                  (72:40)-(72:45)
                                                                                  (ExpValue ()
                                                                                            (72:40)-(72:42)
                                                                                            (ValVariable "ooh"))
                                                                                  (AList ()
                                                                                         (72:44)-(72:44)
                                                                                         [IxSingle ()
                                                                                                   (72:44)-(72:44)
                                                                                                   Nothing
                                                                                                   (ExpValue ()
                                                                                                             (72:44)-(72:44)
                                                                                                             (ValInteger "1"
                                                                                                                         Nothing))])]])),
                           BlStatement ()
                                       (73:7)-(75:46)
                                       Nothing
                                       (StDeclaration ()
                                                      (73:7)-(75:46)
                                                      (TypeSpec ()
                                                                (73:7)-(73:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (73:15)-(75:46)
                                                             [Declarator ()
                                                                         (73:15)-(73:23)
                                                                         (ExpValue ()
                                                                                   (73:15)-(73:20)
                                                                                   (ValVariable "oo_001"))
                                                                         (ArrayDecl (AList ()
                                                                                           (73:22)-(73:22)
                                                                                           [DimensionDeclarator ()
                                                                                                                (73:22)-(73:22)
                                                                                                                Nothing
                                                                                                                (Just ExpValue ()
                                                                                                                               (73:22)-(73:22)
                                                                                                                               (ValInteger "2"
                                                                                                                                           Nothing))]))
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (73:25)-(73:33)
                                                                         (ExpValue ()
                                                                                   (73:25)-(73:30)
                                                                                   (ValVariable "oo_002"))
                                                                         (ArrayDecl (AList ()
                                                                                           (73:32)-(73:32)
                                                                                           [DimensionDeclarator ()
                                                                                                                (73:32)-(73:32)
                                                                                                                Nothing
                                                                                                                (Just ExpValue ()
                                                                                                                               (73:32)-(73:32)
                                                                                                                               (ValInteger "2"
                                                                                                                                           Nothing))]))
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (73:35)-(73:43)
                                                                         (ExpValue ()
                                                                                   (73:35)-(73:40)
                                                                                   (ValVariable "oo_003"))
                                                                         (ArrayDecl (AList ()
                                                                                           (73:42)-(73:42)
                                                                                           [DimensionDeclarator ()
                                                                                                                (73:42)-(73:42)
                                                                                                                Nothing
                                                                                                                (Just ExpValue ()
                                                                                                                               (73:42)-(73:42)
                                                                                                                               (ValInteger "2"
                                                                                                                                           Nothing))]))
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (73:45)-(73:53)
                                                                         (ExpValue ()
                                                                                   (73:45)-(73:50)
                                                                                   (ValVariable "oo_004"))
                                                                         (ArrayDecl (AList ()
                                                                                           (73:52)-(73:52)
                                                                                           [DimensionDeclarator ()
                                                                                                                (73:52)-(73:52)
                                                                                                                Nothing
                                                                                                                (Just ExpValue ()
                                                                                                                               (73:52)-(73:52)
                                                                                                                               (ValInteger "2"
                                                                                                                                           Nothing))]))
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (73:55)-(73:63)
                                                                         (ExpValue ()
                                                                                   (73:55)-(73:60)
                                                                                   (ValVariable "oo_005"))
                                                                         (ArrayDecl (AList ()
                                                                                           (73:62)-(73:62)
                                                                                           [DimensionDeclarator ()
                                                                                                                (73:62)-(73:62)
                                                                                                                Nothing
                                                                                                                (Just ExpValue ()
                                                                                                                               (73:62)-(73:62)
                                                                                                                               (ValInteger "2"
                                                                                                                                           Nothing))]))
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (74:7)-(74:15)
                                                                         (ExpValue ()
                                                                                   (74:7)-(74:12)
                                                                                   (ValVariable "oo_006"))
                                                                         (ArrayDecl (AList ()
                                                                                           (74:14)-(74:14)
                                                                                           [DimensionDeclarator ()
                                                                                                                (74:14)-(74:14)
                                                                                                                Nothing
                                                                                                                (Just ExpValue ()
                                                                                                                               (74:14)-(74:14)
                                                                                                                               (ValInteger "2"
                                                                                                                                           Nothing))]))
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (75:8)-(75:16)
                                                                         (ExpValue ()
                                                                                   (75:8)-(75:13)
                                                                                   (ValVariable "oo_007"))
                                                                         (ArrayDecl (AList ()
                                                                                           (75:15)-(75:15)
                                                                                           [DimensionDeclarator ()
                                                                                                                (75:15)-(75:15)
                                                                                                                Nothing
                                                                                                                (Just ExpValue ()
                                                                                                                               (75:15)-(75:15)
                                                                                                                               (ValInteger "2"
                                                                                                                                           Nothing))]))
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (75:18)-(75:26)
                                                                         (ExpValue ()
                                                                                   (75:18)-(75:23)
                                                                                   (ValVariable "oo_008"))
                                                                         (ArrayDecl (AList ()
                                                                                           (75:25)-(75:25)
                                                                                           [DimensionDeclarator ()
                                                                                                                (75:25)-(75:25)
                                                                                                                Nothing
                                                                                                                (Just ExpValue ()
                                                                                                                               (75:25)-(75:25)
                                                                                                                               (ValInteger "2"
                                                                                                                                           Nothing))]))
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (75:28)-(75:36)
                                                                         (ExpValue ()
                                                                                   (75:28)-(75:33)
                                                                                   (ValVariable "oo_011"))
                                                                         (ArrayDecl (AList ()
                                                                                           (75:35)-(75:35)
                                                                                           [DimensionDeclarator ()
                                                                                                                (75:35)-(75:35)
                                                                                                                Nothing
                                                                                                                (Just ExpValue ()
                                                                                                                               (75:35)-(75:35)
                                                                                                                               (ValInteger "2"
                                                                                                                                           Nothing))]))
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (75:38)-(75:46)
                                                                         (ExpValue ()
                                                                                   (75:38)-(75:43)
                                                                                   (ValVariable "oo_013"))
                                                                         (ArrayDecl (AList ()
                                                                                           (75:45)-(75:45)
                                                                                           [DimensionDeclarator ()
                                                                                                                (75:45)-(75:45)
                                                                                                                Nothing
                                                                                                                (Just ExpValue ()
                                                                                                                               (75:45)-(75:45)
                                                                                                                               (ValInteger "2"
                                                                                                                                           Nothing))]))
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (76:7)-(76:46)
                                       Nothing
                                       (StDeclaration ()
                                                      (76:7)-(76:46)
                                                      (TypeSpec ()
                                                                (76:7)-(76:17)
                                                                TypeCharacter
                                                                (Just Selector ()
                                                                               (76:16)-(76:17)
                                                                               (Just ExpValue ()
                                                                                              (76:17)-(76:17)
                                                                                              (ValInteger "4"
                                                                                                          Nothing))
                                                                               Nothing))
                                                      Nothing
                                                      (AList ()
                                                             (76:18)-(76:46)
                                                             [Declarator ()
                                                                         (76:18)-(76:26)
                                                                         (ExpValue ()
                                                                                   (76:18)-(76:23)
                                                                                   (ValVariable "oo_009"))
                                                                         (ArrayDecl (AList ()
                                                                                           (76:25)-(76:25)
                                                                                           [DimensionDeclarator ()
                                                                                                                (76:25)-(76:25)
                                                                                                                Nothing
                                                                                                                (Just ExpValue ()
                                                                                                                               (76:25)-(76:25)
                                                                                                                               (ValInteger "2"
                                                                                                                                           Nothing))]))
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (76:28)-(76:36)
                                                                         (ExpValue ()
                                                                                   (76:28)-(76:33)
                                                                                   (ValVariable "oo_010"))
                                                                         (ArrayDecl (AList ()
                                                                                           (76:35)-(76:35)
                                                                                           [DimensionDeclarator ()
                                                                                                                (76:35)-(76:35)
                                                                                                                Nothing
                                                                                                                (Just ExpValue ()
                                                                                                                               (76:35)-(76:35)
                                                                                                                               (ValInteger "2"
                                                                                                                                           Nothing))]))
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (76:38)-(76:46)
                                                                         (ExpValue ()
                                                                                   (76:38)-(76:43)
                                                                                   (ValVariable "oo_012"))
                                                                         (ArrayDecl (AList ()
                                                                                           (76:45)-(76:45)
                                                                                           [DimensionDeclarator ()
                                                                                                                (76:45)-(76:45)
                                                                                                                Nothing
                                                                                                                (Just ExpValue ()
                                                                                                                               (76:45)-(76:45)
                                                                                                                               (ValInteger "2"
                                                                                                                                           Nothing))]))
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (77:7)-(77:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (77:7)-(77:19)
                                                      (TypeSpec ()
                                                                (77:7)-(77:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (77:15)-(77:19)
                                                             [Declarator ()
                                                                         (77:15)-(77:19)
                                                                         (ExpValue ()
                                                                                   (77:15)-(77:19)
                                                                                   (ValVariable "nlist"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment ()
                                     (78:1)-(78:18)
                                     (Comment "     segment,list"),
                           BlComment ()
                                     (79:1)-(79:25)
                                     (Comment "     pointeur alist.list"),
                           BlComment ()
                                     (80:1)-(80:26)
                                     (Comment "     pointeur splist.list"),
                           BlComment ()
                                     (81:1)-(81:25)
                                     (Comment "     pointeur rlist.list"),
                           BlStatement ()
                                       (82:7)-(82:21)
                                       Nothing
                                       (StDeclaration ()
                                                      (82:7)-(82:21)
                                                      (TypeSpec ()
                                                                (82:7)-(82:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (82:16)-(82:21)
                                                             [Declarator ()
                                                                         (82:16)-(82:21)
                                                                         (ExpValue ()
                                                                                   (82:16)-(82:21)
                                                                                   (ValVariable "status"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment () (83:1)-(83:1) (Comment ""),
                           BlComment ()
                                     (84:1)-(84:24)
                                     (Comment "     pointeur xs.string"),
                           BlComment ()
                                     (85:1)-(85:24)
                                     (Comment "     pointeur sp.string"),
                           BlComment ()
                                     (86:1)-(86:24)
                                     (Comment "     pointeur ms.string"),
                           BlStatement ()
                                       (87:7)-(87:18)
                                       Nothing
                                       (StDeclaration ()
                                                      (87:7)-(87:18)
                                                      (TypeSpec ()
                                                                (87:7)-(87:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (87:16)-(87:18)
                                                             [Declarator ()
                                                                         (87:16)-(87:18)
                                                                         (ExpValue ()
                                                                                   (87:16)-(87:18)
                                                                                   (ValVariable "lxs"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (88:7)-(88:18)
                                       Nothing
                                       (StDeclaration ()
                                                      (88:7)-(88:18)
                                                      (TypeSpec ()
                                                                (88:7)-(88:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (88:16)-(88:18)
                                                             [Declarator ()
                                                                         (88:16)-(88:18)
                                                                         (ExpValue ()
                                                                                   (88:16)-(88:18)
                                                                                   (ValVariable "lsp"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (89:7)-(89:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (89:7)-(89:19)
                                                      (TypeSpec ()
                                                                (89:7)-(89:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (89:16)-(89:19)
                                                             [Declarator ()
                                                                         (89:16)-(89:19)
                                                                         (ExpValue ()
                                                                                   (89:16)-(89:19)
                                                                                   (ValVariable "lmin"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (90:7)-(90:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (90:7)-(90:19)
                                                      (TypeSpec ()
                                                                (90:7)-(90:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (90:16)-(90:19)
                                                             [Declarator ()
                                                                         (90:16)-(90:16)
                                                                         (ExpValue ()
                                                                                   (90:16)-(90:16)
                                                                                   (ValVariable "i"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (90:18)-(90:19)
                                                                         (ExpValue ()
                                                                                   (90:18)-(90:19)
                                                                                   (ValVariable "ia"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (91:7)-(91:22)
                                       Nothing
                                       (StDeclaration ()
                                                      (91:7)-(91:22)
                                                      (TypeSpec ()
                                                                (91:7)-(91:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (91:16)-(91:22)
                                                             [Declarator ()
                                                                         (91:16)-(91:18)
                                                                         (ExpValue ()
                                                                                   (91:16)-(91:18)
                                                                                   (ValVariable "idx"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (91:20)-(91:22)
                                                                         (ExpValue ()
                                                                                   (91:20)-(91:22)
                                                                                   (ValVariable "kdx"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (92:7)-(92:25)
                                       Nothing
                                       (StDeclaration ()
                                                      (92:7)-(92:25)
                                                      (TypeSpec ()
                                                                (92:7)-(92:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (92:16)-(92:25)
                                                             [Declarator ()
                                                                         (92:16)-(92:20)
                                                                         (ExpValue ()
                                                                                   (92:16)-(92:20)
                                                                                   (ValVariable "first"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (92:22)-(92:25)
                                                                         (ExpValue ()
                                                                                   (92:22)-(92:25)
                                                                                   (ValVariable "last"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (93:7)-(93:27)
                                       Nothing
                                       (StDeclaration ()
                                                      (93:7)-(93:27)
                                                      (TypeSpec ()
                                                                (93:7)-(93:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (93:16)-(93:27)
                                                             [Declarator ()
                                                                         (93:16)-(93:21)
                                                                         (ExpValue ()
                                                                                   (93:16)-(93:21)
                                                                                   (ValVariable "mfirst"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing,
                                                              Declarator ()
                                                                         (93:23)-(93:27)
                                                                         (ExpValue ()
                                                                                   (93:23)-(93:27)
                                                                                   (ValVariable "mlast"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment () (94:1)-(94:1) (Comment ""),
                           BlStatement ()
                                       (95:7)-(95:14)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (95:7)-(95:14)
                                                           (ExpValue ()
                                                                     (95:7)-(95:12)
                                                                     (ValVariable "status"))
                                                           (ExpValue ()
                                                                     (95:14)-(95:14)
                                                                     (ValInteger "0"
                                                                                 Nothing))),
                           BlStatement ()
                                       (96:7)-(96:14)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (96:7)-(96:14)
                                                           (ExpValue ()
                                                                     (96:7)-(96:11)
                                                                     (ValVariable "nlist"))
                                                           (ExpValue ()
                                                                     (96:13)-(96:14)
                                                                     (ValInteger "10"
                                                                                 Nothing))),
                           BlComment ()
                                     (97:1)-(97:18)
                                     (Comment "     segini,rlist"),
                           BlStatement ()
                                       (98:7)-(98:54)
                                       Nothing
                                       (StCall ()
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
                                                                                        (ValVariable "oo4"))),
                                                            Argument ()
                                                                     (98:22)-(98:22)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (98:22)-(98:22)
                                                                                        (ValInteger "0"
                                                                                                    Nothing))),
                                                            Argument ()
                                                                     (98:24)-(98:41)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (98:24)-(98:41)
                                                                                        (ValString "STGBRK 20 RLIST "))),
                                                            Argument ()
                                                                     (98:43)-(98:45)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (98:43)-(98:45)
                                                                                        (ValVariable "oo1"))),
                                                            Argument ()
                                                                     (98:47)-(98:53)
                                                                     Nothing
                                                                     (ArgExpr (ExpBinary ()
                                                                                         (98:47)-(98:53)
                                                                                         Addition
                                                                                         (ExpValue ()
                                                                                                   (98:47)-(98:47)
                                                                                                   (ValInteger "2"
                                                                                                               Nothing))
                                                                                         (ExpValue ()
                                                                                                   (98:49)-(98:53)
                                                                                                   (ValVariable "nlist"))))])),
                           BlStatement ()
                                       (99:7)-(99:40)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (99:7)-(99:40)
                                                           (ExpSubscript ()
                                                                         (99:7)-(99:34)
                                                                         (ExpValue ()
                                                                                   (99:7)-(99:12)
                                                                                   (ValVariable "oo_001"))
                                                                         (AList ()
                                                                                (99:14)-(99:33)
                                                                                [IxSingle ()
                                                                                          (99:14)-(99:33)
                                                                                          Nothing
                                                                                          (ExpBinary ()
                                                                                                     (99:14)-(99:33)
                                                                                                     Addition
                                                                                                     (ExpBinary ()
                                                                                                                (99:14)-(99:31)
                                                                                                                Addition
                                                                                                                (ExpUnary ()
                                                                                                                          (99:14)-(99:18)
                                                                                                                          Minus
                                                                                                                          (ExpValue ()
                                                                                                                                    (99:15)-(99:18)
                                                                                                                                    (ValInteger "0002"
                                                                                                                                                Nothing)))
                                                                                                                (ExpSubscript ()
                                                                                                                              (99:20)-(99:31)
                                                                                                                              (ExpValue ()
                                                                                                                                        (99:20)-(99:22)
                                                                                                                                        (ValVariable "oow"))
                                                                                                                              (AList ()
                                                                                                                                     (99:24)-(99:30)
                                                                                                                                     [IxSingle ()
                                                                                                                                               (99:24)-(99:30)
                                                                                                                                               Nothing
                                                                                                                                               (ExpBinary ()
                                                                                                                                                          (99:24)-(99:30)
                                                                                                                                                          Addition
                                                                                                                                                          (ExpValue ()
                                                                                                                                                                    (99:24)-(99:26)
                                                                                                                                                                    (ValVariable "oot"))
                                                                                                                                                          (ExpValue ()
                                                                                                                                                                    (99:28)-(99:30)
                                                                                                                                                                    (ValVariable "oo1")))])))
                                                                                                     (ExpValue ()
                                                                                                               (99:33)-(99:33)
                                                                                                               (ValInteger "2"
                                                                                                                           Nothing)))]))
                                                           (ExpValue ()
                                                                     (99:36)-(99:40)
                                                                     (ValVariable "nlist"))),
                           BlStatement ()
                                       (100:7)-(100:15)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (100:7)-(100:15)
                                                           (ExpValue ()
                                                                     (100:7)-(100:11)
                                                                     (ValVariable "rlist"))
                                                           (ExpValue ()
                                                                     (100:13)-(100:15)
                                                                     (ValVariable "oo1"))),
                           BlComment ()
                                     (101:1)-(101:18)
                                     (Comment "     segact,rlist"),
                           BlStatement ()
                                       (102:7)-(102:15)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (102:7)-(102:15)
                                                           (ExpValue ()
                                                                     (102:7)-(102:9)
                                                                     (ValVariable "oo1"))
                                                           (ExpValue ()
                                                                     (102:11)-(102:15)
                                                                     (ValVariable "rlist"))),
                           BlStatement ()
                                       (103:7)-(103:48)
                                       Nothing
                                       (StCall ()
                                               (103:7)-(103:48)
                                               (ExpValue ()
                                                         (103:11)-(103:16)
                                                         (ValVariable "ooowac"))
                                               (Just AList ()
                                                           (103:17)-(103:48)
                                                           [Argument ()
                                                                     (103:18)-(103:20)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (103:18)-(103:20)
                                                                                        (ValVariable "oo4"))),
                                                            Argument ()
                                                                     (103:22)-(103:22)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (103:22)-(103:22)
                                                                                        (ValInteger "0"
                                                                                                    Nothing))),
                                                            Argument ()
                                                                     (103:24)-(103:41)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (103:24)-(103:41)
                                                                                        (ValString "STGBRK 24 RLIST "))),
                                                            Argument ()
                                                                     (103:43)-(103:45)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (103:43)-(103:45)
                                                                                        (ValVariable "oo1"))),
                                                            Argument ()
                                                                     (103:47)-(103:47)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (103:47)-(103:47)
                                                                                        (ValInteger "0"
                                                                                                    Nothing)))])),
                           BlComment ()
                                     (104:1)-(104:19)
                                     (Comment "     rlist.ilist=0"),
                           BlStatement ()
                                       (105:7)-(105:38)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (105:7)-(105:38)
                                                           (ExpSubscript ()
                                                                         (105:7)-(105:36)
                                                                         (ExpValue ()
                                                                                   (105:7)-(105:12)
                                                                                   (ValVariable "oo_002"))
                                                                         (AList ()
                                                                                (105:14)-(105:35)
                                                                                [IxSingle ()
                                                                                          (105:14)-(105:35)
                                                                                          Nothing
                                                                                          (ExpBinary ()
                                                                                                     (105:14)-(105:35)
                                                                                                     Addition
                                                                                                     (ExpBinary ()
                                                                                                                (105:14)-(105:33)
                                                                                                                Addition
                                                                                                                (ExpUnary ()
                                                                                                                          (105:14)-(105:18)
                                                                                                                          Minus
                                                                                                                          (ExpValue ()
                                                                                                                                    (105:15)-(105:18)
                                                                                                                                    (ValInteger "0004"
                                                                                                                                                Nothing)))
                                                                                                                (ExpSubscript ()
                                                                                                                              (105:20)-(105:33)
                                                                                                                              (ExpValue ()
                                                                                                                                        (105:20)-(105:22)
                                                                                                                                        (ValVariable "oow"))
                                                                                                                              (AList ()
                                                                                                                                     (105:24)-(105:32)
                                                                                                                                     [IxSingle ()
                                                                                                                                               (105:24)-(105:32)
                                                                                                                                               Nothing
                                                                                                                                               (ExpBinary ()
                                                                                                                                                          (105:24)-(105:32)
                                                                                                                                                          Addition
                                                                                                                                                          (ExpValue ()
                                                                                                                                                                    (105:24)-(105:26)
                                                                                                                                                                    (ValVariable "oot"))
                                                                                                                                                          (ExpValue ()
                                                                                                                                                                    (105:28)-(105:32)
                                                                                                                                                                    (ValVariable "rlist")))])))
                                                                                                     (ExpValue ()
                                                                                                               (105:35)-(105:35)
                                                                                                               (ValInteger "1"
                                                                                                                           Nothing)))]))
                                                           (ExpValue ()
                                                                     (105:38)-(105:38)
                                                                     (ValInteger "0"
                                                                                 Nothing))),
                           BlComment () (106:1)-(106:1) (Comment ""),
                           BlComment ()
                                     (107:1)-(107:19)
                                     (Comment "     segact,splist"),
                           BlStatement ()
                                       (108:7)-(108:16)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (108:7)-(108:16)
                                                           (ExpValue ()
                                                                     (108:7)-(108:9)
                                                                     (ValVariable "oo1"))
                                                           (ExpValue ()
                                                                     (108:11)-(108:16)
                                                                     (ValVariable "splist"))),
                           BlStatement ()
                                       (109:7)-(109:49)
                                       Nothing
                                       (StCall ()
                                               (109:7)-(109:49)
                                               (ExpValue ()
                                                         (109:11)-(109:16)
                                                         (ValVariable "ooowac"))
                                               (Just AList ()
                                                           (109:17)-(109:49)
                                                           [Argument ()
                                                                     (109:18)-(109:20)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (109:18)-(109:20)
                                                                                        (ValVariable "oo4"))),
                                                            Argument ()
                                                                     (109:22)-(109:22)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (109:22)-(109:22)
                                                                                        (ValInteger "0"
                                                                                                    Nothing))),
                                                            Argument ()
                                                                     (109:24)-(109:42)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (109:24)-(109:42)
                                                                                        (ValString "STGBRK 27 SPLIST "))),
                                                            Argument ()
                                                                     (109:44)-(109:46)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (109:44)-(109:46)
                                                                                        (ValVariable "oo1"))),
                                                            Argument ()
                                                                     (109:48)-(109:48)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (109:48)-(109:48)
                                                                                        (ValInteger "0"
                                                                                                    Nothing)))])),
                           BlComment ()
                                     (110:1)-(110:18)
                                     (Comment "     segact,alist"),
                           BlStatement ()
                                       (111:7)-(111:15)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (111:7)-(111:15)
                                                           (ExpValue ()
                                                                     (111:7)-(111:9)
                                                                     (ValVariable "oo1"))
                                                           (ExpValue ()
                                                                     (111:11)-(111:15)
                                                                     (ValVariable "alist"))),
                           BlStatement ()
                                       (112:7)-(112:48)
                                       Nothing
                                       (StCall ()
                                               (112:7)-(112:48)
                                               (ExpValue ()
                                                         (112:11)-(112:16)
                                                         (ValVariable "ooowac"))
                                               (Just AList ()
                                                           (112:17)-(112:48)
                                                           [Argument ()
                                                                     (112:18)-(112:20)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (112:18)-(112:20)
                                                                                        (ValVariable "oo4"))),
                                                            Argument ()
                                                                     (112:22)-(112:22)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (112:22)-(112:22)
                                                                                        (ValInteger "0"
                                                                                                    Nothing))),
                                                            Argument ()
                                                                     (112:24)-(112:41)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (112:24)-(112:41)
                                                                                        (ValString "STGBRK 29 ALIST "))),
                                                            Argument ()
                                                                     (112:43)-(112:45)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (112:43)-(112:45)
                                                                                        (ValVariable "oo1"))),
                                                            Argument ()
                                                                     (112:47)-(112:47)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (112:47)-(112:47)
                                                                                        (ValInteger "0"
                                                                                                    Nothing)))])),
                           BlComment () (113:1)-(113:1) (Comment ""),
                           BlComment ()
                                     (114:1)-(114:40)
                                     (Comment "     //repeter \"decouper chaque chaine\""),
                           BlComment ()
                                     (115:1)-(115:25)
                                     (Comment "     do ia=1,alist.ilist"),
                           BlDo ()
                                (116:7)-(288:11)
                                Nothing
                                Nothing
                                (Just ExpValue ()
                                               (116:9)-(116:13)
                                               (ValInteger "99001" Nothing))
                                (Just DoSpecification ()
                                                      (116:14)-(116:48)
                                                      (StExpressionAssign ()
                                                                          (116:14)-(116:17)
                                                                          (ExpValue ()
                                                                                    (116:14)-(116:15)
                                                                                    (ValVariable "ia"))
                                                                          (ExpValue ()
                                                                                    (116:17)-(116:17)
                                                                                    (ValInteger "1"
                                                                                                Nothing)))
                                                      (ExpSubscript ()
                                                                    (116:19)-(116:48)
                                                                    (ExpValue ()
                                                                              (116:19)-(116:24)
                                                                              (ValVariable "oo_003"))
                                                                    (AList ()
                                                                           (116:26)-(116:47)
                                                                           [IxSingle ()
                                                                                     (116:26)-(116:47)
                                                                                     Nothing
                                                                                     (ExpBinary ()
                                                                                                (116:26)-(116:47)
                                                                                                Addition
                                                                                                (ExpBinary ()
                                                                                                           (116:26)-(116:45)
                                                                                                           Addition
                                                                                                           (ExpUnary ()
                                                                                                                     (116:26)-(116:30)
                                                                                                                     Minus
                                                                                                                     (ExpValue ()
                                                                                                                               (116:27)-(116:30)
                                                                                                                               (ValInteger "0006"
                                                                                                                                           Nothing)))
                                                                                                           (ExpSubscript ()
                                                                                                                         (116:32)-(116:45)
                                                                                                                         (ExpValue ()
                                                                                                                                   (116:32)-(116:34)
                                                                                                                                   (ValVariable "oow"))
                                                                                                                         (AList ()
                                                                                                                                (116:36)-(116:44)
                                                                                                                                [IxSingle ()
                                                                                                                                          (116:36)-(116:44)
                                                                                                                                          Nothing
                                                                                                                                          (ExpBinary ()
                                                                                                                                                     (116:36)-(116:44)
                                                                                                                                                     Addition
                                                                                                                                                     (ExpValue ()
                                                                                                                                                               (116:36)-(116:38)
                                                                                                                                                               (ValVariable "oot"))
                                                                                                                                                     (ExpValue ()
                                                                                                                                                               (116:40)-(116:44)
                                                                                                                                                               (ValVariable "alist")))])))
                                                                                                (ExpValue ()
                                                                                                          (116:47)-(116:47)
                                                                                                          (ValInteger "1"
                                                                                                                      Nothing)))]))
                                                      Nothing)
                                [BlComment ()
                                           (117:1)-(117:31)
                                           (Comment "       xs=abs(alist.elist(ia))"),
                                 BlStatement ()
                                             (118:7)-(118:47)
                                             Nothing
                                             (StExpressionAssign ()
                                                                 (118:7)-(118:47)
                                                                 (ExpValue ()
                                                                           (118:7)-(118:8)
                                                                           (ValVariable "xs"))
                                                                 (ExpFunctionCall ()
                                                                                  (118:10)-(118:47)
                                                                                  (ExpValue ()
                                                                                            (118:10)-(118:12)
                                                                                            (ValIntrinsic "abs"))
                                                                                  (Just AList ()
                                                                                              (118:14)-(118:46)
                                                                                              [Argument ()
                                                                                                        (118:14)-(118:46)
                                                                                                        Nothing
                                                                                                        (ArgExpr (ExpSubscript ()
                                                                                                                               (118:14)-(118:46)
                                                                                                                               (ExpValue ()
                                                                                                                                         (118:14)-(118:19)
                                                                                                                                         (ValVariable "oo_004"))
                                                                                                                               (AList ()
                                                                                                                                      (118:21)-(118:45)
                                                                                                                                      [IxSingle ()
                                                                                                                                                (118:21)-(118:45)
                                                                                                                                                Nothing
                                                                                                                                                (ExpBinary ()
                                                                                                                                                           (118:21)-(118:45)
                                                                                                                                                           Addition
                                                                                                                                                           (ExpBinary ()
                                                                                                                                                                      (118:21)-(118:42)
                                                                                                                                                                      Addition
                                                                                                                                                                      (ExpBinary ()
                                                                                                                                                                                 (118:21)-(118:40)
                                                                                                                                                                                 Addition
                                                                                                                                                                                 (ExpUnary ()
                                                                                                                                                                                           (118:21)-(118:25)
                                                                                                                                                                                           Minus
                                                                                                                                                                                           (ExpValue ()
                                                                                                                                                                                                     (118:22)-(118:25)
                                                                                                                                                                                                     (ValInteger "0008"
                                                                                                                                                                                                                 Nothing)))
                                                                                                                                                                                 (ExpSubscript ()
                                                                                                                                                                                               (118:27)-(118:40)
                                                                                                                                                                                               (ExpValue ()
                                                                                                                                                                                                         (118:27)-(118:29)
                                                                                                                                                                                                         (ValVariable "oow"))
                                                                                                                                                                                               (AList ()
                                                                                                                                                                                                      (118:31)-(118:39)
                                                                                                                                                                                                      [IxSingle ()
                                                                                                                                                                                                                (118:31)-(118:39)
                                                                                                                                                                                                                Nothing
                                                                                                                                                                                                                (ExpBinary ()
                                                                                                                                                                                                                           (118:31)-(118:39)
                                                                                                                                                                                                                           Addition
                                                                                                                                                                                                                           (ExpValue ()
                                                                                                                                                                                                                                     (118:31)-(118:33)
                                                                                                                                                                                                                                     (ValVariable "oot"))
                                                                                                                                                                                                                           (ExpValue ()
                                                                                                                                                                                                                                     (118:35)-(118:39)
                                                                                                                                                                                                                                     (ValVariable "alist")))])))
                                                                                                                                                                      (ExpValue ()
                                                                                                                                                                                (118:42)-(118:42)
                                                                                                                                                                                (ValInteger "2"
                                                                                                                                                                                            Nothing)))
                                                                                                                                                           (ExpValue ()
                                                                                                                                                                     (118:44)-(118:45)
                                                                                                                                                                     (ValVariable "ia")))])))]))),
                                 BlComment () (119:1)-(119:1) (Comment ""),
                                 BlComment ()
                                           (120:1)-(120:17)
                                           (Comment "       segact,xs"),
                                 BlStatement ()
                                             (121:7)-(121:12)
                                             Nothing
                                             (StExpressionAssign ()
                                                                 (121:7)-(121:12)
                                                                 (ExpValue ()
                                                                           (121:7)-(121:9)
                                                                           (ValVariable "oo1"))
                                                                 (ExpValue ()
                                                                           (121:11)-(121:12)
                                                                           (ValVariable "xs"))),
                                 BlStatement ()
                                             (122:7)-(122:45)
                                             Nothing
                                             (StCall ()
                                                     (122:7)-(122:45)
                                                     (ExpValue ()
                                                               (122:11)-(122:16)
                                                               (ValVariable "ooowac"))
                                                     (Just AList ()
                                                                 (122:17)-(122:45)
                                                                 [Argument ()
                                                                           (122:18)-(122:20)
                                                                           Nothing
                                                                           (ArgExpr (ExpValue ()
                                                                                              (122:18)-(122:20)
                                                                                              (ValVariable "oo4"))),
                                                                  Argument ()
                                                                           (122:22)-(122:22)
                                                                           Nothing
                                                                           (ArgExpr (ExpValue ()
                                                                                              (122:22)-(122:22)
                                                                                              (ValInteger "0"
                                                                                                          Nothing))),
                                                                  Argument ()
                                                                           (122:24)-(122:38)
                                                                           Nothing
                                                                           (ArgExpr (ExpValue ()
                                                                                              (122:24)-(122:38)
                                                                                              (ValString "STGBRK 33 XS "))),
                                                                  Argument ()
                                                                           (122:40)-(122:42)
                                                                           Nothing
                                                                           (ArgExpr (ExpValue ()
                                                                                              (122:40)-(122:42)
                                                                                              (ValVariable "oo1"))),
                                                                  Argument ()
                                                                           (122:44)-(122:44)
                                                                           Nothing
                                                                           (ArgExpr (ExpValue ()
                                                                                              (122:44)-(122:44)
                                                                                              (ValInteger "0"
                                                                                                          Nothing)))])),
                                 BlComment ()
                                           (123:1)-(123:23)
                                           (Comment "       lxs=xs.cstg(/1)"),
                                 BlStatement ()
                                             (124:7)-(124:37)
                                             Nothing
                                             (StExpressionAssign ()
                                                                 (124:7)-(124:37)
                                                                 (ExpValue ()
                                                                           (124:7)-(124:9)
                                                                           (ValVariable "lxs"))
                                                                 (ExpSubscript ()
                                                                               (124:11)-(124:37)
                                                                               (ExpValue ()
                                                                                         (124:11)-(124:16)
                                                                                         (ValVariable "oo_005"))
                                                                               (AList ()
                                                                                      (124:18)-(124:36)
                                                                                      [IxSingle ()
                                                                                                (124:18)-(124:36)
                                                                                                Nothing
                                                                                                (ExpBinary ()
                                                                                                           (124:18)-(124:36)
                                                                                                           Addition
                                                                                                           (ExpBinary ()
                                                                                                                      (124:18)-(124:34)
                                                                                                                      Addition
                                                                                                                      (ExpUnary ()
                                                                                                                                (124:18)-(124:22)
                                                                                                                                Minus
                                                                                                                                (ExpValue ()
                                                                                                                                          (124:19)-(124:22)
                                                                                                                                          (ValInteger "0010"
                                                                                                                                                      Nothing)))
                                                                                                                      (ExpSubscript ()
                                                                                                                                    (124:24)-(124:34)
                                                                                                                                    (ExpValue ()
                                                                                                                                              (124:24)-(124:26)
                                                                                                                                              (ValVariable "oow"))
                                                                                                                                    (AList ()
                                                                                                                                           (124:28)-(124:33)
                                                                                                                                           [IxSingle ()
                                                                                                                                                     (124:28)-(124:33)
                                                                                                                                                     Nothing
                                                                                                                                                     (ExpBinary ()
                                                                                                                                                                (124:28)-(124:33)
                                                                                                                                                                Addition
                                                                                                                                                                (ExpValue ()
                                                                                                                                                                          (124:28)-(124:30)
                                                                                                                                                                          (ValVariable "oot"))
                                                                                                                                                                (ExpValue ()
                                                                                                                                                                          (124:32)-(124:33)
                                                                                                                                                                          (ValVariable "xs")))])))
                                                                                                           (ExpValue ()
                                                                                                                     (124:36)-(124:36)
                                                                                                                     (ValInteger "1"
                                                                                                                                 Nothing)))]))),
                                 BlComment () (125:1)-(125:1) (Comment ""),
                                 BlIf ()
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
                                                                (ValInteger "0"
                                                                            Nothing)),
                                       Nothing]
                                      [[BlComment ()
                                                  (127:1)-(127:44)
                                                  (Comment "         == la chaine a \"decouper\" est vide"),
                                        BlComment ()
                                                  (128:1)-(128:32)
                                                  (Comment "         >> ne rien renvoyer <<")],
                                       [BlComment ()
                                                  (130:1)-(130:50)
                                                  (Comment "         == la chaine a \"decouper\" n''est pas vide"),
                                        BlStatement ()
                                                    (131:11)-(131:17)
                                                    Nothing
                                                    (StExpressionAssign ()
                                                                        (131:11)-(131:17)
                                                                        (ExpValue ()
                                                                                  (131:11)-(131:15)
                                                                                  (ValVariable "first"))
                                                                        (ExpValue ()
                                                                                  (131:17)-(131:17)
                                                                                  (ValInteger "1"
                                                                                              Nothing))),
                                        BlStatement ()
                                                    (132:11)-(132:18)
                                                    Nothing
                                                    (StExpressionAssign ()
                                                                        (132:11)-(132:18)
                                                                        (ExpValue ()
                                                                                  (132:11)-(132:14)
                                                                                  (ValVariable "last"))
                                                                        (ExpValue ()
                                                                                  (132:16)-(132:18)
                                                                                  (ValVariable "lxs"))),
                                        BlComment ()
                                                  (133:1)-(133:1)
                                                  (Comment ""),
                                        BlComment ()
                                                  (134:1)-(134:38)
                                                  (Comment "         //repeter \"decouper morceau\""),
                                        BlStatement ()
                                                    (135:2)-(135:18)
                                                    (Just ExpValue ()
                                                                   (135:2)-(135:4)
                                                                   (ValInteger "100"
                                                                               Nothing))
                                                    (StContinue ()
                                                                (135:11)-(135:18)),
                                        BlComment ()
                                                  (136:1)-(136:1)
                                                  (Comment ""),
                                        BlComment ()
                                                  (137:1)-(137:46)
                                                  (Comment "           //repeter \"sauter separateur-tete\""),
                                        BlComment ()
                                                  (138:1)-(138:43)
                                                  (Comment "             -- chercher separateur-entete"),
                                        BlComment ()
                                                  (139:1)-(139:53)
                                                  (Comment "             -- ... donnant le plus petit separateur"),
                                        BlStatement ()
                                                    (140:2)-(140:17)
                                                    (Just ExpValue ()
                                                                   (140:2)-(140:4)
                                                                   (ValInteger "110"
                                                                               Nothing))
                                                    (StExpressionAssign ()
                                                                        (140:15)-(140:17)
                                                                        (ExpValue ()
                                                                                  (140:15)-(140:15)
                                                                                  (ValVariable "i"))
                                                                        (ExpValue ()
                                                                                  (140:17)-(140:17)
                                                                                  (ValInteger "0"
                                                                                              Nothing))),
                                        BlStatement ()
                                                    (141:15)-(141:21)
                                                    Nothing
                                                    (StExpressionAssign ()
                                                                        (141:15)-(141:21)
                                                                        (ExpValue ()
                                                                                  (141:15)-(141:18)
                                                                                  (ValVariable "lmin"))
                                                                        (ExpUnary ()
                                                                                  (141:20)-(141:21)
                                                                                  Minus
                                                                                  (ExpValue ()
                                                                                            (141:21)-(141:21)
                                                                                            (ValInteger "1"
                                                                                                        Nothing)))),
                                        BlStatement ()
                                                    (142:2)-(142:19)
                                                    (Just ExpValue ()
                                                                   (142:2)-(142:4)
                                                                   (ValInteger "120"
                                                                               Nothing))
                                                    (StExpressionAssign ()
                                                                        (142:15)-(142:19)
                                                                        (ExpValue ()
                                                                                  (142:15)-(142:15)
                                                                                  (ValVariable "i"))
                                                                        (ExpBinary ()
                                                                                   (142:17)-(142:19)
                                                                                   Addition
                                                                                   (ExpValue ()
                                                                                             (142:17)-(142:17)
                                                                                             (ValVariable "i"))
                                                                                   (ExpValue ()
                                                                                             (142:19)-(142:19)
                                                                                             (ValInteger "1"
                                                                                                         Nothing)))),
                                        BlComment ()
                                                  (143:1)-(143:41)
                                                  (Comment "             if(i.le.(splist.ilist))then"),
                                        BlIf ()
                                             (144:7)-(173:19)
                                             Nothing
                                             Nothing
                                             [Just ExpBinary ()
                                                             (144:10)-(144:47)
                                                             LTE
                                                             (ExpValue ()
                                                                       (144:10)-(144:10)
                                                                       (ValVariable "i"))
                                                             (ExpSubscript ()
                                                                           (144:15)-(144:47)
                                                                           (ExpValue ()
                                                                                     (144:16)-(144:21)
                                                                                     (ValVariable "oo_006"))
                                                                           (AList ()
                                                                                  (144:23)-(144:45)
                                                                                  [IxSingle ()
                                                                                            (144:23)-(144:45)
                                                                                            Nothing
                                                                                            (ExpBinary ()
                                                                                                       (144:23)-(144:45)
                                                                                                       Addition
                                                                                                       (ExpBinary ()
                                                                                                                  (144:23)-(144:43)
                                                                                                                  Addition
                                                                                                                  (ExpUnary ()
                                                                                                                            (144:23)-(144:27)
                                                                                                                            Minus
                                                                                                                            (ExpValue ()
                                                                                                                                      (144:24)-(144:27)
                                                                                                                                      (ValInteger "0012"
                                                                                                                                                  Nothing)))
                                                                                                                  (ExpSubscript ()
                                                                                                                                (144:29)-(144:43)
                                                                                                                                (ExpValue ()
                                                                                                                                          (144:29)-(144:31)
                                                                                                                                          (ValVariable "oow"))
                                                                                                                                (AList ()
                                                                                                                                       (144:33)-(144:42)
                                                                                                                                       [IxSingle ()
                                                                                                                                                 (144:33)-(144:42)
                                                                                                                                                 Nothing
                                                                                                                                                 (ExpBinary ()
                                                                                                                                                            (144:33)-(144:42)
                                                                                                                                                            Addition
                                                                                                                                                            (ExpValue ()
                                                                                                                                                                      (144:33)-(144:35)
                                                                                                                                                                      (ValVariable "oot"))
                                                                                                                                                            (ExpValue ()
                                                                                                                                                                      (144:37)-(144:42)
                                                                                                                                                                      (ValVariable "splist")))])))
                                                                                                       (ExpValue ()
                                                                                                                 (144:45)-(144:45)
                                                                                                                 (ValInteger "1"
                                                                                                                             Nothing)))]))]
                                             [[BlComment ()
                                                         (145:1)-(145:39)
                                                         (Comment "               sp=abs(splist.elist(i))"),
                                               BlStatement ()
                                                           (146:7)-(146:47)
                                                           Nothing
                                                           (StExpressionAssign ()
                                                                               (146:7)-(146:47)
                                                                               (ExpValue ()
                                                                                         (146:7)-(146:8)
                                                                                         (ValVariable "sp"))
                                                                               (ExpFunctionCall ()
                                                                                                (146:10)-(146:47)
                                                                                                (ExpValue ()
                                                                                                          (146:10)-(146:12)
                                                                                                          (ValIntrinsic "abs"))
                                                                                                (Just AList ()
                                                                                                            (146:14)-(146:46)
                                                                                                            [Argument ()
                                                                                                                      (146:14)-(146:46)
                                                                                                                      Nothing
                                                                                                                      (ArgExpr (ExpSubscript ()
                                                                                                                                             (146:14)-(146:46)
                                                                                                                                             (ExpValue ()
                                                                                                                                                       (146:14)-(146:19)
                                                                                                                                                       (ValVariable "oo_007"))
                                                                                                                                             (AList ()
                                                                                                                                                    (146:21)-(146:45)
                                                                                                                                                    [IxSingle ()
                                                                                                                                                              (146:21)-(146:45)
                                                                                                                                                              Nothing
                                                                                                                                                              (ExpBinary ()
                                                                                                                                                                         (146:21)-(146:45)
                                                                                                                                                                         Addition
                                                                                                                                                                         (ExpBinary ()
                                                                                                                                                                                    (146:21)-(146:43)
                                                                                                                                                                                    Addition
                                                                                                                                                                                    (ExpBinary ()
                                                                                                                                                                                               (146:21)-(146:41)
                                                                                                                                                                                               Addition
                                                                                                                                                                                               (ExpUnary ()
                                                                                                                                                                                                         (146:21)-(146:25)
                                                                                                                                                                                                         Minus
                                                                                                                                                                                                         (ExpValue ()
                                                                                                                                                                                                                   (146:22)-(146:25)
                                                                                                                                                                                                                   (ValInteger "0014"
                                                                                                                                                                                                                               Nothing)))
                                                                                                                                                                                               (ExpSubscript ()
                                                                                                                                                                                                             (146:27)-(146:41)
                                                                                                                                                                                                             (ExpValue ()
                                                                                                                                                                                                                       (146:27)-(146:29)
                                                                                                                                                                                                                       (ValVariable "oow"))
                                                                                                                                                                                                             (AList ()
                                                                                                                                                                                                                    (146:31)-(146:40)
                                                                                                                                                                                                                    [IxSingle ()
                                                                                                                                                                                                                              (146:31)-(146:40)
                                                                                                                                                                                                                              Nothing
                                                                                                                                                                                                                              (ExpBinary ()
                                                                                                                                                                                                                                         (146:31)-(146:40)
                                                                                                                                                                                                                                         Addition
                                                                                                                                                                                                                                         (ExpValue ()
                                                                                                                                                                                                                                                   (146:31)-(146:33)
                                                                                                                                                                                                                                                   (ValVariable "oot"))
                                                                                                                                                                                                                                         (ExpValue ()
                                                                                                                                                                                                                                                   (146:35)-(146:40)
                                                                                                                                                                                                                                                   (ValVariable "splist")))])))
                                                                                                                                                                                    (ExpValue ()
                                                                                                                                                                                              (146:43)-(146:43)
                                                                                                                                                                                              (ValInteger "2"
                                                                                                                                                                                                          Nothing)))
                                                                                                                                                                         (ExpValue ()
                                                                                                                                                                                   (146:45)-(146:45)
                                                                                                                                                                                   (ValVariable "i")))])))]))),
                                               BlComment ()
                                                         (147:1)-(147:25)
                                                         (Comment "               segact,sp"),
                                               BlStatement ()
                                                           (148:7)-(148:12)
                                                           Nothing
                                                           (StExpressionAssign ()
                                                                               (148:7)-(148:12)
                                                                               (ExpValue ()
                                                                                         (148:7)-(148:9)
                                                                                         (ValVariable "oo1"))
                                                                               (ExpValue ()
                                                                                         (148:11)-(148:12)
                                                                                         (ValVariable "sp"))),
                                               BlStatement ()
                                                           (149:7)-(149:45)
                                                           Nothing
                                                           (StCall ()
                                                                   (149:7)-(149:45)
                                                                   (ExpValue ()
                                                                             (149:11)-(149:16)
                                                                             (ValVariable "ooowac"))
                                                                   (Just AList ()
                                                                               (149:17)-(149:45)
                                                                               [Argument ()
                                                                                         (149:18)-(149:20)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (149:18)-(149:20)
                                                                                                            (ValVariable "oo4"))),
                                                                                Argument ()
                                                                                         (149:22)-(149:22)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (149:22)-(149:22)
                                                                                                            (ValInteger "0"
                                                                                                                        Nothing))),
                                                                                Argument ()
                                                                                         (149:24)-(149:38)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (149:24)-(149:38)
                                                                                                            (ValString "STGBRK 46 SP "))),
                                                                                Argument ()
                                                                                         (149:40)-(149:42)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (149:40)-(149:42)
                                                                                                            (ValVariable "oo1"))),
                                                                                Argument ()
                                                                                         (149:44)-(149:44)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (149:44)-(149:44)
                                                                                                            (ValInteger "0"
                                                                                                                        Nothing)))])),
                                               BlComment ()
                                                         (150:1)-(150:31)
                                                         (Comment "               lsp=sp.cstg(/1)"),
                                               BlStatement ()
                                                           (151:7)-(151:37)
                                                           Nothing
                                                           (StExpressionAssign ()
                                                                               (151:7)-(151:37)
                                                                               (ExpValue ()
                                                                                         (151:7)-(151:9)
                                                                                         (ValVariable "lsp"))
                                                                               (ExpSubscript ()
                                                                                             (151:11)-(151:37)
                                                                                             (ExpValue ()
                                                                                                       (151:11)-(151:16)
                                                                                                       (ValVariable "oo_008"))
                                                                                             (AList ()
                                                                                                    (151:18)-(151:36)
                                                                                                    [IxSingle ()
                                                                                                              (151:18)-(151:36)
                                                                                                              Nothing
                                                                                                              (ExpBinary ()
                                                                                                                         (151:18)-(151:36)
                                                                                                                         Addition
                                                                                                                         (ExpBinary ()
                                                                                                                                    (151:18)-(151:34)
                                                                                                                                    Addition
                                                                                                                                    (ExpUnary ()
                                                                                                                                              (151:18)-(151:22)
                                                                                                                                              Minus
                                                                                                                                              (ExpValue ()
                                                                                                                                                        (151:19)-(151:22)
                                                                                                                                                        (ValInteger "0016"
                                                                                                                                                                    Nothing)))
                                                                                                                                    (ExpSubscript ()
                                                                                                                                                  (151:24)-(151:34)
                                                                                                                                                  (ExpValue ()
                                                                                                                                                            (151:24)-(151:26)
                                                                                                                                                            (ValVariable "oow"))
                                                                                                                                                  (AList ()
                                                                                                                                                         (151:28)-(151:33)
                                                                                                                                                         [IxSingle ()
                                                                                                                                                                   (151:28)-(151:33)
                                                                                                                                                                   Nothing
                                                                                                                                                                   (ExpBinary ()
                                                                                                                                                                              (151:28)-(151:33)
                                                                                                                                                                              Addition
                                                                                                                                                                              (ExpValue ()
                                                                                                                                                                                        (151:28)-(151:30)
                                                                                                                                                                                        (ValVariable "oot"))
                                                                                                                                                                              (ExpValue ()
                                                                                                                                                                                        (151:32)-(151:33)
                                                                                                                                                                                        (ValVariable "sp")))])))
                                                                                                                         (ExpValue ()
                                                                                                                                   (151:36)-(151:36)
                                                                                                                                   (ValInteger "1"
                                                                                                                                               Nothing)))]))),
                                               BlIf ()
                                                    (152:17)-(160:21)
                                                    Nothing
                                                    Nothing
                                                    [Just ExpBinary ()
                                                                    (152:20)-(152:27)
                                                                    EQ
                                                                    (ExpValue ()
                                                                              (152:20)-(152:22)
                                                                              (ValVariable "lsp"))
                                                                    (ExpValue ()
                                                                              (152:27)-(152:27)
                                                                              (ValInteger "0"
                                                                                          Nothing)),
                                                     Nothing]
                                                    [[BlStatement ()
                                                                  (153:19)-(153:23)
                                                                  Nothing
                                                                  (StExpressionAssign ()
                                                                                      (153:19)-(153:23)
                                                                                      (ExpValue ()
                                                                                                (153:19)-(153:21)
                                                                                                (ValVariable "idx"))
                                                                                      (ExpValue ()
                                                                                                (153:23)-(153:23)
                                                                                                (ValInteger "1"
                                                                                                            Nothing)))],
                                                     [BlComment ()
                                                                (155:1)-(155:48)
                                                                (Comment "                 idx=index(xs.cstg(first:last),"),
                                                      BlComment ()
                                                                (156:1)-(156:36)
                                                                (Comment "    +                      sp.cstg)"),
                                                      BlStatement ()
                                                                  (157:7)-(159:10)
                                                                  Nothing
                                                                  (StExpressionAssign ()
                                                                                      (157:7)-(159:10)
                                                                                      (ExpValue ()
                                                                                                (157:7)-(157:9)
                                                                                                (ValVariable "idx"))
                                                                                      (ExpFunctionCall ()
                                                                                                       (157:11)-(159:10)
                                                                                                       (ExpValue ()
                                                                                                                 (157:11)-(157:15)
                                                                                                                 (ValIntrinsic "index"))
                                                                                                       (Just AList ()
                                                                                                                   (157:17)-(159:9)
                                                                                                                   [Argument ()
                                                                                                                             (157:17)-(158:7)
                                                                                                                             Nothing
                                                                                                                             (ArgExpr (ExpSubscript ()
                                                                                                                                                    (157:17)-(158:7)
                                                                                                                                                    (ExpSubscript ()
                                                                                                                                                                  (157:17)-(157:43)
                                                                                                                                                                  (ExpValue ()
                                                                                                                                                                            (157:17)-(157:22)
                                                                                                                                                                            (ValVariable "oo_009"))
                                                                                                                                                                  (AList ()
                                                                                                                                                                         (157:24)-(157:42)
                                                                                                                                                                         [IxSingle ()
                                                                                                                                                                                   (157:24)-(157:42)
                                                                                                                                                                                   Nothing
                                                                                                                                                                                   (ExpBinary ()
                                                                                                                                                                                              (157:24)-(157:42)
                                                                                                                                                                                              Addition
                                                                                                                                                                                              (ExpBinary ()
                                                                                                                                                                                                         (157:24)-(157:40)
                                                                                                                                                                                                         Addition
                                                                                                                                                                                                         (ExpUnary ()
                                                                                                                                                                                                                   (157:24)-(157:28)
                                                                                                                                                                                                                   Minus
                                                                                                                                                                                                                   (ExpValue ()
                                                                                                                                                                                                                             (157:25)-(157:28)
                                                                                                                                                                                                                             (ValInteger "0018"
                                                                                                                                                                                                                                         Nothing)))
                                                                                                                                                                                                         (ExpSubscript ()
                                                                                                                                                                                                                       (157:30)-(157:40)
                                                                                                                                                                                                                       (ExpValue ()
                                                                                                                                                                                                                                 (157:30)-(157:32)
                                                                                                                                                                                                                                 (ValVariable "oow"))
                                                                                                                                                                                                                       (AList ()
                                                                                                                                                                                                                              (157:34)-(157:39)
                                                                                                                                                                                                                              [IxSingle ()
                                                                                                                                                                                                                                        (157:34)-(157:39)
                                                                                                                                                                                                                                        Nothing
                                                                                                                                                                                                                                        (ExpBinary ()
                                                                                                                                                                                                                                                   (157:34)-(157:39)
                                                                                                                                                                                                                                                   Addition
                                                                                                                                                                                                                                                   (ExpValue ()
                                                                                                                                                                                                                                                             (157:34)-(157:36)
                                                                                                                                                                                                                                                             (ValVariable "oot"))
                                                                                                                                                                                                                                                   (ExpValue ()
                                                                                                                                                                                                                                                             (157:38)-(157:39)
                                                                                                                                                                                                                                                             (ValVariable "xs")))])))
                                                                                                                                                                                              (ExpValue ()
                                                                                                                                                                                                        (157:42)-(157:42)
                                                                                                                                                                                                        (ValInteger "1"
                                                                                                                                                                                                                    Nothing)))]))
                                                                                                                                                    (AList ()
                                                                                                                                                           (157:45)-(157:72)
                                                                                                                                                           [IxRange ()
                                                                                                                                                                    (157:45)-(157:72)
                                                                                                                                                                    (Just ExpBinary ()
                                                                                                                                                                                    (157:45)-(157:58)
                                                                                                                                                                                    Addition
                                                                                                                                                                                    (ExpBinary ()
                                                                                                                                                                                               (157:45)-(157:52)
                                                                                                                                                                                               Addition
                                                                                                                                                                                               (ExpSubscript ()
                                                                                                                                                                                                             (157:45)-(157:50)
                                                                                                                                                                                                             (ExpValue ()
                                                                                                                                                                                                                       (157:45)-(157:47)
                                                                                                                                                                                                                       (ValVariable "oov"))
                                                                                                                                                                                                             (AList ()
                                                                                                                                                                                                                    (157:49)-(157:49)
                                                                                                                                                                                                                    [IxSingle ()
                                                                                                                                                                                                                              (157:49)-(157:49)
                                                                                                                                                                                                                              Nothing
                                                                                                                                                                                                                              (ExpValue ()
                                                                                                                                                                                                                                        (157:49)-(157:49)
                                                                                                                                                                                                                                        (ValInteger "2"
                                                                                                                                                                                                                                                    Nothing))]))
                                                                                                                                                                                               (ExpValue ()
                                                                                                                                                                                                         (157:52)-(157:52)
                                                                                                                                                                                                         (ValInteger "4"
                                                                                                                                                                                                                     Nothing)))
                                                                                                                                                                                    (ExpValue ()
                                                                                                                                                                                              (157:54)-(157:58)
                                                                                                                                                                                              (ValVariable "first")))
                                                                                                                                                                    (Just ExpBinary ()
                                                                                                                                                                                    (157:60)-(157:72)
                                                                                                                                                                                    Addition
                                                                                                                                                                                    (ExpBinary ()
                                                                                                                                                                                               (157:60)-(157:67)
                                                                                                                                                                                               Addition
                                                                                                                                                                                               (ExpSubscript ()
                                                                                                                                                                                                             (157:60)-(157:65)
                                                                                                                                                                                                             (ExpValue ()
                                                                                                                                                                                                                       (157:60)-(157:62)
                                                                                                                                                                                                                       (ValVariable "oov"))
                                                                                                                                                                                                             (AList ()
                                                                                                                                                                                                                    (157:64)-(157:64)
                                                                                                                                                                                                                    [IxSingle ()
                                                                                                                                                                                                                              (157:64)-(157:64)
                                                                                                                                                                                                                              Nothing
                                                                                                                                                                                                                              (ExpValue ()
                                                                                                                                                                                                                                        (157:64)-(157:64)
                                                                                                                                                                                                                                        (ValInteger "2"
                                                                                                                                                                                                                                                    Nothing))]))
                                                                                                                                                                                               (ExpValue ()
                                                                                                                                                                                                         (157:67)-(157:67)
                                                                                                                                                                                                         (ValInteger "4"
                                                                                                                                                                                                                     Nothing)))
                                                                                                                                                                                    (ExpValue ()
                                                                                                                                                                                              (157:69)-(157:72)
                                                                                                                                                                                              (ValVariable "last")))
                                                                                                                                                                    Nothing]))),
                                                                                                                    Argument ()
                                                                                                                             (158:9)-(159:9)
                                                                                                                             Nothing
                                                                                                                             (ArgExpr (ExpSubscript ()
                                                                                                                                                    (158:9)-(159:9)
                                                                                                                                                    (ExpSubscript ()
                                                                                                                                                                  (158:9)-(158:35)
                                                                                                                                                                  (ExpValue ()
                                                                                                                                                                            (158:9)-(158:14)
                                                                                                                                                                            (ValVariable "oo_010"))
                                                                                                                                                                  (AList ()
                                                                                                                                                                         (158:16)-(158:34)
                                                                                                                                                                         [IxSingle ()
                                                                                                                                                                                   (158:16)-(158:34)
                                                                                                                                                                                   Nothing
                                                                                                                                                                                   (ExpBinary ()
                                                                                                                                                                                              (158:16)-(158:34)
                                                                                                                                                                                              Addition
                                                                                                                                                                                              (ExpBinary ()
                                                                                                                                                                                                         (158:16)-(158:32)
                                                                                                                                                                                                         Addition
                                                                                                                                                                                                         (ExpUnary ()
                                                                                                                                                                                                                   (158:16)-(158:20)
                                                                                                                                                                                                                   Minus
                                                                                                                                                                                                                   (ExpValue ()
                                                                                                                                                                                                                             (158:17)-(158:20)
                                                                                                                                                                                                                             (ValInteger "0020"
                                                                                                                                                                                                                                         Nothing)))
                                                                                                                                                                                                         (ExpSubscript ()
                                                                                                                                                                                                                       (158:22)-(158:32)
                                                                                                                                                                                                                       (ExpValue ()
                                                                                                                                                                                                                                 (158:22)-(158:24)
                                                                                                                                                                                                                                 (ValVariable "oow"))
                                                                                                                                                                                                                       (AList ()
                                                                                                                                                                                                                              (158:26)-(158:31)
                                                                                                                                                                                                                              [IxSingle ()
                                                                                                                                                                                                                                        (158:26)-(158:31)
                                                                                                                                                                                                                                        Nothing
                                                                                                                                                                                                                                        (ExpBinary ()
                                                                                                                                                                                                                                                   (158:26)-(158:31)
                                                                                                                                                                                                                                                   Addition
                                                                                                                                                                                                                                                   (ExpValue ()
                                                                                                                                                                                                                                                             (158:26)-(158:28)
                                                                                                                                                                                                                                                             (ValVariable "oot"))
                                                                                                                                                                                                                                                   (ExpValue ()
                                                                                                                                                                                                                                                             (158:30)-(158:31)
                                                                                                                                                                                                                                                             (ValVariable "sp")))])))
                                                                                                                                                                                              (ExpValue ()
                                                                                                                                                                                                        (158:34)-(158:34)
                                                                                                                                                                                                        (ValInteger "1"
                                                                                                                                                                                                                    Nothing)))]))
                                                                                                                                                    (AList ()
                                                                                                                                                           (158:37)-(159:8)
                                                                                                                                                           [IxRange ()
                                                                                                                                                                    (158:37)-(159:8)
                                                                                                                                                                    (Just ExpBinary ()
                                                                                                                                                                                    (158:37)-(158:46)
                                                                                                                                                                                    Addition
                                                                                                                                                                                    (ExpBinary ()
                                                                                                                                                                                               (158:37)-(158:44)
                                                                                                                                                                                               Addition
                                                                                                                                                                                               (ExpSubscript ()
                                                                                                                                                                                                             (158:37)-(158:42)
                                                                                                                                                                                                             (ExpValue ()
                                                                                                                                                                                                                       (158:37)-(158:39)
                                                                                                                                                                                                                       (ValVariable "oov"))
                                                                                                                                                                                                             (AList ()
                                                                                                                                                                                                                    (158:41)-(158:41)
                                                                                                                                                                                                                    [IxSingle ()
                                                                                                                                                                                                                              (158:41)-(158:41)
                                                                                                                                                                                                                              Nothing
                                                                                                                                                                                                                              (ExpValue ()
                                                                                                                                                                                                                                        (158:41)-(158:41)
                                                                                                                                                                                                                                        (ValInteger "2"
                                                                                                                                                                                                                                                    Nothing))]))
                                                                                                                                                                                               (ExpValue ()
                                                                                                                                                                                                         (158:44)-(158:44)
                                                                                                                                                                                                         (ValInteger "4"
                                                                                                                                                                                                                     Nothing)))
                                                                                                                                                                                    (ExpValue ()
                                                                                                                                                                                              (158:46)-(158:46)
                                                                                                                                                                                              (ValInteger "1"
                                                                                                                                                                                                          Nothing)))
                                                                                                                                                                    (Just ExpBinary ()
                                                                                                                                                                                    (158:48)-(159:8)
                                                                                                                                                                                    Addition
                                                                                                                                                                                    (ExpBinary ()
                                                                                                                                                                                               (158:48)-(158:55)
                                                                                                                                                                                               Addition
                                                                                                                                                                                               (ExpSubscript ()
                                                                                                                                                                                                             (158:48)-(158:53)
                                                                                                                                                                                                             (ExpValue ()
                                                                                                                                                                                                                       (158:48)-(158:50)
                                                                                                                                                                                                                       (ValVariable "oov"))
                                                                                                                                                                                                             (AList ()
                                                                                                                                                                                                                    (158:52)-(158:52)
                                                                                                                                                                                                                    [IxSingle ()
                                                                                                                                                                                                                              (158:52)-(158:52)
                                                                                                                                                                                                                              Nothing
                                                                                                                                                                                                                              (ExpValue ()
                                                                                                                                                                                                                                        (158:52)-(158:52)
                                                                                                                                                                                                                                        (ValInteger "2"
                                                                                                                                                                                                                                                    Nothing))]))
                                                                                                                                                                                               (ExpValue ()
                                                                                                                                                                                                         (158:55)-(158:55)
                                                                                                                                                                                                         (ValInteger "4"
                                                                                                                                                                                                                     Nothing)))
                                                                                                                                                                                    (ExpSubscript ()
                                                                                                                                                                                                  (158:57)-(159:8)
                                                                                                                                                                                                  (ExpValue ()
                                                                                                                                                                                                            (158:57)-(158:59)
                                                                                                                                                                                                            (ValVariable "oov"))
                                                                                                                                                                                                  (AList ()
                                                                                                                                                                                                         (158:61)-(159:7)
                                                                                                                                                                                                         [IxSingle ()
                                                                                                                                                                                                                   (158:61)-(159:7)
                                                                                                                                                                                                                   Nothing
                                                                                                                                                                                                                   (ExpBinary ()
                                                                                                                                                                                                                              (158:61)-(159:7)
                                                                                                                                                                                                                              Addition
                                                                                                                                                                                                                              (ExpSubscript ()
                                                                                                                                                                                                                                            (158:61)-(158:71)
                                                                                                                                                                                                                                            (ExpValue ()
                                                                                                                                                                                                                                                      (158:61)-(158:63)
                                                                                                                                                                                                                                                      (ValVariable "oow"))
                                                                                                                                                                                                                                            (AList ()
                                                                                                                                                                                                                                                   (158:65)-(158:70)
                                                                                                                                                                                                                                                   [IxSingle ()
                                                                                                                                                                                                                                                             (158:65)-(158:70)
                                                                                                                                                                                                                                                             Nothing
                                                                                                                                                                                                                                                             (ExpBinary ()
                                                                                                                                                                                                                                                                        (158:65)-(158:70)
                                                                                                                                                                                                                                                                        Addition
                                                                                                                                                                                                                                                                        (ExpValue ()
                                                                                                                                                                                                                                                                                  (158:65)-(158:67)
                                                                                                                                                                                                                                                                                  (ValVariable "oot"))
                                                                                                                                                                                                                                                                        (ExpValue ()
                                                                                                                                                                                                                                                                                  (158:69)-(158:70)
                                                                                                                                                                                                                                                                                  (ValVariable "sp")))]))
                                                                                                                                                                                                                              (ExpValue ()
                                                                                                                                                                                                                                        (159:7)-(159:7)
                                                                                                                                                                                                                                        (ValInteger "1"
                                                                                                                                                                                                                                                    Nothing)))])))
                                                                                                                                                                    Nothing])))])))]]
                                                    Nothing,
                                               BlIf ()
                                                    (161:17)-(168:21)
                                                    Nothing
                                                    Nothing
                                                    [Just ExpBinary ()
                                                                    (161:20)-(161:27)
                                                                    EQ
                                                                    (ExpValue ()
                                                                              (161:20)-(161:22)
                                                                              (ValVariable "idx"))
                                                                    (ExpValue ()
                                                                              (161:27)-(161:27)
                                                                              (ValInteger "1"
                                                                                          Nothing))]
                                                    [[BlComment ()
                                                                (162:1)-(162:32)
                                                                (Comment "                 -- initialiser"),
                                                      BlStatement ()
                                                                  (163:19)-(163:40)
                                                                  Nothing
                                                                  (StIfLogical ()
                                                                               (163:19)-(163:40)
                                                                               (ExpBinary ()
                                                                                          (163:22)-(163:31)
                                                                                          EQ
                                                                                          (ExpValue ()
                                                                                                    (163:22)-(163:25)
                                                                                                    (ValVariable "lmin"))
                                                                                          (ExpUnary ()
                                                                                                    (163:30)-(163:31)
                                                                                                    Minus
                                                                                                    (ExpValue ()
                                                                                                              (163:31)-(163:31)
                                                                                                              (ValInteger "1"
                                                                                                                          Nothing))))
                                                                               (StExpressionAssign ()
                                                                                                   (163:33)-(163:40)
                                                                                                   (ExpValue ()
                                                                                                             (163:33)-(163:36)
                                                                                                             (ValVariable "lmin"))
                                                                                                   (ExpValue ()
                                                                                                             (163:38)-(163:40)
                                                                                                             (ValVariable "lsp")))),
                                                      BlComment ()
                                                                (164:1)-(164:55)
                                                                (Comment "                 -- favoriser tout separateur-non-vide"),
                                                      BlStatement ()
                                                                  (165:19)-(165:39)
                                                                  Nothing
                                                                  (StIfLogical ()
                                                                               (165:19)-(165:39)
                                                                               (ExpBinary ()
                                                                                          (165:22)-(165:30)
                                                                                          EQ
                                                                                          (ExpValue ()
                                                                                                    (165:22)-(165:25)
                                                                                                    (ValVariable "lmin"))
                                                                                          (ExpValue ()
                                                                                                    (165:30)-(165:30)
                                                                                                    (ValInteger "0"
                                                                                                                Nothing)))
                                                                               (StExpressionAssign ()
                                                                                                   (165:32)-(165:39)
                                                                                                   (ExpValue ()
                                                                                                             (165:32)-(165:35)
                                                                                                             (ValVariable "lmin"))
                                                                                                   (ExpValue ()
                                                                                                             (165:37)-(165:39)
                                                                                                             (ValVariable "lsp")))),
                                                      BlComment ()
                                                                (166:1)-(166:62)
                                                                (Comment "                 -- prendre le plus petit separateur-non-vide"),
                                                      BlStatement ()
                                                                  (167:19)-(167:58)
                                                                  Nothing
                                                                  (StIfLogical ()
                                                                               (167:19)-(167:58)
                                                                               (ExpBinary ()
                                                                                          (167:22)-(167:49)
                                                                                          And
                                                                                          (ExpBinary ()
                                                                                                     (167:22)-(167:34)
                                                                                                     LT
                                                                                                     (ExpValue ()
                                                                                                               (167:23)-(167:25)
                                                                                                               (ValVariable "lsp"))
                                                                                                     (ExpValue ()
                                                                                                               (167:30)-(167:33)
                                                                                                               (ValVariable "lmin")))
                                                                                          (ExpBinary ()
                                                                                                     (167:40)-(167:49)
                                                                                                     GT
                                                                                                     (ExpValue ()
                                                                                                               (167:41)-(167:43)
                                                                                                               (ValVariable "lsp"))
                                                                                                     (ExpValue ()
                                                                                                               (167:48)-(167:48)
                                                                                                               (ValInteger "0"
                                                                                                                           Nothing))))
                                                                               (StExpressionAssign ()
                                                                                                   (167:51)-(167:58)
                                                                                                   (ExpValue ()
                                                                                                             (167:51)-(167:54)
                                                                                                             (ValVariable "lmin"))
                                                                                                   (ExpValue ()
                                                                                                             (167:56)-(167:58)
                                                                                                             (ValVariable "lsp"))))]]
                                                    Nothing,
                                               BlComment ()
                                                         (169:1)-(169:25)
                                                         (Comment "               segdes,sp"),
                                               BlStatement ()
                                                           (170:7)-(170:12)
                                                           Nothing
                                                           (StExpressionAssign ()
                                                                               (170:7)-(170:12)
                                                                               (ExpValue ()
                                                                                         (170:7)-(170:9)
                                                                                         (ValVariable "oo1"))
                                                                               (ExpValue ()
                                                                                         (170:11)-(170:12)
                                                                                         (ValVariable "sp"))),
                                               BlStatement ()
                                                           (171:7)-(171:45)
                                                           Nothing
                                                           (StCall ()
                                                                   (171:7)-(171:45)
                                                                   (ExpValue ()
                                                                             (171:11)-(171:16)
                                                                             (ValVariable "ooowde"))
                                                                   (Just AList ()
                                                                               (171:17)-(171:45)
                                                                               [Argument ()
                                                                                         (171:18)-(171:20)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (171:18)-(171:20)
                                                                                                            (ValVariable "oo4"))),
                                                                                Argument ()
                                                                                         (171:22)-(171:22)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (171:22)-(171:22)
                                                                                                            (ValInteger "0"
                                                                                                                        Nothing))),
                                                                                Argument ()
                                                                                         (171:24)-(171:38)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (171:24)-(171:38)
                                                                                                            (ValString "STGBRK 62 SP "))),
                                                                                Argument ()
                                                                                         (171:40)-(171:42)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (171:40)-(171:42)
                                                                                                            (ValVariable "oo1"))),
                                                                                Argument ()
                                                                                         (171:44)-(171:44)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (171:44)-(171:44)
                                                                                                            (ValInteger "1"
                                                                                                                        Nothing)))])),
                                               BlStatement ()
                                                           (172:17)-(172:24)
                                                           Nothing
                                                           (StGotoUnconditional ()
                                                                                (172:17)-(172:24)
                                                                                (ExpValue ()
                                                                                          (172:22)-(172:24)
                                                                                          (ValInteger "120"
                                                                                                      Nothing)))]]
                                             Nothing,
                                        BlComment ()
                                                  (174:1)-(174:1)
                                                  (Comment ""),
                                        BlComment ()
                                                  (175:1)-(175:49)
                                                  (Comment "             //si trouve, sauter separateur-tete"),
                                        BlIf ()
                                             (176:15)-(181:19)
                                             Nothing
                                             Nothing
                                             [Just ExpBinary ()
                                                             (176:18)-(176:27)
                                                             NE
                                                             (ExpValue ()
                                                                       (176:18)-(176:21)
                                                                       (ValVariable "lmin"))
                                                             (ExpUnary ()
                                                                       (176:26)-(176:27)
                                                                       Minus
                                                                       (ExpValue ()
                                                                                 (176:27)-(176:27)
                                                                                 (ValInteger "1"
                                                                                             Nothing)))]
                                             [[BlComment ()
                                                         (177:1)-(177:43)
                                                         (Comment "               -- sauter separateur-entete"),
                                               BlStatement ()
                                                           (178:17)-(178:32)
                                                           Nothing
                                                           (StExpressionAssign ()
                                                                               (178:17)-(178:32)
                                                                               (ExpValue ()
                                                                                         (178:17)-(178:21)
                                                                                         (ValVariable "first"))
                                                                               (ExpBinary ()
                                                                                          (178:23)-(178:32)
                                                                                          Addition
                                                                                          (ExpValue ()
                                                                                                    (178:23)-(178:27)
                                                                                                    (ValVariable "first"))
                                                                                          (ExpValue ()
                                                                                                    (178:29)-(178:32)
                                                                                                    (ValVariable "lmin")))),
                                               BlComment ()
                                                         (179:1)-(179:62)
                                                         (Comment "               //si possible, sauter prochain separateur-tete"),
                                               BlStatement ()
                                                           (180:17)-(180:59)
                                                           Nothing
                                                           (StIfLogical ()
                                                                        (180:17)-(180:59)
                                                                        (ExpBinary ()
                                                                                   (180:20)-(180:50)
                                                                                   And
                                                                                   (ExpBinary ()
                                                                                              (180:20)-(180:34)
                                                                                              LTE
                                                                                              (ExpValue ()
                                                                                                        (180:21)-(180:25)
                                                                                                        (ValVariable "first"))
                                                                                              (ExpValue ()
                                                                                                        (180:30)-(180:33)
                                                                                                        (ValVariable "last")))
                                                                                   (ExpBinary ()
                                                                                              (180:40)-(180:50)
                                                                                              GTE
                                                                                              (ExpValue ()
                                                                                                        (180:41)-(180:44)
                                                                                                        (ValVariable "lmin"))
                                                                                              (ExpValue ()
                                                                                                        (180:49)-(180:49)
                                                                                                        (ValInteger "1"
                                                                                                                    Nothing))))
                                                                        (StGotoUnconditional ()
                                                                                             (180:52)-(180:59)
                                                                                             (ExpValue ()
                                                                                                       (180:57)-(180:59)
                                                                                                       (ValInteger "110"
                                                                                                                   Nothing))))]]
                                             Nothing,
                                        BlComment ()
                                                  (182:1)-(182:50)
                                                  (Comment "           //fin repeter \"sauter separateur-tete\""),
                                        BlComment ()
                                                  (183:1)-(183:1)
                                                  (Comment ""),
                                        BlComment ()
                                                  (184:1)-(184:43)
                                                  (Comment "           //si possible, chercher morceau"),
                                        BlIf ()
                                             (185:13)-(280:17)
                                             Nothing
                                             Nothing
                                             [Just ExpBinary ()
                                                             (185:16)-(185:28)
                                                             LTE
                                                             (ExpValue ()
                                                                       (185:16)-(185:20)
                                                                       (ValVariable "first"))
                                                             (ExpValue ()
                                                                       (185:25)-(185:28)
                                                                       (ValVariable "last"))]
                                             [[BlComment ()
                                                         (186:1)-(186:44)
                                                         (Comment "             -- chercher separateur-morceau"),
                                               BlComment ()
                                                         (187:1)-(187:50)
                                                         (Comment "             -- ... donnant le plus petit morceau"),
                                               BlStatement ()
                                                           (188:15)-(188:17)
                                                           Nothing
                                                           (StExpressionAssign ()
                                                                               (188:15)-(188:17)
                                                                               (ExpValue ()
                                                                                         (188:15)-(188:15)
                                                                                         (ValVariable "i"))
                                                                               (ExpValue ()
                                                                                         (188:17)-(188:17)
                                                                                         (ValInteger "0"
                                                                                                     Nothing))),
                                               BlStatement ()
                                                           (189:15)-(189:19)
                                                           Nothing
                                                           (StExpressionAssign ()
                                                                               (189:15)-(189:19)
                                                                               (ExpValue ()
                                                                                         (189:15)-(189:17)
                                                                                         (ValVariable "kdx"))
                                                                               (ExpValue ()
                                                                                         (189:19)-(189:19)
                                                                                         (ValInteger "0"
                                                                                                     Nothing))),
                                               BlStatement ()
                                                           (190:15)-(190:21)
                                                           Nothing
                                                           (StExpressionAssign ()
                                                                               (190:15)-(190:21)
                                                                               (ExpValue ()
                                                                                         (190:15)-(190:18)
                                                                                         (ValVariable "lmin"))
                                                                               (ExpUnary ()
                                                                                         (190:20)-(190:21)
                                                                                         Minus
                                                                                         (ExpValue ()
                                                                                                   (190:21)-(190:21)
                                                                                                   (ValInteger "1"
                                                                                                               Nothing)))),
                                               BlStatement ()
                                                           (191:2)-(191:19)
                                                           (Just ExpValue ()
                                                                          (191:2)-(191:4)
                                                                          (ValInteger "130"
                                                                                      Nothing))
                                                           (StExpressionAssign ()
                                                                               (191:15)-(191:19)
                                                                               (ExpValue ()
                                                                                         (191:15)-(191:15)
                                                                                         (ValVariable "i"))
                                                                               (ExpBinary ()
                                                                                          (191:17)-(191:19)
                                                                                          Addition
                                                                                          (ExpValue ()
                                                                                                    (191:17)-(191:17)
                                                                                                    (ValVariable "i"))
                                                                                          (ExpValue ()
                                                                                                    (191:19)-(191:19)
                                                                                                    (ValInteger "1"
                                                                                                                Nothing)))),
                                               BlComment ()
                                                         (192:1)-(192:41)
                                                         (Comment "             if(i.le.(splist.ilist))then"),
                                               BlIf ()
                                                    (193:7)-(228:19)
                                                    Nothing
                                                    Nothing
                                                    [Just ExpBinary ()
                                                                    (193:10)-(193:47)
                                                                    LTE
                                                                    (ExpValue ()
                                                                              (193:10)-(193:10)
                                                                              (ValVariable "i"))
                                                                    (ExpSubscript ()
                                                                                  (193:15)-(193:47)
                                                                                  (ExpValue ()
                                                                                            (193:16)-(193:21)
                                                                                            (ValVariable "oo_006"))
                                                                                  (AList ()
                                                                                         (193:23)-(193:45)
                                                                                         [IxSingle ()
                                                                                                   (193:23)-(193:45)
                                                                                                   Nothing
                                                                                                   (ExpBinary ()
                                                                                                              (193:23)-(193:45)
                                                                                                              Addition
                                                                                                              (ExpBinary ()
                                                                                                                         (193:23)-(193:43)
                                                                                                                         Addition
                                                                                                                         (ExpUnary ()
                                                                                                                                   (193:23)-(193:27)
                                                                                                                                   Minus
                                                                                                                                   (ExpValue ()
                                                                                                                                             (193:24)-(193:27)
                                                                                                                                             (ValInteger "0012"
                                                                                                                                                         Nothing)))
                                                                                                                         (ExpSubscript ()
                                                                                                                                       (193:29)-(193:43)
                                                                                                                                       (ExpValue ()
                                                                                                                                                 (193:29)-(193:31)
                                                                                                                                                 (ValVariable "oow"))
                                                                                                                                       (AList ()
                                                                                                                                              (193:33)-(193:42)
                                                                                                                                              [IxSingle ()
                                                                                                                                                        (193:33)-(193:42)
                                                                                                                                                        Nothing
                                                                                                                                                        (ExpBinary ()
                                                                                                                                                                   (193:33)-(193:42)
                                                                                                                                                                   Addition
                                                                                                                                                                   (ExpValue ()
                                                                                                                                                                             (193:33)-(193:35)
                                                                                                                                                                             (ValVariable "oot"))
                                                                                                                                                                   (ExpValue ()
                                                                                                                                                                             (193:37)-(193:42)
                                                                                                                                                                             (ValVariable "splist")))])))
                                                                                                              (ExpValue ()
                                                                                                                        (193:45)-(193:45)
                                                                                                                        (ValInteger "1"
                                                                                                                                    Nothing)))]))]
                                                    [[BlComment ()
                                                                (194:1)-(194:39)
                                                                (Comment "               sp=abs(splist.elist(i))"),
                                                      BlStatement ()
                                                                  (195:7)-(195:47)
                                                                  Nothing
                                                                  (StExpressionAssign ()
                                                                                      (195:7)-(195:47)
                                                                                      (ExpValue ()
                                                                                                (195:7)-(195:8)
                                                                                                (ValVariable "sp"))
                                                                                      (ExpFunctionCall ()
                                                                                                       (195:10)-(195:47)
                                                                                                       (ExpValue ()
                                                                                                                 (195:10)-(195:12)
                                                                                                                 (ValIntrinsic "abs"))
                                                                                                       (Just AList ()
                                                                                                                   (195:14)-(195:46)
                                                                                                                   [Argument ()
                                                                                                                             (195:14)-(195:46)
                                                                                                                             Nothing
                                                                                                                             (ArgExpr (ExpSubscript ()
                                                                                                                                                    (195:14)-(195:46)
                                                                                                                                                    (ExpValue ()
                                                                                                                                                              (195:14)-(195:19)
                                                                                                                                                              (ValVariable "oo_007"))
                                                                                                                                                    (AList ()
                                                                                                                                                           (195:21)-(195:45)
                                                                                                                                                           [IxSingle ()
                                                                                                                                                                     (195:21)-(195:45)
                                                                                                                                                                     Nothing
                                                                                                                                                                     (ExpBinary ()
                                                                                                                                                                                (195:21)-(195:45)
                                                                                                                                                                                Addition
                                                                                                                                                                                (ExpBinary ()
                                                                                                                                                                                           (195:21)-(195:43)
                                                                                                                                                                                           Addition
                                                                                                                                                                                           (ExpBinary ()
                                                                                                                                                                                                      (195:21)-(195:41)
                                                                                                                                                                                                      Addition
                                                                                                                                                                                                      (ExpUnary ()
                                                                                                                                                                                                                (195:21)-(195:25)
                                                                                                                                                                                                                Minus
                                                                                                                                                                                                                (ExpValue ()
                                                                                                                                                                                                                          (195:22)-(195:25)
                                                                                                                                                                                                                          (ValInteger "0014"
                                                                                                                                                                                                                                      Nothing)))
                                                                                                                                                                                                      (ExpSubscript ()
                                                                                                                                                                                                                    (195:27)-(195:41)
                                                                                                                                                                                                                    (ExpValue ()
                                                                                                                                                                                                                              (195:27)-(195:29)
                                                                                                                                                                                                                              (ValVariable "oow"))
                                                                                                                                                                                                                    (AList ()
                                                                                                                                                                                                                           (195:31)-(195:40)
                                                                                                                                                                                                                           [IxSingle ()
                                                                                                                                                                                                                                     (195:31)-(195:40)
                                                                                                                                                                                                                                     Nothing
                                                                                                                                                                                                                                     (ExpBinary ()
                                                                                                                                                                                                                                                (195:31)-(195:40)
                                                                                                                                                                                                                                                Addition
                                                                                                                                                                                                                                                (ExpValue ()
                                                                                                                                                                                                                                                          (195:31)-(195:33)
                                                                                                                                                                                                                                                          (ValVariable "oot"))
                                                                                                                                                                                                                                                (ExpValue ()
                                                                                                                                                                                                                                                          (195:35)-(195:40)
                                                                                                                                                                                                                                                          (ValVariable "splist")))])))
                                                                                                                                                                                           (ExpValue ()
                                                                                                                                                                                                     (195:43)-(195:43)
                                                                                                                                                                                                     (ValInteger "2"
                                                                                                                                                                                                                 Nothing)))
                                                                                                                                                                                (ExpValue ()
                                                                                                                                                                                          (195:45)-(195:45)
                                                                                                                                                                                          (ValVariable "i")))])))]))),
                                                      BlComment ()
                                                                (196:1)-(196:25)
                                                                (Comment "               segact,sp"),
                                                      BlStatement ()
                                                                  (197:7)-(197:12)
                                                                  Nothing
                                                                  (StExpressionAssign ()
                                                                                      (197:7)-(197:12)
                                                                                      (ExpValue ()
                                                                                                (197:7)-(197:9)
                                                                                                (ValVariable "oo1"))
                                                                                      (ExpValue ()
                                                                                                (197:11)-(197:12)
                                                                                                (ValVariable "sp"))),
                                                      BlStatement ()
                                                                  (198:7)-(198:45)
                                                                  Nothing
                                                                  (StCall ()
                                                                          (198:7)-(198:45)
                                                                          (ExpValue ()
                                                                                    (198:11)-(198:16)
                                                                                    (ValVariable "ooowac"))
                                                                          (Just AList ()
                                                                                      (198:17)-(198:45)
                                                                                      [Argument ()
                                                                                                (198:18)-(198:20)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (198:18)-(198:20)
                                                                                                                   (ValVariable "oo4"))),
                                                                                       Argument ()
                                                                                                (198:22)-(198:22)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (198:22)-(198:22)
                                                                                                                   (ValInteger "0"
                                                                                                                               Nothing))),
                                                                                       Argument ()
                                                                                                (198:24)-(198:38)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (198:24)-(198:38)
                                                                                                                   (ValString "STGBRK 77 SP "))),
                                                                                       Argument ()
                                                                                                (198:40)-(198:42)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (198:40)-(198:42)
                                                                                                                   (ValVariable "oo1"))),
                                                                                       Argument ()
                                                                                                (198:44)-(198:44)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (198:44)-(198:44)
                                                                                                                   (ValInteger "0"
                                                                                                                               Nothing)))])),
                                                      BlComment ()
                                                                (199:1)-(199:31)
                                                                (Comment "               lsp=sp.cstg(/1)"),
                                                      BlStatement ()
                                                                  (200:7)-(200:37)
                                                                  Nothing
                                                                  (StExpressionAssign ()
                                                                                      (200:7)-(200:37)
                                                                                      (ExpValue ()
                                                                                                (200:7)-(200:9)
                                                                                                (ValVariable "lsp"))
                                                                                      (ExpSubscript ()
                                                                                                    (200:11)-(200:37)
                                                                                                    (ExpValue ()
                                                                                                              (200:11)-(200:16)
                                                                                                              (ValVariable "oo_008"))
                                                                                                    (AList ()
                                                                                                           (200:18)-(200:36)
                                                                                                           [IxSingle ()
                                                                                                                     (200:18)-(200:36)
                                                                                                                     Nothing
                                                                                                                     (ExpBinary ()
                                                                                                                                (200:18)-(200:36)
                                                                                                                                Addition
                                                                                                                                (ExpBinary ()
                                                                                                                                           (200:18)-(200:34)
                                                                                                                                           Addition
                                                                                                                                           (ExpUnary ()
                                                                                                                                                     (200:18)-(200:22)
                                                                                                                                                     Minus
                                                                                                                                                     (ExpValue ()
                                                                                                                                                               (200:19)-(200:22)
                                                                                                                                                               (ValInteger "0016"
                                                                                                                                                                           Nothing)))
                                                                                                                                           (ExpSubscript ()
                                                                                                                                                         (200:24)-(200:34)
                                                                                                                                                         (ExpValue ()
                                                                                                                                                                   (200:24)-(200:26)
                                                                                                                                                                   (ValVariable "oow"))
                                                                                                                                                         (AList ()
                                                                                                                                                                (200:28)-(200:33)
                                                                                                                                                                [IxSingle ()
                                                                                                                                                                          (200:28)-(200:33)
                                                                                                                                                                          Nothing
                                                                                                                                                                          (ExpBinary ()
                                                                                                                                                                                     (200:28)-(200:33)
                                                                                                                                                                                     Addition
                                                                                                                                                                                     (ExpValue ()
                                                                                                                                                                                               (200:28)-(200:30)
                                                                                                                                                                                               (ValVariable "oot"))
                                                                                                                                                                                     (ExpValue ()
                                                                                                                                                                                               (200:32)-(200:33)
                                                                                                                                                                                               (ValVariable "sp")))])))
                                                                                                                                (ExpValue ()
                                                                                                                                          (200:36)-(200:36)
                                                                                                                                          (ValInteger "1"
                                                                                                                                                      Nothing)))]))),
                                                      BlIf ()
                                                           (201:17)-(209:21)
                                                           Nothing
                                                           Nothing
                                                           [Just ExpBinary ()
                                                                           (201:20)-(201:27)
                                                                           EQ
                                                                           (ExpValue ()
                                                                                     (201:20)-(201:22)
                                                                                     (ValVariable "lsp"))
                                                                           (ExpValue ()
                                                                                     (201:27)-(201:27)
                                                                                     (ValInteger "0"
                                                                                                 Nothing)),
                                                            Nothing]
                                                           [[BlStatement ()
                                                                         (202:19)-(202:23)
                                                                         Nothing
                                                                         (StExpressionAssign ()
                                                                                             (202:19)-(202:23)
                                                                                             (ExpValue ()
                                                                                                       (202:19)-(202:21)
                                                                                                       (ValVariable "idx"))
                                                                                             (ExpValue ()
                                                                                                       (202:23)-(202:23)
                                                                                                       (ValInteger "1"
                                                                                                                   Nothing)))],
                                                            [BlComment ()
                                                                       (204:1)-(204:48)
                                                                       (Comment "                 idx=index(xs.cstg(first:last),"),
                                                             BlComment ()
                                                                       (205:1)-(205:36)
                                                                       (Comment "    +                      sp.cstg)"),
                                                             BlStatement ()
                                                                         (206:7)-(208:10)
                                                                         Nothing
                                                                         (StExpressionAssign ()
                                                                                             (206:7)-(208:10)
                                                                                             (ExpValue ()
                                                                                                       (206:7)-(206:9)
                                                                                                       (ValVariable "idx"))
                                                                                             (ExpFunctionCall ()
                                                                                                              (206:11)-(208:10)
                                                                                                              (ExpValue ()
                                                                                                                        (206:11)-(206:15)
                                                                                                                        (ValIntrinsic "index"))
                                                                                                              (Just AList ()
                                                                                                                          (206:17)-(208:9)
                                                                                                                          [Argument ()
                                                                                                                                    (206:17)-(207:7)
                                                                                                                                    Nothing
                                                                                                                                    (ArgExpr (ExpSubscript ()
                                                                                                                                                           (206:17)-(207:7)
                                                                                                                                                           (ExpSubscript ()
                                                                                                                                                                         (206:17)-(206:43)
                                                                                                                                                                         (ExpValue ()
                                                                                                                                                                                   (206:17)-(206:22)
                                                                                                                                                                                   (ValVariable "oo_009"))
                                                                                                                                                                         (AList ()
                                                                                                                                                                                (206:24)-(206:42)
                                                                                                                                                                                [IxSingle ()
                                                                                                                                                                                          (206:24)-(206:42)
                                                                                                                                                                                          Nothing
                                                                                                                                                                                          (ExpBinary ()
                                                                                                                                                                                                     (206:24)-(206:42)
                                                                                                                                                                                                     Addition
                                                                                                                                                                                                     (ExpBinary ()
                                                                                                                                                                                                                (206:24)-(206:40)
                                                                                                                                                                                                                Addition
                                                                                                                                                                                                                (ExpUnary ()
                                                                                                                                                                                                                          (206:24)-(206:28)
                                                                                                                                                                                                                          Minus
                                                                                                                                                                                                                          (ExpValue ()
                                                                                                                                                                                                                                    (206:25)-(206:28)
                                                                                                                                                                                                                                    (ValInteger "0018"
                                                                                                                                                                                                                                                Nothing)))
                                                                                                                                                                                                                (ExpSubscript ()
                                                                                                                                                                                                                              (206:30)-(206:40)
                                                                                                                                                                                                                              (ExpValue ()
                                                                                                                                                                                                                                        (206:30)-(206:32)
                                                                                                                                                                                                                                        (ValVariable "oow"))
                                                                                                                                                                                                                              (AList ()
                                                                                                                                                                                                                                     (206:34)-(206:39)
                                                                                                                                                                                                                                     [IxSingle ()
                                                                                                                                                                                                                                               (206:34)-(206:39)
                                                                                                                                                                                                                                               Nothing
                                                                                                                                                                                                                                               (ExpBinary ()
                                                                                                                                                                                                                                                          (206:34)-(206:39)
                                                                                                                                                                                                                                                          Addition
                                                                                                                                                                                                                                                          (ExpValue ()
                                                                                                                                                                                                                                                                    (206:34)-(206:36)
                                                                                                                                                                                                                                                                    (ValVariable "oot"))
                                                                                                                                                                                                                                                          (ExpValue ()
                                                                                                                                                                                                                                                                    (206:38)-(206:39)
                                                                                                                                                                                                                                                                    (ValVariable "xs")))])))
                                                                                                                                                                                                     (ExpValue ()
                                                                                                                                                                                                               (206:42)-(206:42)
                                                                                                                                                                                                               (ValInteger "1"
                                                                                                                                                                                                                           Nothing)))]))
                                                                                                                                                           (AList ()
                                                                                                                                                                  (206:45)-(206:72)
                                                                                                                                                                  [IxRange ()
                                                                                                                                                                           (206:45)-(206:72)
                                                                                                                                                                           (Just ExpBinary ()
                                                                                                                                                                                           (206:45)-(206:58)
                                                                                                                                                                                           Addition
                                                                                                                                                                                           (ExpBinary ()
                                                                                                                                                                                                      (206:45)-(206:52)
                                                                                                                                                                                                      Addition
                                                                                                                                                                                                      (ExpSubscript ()
                                                                                                                                                                                                                    (206:45)-(206:50)
                                                                                                                                                                                                                    (ExpValue ()
                                                                                                                                                                                                                              (206:45)-(206:47)
                                                                                                                                                                                                                              (ValVariable "oov"))
                                                                                                                                                                                                                    (AList ()
                                                                                                                                                                                                                           (206:49)-(206:49)
                                                                                                                                                                                                                           [IxSingle ()
                                                                                                                                                                                                                                     (206:49)-(206:49)
                                                                                                                                                                                                                                     Nothing
                                                                                                                                                                                                                                     (ExpValue ()
                                                                                                                                                                                                                                               (206:49)-(206:49)
                                                                                                                                                                                                                                               (ValInteger "2"
                                                                                                                                                                                                                                                           Nothing))]))
                                                                                                                                                                                                      (ExpValue ()
                                                                                                                                                                                                                (206:52)-(206:52)
                                                                                                                                                                                                                (ValInteger "4"
                                                                                                                                                                                                                            Nothing)))
                                                                                                                                                                                           (ExpValue ()
                                                                                                                                                                                                     (206:54)-(206:58)
                                                                                                                                                                                                     (ValVariable "first")))
                                                                                                                                                                           (Just ExpBinary ()
                                                                                                                                                                                           (206:60)-(206:72)
                                                                                                                                                                                           Addition
                                                                                                                                                                                           (ExpBinary ()
                                                                                                                                                                                                      (206:60)-(206:67)
                                                                                                                                                                                                      Addition
                                                                                                                                                                                                      (ExpSubscript ()
                                                                                                                                                                                                                    (206:60)-(206:65)
                                                                                                                                                                                                                    (ExpValue ()
                                                                                                                                                                                                                              (206:60)-(206:62)
                                                                                                                                                                                                                              (ValVariable "oov"))
                                                                                                                                                                                                                    (AList ()
                                                                                                                                                                                                                           (206:64)-(206:64)
                                                                                                                                                                                                                           [IxSingle ()
                                                                                                                                                                                                                                     (206:64)-(206:64)
                                                                                                                                                                                                                                     Nothing
                                                                                                                                                                                                                                     (ExpValue ()
                                                                                                                                                                                                                                               (206:64)-(206:64)
                                                                                                                                                                                                                                               (ValInteger "2"
                                                                                                                                                                                                                                                           Nothing))]))
                                                                                                                                                                                                      (ExpValue ()
                                                                                                                                                                                                                (206:67)-(206:67)
                                                                                                                                                                                                                (ValInteger "4"
                                                                                                                                                                                                                            Nothing)))
                                                                                                                                                                                           (ExpValue ()
                                                                                                                                                                                                     (206:69)-(206:72)
                                                                                                                                                                                                     (ValVariable "last")))
                                                                                                                                                                           Nothing]))),
                                                                                                                           Argument ()
                                                                                                                                    (207:9)-(208:9)
                                                                                                                                    Nothing
                                                                                                                                    (ArgExpr (ExpSubscript ()
                                                                                                                                                           (207:9)-(208:9)
                                                                                                                                                           (ExpSubscript ()
                                                                                                                                                                         (207:9)-(207:35)
                                                                                                                                                                         (ExpValue ()
                                                                                                                                                                                   (207:9)-(207:14)
                                                                                                                                                                                   (ValVariable "oo_010"))
                                                                                                                                                                         (AList ()
                                                                                                                                                                                (207:16)-(207:34)
                                                                                                                                                                                [IxSingle ()
                                                                                                                                                                                          (207:16)-(207:34)
                                                                                                                                                                                          Nothing
                                                                                                                                                                                          (ExpBinary ()
                                                                                                                                                                                                     (207:16)-(207:34)
                                                                                                                                                                                                     Addition
                                                                                                                                                                                                     (ExpBinary ()
                                                                                                                                                                                                                (207:16)-(207:32)
                                                                                                                                                                                                                Addition
                                                                                                                                                                                                                (ExpUnary ()
                                                                                                                                                                                                                          (207:16)-(207:20)
                                                                                                                                                                                                                          Minus
                                                                                                                                                                                                                          (ExpValue ()
                                                                                                                                                                                                                                    (207:17)-(207:20)
                                                                                                                                                                                                                                    (ValInteger "0020"
                                                                                                                                                                                                                                                Nothing)))
                                                                                                                                                                                                                (ExpSubscript ()
                                                                                                                                                                                                                              (207:22)-(207:32)
                                                                                                                                                                                                                              (ExpValue ()
                                                                                                                                                                                                                                        (207:22)-(207:24)
                                                                                                                                                                                                                                        (ValVariable "oow"))
                                                                                                                                                                                                                              (AList ()
                                                                                                                                                                                                                                     (207:26)-(207:31)
                                                                                                                                                                                                                                     [IxSingle ()
                                                                                                                                                                                                                                               (207:26)-(207:31)
                                                                                                                                                                                                                                               Nothing
                                                                                                                                                                                                                                               (ExpBinary ()
                                                                                                                                                                                                                                                          (207:26)-(207:31)
                                                                                                                                                                                                                                                          Addition
                                                                                                                                                                                                                                                          (ExpValue ()
                                                                                                                                                                                                                                                                    (207:26)-(207:28)
                                                                                                                                                                                                                                                                    (ValVariable "oot"))
                                                                                                                                                                                                                                                          (ExpValue ()
                                                                                                                                                                                                                                                                    (207:30)-(207:31)
                                                                                                                                                                                                                                                                    (ValVariable "sp")))])))
                                                                                                                                                                                                     (ExpValue ()
                                                                                                                                                                                                               (207:34)-(207:34)
                                                                                                                                                                                                               (ValInteger "1"
                                                                                                                                                                                                                           Nothing)))]))
                                                                                                                                                           (AList ()
                                                                                                                                                                  (207:37)-(208:8)
                                                                                                                                                                  [IxRange ()
                                                                                                                                                                           (207:37)-(208:8)
                                                                                                                                                                           (Just ExpBinary ()
                                                                                                                                                                                           (207:37)-(207:46)
                                                                                                                                                                                           Addition
                                                                                                                                                                                           (ExpBinary ()
                                                                                                                                                                                                      (207:37)-(207:44)
                                                                                                                                                                                                      Addition
                                                                                                                                                                                                      (ExpSubscript ()
                                                                                                                                                                                                                    (207:37)-(207:42)
                                                                                                                                                                                                                    (ExpValue ()
                                                                                                                                                                                                                              (207:37)-(207:39)
                                                                                                                                                                                                                              (ValVariable "oov"))
                                                                                                                                                                                                                    (AList ()
                                                                                                                                                                                                                           (207:41)-(207:41)
                                                                                                                                                                                                                           [IxSingle ()
                                                                                                                                                                                                                                     (207:41)-(207:41)
                                                                                                                                                                                                                                     Nothing
                                                                                                                                                                                                                                     (ExpValue ()
                                                                                                                                                                                                                                               (207:41)-(207:41)
                                                                                                                                                                                                                                               (ValInteger "2"
                                                                                                                                                                                                                                                           Nothing))]))
                                                                                                                                                                                                      (ExpValue ()
                                                                                                                                                                                                                (207:44)-(207:44)
                                                                                                                                                                                                                (ValInteger "4"
                                                                                                                                                                                                                            Nothing)))
                                                                                                                                                                                           (ExpValue ()
                                                                                                                                                                                                     (207:46)-(207:46)
                                                                                                                                                                                                     (ValInteger "1"
                                                                                                                                                                                                                 Nothing)))
                                                                                                                                                                           (Just ExpBinary ()
                                                                                                                                                                                           (207:48)-(208:8)
                                                                                                                                                                                           Addition
                                                                                                                                                                                           (ExpBinary ()
                                                                                                                                                                                                      (207:48)-(207:55)
                                                                                                                                                                                                      Addition
                                                                                                                                                                                                      (ExpSubscript ()
                                                                                                                                                                                                                    (207:48)-(207:53)
                                                                                                                                                                                                                    (ExpValue ()
                                                                                                                                                                                                                              (207:48)-(207:50)
                                                                                                                                                                                                                              (ValVariable "oov"))
                                                                                                                                                                                                                    (AList ()
                                                                                                                                                                                                                           (207:52)-(207:52)
                                                                                                                                                                                                                           [IxSingle ()
                                                                                                                                                                                                                                     (207:52)-(207:52)
                                                                                                                                                                                                                                     Nothing
                                                                                                                                                                                                                                     (ExpValue ()
                                                                                                                                                                                                                                               (207:52)-(207:52)
                                                                                                                                                                                                                                               (ValInteger "2"
                                                                                                                                                                                                                                                           Nothing))]))
                                                                                                                                                                                                      (ExpValue ()
                                                                                                                                                                                                                (207:55)-(207:55)
                                                                                                                                                                                                                (ValInteger "4"
                                                                                                                                                                                                                            Nothing)))
                                                                                                                                                                                           (ExpSubscript ()
                                                                                                                                                                                                         (207:57)-(208:8)
                                                                                                                                                                                                         (ExpValue ()
                                                                                                                                                                                                                   (207:57)-(207:59)
                                                                                                                                                                                                                   (ValVariable "oov"))
                                                                                                                                                                                                         (AList ()
                                                                                                                                                                                                                (207:61)-(208:7)
                                                                                                                                                                                                                [IxSingle ()
                                                                                                                                                                                                                          (207:61)-(208:7)
                                                                                                                                                                                                                          Nothing
                                                                                                                                                                                                                          (ExpBinary ()
                                                                                                                                                                                                                                     (207:61)-(208:7)
                                                                                                                                                                                                                                     Addition
                                                                                                                                                                                                                                     (ExpSubscript ()
                                                                                                                                                                                                                                                   (207:61)-(207:71)
                                                                                                                                                                                                                                                   (ExpValue ()
                                                                                                                                                                                                                                                             (207:61)-(207:63)
                                                                                                                                                                                                                                                             (ValVariable "oow"))
                                                                                                                                                                                                                                                   (AList ()
                                                                                                                                                                                                                                                          (207:65)-(207:70)
                                                                                                                                                                                                                                                          [IxSingle ()
                                                                                                                                                                                                                                                                    (207:65)-(207:70)
                                                                                                                                                                                                                                                                    Nothing
                                                                                                                                                                                                                                                                    (ExpBinary ()
                                                                                                                                                                                                                                                                               (207:65)-(207:70)
                                                                                                                                                                                                                                                                               Addition
                                                                                                                                                                                                                                                                               (ExpValue ()
                                                                                                                                                                                                                                                                                         (207:65)-(207:67)
                                                                                                                                                                                                                                                                                         (ValVariable "oot"))
                                                                                                                                                                                                                                                                               (ExpValue ()
                                                                                                                                                                                                                                                                                         (207:69)-(207:70)
                                                                                                                                                                                                                                                                                         (ValVariable "sp")))]))
                                                                                                                                                                                                                                     (ExpValue ()
                                                                                                                                                                                                                                               (208:7)-(208:7)
                                                                                                                                                                                                                                               (ValInteger "1"
                                                                                                                                                                                                                                                           Nothing)))])))
                                                                                                                                                                           Nothing])))])))]]
                                                           Nothing,
                                                      BlIf ()
                                                           (210:17)-(223:21)
                                                           Nothing
                                                           Nothing
                                                           [Just ExpBinary ()
                                                                           (210:20)-(210:27)
                                                                           NE
                                                                           (ExpValue ()
                                                                                     (210:20)-(210:22)
                                                                                     (ValVariable "idx"))
                                                                           (ExpValue ()
                                                                                     (210:27)-(210:27)
                                                                                     (ValInteger "0"
                                                                                                 Nothing))]
                                                           [[BlIf ()
                                                                  (211:19)-(214:23)
                                                                  Nothing
                                                                  Nothing
                                                                  [Just ExpBinary ()
                                                                                  (211:22)-(211:29)
                                                                                  EQ
                                                                                  (ExpValue ()
                                                                                            (211:22)-(211:24)
                                                                                            (ValVariable "kdx"))
                                                                                  (ExpValue ()
                                                                                            (211:29)-(211:29)
                                                                                            (ValInteger "0"
                                                                                                        Nothing))]
                                                                  [[BlStatement ()
                                                                                (212:21)-(212:27)
                                                                                Nothing
                                                                                (StExpressionAssign ()
                                                                                                    (212:21)-(212:27)
                                                                                                    (ExpValue ()
                                                                                                              (212:21)-(212:23)
                                                                                                              (ValVariable "kdx"))
                                                                                                    (ExpValue ()
                                                                                                              (212:25)-(212:27)
                                                                                                              (ValVariable "idx"))),
                                                                    BlStatement ()
                                                                                (213:21)-(213:28)
                                                                                Nothing
                                                                                (StExpressionAssign ()
                                                                                                    (213:21)-(213:28)
                                                                                                    (ExpValue ()
                                                                                                              (213:21)-(213:24)
                                                                                                              (ValVariable "lmin"))
                                                                                                    (ExpValue ()
                                                                                                              (213:26)-(213:28)
                                                                                                              (ValVariable "lsp")))]]
                                                                  Nothing,
                                                             BlIf ()
                                                                  (215:19)-(218:23)
                                                                  Nothing
                                                                  Nothing
                                                                  [Just ExpBinary ()
                                                                                  (215:22)-(215:31)
                                                                                  LT
                                                                                  (ExpValue ()
                                                                                            (215:22)-(215:24)
                                                                                            (ValVariable "idx"))
                                                                                  (ExpValue ()
                                                                                            (215:29)-(215:31)
                                                                                            (ValVariable "kdx"))]
                                                                  [[BlStatement ()
                                                                                (216:21)-(216:27)
                                                                                Nothing
                                                                                (StExpressionAssign ()
                                                                                                    (216:21)-(216:27)
                                                                                                    (ExpValue ()
                                                                                                              (216:21)-(216:23)
                                                                                                              (ValVariable "kdx"))
                                                                                                    (ExpValue ()
                                                                                                              (216:25)-(216:27)
                                                                                                              (ValVariable "idx"))),
                                                                    BlStatement ()
                                                                                (217:21)-(217:28)
                                                                                Nothing
                                                                                (StExpressionAssign ()
                                                                                                    (217:21)-(217:28)
                                                                                                    (ExpValue ()
                                                                                                              (217:21)-(217:24)
                                                                                                              (ValVariable "lmin"))
                                                                                                    (ExpValue ()
                                                                                                              (217:26)-(217:28)
                                                                                                              (ValVariable "lsp")))]]
                                                                  Nothing,
                                                             BlIf ()
                                                                  (219:19)-(222:23)
                                                                  Nothing
                                                                  Nothing
                                                                  [Just ExpBinary ()
                                                                                  (219:22)-(219:51)
                                                                                  And
                                                                                  (ExpBinary ()
                                                                                             (219:22)-(219:33)
                                                                                             EQ
                                                                                             (ExpValue ()
                                                                                                       (219:23)-(219:25)
                                                                                                       (ValVariable "idx"))
                                                                                             (ExpValue ()
                                                                                                       (219:30)-(219:32)
                                                                                                       (ValVariable "kdx")))
                                                                                  (ExpBinary ()
                                                                                             (219:39)-(219:51)
                                                                                             LT
                                                                                             (ExpValue ()
                                                                                                       (219:40)-(219:42)
                                                                                                       (ValVariable "lsp"))
                                                                                             (ExpValue ()
                                                                                                       (219:47)-(219:50)
                                                                                                       (ValVariable "lmin")))]
                                                                  [[BlStatement ()
                                                                                (220:21)-(220:27)
                                                                                Nothing
                                                                                (StExpressionAssign ()
                                                                                                    (220:21)-(220:27)
                                                                                                    (ExpValue ()
                                                                                                              (220:21)-(220:23)
                                                                                                              (ValVariable "kdx"))
                                                                                                    (ExpValue ()
                                                                                                              (220:25)-(220:27)
                                                                                                              (ValVariable "idx"))),
                                                                    BlStatement ()
                                                                                (221:21)-(221:28)
                                                                                Nothing
                                                                                (StExpressionAssign ()
                                                                                                    (221:21)-(221:28)
                                                                                                    (ExpValue ()
                                                                                                              (221:21)-(221:24)
                                                                                                              (ValVariable "lmin"))
                                                                                                    (ExpValue ()
                                                                                                              (221:26)-(221:28)
                                                                                                              (ValVariable "lsp")))]]
                                                                  Nothing]]
                                                           Nothing,
                                                      BlComment ()
                                                                (224:1)-(224:25)
                                                                (Comment "               segdes,sp"),
                                                      BlStatement ()
                                                                  (225:7)-(225:12)
                                                                  Nothing
                                                                  (StExpressionAssign ()
                                                                                      (225:7)-(225:12)
                                                                                      (ExpValue ()
                                                                                                (225:7)-(225:9)
                                                                                                (ValVariable "oo1"))
                                                                                      (ExpValue ()
                                                                                                (225:11)-(225:12)
                                                                                                (ValVariable "sp"))),
                                                      BlStatement ()
                                                                  (226:7)-(226:45)
                                                                  Nothing
                                                                  (StCall ()
                                                                          (226:7)-(226:45)
                                                                          (ExpValue ()
                                                                                    (226:11)-(226:16)
                                                                                    (ValVariable "ooowde"))
                                                                          (Just AList ()
                                                                                      (226:17)-(226:45)
                                                                                      [Argument ()
                                                                                                (226:18)-(226:20)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (226:18)-(226:20)
                                                                                                                   (ValVariable "oo4"))),
                                                                                       Argument ()
                                                                                                (226:22)-(226:22)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (226:22)-(226:22)
                                                                                                                   (ValInteger "0"
                                                                                                                               Nothing))),
                                                                                       Argument ()
                                                                                                (226:24)-(226:38)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (226:24)-(226:38)
                                                                                                                   (ValString "STGBRK 99 SP "))),
                                                                                       Argument ()
                                                                                                (226:40)-(226:42)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (226:40)-(226:42)
                                                                                                                   (ValVariable "oo1"))),
                                                                                       Argument ()
                                                                                                (226:44)-(226:44)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (226:44)-(226:44)
                                                                                                                   (ValInteger "1"
                                                                                                                               Nothing)))])),
                                                      BlStatement ()
                                                                  (227:17)-(227:24)
                                                                  Nothing
                                                                  (StGotoUnconditional ()
                                                                                       (227:17)-(227:24)
                                                                                       (ExpValue ()
                                                                                                 (227:22)-(227:24)
                                                                                                 (ValInteger "130"
                                                                                                             Nothing)))]]
                                                    Nothing,
                                               BlComment ()
                                                         (229:1)-(229:1)
                                                         (Comment ""),
                                               BlComment ()
                                                         (230:1)-(230:43)
                                                         (Comment "             -- determiner limites morceau"),
                                               BlIf ()
                                                    (231:15)-(242:19)
                                                    Nothing
                                                    Nothing
                                                    [Just ExpBinary ()
                                                                    (231:18)-(231:25)
                                                                    NE
                                                                    (ExpValue ()
                                                                              (231:18)-(231:20)
                                                                              (ValVariable "kdx"))
                                                                    (ExpValue ()
                                                                              (231:25)-(231:25)
                                                                              (ValInteger "0"
                                                                                          Nothing)),
                                                     Nothing]
                                                    [[BlStatement ()
                                                                  (232:17)-(232:28)
                                                                  Nothing
                                                                  (StExpressionAssign ()
                                                                                      (232:17)-(232:28)
                                                                                      (ExpValue ()
                                                                                                (232:17)-(232:22)
                                                                                                (ValVariable "mfirst"))
                                                                                      (ExpValue ()
                                                                                                (232:24)-(232:28)
                                                                                                (ValVariable "first"))),
                                                      BlIf ()
                                                           (233:17)-(237:21)
                                                           Nothing
                                                           Nothing
                                                           [Just ExpBinary ()
                                                                           (233:20)-(233:27)
                                                                           EQ
                                                                           (ExpValue ()
                                                                                     (233:20)-(233:22)
                                                                                     (ValVariable "kdx"))
                                                                           (ExpValue ()
                                                                                     (233:27)-(233:27)
                                                                                     (ValInteger "1"
                                                                                                 Nothing)),
                                                            Nothing]
                                                           [[BlStatement ()
                                                                         (234:19)-(234:29)
                                                                         Nothing
                                                                         (StExpressionAssign ()
                                                                                             (234:19)-(234:29)
                                                                                             (ExpValue ()
                                                                                                       (234:19)-(234:23)
                                                                                                       (ValVariable "mlast"))
                                                                                             (ExpValue ()
                                                                                                       (234:25)-(234:29)
                                                                                                       (ValVariable "first")))],
                                                            [BlStatement ()
                                                                         (236:19)-(236:35)
                                                                         Nothing
                                                                         (StExpressionAssign ()
                                                                                             (236:19)-(236:35)
                                                                                             (ExpValue ()
                                                                                                       (236:19)-(236:23)
                                                                                                       (ValVariable "mlast"))
                                                                                             (ExpBinary ()
                                                                                                        (236:25)-(236:35)
                                                                                                        Subtraction
                                                                                                        (ExpBinary ()
                                                                                                                   (236:25)-(236:33)
                                                                                                                   Addition
                                                                                                                   (ExpValue ()
                                                                                                                             (236:25)-(236:29)
                                                                                                                             (ValVariable "first"))
                                                                                                                   (ExpValue ()
                                                                                                                             (236:31)-(236:33)
                                                                                                                             (ValVariable "kdx")))
                                                                                                        (ExpValue ()
                                                                                                                  (236:35)-(236:35)
                                                                                                                  (ValInteger "2"
                                                                                                                              Nothing))))]]
                                                           Nothing],
                                                     [BlStatement ()
                                                                  (239:17)-(239:22)
                                                                  Nothing
                                                                  (StExpressionAssign ()
                                                                                      (239:17)-(239:22)
                                                                                      (ExpValue ()
                                                                                                (239:17)-(239:20)
                                                                                                (ValVariable "lmin"))
                                                                                      (ExpValue ()
                                                                                                (239:22)-(239:22)
                                                                                                (ValInteger "0"
                                                                                                            Nothing))),
                                                      BlStatement ()
                                                                  (240:17)-(240:28)
                                                                  Nothing
                                                                  (StExpressionAssign ()
                                                                                      (240:17)-(240:28)
                                                                                      (ExpValue ()
                                                                                                (240:17)-(240:22)
                                                                                                (ValVariable "mfirst"))
                                                                                      (ExpValue ()
                                                                                                (240:24)-(240:28)
                                                                                                (ValVariable "first"))),
                                                      BlStatement ()
                                                                  (241:17)-(241:26)
                                                                  Nothing
                                                                  (StExpressionAssign ()
                                                                                      (241:17)-(241:26)
                                                                                      (ExpValue ()
                                                                                                (241:17)-(241:21)
                                                                                                (ValVariable "mlast"))
                                                                                      (ExpValue ()
                                                                                                (241:23)-(241:26)
                                                                                                (ValVariable "last")))]]
                                                    Nothing,
                                               BlComment ()
                                                         (243:1)-(243:1)
                                                         (Comment ""),
                                               BlComment ()
                                                         (244:1)-(244:31)
                                                         (Comment "             -- ranger morceau"),
                                               BlStatement ()
                                                           (245:15)-(245:33)
                                                           Nothing
                                                           (StExpressionAssign ()
                                                                               (245:15)-(245:33)
                                                                               (ExpValue ()
                                                                                         (245:15)-(245:18)
                                                                                         (ValVariable "lstg"))
                                                                               (ExpBinary ()
                                                                                          (245:20)-(245:33)
                                                                                          Addition
                                                                                          (ExpBinary ()
                                                                                                     (245:20)-(245:31)
                                                                                                     Subtraction
                                                                                                     (ExpValue ()
                                                                                                               (245:20)-(245:24)
                                                                                                               (ValVariable "mlast"))
                                                                                                     (ExpValue ()
                                                                                                               (245:26)-(245:31)
                                                                                                               (ValVariable "mfirst")))
                                                                                          (ExpValue ()
                                                                                                    (245:33)-(245:33)
                                                                                                    (ValInteger "1"
                                                                                                                Nothing)))),
                                               BlComment ()
                                                         (246:1)-(246:23)
                                                         (Comment "             segini,ms"),
                                               BlStatement ()
                                                           (247:7)-(247:57)
                                                           Nothing
                                                           (StCall ()
                                                                   (247:7)-(247:57)
                                                                   (ExpValue ()
                                                                             (247:11)-(247:16)
                                                                             (ValVariable "ooowin"))
                                                                   (Just AList ()
                                                                               (247:17)-(247:57)
                                                                               [Argument ()
                                                                                         (247:18)-(247:20)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (247:18)-(247:20)
                                                                                                            (ValVariable "oo4"))),
                                                                                Argument ()
                                                                                         (247:22)-(247:22)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (247:22)-(247:22)
                                                                                                            (ValInteger "0"
                                                                                                                        Nothing))),
                                                                                Argument ()
                                                                                         (247:24)-(247:39)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (247:24)-(247:39)
                                                                                                            (ValString "STGBRK 115 MS "))),
                                                                                Argument ()
                                                                                         (247:41)-(247:43)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (247:41)-(247:43)
                                                                                                            (ValVariable "oo1"))),
                                                                                Argument ()
                                                                                         (247:45)-(247:56)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpBinary ()
                                                                                                             (247:45)-(247:56)
                                                                                                             Division
                                                                                                             (ExpBinary ()
                                                                                                                        (247:45)-(247:54)
                                                                                                                        Addition
                                                                                                                        (ExpBinary ()
                                                                                                                                   (247:46)-(247:51)
                                                                                                                                   Addition
                                                                                                                                   (ExpValue ()
                                                                                                                                             (247:46)-(247:46)
                                                                                                                                             (ValInteger "4"
                                                                                                                                                         Nothing))
                                                                                                                                   (ExpValue ()
                                                                                                                                             (247:48)-(247:51)
                                                                                                                                             (ValVariable "lstg")))
                                                                                                                        (ExpValue ()
                                                                                                                                  (247:53)-(247:53)
                                                                                                                                  (ValInteger "3"
                                                                                                                                              Nothing)))
                                                                                                             (ExpValue ()
                                                                                                                       (247:56)-(247:56)
                                                                                                                       (ValInteger "4"
                                                                                                                                   Nothing))))])),
                                               BlStatement ()
                                                           (248:7)-(248:39)
                                                           Nothing
                                                           (StExpressionAssign ()
                                                                               (248:7)-(248:39)
                                                                               (ExpSubscript ()
                                                                                             (248:7)-(248:34)
                                                                                             (ExpValue ()
                                                                                                       (248:7)-(248:12)
                                                                                                       (ValVariable "oo_011"))
                                                                                             (AList ()
                                                                                                    (248:14)-(248:33)
                                                                                                    [IxSingle ()
                                                                                                              (248:14)-(248:33)
                                                                                                              Nothing
                                                                                                              (ExpBinary ()
                                                                                                                         (248:14)-(248:33)
                                                                                                                         Addition
                                                                                                                         (ExpBinary ()
                                                                                                                                    (248:14)-(248:31)
                                                                                                                                    Addition
                                                                                                                                    (ExpUnary ()
                                                                                                                                              (248:14)-(248:18)
                                                                                                                                              Minus
                                                                                                                                              (ExpValue ()
                                                                                                                                                        (248:15)-(248:18)
                                                                                                                                                        (ValInteger "0022"
                                                                                                                                                                    Nothing)))
                                                                                                                                    (ExpSubscript ()
                                                                                                                                                  (248:20)-(248:31)
                                                                                                                                                  (ExpValue ()
                                                                                                                                                            (248:20)-(248:22)
                                                                                                                                                            (ValVariable "oow"))
                                                                                                                                                  (AList ()
                                                                                                                                                         (248:24)-(248:30)
                                                                                                                                                         [IxSingle ()
                                                                                                                                                                   (248:24)-(248:30)
                                                                                                                                                                   Nothing
                                                                                                                                                                   (ExpBinary ()
                                                                                                                                                                              (248:24)-(248:30)
                                                                                                                                                                              Addition
                                                                                                                                                                              (ExpValue ()
                                                                                                                                                                                        (248:24)-(248:26)
                                                                                                                                                                                        (ValVariable "oot"))
                                                                                                                                                                              (ExpValue ()
                                                                                                                                                                                        (248:28)-(248:30)
                                                                                                                                                                                        (ValVariable "oo1")))])))
                                                                                                                         (ExpValue ()
                                                                                                                                   (248:33)-(248:33)
                                                                                                                                   (ValInteger "1"
                                                                                                                                               Nothing)))]))
                                                                               (ExpValue ()
                                                                                         (248:36)-(248:39)
                                                                                         (ValVariable "lstg"))),
                                               BlStatement ()
                                                           (249:7)-(249:12)
                                                           Nothing
                                                           (StExpressionAssign ()
                                                                               (249:7)-(249:12)
                                                                               (ExpValue ()
                                                                                         (249:7)-(249:8)
                                                                                         (ValVariable "ms"))
                                                                               (ExpValue ()
                                                                                         (249:10)-(249:12)
                                                                                         (ValVariable "oo1"))),
                                               BlComment ()
                                                         (250:1)-(250:23)
                                                         (Comment "             segact,ms"),
                                               BlStatement ()
                                                           (251:7)-(251:12)
                                                           Nothing
                                                           (StExpressionAssign ()
                                                                               (251:7)-(251:12)
                                                                               (ExpValue ()
                                                                                         (251:7)-(251:9)
                                                                                         (ValVariable "oo1"))
                                                                               (ExpValue ()
                                                                                         (251:11)-(251:12)
                                                                                         (ValVariable "ms"))),
                                               BlStatement ()
                                                           (252:7)-(252:46)
                                                           Nothing
                                                           (StCall ()
                                                                   (252:7)-(252:46)
                                                                   (ExpValue ()
                                                                             (252:11)-(252:16)
                                                                             (ValVariable "ooowac"))
                                                                   (Just AList ()
                                                                               (252:17)-(252:46)
                                                                               [Argument ()
                                                                                         (252:18)-(252:20)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (252:18)-(252:20)
                                                                                                            (ValVariable "oo4"))),
                                                                                Argument ()
                                                                                         (252:22)-(252:22)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (252:22)-(252:22)
                                                                                                            (ValInteger "0"
                                                                                                                        Nothing))),
                                                                                Argument ()
                                                                                         (252:24)-(252:39)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (252:24)-(252:39)
                                                                                                            (ValString "STGBRK 119 MS "))),
                                                                                Argument ()
                                                                                         (252:41)-(252:43)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (252:41)-(252:43)
                                                                                                            (ValVariable "oo1"))),
                                                                                Argument ()
                                                                                         (252:45)-(252:45)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (252:45)-(252:45)
                                                                                                            (ValInteger "0"
                                                                                                                        Nothing)))])),
                                               BlComment ()
                                                         (253:1)-(253:45)
                                                         (Comment "               ms.cstg=xs.cstg(mfirst:mlast)"),
                                               BlStatement ()
                                                           (254:7)-(255:67)
                                                           Nothing
                                                           (StExpressionAssign ()
                                                                               (254:7)-(255:67)
                                                                               (ExpSubscript ()
                                                                                             (254:7)-(255:7)
                                                                                             (ExpSubscript ()
                                                                                                           (254:7)-(254:33)
                                                                                                           (ExpValue ()
                                                                                                                     (254:7)-(254:12)
                                                                                                                     (ValVariable "oo_012"))
                                                                                                           (AList ()
                                                                                                                  (254:14)-(254:32)
                                                                                                                  [IxSingle ()
                                                                                                                            (254:14)-(254:32)
                                                                                                                            Nothing
                                                                                                                            (ExpBinary ()
                                                                                                                                       (254:14)-(254:32)
                                                                                                                                       Addition
                                                                                                                                       (ExpBinary ()
                                                                                                                                                  (254:14)-(254:30)
                                                                                                                                                  Addition
                                                                                                                                                  (ExpUnary ()
                                                                                                                                                            (254:14)-(254:18)
                                                                                                                                                            Minus
                                                                                                                                                            (ExpValue ()
                                                                                                                                                                      (254:15)-(254:18)
                                                                                                                                                                      (ValInteger "0024"
                                                                                                                                                                                  Nothing)))
                                                                                                                                                  (ExpSubscript ()
                                                                                                                                                                (254:20)-(254:30)
                                                                                                                                                                (ExpValue ()
                                                                                                                                                                          (254:20)-(254:22)
                                                                                                                                                                          (ValVariable "oow"))
                                                                                                                                                                (AList ()
                                                                                                                                                                       (254:24)-(254:29)
                                                                                                                                                                       [IxSingle ()
                                                                                                                                                                                 (254:24)-(254:29)
                                                                                                                                                                                 Nothing
                                                                                                                                                                                 (ExpBinary ()
                                                                                                                                                                                            (254:24)-(254:29)
                                                                                                                                                                                            Addition
                                                                                                                                                                                            (ExpValue ()
                                                                                                                                                                                                      (254:24)-(254:26)
                                                                                                                                                                                                      (ValVariable "oot"))
                                                                                                                                                                                            (ExpValue ()
                                                                                                                                                                                                      (254:28)-(254:29)
                                                                                                                                                                                                      (ValVariable "ms")))])))
                                                                                                                                       (ExpValue ()
                                                                                                                                                 (254:32)-(254:32)
                                                                                                                                                 (ValInteger "1"
                                                                                                                                                             Nothing)))]))
                                                                                             (AList ()
                                                                                                    (254:35)-(254:72)
                                                                                                    [IxRange ()
                                                                                                             (254:35)-(254:72)
                                                                                                             (Just ExpBinary ()
                                                                                                                             (254:35)-(254:44)
                                                                                                                             Addition
                                                                                                                             (ExpBinary ()
                                                                                                                                        (254:35)-(254:42)
                                                                                                                                        Addition
                                                                                                                                        (ExpSubscript ()
                                                                                                                                                      (254:35)-(254:40)
                                                                                                                                                      (ExpValue ()
                                                                                                                                                                (254:35)-(254:37)
                                                                                                                                                                (ValVariable "oov"))
                                                                                                                                                      (AList ()
                                                                                                                                                             (254:39)-(254:39)
                                                                                                                                                             [IxSingle ()
                                                                                                                                                                       (254:39)-(254:39)
                                                                                                                                                                       Nothing
                                                                                                                                                                       (ExpValue ()
                                                                                                                                                                                 (254:39)-(254:39)
                                                                                                                                                                                 (ValInteger "2"
                                                                                                                                                                                             Nothing))]))
                                                                                                                                        (ExpValue ()
                                                                                                                                                  (254:42)-(254:42)
                                                                                                                                                  (ValInteger "4"
                                                                                                                                                              Nothing)))
                                                                                                                             (ExpValue ()
                                                                                                                                       (254:44)-(254:44)
                                                                                                                                       (ValInteger "1"
                                                                                                                                                   Nothing)))
                                                                                                             (Just ExpBinary ()
                                                                                                                             (254:46)-(254:72)
                                                                                                                             Addition
                                                                                                                             (ExpBinary ()
                                                                                                                                        (254:46)-(254:53)
                                                                                                                                        Addition
                                                                                                                                        (ExpSubscript ()
                                                                                                                                                      (254:46)-(254:51)
                                                                                                                                                      (ExpValue ()
                                                                                                                                                                (254:46)-(254:48)
                                                                                                                                                                (ValVariable "oov"))
                                                                                                                                                      (AList ()
                                                                                                                                                             (254:50)-(254:50)
                                                                                                                                                             [IxSingle ()
                                                                                                                                                                       (254:50)-(254:50)
                                                                                                                                                                       Nothing
                                                                                                                                                                       (ExpValue ()
                                                                                                                                                                                 (254:50)-(254:50)
                                                                                                                                                                                 (ValInteger "2"
                                                                                                                                                                                             Nothing))]))
                                                                                                                                        (ExpValue ()
                                                                                                                                                  (254:53)-(254:53)
                                                                                                                                                  (ValInteger "4"
                                                                                                                                                              Nothing)))
                                                                                                                             (ExpSubscript ()
                                                                                                                                           (254:55)-(254:72)
                                                                                                                                           (ExpValue ()
                                                                                                                                                     (254:55)-(254:57)
                                                                                                                                                     (ValVariable "oov"))
                                                                                                                                           (AList ()
                                                                                                                                                  (254:59)-(254:71)
                                                                                                                                                  [IxSingle ()
                                                                                                                                                            (254:59)-(254:71)
                                                                                                                                                            Nothing
                                                                                                                                                            (ExpBinary ()
                                                                                                                                                                       (254:59)-(254:71)
                                                                                                                                                                       Addition
                                                                                                                                                                       (ExpSubscript ()
                                                                                                                                                                                     (254:59)-(254:69)
                                                                                                                                                                                     (ExpValue ()
                                                                                                                                                                                               (254:59)-(254:61)
                                                                                                                                                                                               (ValVariable "oow"))
                                                                                                                                                                                     (AList ()
                                                                                                                                                                                            (254:63)-(254:68)
                                                                                                                                                                                            [IxSingle ()
                                                                                                                                                                                                      (254:63)-(254:68)
                                                                                                                                                                                                      Nothing
                                                                                                                                                                                                      (ExpBinary ()
                                                                                                                                                                                                                 (254:63)-(254:68)
                                                                                                                                                                                                                 Addition
                                                                                                                                                                                                                 (ExpValue ()
                                                                                                                                                                                                                           (254:63)-(254:65)
                                                                                                                                                                                                                           (ValVariable "oot"))
                                                                                                                                                                                                                 (ExpValue ()
                                                                                                                                                                                                                           (254:67)-(254:68)
                                                                                                                                                                                                                           (ValVariable "ms")))]))
                                                                                                                                                                       (ExpValue ()
                                                                                                                                                                                 (254:71)-(254:71)
                                                                                                                                                                                 (ValInteger "1"
                                                                                                                                                                                             Nothing)))])))
                                                                                                             Nothing]))
                                                                               (ExpSubscript ()
                                                                                             (255:9)-(255:67)
                                                                                             (ExpSubscript ()
                                                                                                           (255:9)-(255:35)
                                                                                                           (ExpValue ()
                                                                                                                     (255:9)-(255:14)
                                                                                                                     (ValVariable "oo_009"))
                                                                                                           (AList ()
                                                                                                                  (255:16)-(255:34)
                                                                                                                  [IxSingle ()
                                                                                                                            (255:16)-(255:34)
                                                                                                                            Nothing
                                                                                                                            (ExpBinary ()
                                                                                                                                       (255:16)-(255:34)
                                                                                                                                       Addition
                                                                                                                                       (ExpBinary ()
                                                                                                                                                  (255:16)-(255:32)
                                                                                                                                                  Addition
                                                                                                                                                  (ExpUnary ()
                                                                                                                                                            (255:16)-(255:20)
                                                                                                                                                            Minus
                                                                                                                                                            (ExpValue ()
                                                                                                                                                                      (255:17)-(255:20)
                                                                                                                                                                      (ValInteger "0018"
                                                                                                                                                                                  Nothing)))
                                                                                                                                                  (ExpSubscript ()
                                                                                                                                                                (255:22)-(255:32)
                                                                                                                                                                (ExpValue ()
                                                                                                                                                                          (255:22)-(255:24)
                                                                                                                                                                          (ValVariable "oow"))
                                                                                                                                                                (AList ()
                                                                                                                                                                       (255:26)-(255:31)
                                                                                                                                                                       [IxSingle ()
                                                                                                                                                                                 (255:26)-(255:31)
                                                                                                                                                                                 Nothing
                                                                                                                                                                                 (ExpBinary ()
                                                                                                                                                                                            (255:26)-(255:31)
                                                                                                                                                                                            Addition
                                                                                                                                                                                            (ExpValue ()
                                                                                                                                                                                                      (255:26)-(255:28)
                                                                                                                                                                                                      (ValVariable "oot"))
                                                                                                                                                                                            (ExpValue ()
                                                                                                                                                                                                      (255:30)-(255:31)
                                                                                                                                                                                                      (ValVariable "xs")))])))
                                                                                                                                       (ExpValue ()
                                                                                                                                                 (255:34)-(255:34)
                                                                                                                                                 (ValInteger "1"
                                                                                                                                                             Nothing)))]))
                                                                                             (AList ()
                                                                                                    (255:37)-(255:66)
                                                                                                    [IxRange ()
                                                                                                             (255:37)-(255:66)
                                                                                                             (Just ExpBinary ()
                                                                                                                             (255:37)-(255:51)
                                                                                                                             Addition
                                                                                                                             (ExpBinary ()
                                                                                                                                        (255:37)-(255:44)
                                                                                                                                        Addition
                                                                                                                                        (ExpSubscript ()
                                                                                                                                                      (255:37)-(255:42)
                                                                                                                                                      (ExpValue ()
                                                                                                                                                                (255:37)-(255:39)
                                                                                                                                                                (ValVariable "oov"))
                                                                                                                                                      (AList ()
                                                                                                                                                             (255:41)-(255:41)
                                                                                                                                                             [IxSingle ()
                                                                                                                                                                       (255:41)-(255:41)
                                                                                                                                                                       Nothing
                                                                                                                                                                       (ExpValue ()
                                                                                                                                                                                 (255:41)-(255:41)
                                                                                                                                                                                 (ValInteger "2"
                                                                                                                                                                                             Nothing))]))
                                                                                                                                        (ExpValue ()
                                                                                                                                                  (255:44)-(255:44)
                                                                                                                                                  (ValInteger "4"
                                                                                                                                                              Nothing)))
                                                                                                                             (ExpValue ()
                                                                                                                                       (255:46)-(255:51)
                                                                                                                                       (ValVariable "mfirst")))
                                                                                                             (Just ExpBinary ()
                                                                                                                             (255:53)-(255:66)
                                                                                                                             Addition
                                                                                                                             (ExpBinary ()
                                                                                                                                        (255:53)-(255:60)
                                                                                                                                        Addition
                                                                                                                                        (ExpSubscript ()
                                                                                                                                                      (255:53)-(255:58)
                                                                                                                                                      (ExpValue ()
                                                                                                                                                                (255:53)-(255:55)
                                                                                                                                                                (ValVariable "oov"))
                                                                                                                                                      (AList ()
                                                                                                                                                             (255:57)-(255:57)
                                                                                                                                                             [IxSingle ()
                                                                                                                                                                       (255:57)-(255:57)
                                                                                                                                                                       Nothing
                                                                                                                                                                       (ExpValue ()
                                                                                                                                                                                 (255:57)-(255:57)
                                                                                                                                                                                 (ValInteger "2"
                                                                                                                                                                                             Nothing))]))
                                                                                                                                        (ExpValue ()
                                                                                                                                                  (255:60)-(255:60)
                                                                                                                                                  (ValInteger "4"
                                                                                                                                                              Nothing)))
                                                                                                                             (ExpValue ()
                                                                                                                                       (255:62)-(255:66)
                                                                                                                                       (ValVariable "mlast")))
                                                                                                             Nothing]))),
                                               BlComment ()
                                                         (256:1)-(256:23)
                                                         (Comment "             segdes,ms"),
                                               BlStatement ()
                                                           (257:7)-(257:12)
                                                           Nothing
                                                           (StExpressionAssign ()
                                                                               (257:7)-(257:12)
                                                                               (ExpValue ()
                                                                                         (257:7)-(257:9)
                                                                                         (ValVariable "oo1"))
                                                                               (ExpValue ()
                                                                                         (257:11)-(257:12)
                                                                                         (ValVariable "ms"))),
                                               BlStatement ()
                                                           (258:7)-(258:46)
                                                           Nothing
                                                           (StCall ()
                                                                   (258:7)-(258:46)
                                                                   (ExpValue ()
                                                                             (258:11)-(258:16)
                                                                             (ValVariable "ooowde"))
                                                                   (Just AList ()
                                                                               (258:17)-(258:46)
                                                                               [Argument ()
                                                                                         (258:18)-(258:20)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (258:18)-(258:20)
                                                                                                            (ValVariable "oo4"))),
                                                                                Argument ()
                                                                                         (258:22)-(258:22)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (258:22)-(258:22)
                                                                                                            (ValInteger "0"
                                                                                                                        Nothing))),
                                                                                Argument ()
                                                                                         (258:24)-(258:39)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (258:24)-(258:39)
                                                                                                            (ValString "STGBRK 122 MS "))),
                                                                                Argument ()
                                                                                         (258:41)-(258:43)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (258:41)-(258:43)
                                                                                                            (ValVariable "oo1"))),
                                                                                Argument ()
                                                                                         (258:45)-(258:45)
                                                                                         Nothing
                                                                                         (ArgExpr (ExpValue ()
                                                                                                            (258:45)-(258:45)
                                                                                                            (ValInteger "1"
                                                                                                                        Nothing)))])),
                                               BlComment ()
                                                         (259:1)-(259:39)
                                                         (Comment "             rlist.ilist=rlist.ilist+1"),
                                               BlStatement ()
                                                           (260:7)-(260:69)
                                                           Nothing
                                                           (StExpressionAssign ()
                                                                               (260:7)-(260:69)
                                                                               (ExpSubscript ()
                                                                                             (260:7)-(260:36)
                                                                                             (ExpValue ()
                                                                                                       (260:7)-(260:12)
                                                                                                       (ValVariable "oo_002"))
                                                                                             (AList ()
                                                                                                    (260:14)-(260:35)
                                                                                                    [IxSingle ()
                                                                                                              (260:14)-(260:35)
                                                                                                              Nothing
                                                                                                              (ExpBinary ()
                                                                                                                         (260:14)-(260:35)
                                                                                                                         Addition
                                                                                                                         (ExpBinary ()
                                                                                                                                    (260:14)-(260:33)
                                                                                                                                    Addition
                                                                                                                                    (ExpUnary ()
                                                                                                                                              (260:14)-(260:18)
                                                                                                                                              Minus
                                                                                                                                              (ExpValue ()
                                                                                                                                                        (260:15)-(260:18)
                                                                                                                                                        (ValInteger "0004"
                                                                                                                                                                    Nothing)))
                                                                                                                                    (ExpSubscript ()
                                                                                                                                                  (260:20)-(260:33)
                                                                                                                                                  (ExpValue ()
                                                                                                                                                            (260:20)-(260:22)
                                                                                                                                                            (ValVariable "oow"))
                                                                                                                                                  (AList ()
                                                                                                                                                         (260:24)-(260:32)
                                                                                                                                                         [IxSingle ()
                                                                                                                                                                   (260:24)-(260:32)
                                                                                                                                                                   Nothing
                                                                                                                                                                   (ExpBinary ()
                                                                                                                                                                              (260:24)-(260:32)
                                                                                                                                                                              Addition
                                                                                                                                                                              (ExpValue ()
                                                                                                                                                                                        (260:24)-(260:26)
                                                                                                                                                                                        (ValVariable "oot"))
                                                                                                                                                                              (ExpValue ()
                                                                                                                                                                                        (260:28)-(260:32)
                                                                                                                                                                                        (ValVariable "rlist")))])))
                                                                                                                         (ExpValue ()
                                                                                                                                   (260:35)-(260:35)
                                                                                                                                   (ValInteger "1"
                                                                                                                                               Nothing)))]))
                                                                               (ExpBinary ()
                                                                                          (260:38)-(260:69)
                                                                                          Addition
                                                                                          (ExpSubscript ()
                                                                                                        (260:38)-(260:67)
                                                                                                        (ExpValue ()
                                                                                                                  (260:38)-(260:43)
                                                                                                                  (ValVariable "oo_002"))
                                                                                                        (AList ()
                                                                                                               (260:45)-(260:66)
                                                                                                               [IxSingle ()
                                                                                                                         (260:45)-(260:66)
                                                                                                                         Nothing
                                                                                                                         (ExpBinary ()
                                                                                                                                    (260:45)-(260:66)
                                                                                                                                    Addition
                                                                                                                                    (ExpBinary ()
                                                                                                                                               (260:45)-(260:64)
                                                                                                                                               Addition
                                                                                                                                               (ExpUnary ()
                                                                                                                                                         (260:45)-(260:49)
                                                                                                                                                         Minus
                                                                                                                                                         (ExpValue ()
                                                                                                                                                                   (260:46)-(260:49)
                                                                                                                                                                   (ValInteger "0004"
                                                                                                                                                                               Nothing)))
                                                                                                                                               (ExpSubscript ()
                                                                                                                                                             (260:51)-(260:64)
                                                                                                                                                             (ExpValue ()
                                                                                                                                                                       (260:51)-(260:53)
                                                                                                                                                                       (ValVariable "oow"))
                                                                                                                                                             (AList ()
                                                                                                                                                                    (260:55)-(260:63)
                                                                                                                                                                    [IxSingle ()
                                                                                                                                                                              (260:55)-(260:63)
                                                                                                                                                                              Nothing
                                                                                                                                                                              (ExpBinary ()
                                                                                                                                                                                         (260:55)-(260:63)
                                                                                                                                                                                         Addition
                                                                                                                                                                                         (ExpValue ()
                                                                                                                                                                                                   (260:55)-(260:57)
                                                                                                                                                                                                   (ValVariable "oot"))
                                                                                                                                                                                         (ExpValue ()
                                                                                                                                                                                                   (260:59)-(260:63)
                                                                                                                                                                                                   (ValVariable "rlist")))])))
                                                                                                                                    (ExpValue ()
                                                                                                                                              (260:66)-(260:66)
                                                                                                                                              (ValInteger "1"
                                                                                                                                                          Nothing)))]))
                                                                                          (ExpValue ()
                                                                                                    (260:69)-(260:69)
                                                                                                    (ValInteger "1"
                                                                                                                Nothing)))),
                                               BlComment ()
                                                         (261:1)-(261:44)
                                                         (Comment "             if((rlist.ilist).gt.nlist)then"),
                                               BlIf ()
                                                    (262:7)-(273:19)
                                                    Nothing
                                                    Nothing
                                                    [Just ExpBinary ()
                                                                    (262:10)-(262:50)
                                                                    GT
                                                                    (ExpSubscript ()
                                                                                  (262:10)-(262:41)
                                                                                  (ExpValue ()
                                                                                            (262:11)-(262:16)
                                                                                            (ValVariable "oo_002"))
                                                                                  (AList ()
                                                                                         (262:18)-(262:39)
                                                                                         [IxSingle ()
                                                                                                   (262:18)-(262:39)
                                                                                                   Nothing
                                                                                                   (ExpBinary ()
                                                                                                              (262:18)-(262:39)
                                                                                                              Addition
                                                                                                              (ExpBinary ()
                                                                                                                         (262:18)-(262:37)
                                                                                                                         Addition
                                                                                                                         (ExpUnary ()
                                                                                                                                   (262:18)-(262:22)
                                                                                                                                   Minus
                                                                                                                                   (ExpValue ()
                                                                                                                                             (262:19)-(262:22)
                                                                                                                                             (ValInteger "0004"
                                                                                                                                                         Nothing)))
                                                                                                                         (ExpSubscript ()
                                                                                                                                       (262:24)-(262:37)
                                                                                                                                       (ExpValue ()
                                                                                                                                                 (262:24)-(262:26)
                                                                                                                                                 (ValVariable "oow"))
                                                                                                                                       (AList ()
                                                                                                                                              (262:28)-(262:36)
                                                                                                                                              [IxSingle ()
                                                                                                                                                        (262:28)-(262:36)
                                                                                                                                                        Nothing
                                                                                                                                                        (ExpBinary ()
                                                                                                                                                                   (262:28)-(262:36)
                                                                                                                                                                   Addition
                                                                                                                                                                   (ExpValue ()
                                                                                                                                                                             (262:28)-(262:30)
                                                                                                                                                                             (ValVariable "oot"))
                                                                                                                                                                   (ExpValue ()
                                                                                                                                                                             (262:32)-(262:36)
                                                                                                                                                                             (ValVariable "rlist")))])))
                                                                                                              (ExpValue ()
                                                                                                                        (262:39)-(262:39)
                                                                                                                        (ValInteger "1"
                                                                                                                                    Nothing)))]))
                                                                    (ExpValue ()
                                                                              (262:46)-(262:50)
                                                                              (ValVariable "nlist"))]
                                                    [[BlStatement ()
                                                                  (263:17)-(263:30)
                                                                  Nothing
                                                                  (StExpressionAssign ()
                                                                                      (263:17)-(263:30)
                                                                                      (ExpValue ()
                                                                                                (263:17)-(263:21)
                                                                                                (ValVariable "nlist"))
                                                                                      (ExpBinary ()
                                                                                                 (263:23)-(263:30)
                                                                                                 Addition
                                                                                                 (ExpValue ()
                                                                                                           (263:23)-(263:27)
                                                                                                           (ValVariable "nlist"))
                                                                                                 (ExpValue ()
                                                                                                           (263:29)-(263:30)
                                                                                                           (ValInteger "10"
                                                                                                                       Nothing)))),
                                                      BlComment ()
                                                                (264:1)-(264:28)
                                                                (Comment "               segadj,rlist"),
                                                      BlStatement ()
                                                                  (265:7)-(265:17)
                                                                  Nothing
                                                                  (StExpressionAssign ()
                                                                                      (265:7)-(265:17)
                                                                                      (ExpSubscript ()
                                                                                                    (265:7)-(265:11)
                                                                                                    (ExpValue ()
                                                                                                              (265:7)-(265:8)
                                                                                                              (ValVariable "oo"))
                                                                                                    (AList ()
                                                                                                           (265:10)-(265:10)
                                                                                                           [IxSingle ()
                                                                                                                     (265:10)-(265:10)
                                                                                                                     Nothing
                                                                                                                     (ExpValue ()
                                                                                                                               (265:10)-(265:10)
                                                                                                                               (ValInteger "1"
                                                                                                                                           Nothing))]))
                                                                                      (ExpValue ()
                                                                                                (265:13)-(265:17)
                                                                                                (ValInteger "40032"
                                                                                                            Nothing))),
                                                      BlStatement ()
                                                                  (266:7)-(266:14)
                                                                  Nothing
                                                                  (StExpressionAssign ()
                                                                                      (266:7)-(266:14)
                                                                                      (ExpSubscript ()
                                                                                                    (266:7)-(266:11)
                                                                                                    (ExpValue ()
                                                                                                              (266:7)-(266:8)
                                                                                                              (ValVariable "oo"))
                                                                                                    (AList ()
                                                                                                           (266:10)-(266:10)
                                                                                                           [IxSingle ()
                                                                                                                     (266:10)-(266:10)
                                                                                                                     Nothing
                                                                                                                     (ExpValue ()
                                                                                                                               (266:10)-(266:10)
                                                                                                                               (ValInteger "2"
                                                                                                                                           Nothing))]))
                                                                                      (ExpValue ()
                                                                                                (266:13)-(266:14)
                                                                                                (ValInteger "32"
                                                                                                            Nothing))),
                                                      BlStatement ()
                                                                  (267:7)-(267:13)
                                                                  Nothing
                                                                  (StExpressionAssign ()
                                                                                      (267:7)-(267:13)
                                                                                      (ExpSubscript ()
                                                                                                    (267:7)-(267:11)
                                                                                                    (ExpValue ()
                                                                                                              (267:7)-(267:8)
                                                                                                              (ValVariable "oo"))
                                                                                                    (AList ()
                                                                                                           (267:10)-(267:10)
                                                                                                           [IxSingle ()
                                                                                                                     (267:10)-(267:10)
                                                                                                                     Nothing
                                                                                                                     (ExpValue ()
                                                                                                                               (267:10)-(267:10)
                                                                                                                               (ValInteger "3"
                                                                                                                                           Nothing))]))
                                                                                      (ExpValue ()
                                                                                                (267:13)-(267:13)
                                                                                                (ValInteger "1"
                                                                                                            Nothing))),
                                                      BlStatement ()
                                                                  (268:7)-(268:13)
                                                                  Nothing
                                                                  (StExpressionAssign ()
                                                                                      (268:7)-(268:13)
                                                                                      (ExpSubscript ()
                                                                                                    (268:7)-(268:11)
                                                                                                    (ExpValue ()
                                                                                                              (268:7)-(268:8)
                                                                                                              (ValVariable "oo"))
                                                                                                    (AList ()
                                                                                                           (268:10)-(268:10)
                                                                                                           [IxSingle ()
                                                                                                                     (268:10)-(268:10)
                                                                                                                     Nothing
                                                                                                                     (ExpValue ()
                                                                                                                               (268:10)-(268:10)
                                                                                                                               (ValInteger "4"
                                                                                                                                           Nothing))]))
                                                                                      (ExpValue ()
                                                                                                (268:13)-(268:13)
                                                                                                (ValInteger "3"
                                                                                                            Nothing))),
                                                      BlStatement ()
                                                                  (269:7)-(269:13)
                                                                  Nothing
                                                                  (StExpressionAssign ()
                                                                                      (269:7)-(269:13)
                                                                                      (ExpSubscript ()
                                                                                                    (269:7)-(269:11)
                                                                                                    (ExpValue ()
                                                                                                              (269:7)-(269:8)
                                                                                                              (ValVariable "oo"))
                                                                                                    (AList ()
                                                                                                           (269:10)-(269:10)
                                                                                                           [IxSingle ()
                                                                                                                     (269:10)-(269:10)
                                                                                                                     Nothing
                                                                                                                     (ExpValue ()
                                                                                                                               (269:10)-(269:10)
                                                                                                                               (ValInteger "5"
                                                                                                                                           Nothing))]))
                                                                                      (ExpValue ()
                                                                                                (269:13)-(269:13)
                                                                                                (ValInteger "2"
                                                                                                            Nothing))),
                                                      BlStatement ()
                                                                  (270:7)-(270:17)
                                                                  Nothing
                                                                  (StExpressionAssign ()
                                                                                      (270:7)-(270:17)
                                                                                      (ExpSubscript ()
                                                                                                    (270:7)-(270:11)
                                                                                                    (ExpValue ()
                                                                                                              (270:7)-(270:8)
                                                                                                              (ValVariable "oo"))
                                                                                                    (AList ()
                                                                                                           (270:10)-(270:10)
                                                                                                           [IxSingle ()
                                                                                                                     (270:10)-(270:10)
                                                                                                                     Nothing
                                                                                                                     (ExpValue ()
                                                                                                                               (270:10)-(270:10)
                                                                                                                               (ValInteger "6"
                                                                                                                                           Nothing))]))
                                                                                      (ExpValue ()
                                                                                                (270:13)-(270:17)
                                                                                                (ValVariable "nlist"))),
                                                      BlStatement ()
                                                                  (271:7)-(271:15)
                                                                  Nothing
                                                                  (StExpressionAssign ()
                                                                                      (271:7)-(271:15)
                                                                                      (ExpValue ()
                                                                                                (271:7)-(271:9)
                                                                                                (ValVariable "oo1"))
                                                                                      (ExpValue ()
                                                                                                (271:11)-(271:15)
                                                                                                (ValVariable "rlist"))),
                                                      BlStatement ()
                                                                  (272:7)-(272:57)
                                                                  Nothing
                                                                  (StCall ()
                                                                          (272:7)-(272:57)
                                                                          (ExpValue ()
                                                                                    (272:11)-(272:16)
                                                                                    (ValVariable "ooowad"))
                                                                          (Just AList ()
                                                                                      (272:17)-(272:57)
                                                                                      [Argument ()
                                                                                                (272:18)-(272:20)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (272:18)-(272:20)
                                                                                                                   (ValVariable "oo4"))),
                                                                                       Argument ()
                                                                                                (272:22)-(272:22)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (272:22)-(272:22)
                                                                                                                   (ValInteger "0"
                                                                                                                               Nothing))),
                                                                                       Argument ()
                                                                                                (272:24)-(272:42)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (272:24)-(272:42)
                                                                                                                   (ValString "STGBRK 133 RLIST "))),
                                                                                       Argument ()
                                                                                                (272:44)-(272:46)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (272:44)-(272:46)
                                                                                                                   (ValVariable "oo1"))),
                                                                                       Argument ()
                                                                                                (272:48)-(272:48)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (272:48)-(272:48)
                                                                                                                   (ValInteger "2"
                                                                                                                               Nothing))),
                                                                                       Argument ()
                                                                                                (272:50)-(272:54)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpSubscript ()
                                                                                                                       (272:50)-(272:54)
                                                                                                                       (ExpValue ()
                                                                                                                                 (272:50)-(272:51)
                                                                                                                                 (ValVariable "oo"))
                                                                                                                       (AList ()
                                                                                                                              (272:53)-(272:53)
                                                                                                                              [IxSingle ()
                                                                                                                                        (272:53)-(272:53)
                                                                                                                                        Nothing
                                                                                                                                        (ExpValue ()
                                                                                                                                                  (272:53)-(272:53)
                                                                                                                                                  (ValInteger "1"
                                                                                                                                                              Nothing))]))),
                                                                                       Argument ()
                                                                                                (272:56)-(272:56)
                                                                                                Nothing
                                                                                                (ArgExpr (ExpValue ()
                                                                                                                   (272:56)-(272:56)
                                                                                                                   (ValInteger "1"
                                                                                                                               Nothing)))]))]]
                                                    Nothing,
                                               BlComment ()
                                                         (274:1)-(274:41)
                                                         (Comment "             rlist.elist(rlist.ilist)=ms"),
                                               BlStatement ()
                                                           (275:7)-(275:70)
                                                           Nothing
                                                           (StExpressionAssign ()
                                                                               (275:7)-(275:70)
                                                                               (ExpSubscript ()
                                                                                             (275:7)-(275:67)
                                                                                             (ExpValue ()
                                                                                                       (275:7)-(275:12)
                                                                                                       (ValVariable "oo_013"))
                                                                                             (AList ()
                                                                                                    (275:14)-(275:66)
                                                                                                    [IxSingle ()
                                                                                                              (275:14)-(275:66)
                                                                                                              Nothing
                                                                                                              (ExpBinary ()
                                                                                                                         (275:14)-(275:66)
                                                                                                                         Addition
                                                                                                                         (ExpBinary ()
                                                                                                                                    (275:14)-(275:35)
                                                                                                                                    Addition
                                                                                                                                    (ExpBinary ()
                                                                                                                                               (275:14)-(275:33)
                                                                                                                                               Addition
                                                                                                                                               (ExpUnary ()
                                                                                                                                                         (275:14)-(275:18)
                                                                                                                                                         Minus
                                                                                                                                                         (ExpValue ()
                                                                                                                                                                   (275:15)-(275:18)
                                                                                                                                                                   (ValInteger "0026"
                                                                                                                                                                               Nothing)))
                                                                                                                                               (ExpSubscript ()
                                                                                                                                                             (275:20)-(275:33)
                                                                                                                                                             (ExpValue ()
                                                                                                                                                                       (275:20)-(275:22)
                                                                                                                                                                       (ValVariable "oow"))
                                                                                                                                                             (AList ()
                                                                                                                                                                    (275:24)-(275:32)
                                                                                                                                                                    [IxSingle ()
                                                                                                                                                                              (275:24)-(275:32)
                                                                                                                                                                              Nothing
                                                                                                                                                                              (ExpBinary ()
                                                                                                                                                                                         (275:24)-(275:32)
                                                                                                                                                                                         Addition
                                                                                                                                                                                         (ExpValue ()
                                                                                                                                                                                                   (275:24)-(275:26)
                                                                                                                                                                                                   (ValVariable "oot"))
                                                                                                                                                                                         (ExpValue ()
                                                                                                                                                                                                   (275:28)-(275:32)
                                                                                                                                                                                                   (ValVariable "rlist")))])))
                                                                                                                                    (ExpValue ()
                                                                                                                                              (275:35)-(275:35)
                                                                                                                                              (ValInteger "2"
                                                                                                                                                          Nothing)))
                                                                                                                         (ExpSubscript ()
                                                                                                                                       (275:37)-(275:66)
                                                                                                                                       (ExpValue ()
                                                                                                                                                 (275:37)-(275:42)
                                                                                                                                                 (ValVariable "oo_002"))
                                                                                                                                       (AList ()
                                                                                                                                              (275:44)-(275:65)
                                                                                                                                              [IxSingle ()
                                                                                                                                                        (275:44)-(275:65)
                                                                                                                                                        Nothing
                                                                                                                                                        (ExpBinary ()
                                                                                                                                                                   (275:44)-(275:65)
                                                                                                                                                                   Addition
                                                                                                                                                                   (ExpBinary ()
                                                                                                                                                                              (275:44)-(275:63)
                                                                                                                                                                              Addition
                                                                                                                                                                              (ExpUnary ()
                                                                                                                                                                                        (275:44)-(275:48)
                                                                                                                                                                                        Minus
                                                                                                                                                                                        (ExpValue ()
                                                                                                                                                                                                  (275:45)-(275:48)
                                                                                                                                                                                                  (ValInteger "0004"
                                                                                                                                                                                                              Nothing)))
                                                                                                                                                                              (ExpSubscript ()
                                                                                                                                                                                            (275:50)-(275:63)
                                                                                                                                                                                            (ExpValue ()
                                                                                                                                                                                                      (275:50)-(275:52)
                                                                                                                                                                                                      (ValVariable "oow"))
                                                                                                                                                                                            (AList ()
                                                                                                                                                                                                   (275:54)-(275:62)
                                                                                                                                                                                                   [IxSingle ()
                                                                                                                                                                                                             (275:54)-(275:62)
                                                                                                                                                                                                             Nothing
                                                                                                                                                                                                             (ExpBinary ()
                                                                                                                                                                                                                        (275:54)-(275:62)
                                                                                                                                                                                                                        Addition
                                                                                                                                                                                                                        (ExpValue ()
                                                                                                                                                                                                                                  (275:54)-(275:56)
                                                                                                                                                                                                                                  (ValVariable "oot"))
                                                                                                                                                                                                                        (ExpValue ()
                                                                                                                                                                                                                                  (275:58)-(275:62)
                                                                                                                                                                                                                                  (ValVariable "rlist")))])))
                                                                                                                                                                   (ExpValue ()
                                                                                                                                                                             (275:65)-(275:65)
                                                                                                                                                                             (ValInteger "1"
                                                                                                                                                                                         Nothing)))])))]))
                                                                               (ExpValue ()
                                                                                         (275:69)-(275:70)
                                                                                         (ValVariable "ms"))),
                                               BlComment ()
                                                         (276:1)-(276:1)
                                                         (Comment ""),
                                               BlComment ()
                                                         (277:1)-(277:54)
                                                         (Comment "             //si possible, decouper prochain morceau"),
                                               BlStatement ()
                                                           (278:15)-(278:32)
                                                           Nothing
                                                           (StExpressionAssign ()
                                                                               (278:15)-(278:32)
                                                                               (ExpValue ()
                                                                                         (278:15)-(278:19)
                                                                                         (ValVariable "first"))
                                                                               (ExpBinary ()
                                                                                          (278:21)-(278:32)
                                                                                          Addition
                                                                                          (ExpBinary ()
                                                                                                     (278:21)-(278:30)
                                                                                                     Addition
                                                                                                     (ExpValue ()
                                                                                                               (278:21)-(278:25)
                                                                                                               (ValVariable "mlast"))
                                                                                                     (ExpValue ()
                                                                                                               (278:27)-(278:30)
                                                                                                               (ValVariable "lmin")))
                                                                                          (ExpValue ()
                                                                                                    (278:32)-(278:32)
                                                                                                    (ValInteger "1"
                                                                                                                Nothing)))),
                                               BlStatement ()
                                                           (279:15)-(279:39)
                                                           Nothing
                                                           (StIfLogical ()
                                                                        (279:15)-(279:39)
                                                                        (ExpBinary ()
                                                                                   (279:18)-(279:30)
                                                                                   LTE
                                                                                   (ExpValue ()
                                                                                             (279:18)-(279:22)
                                                                                             (ValVariable "first"))
                                                                                   (ExpValue ()
                                                                                             (279:27)-(279:30)
                                                                                             (ValVariable "last")))
                                                                        (StGotoUnconditional ()
                                                                                             (279:32)-(279:39)
                                                                                             (ExpValue ()
                                                                                                       (279:37)-(279:39)
                                                                                                       (ValInteger "100"
                                                                                                                   Nothing))))]]
                                             Nothing,
                                        BlComment ()
                                                  (281:1)-(281:1)
                                                  (Comment ""),
                                        BlComment ()
                                                  (282:1)-(282:42)
                                                  (Comment "         //fin repeter \"decouper morceau\"")]]
                                      Nothing,
                                 BlComment () (284:1)-(284:1) (Comment ""),
                                 BlComment ()
                                           (285:1)-(285:17)
                                           (Comment "       segdes,xs"),
                                 BlStatement ()
                                             (286:7)-(286:12)
                                             Nothing
                                             (StExpressionAssign ()
                                                                 (286:7)-(286:12)
                                                                 (ExpValue ()
                                                                           (286:7)-(286:9)
                                                                           (ValVariable "oo1"))
                                                                 (ExpValue ()
                                                                           (286:11)-(286:12)
                                                                           (ValVariable "xs"))),
                                 BlStatement ()
                                             (287:7)-(287:46)
                                             Nothing
                                             (StCall ()
                                                     (287:7)-(287:46)
                                                     (ExpValue ()
                                                               (287:11)-(287:16)
                                                               (ValVariable "ooowde"))
                                                     (Just AList ()
                                                                 (287:17)-(287:46)
                                                                 [Argument ()
                                                                           (287:18)-(287:20)
                                                                           Nothing
                                                                           (ArgExpr (ExpValue ()
                                                                                              (287:18)-(287:20)
                                                                                              (ValVariable "oo4"))),
                                                                  Argument ()
                                                                           (287:22)-(287:22)
                                                                           Nothing
                                                                           (ArgExpr (ExpValue ()
                                                                                              (287:22)-(287:22)
                                                                                              (ValInteger "0"
                                                                                                          Nothing))),
                                                                  Argument ()
                                                                           (287:24)-(287:39)
                                                                           Nothing
                                                                           (ArgExpr (ExpValue ()
                                                                                              (287:24)-(287:39)
                                                                                              (ValString "STGBRK 141 XS "))),
                                                                  Argument ()
                                                                           (287:41)-(287:43)
                                                                           Nothing
                                                                           (ArgExpr (ExpValue ()
                                                                                              (287:41)-(287:43)
                                                                                              (ValVariable "oo1"))),
                                                                  Argument ()
                                                                           (287:45)-(287:45)
                                                                           Nothing
                                                                           (ArgExpr (ExpValue ()
                                                                                              (287:45)-(287:45)
                                                                                              (ValInteger "1"
                                                                                                          Nothing)))])),
                                 BlComment ()
                                           (288:1)-(288:11)
                                           (Comment "     enddo")]
                                (Just ExpValue ()
                                               (289:1)-(289:5)
                                               (ValInteger "99001" Nothing)),
                           BlComment ()
                                     (290:1)-(290:44)
                                     (Comment "     //fin repeter \"decouper chaque chaine\""),
                           BlComment () (291:1)-(291:1) (Comment ""),
                           BlComment ()
                                     (292:1)-(292:18)
                                     (Comment "     segdes,alist"),
                           BlStatement ()
                                       (293:7)-(293:15)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (293:7)-(293:15)
                                                           (ExpValue ()
                                                                     (293:7)-(293:9)
                                                                     (ValVariable "oo1"))
                                                           (ExpValue ()
                                                                     (293:11)-(293:15)
                                                                     (ValVariable "alist"))),
                           BlStatement ()
                                       (294:7)-(294:49)
                                       Nothing
                                       (StCall ()
                                               (294:7)-(294:49)
                                               (ExpValue ()
                                                         (294:11)-(294:16)
                                                         (ValVariable "ooowde"))
                                               (Just AList ()
                                                           (294:17)-(294:49)
                                                           [Argument ()
                                                                     (294:18)-(294:20)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (294:18)-(294:20)
                                                                                        (ValVariable "oo4"))),
                                                            Argument ()
                                                                     (294:22)-(294:22)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (294:22)-(294:22)
                                                                                        (ValInteger "0"
                                                                                                    Nothing))),
                                                            Argument ()
                                                                     (294:24)-(294:42)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (294:24)-(294:42)
                                                                                        (ValString "STGBRK 144 ALIST "))),
                                                            Argument ()
                                                                     (294:44)-(294:46)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (294:44)-(294:46)
                                                                                        (ValVariable "oo1"))),
                                                            Argument ()
                                                                     (294:48)-(294:48)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (294:48)-(294:48)
                                                                                        (ValInteger "1"
                                                                                                    Nothing)))])),
                           BlComment ()
                                     (295:1)-(295:19)
                                     (Comment "     segdes,splist"),
                           BlStatement ()
                                       (296:7)-(296:16)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (296:7)-(296:16)
                                                           (ExpValue ()
                                                                     (296:7)-(296:9)
                                                                     (ValVariable "oo1"))
                                                           (ExpValue ()
                                                                     (296:11)-(296:16)
                                                                     (ValVariable "splist"))),
                           BlStatement ()
                                       (297:7)-(297:50)
                                       Nothing
                                       (StCall ()
                                               (297:7)-(297:50)
                                               (ExpValue ()
                                                         (297:11)-(297:16)
                                                         (ValVariable "ooowde"))
                                               (Just AList ()
                                                           (297:17)-(297:50)
                                                           [Argument ()
                                                                     (297:18)-(297:20)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (297:18)-(297:20)
                                                                                        (ValVariable "oo4"))),
                                                            Argument ()
                                                                     (297:22)-(297:22)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (297:22)-(297:22)
                                                                                        (ValInteger "0"
                                                                                                    Nothing))),
                                                            Argument ()
                                                                     (297:24)-(297:43)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (297:24)-(297:43)
                                                                                        (ValString "STGBRK 146 SPLIST "))),
                                                            Argument ()
                                                                     (297:45)-(297:47)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (297:45)-(297:47)
                                                                                        (ValVariable "oo1"))),
                                                            Argument ()
                                                                     (297:49)-(297:49)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (297:49)-(297:49)
                                                                                        (ValInteger "1"
                                                                                                    Nothing)))])),
                           BlComment ()
                                     (298:1)-(298:18)
                                     (Comment "     segdes,rlist"),
                           BlStatement ()
                                       (299:7)-(299:15)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (299:7)-(299:15)
                                                           (ExpValue ()
                                                                     (299:7)-(299:9)
                                                                     (ValVariable "oo1"))
                                                           (ExpValue ()
                                                                     (299:11)-(299:15)
                                                                     (ValVariable "rlist"))),
                           BlStatement ()
                                       (300:7)-(300:49)
                                       Nothing
                                       (StCall ()
                                               (300:7)-(300:49)
                                               (ExpValue ()
                                                         (300:11)-(300:16)
                                                         (ValVariable "ooowde"))
                                               (Just AList ()
                                                           (300:17)-(300:49)
                                                           [Argument ()
                                                                     (300:18)-(300:20)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (300:18)-(300:20)
                                                                                        (ValVariable "oo4"))),
                                                            Argument ()
                                                                     (300:22)-(300:22)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (300:22)-(300:22)
                                                                                        (ValInteger "0"
                                                                                                    Nothing))),
                                                            Argument ()
                                                                     (300:24)-(300:42)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (300:24)-(300:42)
                                                                                        (ValString "STGBRK 148 RLIST "))),
                                                            Argument ()
                                                                     (300:44)-(300:46)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (300:44)-(300:46)
                                                                                        (ValVariable "oo1"))),
                                                            Argument ()
                                                                     (300:48)-(300:48)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (300:48)-(300:48)
                                                                                        (ValInteger "1"
                                                                                                    Nothing)))])),
                           BlStatement ()
                                       (301:7)-(301:12)
                                       Nothing
                                       (StReturn () (301:7)-(301:12) Nothing)]
                          Nothing]
'
]

{ #category : #'tests - todo' }
PP2FortranSrcGrammarTest class >> valrmaAst [

	^ 'ProgramFile (MetaInfo
                     {miVersion = Fortran77,
                      miFilename = "/Users/Younoussa/Documents/demoparser/valrma.f"})
            [PUSubroutine ()
                          (1:7)-(111:9)
                          (Nothing, Nothing)
                          "valrma"
                          (Just AList ()
                                      (2:8)-(3:13)
                                      [ExpValue ()
                                                (2:8)-(2:11)
                                                (ValVariable "pval"),
                                       ExpValue ()
                                                (3:8)-(3:13)
                                                (ValVariable "status")])
                          [BlComment ()
                                     (4:1)-(4:72)
                                     (Comment " xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
                           BlComment ()
                                     (5:1)-(5:39)
                                     (Comment "b  subroutine : valrma (langage esope)"),
                           BlComment ()
                                     (6:1)-(6:23)
                                     (Comment "b  module     : vector"),
                           BlComment ()
                                     (7:1)-(7:25)
                                     (Comment "b  auteur     : l.brault"),
                           BlComment ()
                                     (8:1)-(8:29)
                                     (Comment "b  date       : octobre-2000"),
                           BlComment ()
                                     (9:1)-(9:22)
                                     (Comment "b  service    : epdn "),
                           BlComment ()
                                     (10:1)-(10:67)
                                     (Comment "b  but        : effacer toutes les valeurs d''un conteneur \"values\""),
                           BlComment ()
                                     (11:1)-(11:72)
                                     (Comment " xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
                           BlComment () (12:1)-(12:1) (Comment ""),
                           BlComment ()
                                     (13:1)-(13:35)
                                     (Comment "as  pval   : un conteneur \"values\""),
                           BlComment ()
                                     (14:1)-(14:54)
                                     (Comment "as  status : status d''execution (status=0 <=> succes)"),
                           BlComment () (15:1)-(15:1) (Comment ""),
                           BlComment () (16:1)-(16:1) (Comment ""),
                           BlComment ()
                                     (17:1)-(17:62)
                                     (Comment " fichier a inclure dans tout source pacome, esope ou fortran."),
                           BlComment () (18:1)-(18:1) (Comment ""),
                           BlComment ()
                                     (19:1)-(19:38)
                                     (Comment " utilisation lors de la compilation :"),
                           BlComment () (20:1)-(20:1) (Comment ""),
                           BlComment ()
                                     (21:1)-(21:18)
                                     (Comment " source fortran :"),
                           BlComment ()
                                     (22:1)-(22:57)
                                     (Comment "  f77 -dfortran -c -i{repertoires d''inclusion} fichier.f"),
                           BlComment () (23:1)-(23:1) (Comment ""),
                           BlComment ()
                                     (24:1)-(24:16)
                                     (Comment " source esope :"),
                           BlComment ()
                                     (25:1)-(25:59)
                                     (Comment "  cpp -p -i{repertoires d''inclusion} fichier.e > fichier.e"),
                           BlComment () (26:1)-(26:1) (Comment ""),
                           BlComment ()
                                     (27:1)-(27:40)
                                     (Comment " source fortran et esope pour le cray :"),
                           BlComment ()
                                     (28:1)-(28:77)
                                     (Comment "  cpp -dcray -i{repertoires d''inclusion} fichier.[f,e] > fichier_source_cray"),
                           BlComment () (29:1)-(29:1) (Comment ""),
                           BlComment ()
                                     (30:1)-(30:24)
                                     (Comment "  auteur  : l.caramelle"),
                           BlComment ()
                                     (31:1)-(31:29)
                                     (Comment "  service : serlog systemes."),
                           BlComment ()
                                     (32:1)-(32:22)
                                     (Comment "  date    : 28/03/93."),
                           BlComment () (33:1)-(33:1) (Comment ""),
                           BlComment () (34:1)-(34:1) (Comment ""),
                           BlComment ()
                                     (35:1)-(35:23)
                                     (Comment "  modif   : g.martinez"),
                           BlComment ()
                                     (36:1)-(36:18)
                                     (Comment "  service : epnc."),
                           BlComment ()
                                     (37:1)-(37:22)
                                     (Comment "  date    : 24/08/95."),
                           BlComment ()
                                     (38:1)-(38:30)
                                     (Comment "  sujet   : portage sur cray."),
                           BlComment () (39:1)-(39:1) (Comment ""),
                           BlComment ()
                                     (40:1)-(40:20)
                                     (Comment "  modif   : m.ponce"),
                           BlComment ()
                                     (41:1)-(41:31)
                                     (Comment "            (origine l.brault)"),
                           BlComment ()
                                     (42:1)-(42:17)
                                     (Comment "  service : epdn"),
                           BlComment ()
                                     (43:1)-(43:23)
                                     (Comment "  date    : 19/07/2000"),
                           BlComment ()
                                     (44:1)-(44:32)
                                     (Comment "  sujet   : implicit_h_included"),
                           BlComment () (45:1)-(45:1) (Comment ""),
                           BlStatement ()
                                       (48:7)-(48:28)
                                       Nothing
                                       (StImplicit ()
                                                   (48:7)-(48:28)
                                                   (Just AList ()
                                                               (48:16)-(48:28)
                                                               [ImpList ()
                                                                        (48:16)-(48:28)
                                                                        (TypeSpec ()
                                                                                  (48:16)-(48:22)
                                                                                  TypeLogical
                                                                                  Nothing)
                                                                        (AList ()
                                                                               (48:25)-(48:27)
                                                                               [ImpRange ()
                                                                                         (48:25)-(48:27)
                                                                                         "a"
                                                                                         "z"])])),
                           BlComment () (50:1)-(50:1) (Comment ""),
                           BlComment ()
                                     (51:1)-(51:51)
                                     (Comment " values      : valeurs sur un type de base gibiane"),
                           BlComment ()
                                     (52:1)-(52:61)
                                     (Comment " valtyp      : type dans {flottant, entier, logique, chaine}"),
                           BlComment ()
                                     (53:1)-(53:30)
                                     (Comment " valf(valnf) : valnf flottant"),
                           BlComment ()
                                     (54:1)-(54:28)
                                     (Comment " vale(valne) : valne entier"),
                           BlComment ()
                                     (55:1)-(55:29)
                                     (Comment " vall(valnl) : valnl logique"),
                           BlComment ()
                                     (56:1)-(56:28)
                                     (Comment " valc(valnc) : valnc chaine"),
                           BlComment ()
                                     (57:1)-(57:39)
                                     (Comment " vals(valnc) : valnc tailles de chaine"),
                           BlComment ()
                                     (58:1)-(58:45)
                                     (Comment " valsmx      : maximum des tailles de chaine"),
                           BlComment () (59:1)-(59:1) (Comment ""),
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
                                                                                   (ValVariable "valnf"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment () (61:1)-(61:1) (Comment ""),
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
                                                                                   (ValVariable "valne"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment () (63:1)-(63:1) (Comment ""),
                           BlStatement ()
                                       (64:7)-(64:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (64:7)-(64:19)
                                                      (TypeSpec ()
                                                                (64:7)-(64:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (64:15)-(64:19)
                                                             [Declarator ()
                                                                         (64:15)-(64:19)
                                                                         (ExpValue ()
                                                                                   (64:15)-(64:19)
                                                                                   (ValVariable "valnl"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment () (65:1)-(65:1) (Comment ""),
                           BlStatement ()
                                       (66:7)-(66:19)
                                       Nothing
                                       (StDeclaration ()
                                                      (66:7)-(66:19)
                                                      (TypeSpec ()
                                                                (66:7)-(66:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (66:15)-(66:19)
                                                             [Declarator ()
                                                                         (66:15)-(66:19)
                                                                         (ExpValue ()
                                                                                   (66:15)-(66:19)
                                                                                   (ValVariable "valnc"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment () (67:1)-(67:1) (Comment ""),
                           BlStatement ()
                                       (68:7)-(68:20)
                                       Nothing
                                       (StDeclaration ()
                                                      (68:7)-(68:20)
                                                      (TypeSpec ()
                                                                (68:7)-(68:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (68:15)-(68:20)
                                                             [Declarator ()
                                                                         (68:15)-(68:20)
                                                                         (ExpValue ()
                                                                                   (68:15)-(68:20)
                                                                                   (ValVariable "valsmx"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment () (69:1)-(69:1) (Comment ""),
                           BlComment ()
                                     (70:1)-(70:20)
                                     (Comment "eso  segment,values"),
                           BlComment ()
                                     (71:1)-(71:33)
                                     (Comment "eso    character*8        valtyp"),
                           BlComment ()
                                     (72:1)-(72:38)
                                     (Comment "eso    real               valf(valnf)"),
                           BlComment ()
                                     (73:1)-(73:38)
                                     (Comment "eso    integer            vale(valne)"),
                           BlComment ()
                                     (74:1)-(74:38)
                                     (Comment "eso    logical            vall(valnl)"),
                           BlComment ()
                                     (75:1)-(75:38)
                                     (Comment "eso    character*(valsmx) valc(valnc)"),
                           BlComment ()
                                     (76:1)-(76:38)
                                     (Comment "eso    integer            vals(valnc)"),
                           BlComment ()
                                     (77:1)-(77:16)
                                     (Comment "eso  endsegment"),
                           BlComment () (78:1)-(78:1) (Comment ""),
                           BlComment ()
                                     (79:1)-(79:31)
                                     (Comment "eso  pointeur      pval.values"),
                           BlStatement ()
                                       (80:7)-(80:26)
                                       Nothing
                                       (StDeclaration ()
                                                      (80:7)-(80:26)
                                                      (TypeSpec ()
                                                                (80:7)-(80:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (80:21)-(80:26)
                                                             [Declarator ()
                                                                         (80:21)-(80:26)
                                                                         (ExpValue ()
                                                                                   (80:21)-(80:26)
                                                                                   (ValVariable "status"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlComment () (81:1)-(81:1) (Comment ""),
                           BlStatement ()
                                       (82:7)-(82:14)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (82:7)-(82:14)
                                                           (ExpValue ()
                                                                     (82:7)-(82:12)
                                                                     (ValVariable "status"))
                                                           (ExpValue ()
                                                                     (82:14)-(82:14)
                                                                     (ValInteger "0"
                                                                                 Nothing))),
                           BlComment () (83:1)-(83:1) (Comment ""),
                           BlComment ()
                                     (84:1)-(84:37)
                                     (Comment "     -- ouvrir le conteneur \"values\""),
                           BlComment ()
                                     (85:1)-(85:17)
                                     (Comment "eso  segact,pval"),
                           BlStatement ()
                                       (86:7)-(86:38)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (86:7)-(86:38)
                                                           (ExpValue ()
                                                                     (86:7)-(86:11)
                                                                     (ValVariable "valnf"))
                                                           (ExpFunctionCall ()
                                                                            (86:14)-(86:38)
                                                                            (ExpValue ()
                                                                                      (86:14)-(86:18)
                                                                                      (ValVariable "esosl"))
                                                                            (Just AList ()
                                                                                        (86:20)-(86:37)
                                                                                        [Argument ()
                                                                                                  (86:20)-(86:35)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpFunctionCall ()
                                                                                                                            (86:20)-(86:35)
                                                                                                                            (ExpValue ()
                                                                                                                                      (86:20)-(86:24)
                                                                                                                                      (ValVariable "esoat"))
                                                                                                                            (Just AList ()
                                                                                                                                        (86:26)-(86:34)
                                                                                                                                        [Argument ()
                                                                                                                                                  (86:26)-(86:29)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (86:26)-(86:29)
                                                                                                                                                                     (ValVariable "pval"))),
                                                                                                                                         Argument ()
                                                                                                                                                  (86:31)-(86:34)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (86:31)-(86:34)
                                                                                                                                                                     (ValVariable "valf")))]))),
                                                                                         Argument ()
                                                                                                  (86:37)-(86:37)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (86:37)-(86:37)
                                                                                                                     (ValInteger "1"
                                                                                                                                 Nothing)))]))),
                           BlStatement ()
                                       (87:7)-(87:38)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (87:7)-(87:38)
                                                           (ExpValue ()
                                                                     (87:7)-(87:11)
                                                                     (ValVariable "valne"))
                                                           (ExpFunctionCall ()
                                                                            (87:14)-(87:38)
                                                                            (ExpValue ()
                                                                                      (87:14)-(87:18)
                                                                                      (ValVariable "esosl"))
                                                                            (Just AList ()
                                                                                        (87:20)-(87:37)
                                                                                        [Argument ()
                                                                                                  (87:20)-(87:35)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpFunctionCall ()
                                                                                                                            (87:20)-(87:35)
                                                                                                                            (ExpValue ()
                                                                                                                                      (87:20)-(87:24)
                                                                                                                                      (ValVariable "esoat"))
                                                                                                                            (Just AList ()
                                                                                                                                        (87:26)-(87:34)
                                                                                                                                        [Argument ()
                                                                                                                                                  (87:26)-(87:29)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (87:26)-(87:29)
                                                                                                                                                                     (ValVariable "pval"))),
                                                                                                                                         Argument ()
                                                                                                                                                  (87:31)-(87:34)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (87:31)-(87:34)
                                                                                                                                                                     (ValVariable "vale")))]))),
                                                                                         Argument ()
                                                                                                  (87:37)-(87:37)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (87:37)-(87:37)
                                                                                                                     (ValInteger "1"
                                                                                                                                 Nothing)))]))),
                           BlStatement ()
                                       (88:7)-(88:38)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (88:7)-(88:38)
                                                           (ExpValue ()
                                                                     (88:7)-(88:11)
                                                                     (ValVariable "valnl"))
                                                           (ExpFunctionCall ()
                                                                            (88:14)-(88:38)
                                                                            (ExpValue ()
                                                                                      (88:14)-(88:18)
                                                                                      (ValVariable "esosl"))
                                                                            (Just AList ()
                                                                                        (88:20)-(88:37)
                                                                                        [Argument ()
                                                                                                  (88:20)-(88:35)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpFunctionCall ()
                                                                                                                            (88:20)-(88:35)
                                                                                                                            (ExpValue ()
                                                                                                                                      (88:20)-(88:24)
                                                                                                                                      (ValVariable "esoat"))
                                                                                                                            (Just AList ()
                                                                                                                                        (88:26)-(88:34)
                                                                                                                                        [Argument ()
                                                                                                                                                  (88:26)-(88:29)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (88:26)-(88:29)
                                                                                                                                                                     (ValVariable "pval"))),
                                                                                                                                         Argument ()
                                                                                                                                                  (88:31)-(88:34)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (88:31)-(88:34)
                                                                                                                                                                     (ValVariable "vall")))]))),
                                                                                         Argument ()
                                                                                                  (88:37)-(88:37)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (88:37)-(88:37)
                                                                                                                     (ValInteger "1"
                                                                                                                                 Nothing)))]))),
                           BlStatement ()
                                       (89:7)-(89:38)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (89:7)-(89:38)
                                                           (ExpValue ()
                                                                     (89:7)-(89:11)
                                                                     (ValVariable "valnc"))
                                                           (ExpFunctionCall ()
                                                                            (89:14)-(89:38)
                                                                            (ExpValue ()
                                                                                      (89:14)-(89:18)
                                                                                      (ValVariable "esosl"))
                                                                            (Just AList ()
                                                                                        (89:20)-(89:37)
                                                                                        [Argument ()
                                                                                                  (89:20)-(89:35)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpFunctionCall ()
                                                                                                                            (89:20)-(89:35)
                                                                                                                            (ExpValue ()
                                                                                                                                      (89:20)-(89:24)
                                                                                                                                      (ValVariable "esoat"))
                                                                                                                            (Just AList ()
                                                                                                                                        (89:26)-(89:34)
                                                                                                                                        [Argument ()
                                                                                                                                                  (89:26)-(89:29)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (89:26)-(89:29)
                                                                                                                                                                     (ValVariable "pval"))),
                                                                                                                                         Argument ()
                                                                                                                                                  (89:31)-(89:34)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (89:31)-(89:34)
                                                                                                                                                                     (ValVariable "valc")))]))),
                                                                                         Argument ()
                                                                                                  (89:37)-(89:37)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (89:37)-(89:37)
                                                                                                                     (ValInteger "2"
                                                                                                                                 Nothing)))]))),
                           BlStatement ()
                                       (90:7)-(90:38)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (90:7)-(90:38)
                                                           (ExpValue ()
                                                                     (90:7)-(90:12)
                                                                     (ValVariable "valsmx"))
                                                           (ExpFunctionCall ()
                                                                            (90:14)-(90:38)
                                                                            (ExpValue ()
                                                                                      (90:14)-(90:18)
                                                                                      (ValVariable "esosl"))
                                                                            (Just AList ()
                                                                                        (90:20)-(90:37)
                                                                                        [Argument ()
                                                                                                  (90:20)-(90:35)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpFunctionCall ()
                                                                                                                            (90:20)-(90:35)
                                                                                                                            (ExpValue ()
                                                                                                                                      (90:20)-(90:24)
                                                                                                                                      (ValVariable "esoat"))
                                                                                                                            (Just AList ()
                                                                                                                                        (90:26)-(90:34)
                                                                                                                                        [Argument ()
                                                                                                                                                  (90:26)-(90:29)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (90:26)-(90:29)
                                                                                                                                                                     (ValVariable "pval"))),
                                                                                                                                         Argument ()
                                                                                                                                                  (90:31)-(90:34)
                                                                                                                                                  Nothing
                                                                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                                                                     (90:31)-(90:34)
                                                                                                                                                                     (ValVariable "valc")))]))),
                                                                                         Argument ()
                                                                                                  (90:37)-(90:37)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (90:37)-(90:37)
                                                                                                                     (ValInteger "1"
                                                                                                                                 Nothing)))]))),
                           BlComment () (91:1)-(91:1) (Comment ""),
                           BlComment ()
                                     (92:1)-(92:36)
                                     (Comment "     -- vider le conteneur \"values\""),
                           BlStatement ()
                                       (93:7)-(93:15)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (93:7)-(93:15)
                                                           (ExpValue ()
                                                                     (93:7)-(93:11)
                                                                     (ValVariable "valnf"))
                                                           (ExpValue ()
                                                                     (93:15)-(93:15)
                                                                     (ValInteger "0"
                                                                                 Nothing))),
                           BlStatement ()
                                       (94:7)-(94:15)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (94:7)-(94:15)
                                                           (ExpValue ()
                                                                     (94:7)-(94:11)
                                                                     (ValVariable "valne"))
                                                           (ExpValue ()
                                                                     (94:15)-(94:15)
                                                                     (ValInteger "0"
                                                                                 Nothing))),
                           BlStatement ()
                                       (95:7)-(95:15)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (95:7)-(95:15)
                                                           (ExpValue ()
                                                                     (95:7)-(95:11)
                                                                     (ValVariable "valnl"))
                                                           (ExpValue ()
                                                                     (95:15)-(95:15)
                                                                     (ValInteger "0"
                                                                                 Nothing))),
                           BlStatement ()
                                       (96:7)-(96:15)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (96:7)-(96:15)
                                                           (ExpValue ()
                                                                     (96:7)-(96:11)
                                                                     (ValVariable "valnc"))
                                                           (ExpValue ()
                                                                     (96:15)-(96:15)
                                                                     (ValInteger "0"
                                                                                 Nothing))),
                           BlStatement ()
                                       (97:7)-(97:15)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (97:7)-(97:15)
                                                           (ExpValue ()
                                                                     (97:7)-(97:12)
                                                                     (ValVariable "valsmx"))
                                                           (ExpValue ()
                                                                     (97:15)-(97:15)
                                                                     (ValInteger "0"
                                                                                 Nothing))),
                           BlComment ()
                                     (98:1)-(98:17)
                                     (Comment "eso  segadj,pval"),
                           BlComment () (99:1)-(99:1) (Comment ""),
                           BlComment ()
                                     (100:1)-(100:37)
                                     (Comment "     -- fermer le conteneur \"values\""),
                           BlComment ()
                                     (101:1)-(101:21)
                                     (Comment "eso  segdes,pval*mod"),
                           BlComment () (102:1)-(102:1) (Comment ""),
                           BlComment ()
                                     (103:1)-(103:35)
                                     (Comment "     -- terminer avec succes      "),
                           BlStatement ()
                                       (104:7)-(104:12)
                                       Nothing
                                       (StReturn () (104:7)-(104:12) Nothing),
                           BlComment () (105:1)-(105:1) (Comment ""),
                           BlComment ()
                                     (106:1)-(106:26)
                                     (Comment "     -- terminer en echec"),
                           BlStatement ()
                                       (107:2)-(107:14)
                                       (Just ExpValue ()
                                                      (107:2)-(107:4)
                                                      (ValInteger "999"
                                                                  Nothing))
                                       (StContinue () (107:7)-(107:14)),
                           BlStatement ()
                                       (108:7)-(108:19)
                                       Nothing
                                       (StCall ()
                                               (108:7)-(108:19)
                                               (ExpValue ()
                                                         (108:12)-(108:17)
                                                         (ValVariable "edmess"))
                                               (Just AList ()
                                                           (108:18)-(108:19)
                                                           [])),
                           BlStatement ()
                                       (109:7)-(109:14)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (109:7)-(109:14)
                                                           (ExpValue ()
                                                                     (109:7)-(109:12)
                                                                     (ValVariable "status"))
                                                           (ExpValue ()
                                                                     (109:14)-(109:14)
                                                                     (ValInteger "1"
                                                                                 Nothing))),
                           BlStatement ()
                                       (110:7)-(110:12)
                                       Nothing
                                       (StReturn () (110:7)-(110:12) Nothing)]
                          Nothing]
'
]

{ #category : #accessing }
PP2FortranSrcGrammarTest >> parserClass [
	^ PP2FortranSrcGrammar 
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

{ #category : #'tests - allnodes' }
PP2FortranSrcGrammarTest >> testFullFileStgbrk [

	self parse: self class stgbrkAst rule: #start
]

{ #category : #'tests - allnodes' }
PP2FortranSrcGrammarTest >> testFullFileValrma [

	self parse: self class valrmaAst rule: #start
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

{ #category : #'tests-programUnit' }
PP2FortranSrcGrammarTest >> testPuComment [

	self
		parse: 'PUComment  ()
	(4:1)-(4:19)
	(Comment "== entrees ==")'
		rule: #puComment
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
