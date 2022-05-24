Class {
	#name : #PP2FortranSrcGrammarTest,
	#superclass : #PP2CompositeNodeTest,
	#category : #'FortranSrc-Tests'
}

{ #category : #'tests - todo' }
PP2FortranSrcGrammarTest class >> haskellAst [

	^ 'ProgramFile (MetaInfo
                     {miVersion = Fortran77,
                      miFilename = "/tmp/toto/file.f"})
            [PUMain ()
                    (1:7)-(48:9)
                    (Just "main")
                    [BlComment ()
                               (3:1)-(3:72)
                               (Comment "*********************************************************************72"),
                     BlComment () (4:1)-(4:1) (Comment ""),
                     BlComment ()
                               (5:1)-(5:46)
                               (Comment "c main is the main program for big_ints_real."),
                     BlComment () (6:1)-(6:1) (Comment ""),
                     BlComment () (7:1)-(7:14) (Comment "  discussion:"),
                     BlComment () (8:1)-(8:1) (Comment ""),
                     BlComment ()
                               (9:1)-(9:76)
                               (Comment "    it''s easy to forget that computer numbers are not mathematical numbers."),
                     BlComment () (10:1)-(10:1) (Comment ""),
                     BlComment ()
                               (11:1)-(11:36)
                               (Comment "    there is a biggest real number."),
                     BlComment () (12:1)-(12:1) (Comment ""),
                     BlComment ()
                               (13:1)-(13:32)
                               (Comment "    there is a biggest integer."),
                     BlComment () (14:1)-(14:1) (Comment ""),
                     BlComment ()
                               (15:1)-(15:68)
                               (Comment "    there is a biggest integer that you can store as a real number."),
                     BlComment () (16:1)-(16:1) (Comment ""),
                     BlComment () (17:1)-(17:13) (Comment "  licensing:"),
                     BlComment () (18:1)-(18:1) (Comment ""),
                     BlComment ()
                               (19:1)-(19:57)
                               (Comment "    this code is distributed under the gnu lgpl license."),
                     BlComment () (20:1)-(20:1) (Comment ""),
                     BlComment () (21:1)-(21:12) (Comment "  modified:"),
                     BlComment () (22:1)-(22:1) (Comment ""),
                     BlComment ()
                               (23:1)-(23:22)
                               (Comment "    28 september 2014"),
                     BlComment () (24:1)-(24:1) (Comment ""),
                     BlComment () (25:1)-(25:10) (Comment "  author:"),
                     BlComment () (26:1)-(26:1) (Comment ""),
                     BlComment ()
                               (27:1)-(27:18)
                               (Comment "    john burkardt"),
                     BlComment () (28:1)-(28:1) (Comment ""),
                     BlStatement ()
                                 (29:7)-(29:19)
                                 Nothing
                                 (StImplicit () (29:7)-(29:19) Nothing),
                     BlStatement ()
                                 (31:7)-(31:24)
                                 Nothing
                                 (StCall ()
                                         (31:7)-(31:24)
                                         (ExpValue ()
                                                   (31:12)-(31:20)
                                                   (ValVariable "timestamp"))
                                         (Just AList () (31:22)-(31:24) [])),
                     BlStatement ()
                                 (32:7)-(32:27)
                                 Nothing
                                 (StWrite ()
                                          (32:7)-(32:27)
                                          (AList ()
                                                 (32:13)-(32:24)
                                                 [ControlPair ()
                                                              (32:15)-(32:15)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (32:15)-(32:15)
                                                                        ValStar),
                                                  ControlPair ()
                                                              (32:18)-(32:22)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (32:18)-(32:22)
                                                                        (ValString "(a)"))])
                                          (Just AList ()
                                                      (32:26)-(32:27)
                                                      [ExpValue ()
                                                                (32:26)-(32:27)
                                                                (ValString "")])),
                     BlStatement ()
                                 (33:7)-(33:41)
                                 Nothing
                                 (StWrite ()
                                          (33:7)-(33:41)
                                          (AList ()
                                                 (33:13)-(33:24)
                                                 [ControlPair ()
                                                              (33:15)-(33:15)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (33:15)-(33:15)
                                                                        ValStar),
                                                  ControlPair ()
                                                              (33:18)-(33:22)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (33:18)-(33:22)
                                                                        (ValString "(a)"))])
                                          (Just AList ()
                                                      (33:26)-(33:41)
                                                      [ExpValue ()
                                                                (33:26)-(33:41)
                                                                (ValString "BIG_INTS_REAL:")])),
                     BlStatement ()
                                 (34:7)-(34:46)
                                 Nothing
                                 (StWrite ()
                                          (34:7)-(34:46)
                                          (AList ()
                                                 (34:13)-(34:24)
                                                 [ControlPair ()
                                                              (34:15)-(34:15)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (34:15)-(34:15)
                                                                        ValStar),
                                                  ControlPair ()
                                                              (34:18)-(34:22)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (34:18)-(34:22)
                                                                        (ValString "(a)"))])
                                          (Just AList ()
                                                      (34:26)-(34:46)
                                                      [ExpValue ()
                                                                (34:26)-(34:46)
                                                                (ValString "  FORTRAN77 version")])),
                     BlStatement ()
                                 (35:7)-(35:68)
                                 Nothing
                                 (StWrite ()
                                          (35:7)-(35:68)
                                          (AList ()
                                                 (35:13)-(35:24)
                                                 [ControlPair ()
                                                              (35:15)-(35:15)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (35:15)-(35:15)
                                                                        ValStar),
                                                  ControlPair ()
                                                              (35:18)-(35:22)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (35:18)-(35:22)
                                                                        (ValString "(a)"))])
                                          (Just AList ()
                                                      (35:26)-(35:68)
                                                      [ExpValue ()
                                                                (35:26)-(35:68)
                                                                (ValString "  Storing big integers in real variables.")])),
                     BlStatement ()
                                 (37:7)-(37:21)
                                 Nothing
                                 (StCall ()
                                         (37:7)-(37:21)
                                         (ExpValue ()
                                                   (37:12)-(37:17)
                                                   (ValVariable "test01"))
                                         (Just AList () (37:19)-(37:21) [])),
                     BlComment () (38:1)-(38:1) (Comment ""),
                     BlComment () (39:1)-(39:13) (Comment "  terminate."),
                     BlComment () (40:1)-(40:1) (Comment ""),
                     BlStatement ()
                                 (41:7)-(41:27)
                                 Nothing
                                 (StWrite ()
                                          (41:7)-(41:27)
                                          (AList ()
                                                 (41:13)-(41:24)
                                                 [ControlPair ()
                                                              (41:15)-(41:15)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (41:15)-(41:15)
                                                                        ValStar),
                                                  ControlPair ()
                                                              (41:18)-(41:22)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (41:18)-(41:22)
                                                                        (ValString "(a)"))])
                                          (Just AList ()
                                                      (41:26)-(41:27)
                                                      [ExpValue ()
                                                                (41:26)-(41:27)
                                                                (ValString "")])),
                     BlStatement ()
                                 (42:7)-(42:41)
                                 Nothing
                                 (StWrite ()
                                          (42:7)-(42:41)
                                          (AList ()
                                                 (42:13)-(42:24)
                                                 [ControlPair ()
                                                              (42:15)-(42:15)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (42:15)-(42:15)
                                                                        ValStar),
                                                  ControlPair ()
                                                              (42:18)-(42:22)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (42:18)-(42:22)
                                                                        (ValString "(a)"))])
                                          (Just AList ()
                                                      (42:26)-(42:41)
                                                      [ExpValue ()
                                                                (42:26)-(42:41)
                                                                (ValString "BIG_INTS_REAL:")])),
                     BlStatement ()
                                 (43:7)-(43:53)
                                 Nothing
                                 (StWrite ()
                                          (43:7)-(43:53)
                                          (AList ()
                                                 (43:13)-(43:24)
                                                 [ControlPair ()
                                                              (43:15)-(43:15)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (43:15)-(43:15)
                                                                        ValStar),
                                                  ControlPair ()
                                                              (43:18)-(43:22)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (43:18)-(43:22)
                                                                        (ValString "(a)"))])
                                          (Just AList ()
                                                      (43:26)-(43:53)
                                                      [ExpValue ()
                                                                (43:26)-(43:53)
                                                                (ValString "  Normal end of execution.")])),
                     BlStatement ()
                                 (44:7)-(44:27)
                                 Nothing
                                 (StWrite ()
                                          (44:7)-(44:27)
                                          (AList ()
                                                 (44:13)-(44:24)
                                                 [ControlPair ()
                                                              (44:15)-(44:15)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (44:15)-(44:15)
                                                                        ValStar),
                                                  ControlPair ()
                                                              (44:18)-(44:22)
                                                              Nothing
                                                              (ExpValue ()
                                                                        (44:18)-(44:22)
                                                                        (ValString "(a)"))])
                                          (Just AList ()
                                                      (44:26)-(44:27)
                                                      [ExpValue ()
                                                                (44:26)-(44:27)
                                                                (ValString "")])),
                     BlStatement ()
                                 (45:7)-(45:24)
                                 Nothing
                                 (StCall ()
                                         (45:7)-(45:24)
                                         (ExpValue ()
                                                   (45:12)-(45:20)
                                                   (ValVariable "timestamp"))
                                         (Just AList () (45:22)-(45:24) [])),
                     BlStatement ()
                                 (47:7)-(47:10)
                                 Nothing
                                 (StStop () (47:7)-(47:10) Nothing)]
                    Nothing,
             PUSubroutine ()
                          (49:7)-(144:9)
                          (Nothing, Nothing)
                          "test01"
                          Nothing
                          [BlComment ()
                                     (51:1)-(51:80)
                                     (Comment "*****************************************************************************80"),
                           BlComment () (52:1)-(52:1) (Comment ""),
                           BlComment ()
                                     (53:1)-(53:40)
                                     (Comment "c test01 stores huge integers as reals."),
                           BlComment () (54:1)-(54:1) (Comment ""),
                           BlComment () (55:1)-(55:13) (Comment "  licensing:"),
                           BlComment () (56:1)-(56:1) (Comment ""),
                           BlComment ()
                                     (57:1)-(57:57)
                                     (Comment "    this code is distributed under the gnu lgpl license."),
                           BlComment () (58:1)-(58:1) (Comment ""),
                           BlComment () (59:1)-(59:12) (Comment "  modified:"),
                           BlComment () (60:1)-(60:1) (Comment ""),
                           BlComment ()
                                     (61:1)-(61:22)
                                     (Comment "    28 september 2014"),
                           BlComment () (62:1)-(62:1) (Comment ""),
                           BlComment () (63:1)-(63:10) (Comment "  author:"),
                           BlComment () (64:1)-(64:1) (Comment ""),
                           BlComment ()
                                     (65:1)-(65:18)
                                     (Comment "    john burkardt"),
                           BlComment () (66:1)-(66:1) (Comment ""),
                           BlStatement ()
                                       (67:7)-(67:19)
                                       Nothing
                                       (StImplicit () (67:7)-(67:19) Nothing),
                           BlStatement ()
                                       (69:7)-(69:16)
                                       Nothing
                                       (StDeclaration ()
                                                      (69:7)-(69:16)
                                                      (TypeSpec ()
                                                                (69:7)-(69:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (69:15)-(69:16)
                                                             [Declarator ()
                                                                         (69:15)-(69:16)
                                                                         (ExpValue ()
                                                                                   (69:15)-(69:16)
                                                                                   (ValVariable "i4"))
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
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (70:15)-(70:20)
                                                             [Declarator ()
                                                                         (70:15)-(70:20)
                                                                         (ExpValue ()
                                                                                   (70:15)-(70:20)
                                                                                   (ValVariable "i4r4i4"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (71:7)-(71:20)
                                       Nothing
                                       (StDeclaration ()
                                                      (71:7)-(71:20)
                                                      (TypeSpec ()
                                                                (71:7)-(71:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (71:15)-(71:20)
                                                             [Declarator ()
                                                                         (71:15)-(71:20)
                                                                         (ExpValue ()
                                                                                   (71:15)-(71:20)
                                                                                   (ValVariable "i4r8i4"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (72:7)-(72:20)
                                       Nothing
                                       (StDeclaration ()
                                                      (72:7)-(72:20)
                                                      (TypeSpec ()
                                                                (72:7)-(72:17)
                                                                TypeInteger
                                                                (Just Selector ()
                                                                               (72:15)-(72:17)
                                                                               Nothing
                                                                               (Just ExpValue ()
                                                                                              (72:17)-(72:17)
                                                                                              (ValInteger "8"
                                                                                                          Nothing))))
                                                      Nothing
                                                      (AList ()
                                                             (72:19)-(72:20)
                                                             [Declarator ()
                                                                         (72:19)-(72:20)
                                                                         (ExpValue ()
                                                                                   (72:19)-(72:20)
                                                                                   (ValVariable "i8"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (73:7)-(73:24)
                                       Nothing
                                       (StDeclaration ()
                                                      (73:7)-(73:24)
                                                      (TypeSpec ()
                                                                (73:7)-(73:17)
                                                                TypeInteger
                                                                (Just Selector ()
                                                                               (73:15)-(73:17)
                                                                               Nothing
                                                                               (Just ExpValue ()
                                                                                              (73:17)-(73:17)
                                                                                              (ValInteger "8"
                                                                                                          Nothing))))
                                                      Nothing
                                                      (AList ()
                                                             (73:19)-(73:24)
                                                             [Declarator ()
                                                                         (73:19)-(73:24)
                                                                         (ExpValue ()
                                                                                   (73:19)-(73:24)
                                                                                   (ValVariable "i8r4i8"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (74:7)-(74:24)
                                       Nothing
                                       (StDeclaration ()
                                                      (74:7)-(74:24)
                                                      (TypeSpec ()
                                                                (74:7)-(74:17)
                                                                TypeInteger
                                                                (Just Selector ()
                                                                               (74:15)-(74:17)
                                                                               Nothing
                                                                               (Just ExpValue ()
                                                                                              (74:17)-(74:17)
                                                                                              (ValInteger "8"
                                                                                                          Nothing))))
                                                      Nothing
                                                      (AList ()
                                                             (74:19)-(74:24)
                                                             [Declarator ()
                                                                         (74:19)-(74:24)
                                                                         (ExpValue ()
                                                                                   (74:19)-(74:24)
                                                                                   (ValVariable "i8r8i8"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (75:7)-(75:13)
                                       Nothing
                                       (StDeclaration ()
                                                      (75:7)-(75:13)
                                                      (TypeSpec ()
                                                                (75:7)-(75:10)
                                                                TypeReal
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (75:12)-(75:13)
                                                             [Declarator ()
                                                                         (75:12)-(75:13)
                                                                         (ExpValue ()
                                                                                   (75:12)-(75:13)
                                                                                   (ValVariable "r4"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (76:7)-(76:15)
                                       Nothing
                                       (StDeclaration ()
                                                      (76:7)-(76:15)
                                                      (TypeSpec ()
                                                                (76:7)-(76:10)
                                                                TypeReal
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (76:12)-(76:15)
                                                             [Declarator ()
                                                                         (76:12)-(76:15)
                                                                         (ExpValue ()
                                                                                   (76:12)-(76:15)
                                                                                   (ValVariable "r4i4"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (77:7)-(77:15)
                                       Nothing
                                       (StDeclaration ()
                                                      (77:7)-(77:15)
                                                      (TypeSpec ()
                                                                (77:7)-(77:10)
                                                                TypeReal
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (77:12)-(77:15)
                                                             [Declarator ()
                                                                         (77:12)-(77:15)
                                                                         (ExpValue ()
                                                                                   (77:12)-(77:15)
                                                                                   (ValVariable "r4i8"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (78:7)-(78:25)
                                       Nothing
                                       (StDeclaration ()
                                                      (78:7)-(78:25)
                                                      (TypeSpec ()
                                                                (78:7)-(78:22)
                                                                TypeDoublePrecision
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (78:24)-(78:25)
                                                             [Declarator ()
                                                                         (78:24)-(78:25)
                                                                         (ExpValue ()
                                                                                   (78:24)-(78:25)
                                                                                   (ValVariable "r8"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (79:7)-(79:27)
                                       Nothing
                                       (StDeclaration ()
                                                      (79:7)-(79:27)
                                                      (TypeSpec ()
                                                                (79:7)-(79:22)
                                                                TypeDoublePrecision
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (79:24)-(79:27)
                                                             [Declarator ()
                                                                         (79:24)-(79:27)
                                                                         (ExpValue ()
                                                                                   (79:24)-(79:27)
                                                                                   (ValVariable "r8i4"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (80:7)-(80:27)
                                       Nothing
                                       (StDeclaration ()
                                                      (80:7)-(80:27)
                                                      (TypeSpec ()
                                                                (80:7)-(80:22)
                                                                TypeDoublePrecision
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (80:24)-(80:27)
                                                             [Declarator ()
                                                                         (80:24)-(80:27)
                                                                         (ExpValue ()
                                                                                   (80:24)-(80:27)
                                                                                   (ValVariable "r8i8"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (82:7)-(82:27)
                                       Nothing
                                       (StWrite ()
                                                (82:7)-(82:27)
                                                (AList ()
                                                       (82:13)-(82:24)
                                                       [ControlPair ()
                                                                    (82:15)-(82:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (82:15)-(82:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (82:18)-(82:22)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (82:18)-(82:22)
                                                                              (ValString "(a)"))])
                                                (Just AList ()
                                                            (82:26)-(82:27)
                                                            [ExpValue ()
                                                                      (82:26)-(82:27)
                                                                      (ValString "")])),
                           BlStatement ()
                                       (83:7)-(83:33)
                                       Nothing
                                       (StWrite ()
                                                (83:7)-(83:33)
                                                (AList ()
                                                       (83:13)-(83:24)
                                                       [ControlPair ()
                                                                    (83:15)-(83:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (83:15)-(83:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (83:18)-(83:22)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (83:18)-(83:22)
                                                                              (ValString "(a)"))])
                                                (Just AList ()
                                                            (83:26)-(83:33)
                                                            [ExpValue ()
                                                                      (83:26)-(83:33)
                                                                      (ValString "TEST01")])),
                           BlStatement ()
                                       (84:7)-(84:67)
                                       Nothing
                                       (StWrite ()
                                                (84:7)-(84:67)
                                                (AList ()
                                                       (84:13)-(84:24)
                                                       [ControlPair ()
                                                                    (84:15)-(84:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (84:15)-(84:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (84:18)-(84:22)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (84:18)-(84:22)
                                                                              (ValString "(a)"))])
                                                (Just AList ()
                                                            (84:26)-(84:67)
                                                            [ExpValue ()
                                                                      (84:26)-(84:67)
                                                                      (ValString "  Compute the largest possible integers.")])),
                           BlStatement ()
                                       (85:7)-(85:62)
                                       Nothing
                                       (StWrite ()
                                                (85:7)-(85:62)
                                                (AList ()
                                                       (85:13)-(85:24)
                                                       [ControlPair ()
                                                                    (85:15)-(85:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (85:15)-(85:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (85:18)-(85:22)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (85:18)-(85:22)
                                                                              (ValString "(a)"))])
                                                (Just AList ()
                                                            (85:26)-(85:62)
                                                            [ExpValue ()
                                                                      (85:26)-(85:62)
                                                                      (ValString "  Try to store them as real values.")])),
                           BlStatement ()
                                       (86:7)-(86:49)
                                       Nothing
                                       (StWrite ()
                                                (86:7)-(86:49)
                                                (AList ()
                                                       (86:13)-(86:24)
                                                       [ControlPair ()
                                                                    (86:15)-(86:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (86:15)-(86:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (86:18)-(86:22)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (86:18)-(86:22)
                                                                              (ValString "(a)"))])
                                                (Just AList ()
                                                            (86:26)-(86:49)
                                                            [ExpValue ()
                                                                      (86:26)-(86:49)
                                                                      (ValString "  Then copy them back.")])),
                           BlStatement ()
                                       (88:7)-(88:27)
                                       Nothing
                                       (StWrite ()
                                                (88:7)-(88:27)
                                                (AList ()
                                                       (88:13)-(88:24)
                                                       [ControlPair ()
                                                                    (88:15)-(88:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (88:15)-(88:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (88:18)-(88:22)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (88:18)-(88:22)
                                                                              (ValString "(a)"))])
                                                (Just AList ()
                                                            (88:26)-(88:27)
                                                            [ExpValue ()
                                                                      (88:26)-(88:27)
                                                                      (ValString "")])),
                           BlStatement ()
                                       (89:7)-(89:60)
                                       Nothing
                                       (StWrite ()
                                                (89:7)-(89:60)
                                                (AList ()
                                                       (89:13)-(89:24)
                                                       [ControlPair ()
                                                                    (89:15)-(89:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (89:15)-(89:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (89:18)-(89:22)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (89:18)-(89:22)
                                                                              (ValString "(a)"))])
                                                (Just AList ()
                                                            (89:26)-(89:60)
                                                            [ExpValue ()
                                                                      (89:26)-(89:60)
                                                                      (ValString "  \"Huge\" integers and huge reals:")])),
                           BlStatement ()
                                       (90:7)-(90:27)
                                       Nothing
                                       (StWrite ()
                                                (90:7)-(90:27)
                                                (AList ()
                                                       (90:13)-(90:24)
                                                       [ControlPair ()
                                                                    (90:15)-(90:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (90:15)-(90:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (90:18)-(90:22)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (90:18)-(90:22)
                                                                              (ValString "(a)"))])
                                                (Just AList ()
                                                            (90:26)-(90:27)
                                                            [ExpValue ()
                                                                      (90:26)-(90:27)
                                                                      (ValString "")])),
                           BlStatement ()
                                       (92:7)-(92:22)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (92:7)-(92:22)
                                                           (ExpValue ()
                                                                     (92:7)-(92:8)
                                                                     (ValVariable "i4"))
                                                           (ExpFunctionCall ()
                                                                            (92:12)-(92:22)
                                                                            (ExpValue ()
                                                                                      (92:12)-(92:15)
                                                                                      (ValVariable "huge"))
                                                                            (Just AList ()
                                                                                        (92:19)-(92:20)
                                                                                        [Argument ()
                                                                                                  (92:19)-(92:20)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (92:19)-(92:20)
                                                                                                                     (ValVariable "i4")))]))),
                           BlStatement ()
                                       (93:7)-(93:22)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (93:7)-(93:22)
                                                           (ExpValue ()
                                                                     (93:7)-(93:8)
                                                                     (ValVariable "i8"))
                                                           (ExpFunctionCall ()
                                                                            (93:12)-(93:22)
                                                                            (ExpValue ()
                                                                                      (93:12)-(93:15)
                                                                                      (ValVariable "huge"))
                                                                            (Just AList ()
                                                                                        (93:19)-(93:20)
                                                                                        [Argument ()
                                                                                                  (93:19)-(93:20)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (93:19)-(93:20)
                                                                                                                     (ValVariable "i8")))]))),
                           BlStatement ()
                                       (94:7)-(94:22)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (94:7)-(94:22)
                                                           (ExpValue ()
                                                                     (94:7)-(94:8)
                                                                     (ValVariable "r4"))
                                                           (ExpFunctionCall ()
                                                                            (94:12)-(94:22)
                                                                            (ExpValue ()
                                                                                      (94:12)-(94:15)
                                                                                      (ValVariable "huge"))
                                                                            (Just AList ()
                                                                                        (94:19)-(94:20)
                                                                                        [Argument ()
                                                                                                  (94:19)-(94:20)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (94:19)-(94:20)
                                                                                                                     (ValVariable "r4")))]))),
                           BlStatement ()
                                       (95:7)-(95:22)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (95:7)-(95:22)
                                                           (ExpValue ()
                                                                     (95:7)-(95:8)
                                                                     (ValVariable "r8"))
                                                           (ExpFunctionCall ()
                                                                            (95:12)-(95:22)
                                                                            (ExpValue ()
                                                                                      (95:12)-(95:15)
                                                                                      (ValVariable "huge"))
                                                                            (Just AList ()
                                                                                        (95:19)-(95:20)
                                                                                        [Argument ()
                                                                                                  (95:19)-(95:20)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (95:19)-(95:20)
                                                                                                                     (ValVariable "r8")))]))),
                           BlStatement ()
                                       (97:7)-(98:40)
                                       Nothing
                                       (StWrite ()
                                                (97:7)-(98:40)
                                                (AList ()
                                                       (97:13)-(97:30)
                                                       [ControlPair ()
                                                                    (97:15)-(97:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (97:15)-(97:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (97:18)-(97:26)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (97:18)-(97:26)
                                                                              (ValString "(a,i26)"))])
                                                (Just AList ()
                                                            (98:9)-(98:40)
                                                            [ExpValue ()
                                                                      (98:9)-(98:36)
                                                                      (ValString "  i4 = huge ( integer ) = "),
                                                             ExpValue ()
                                                                      (98:39)-(98:40)
                                                                      (ValVariable "i4")])),
                           BlStatement ()
                                       (99:7)-(100:44)
                                       Nothing
                                       (StWrite ()
                                                (99:7)-(100:44)
                                                (AList ()
                                                       (99:13)-(99:30)
                                                       [ControlPair ()
                                                                    (99:15)-(99:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (99:15)-(99:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (99:18)-(99:26)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (99:18)-(99:26)
                                                                              (ValString "(a,i26)"))])
                                                (Just AList ()
                                                            (100:9)-(100:44)
                                                            [ExpValue ()
                                                                      (100:9)-(100:40)
                                                                      (ValString "  i8 = huge ( integer * 8 ) = "),
                                                             ExpValue ()
                                                                      (100:43)-(100:44)
                                                                      (ValVariable "i8")])),
                           BlStatement ()
                                       (101:7)-(102:40)
                                       Nothing
                                       (StWrite ()
                                                (101:7)-(102:40)
                                                (AList ()
                                                       (101:13)-(101:30)
                                                       [ControlPair ()
                                                                    (101:15)-(101:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (101:15)-(101:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (101:18)-(101:28)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (101:18)-(101:28)
                                                                              (ValString "(a,g26.6)"))])
                                                (Just AList ()
                                                            (102:9)-(102:40)
                                                            [ExpValue ()
                                                                      (102:9)-(102:36)
                                                                      (ValString "  r4 = huge ( real ) =    "),
                                                             ExpValue ()
                                                                      (102:39)-(102:40)
                                                                      (ValVariable "r4")])),
                           BlStatement ()
                                       (103:7)-(104:52)
                                       Nothing
                                       (StWrite ()
                                                (103:7)-(104:52)
                                                (AList ()
                                                       (103:13)-(103:30)
                                                       [ControlPair ()
                                                                    (103:15)-(103:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (103:15)-(103:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (103:18)-(103:28)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (103:18)-(103:28)
                                                                              (ValString "(a,g26.6)"))])
                                                (Just AList ()
                                                            (104:9)-(104:52)
                                                            [ExpValue ()
                                                                      (104:9)-(104:48)
                                                                      (ValString "  r8 = huge ( double precision ) =    "),
                                                             ExpValue ()
                                                                      (104:51)-(104:52)
                                                                      (ValVariable "r8")])),
                           BlStatement ()
                                       (106:7)-(106:27)
                                       Nothing
                                       (StWrite ()
                                                (106:7)-(106:27)
                                                (AList ()
                                                       (106:13)-(106:24)
                                                       [ControlPair ()
                                                                    (106:15)-(106:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (106:15)-(106:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (106:18)-(106:22)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (106:18)-(106:22)
                                                                              (ValString "(a)"))])
                                                (Just AList ()
                                                            (106:26)-(106:27)
                                                            [ExpValue ()
                                                                      (106:26)-(106:27)
                                                                      (ValString "")])),
                           BlStatement ()
                                       (107:7)-(107:66)
                                       Nothing
                                       (StWrite ()
                                                (107:7)-(107:66)
                                                (AList ()
                                                       (107:13)-(107:24)
                                                       [ControlPair ()
                                                                    (107:15)-(107:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (107:15)-(107:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (107:18)-(107:22)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (107:18)-(107:22)
                                                                              (ValString "(a)"))])
                                                (Just AList ()
                                                            (107:26)-(107:66)
                                                            [ExpValue ()
                                                                      (107:26)-(107:66)
                                                                      (ValString "  Convert huge integers to real values:")])),
                           BlStatement ()
                                       (108:7)-(108:27)
                                       Nothing
                                       (StWrite ()
                                                (108:7)-(108:27)
                                                (AList ()
                                                       (108:13)-(108:24)
                                                       [ControlPair ()
                                                                    (108:15)-(108:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (108:15)-(108:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (108:18)-(108:22)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (108:18)-(108:22)
                                                                              (ValString "(a)"))])
                                                (Just AList ()
                                                            (108:26)-(108:27)
                                                            [ExpValue ()
                                                                      (108:26)-(108:27)
                                                                      (ValString "")])),
                           BlStatement ()
                                       (110:7)-(110:24)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (110:7)-(110:24)
                                                           (ExpValue ()
                                                                     (110:7)-(110:10)
                                                                     (ValVariable "r4i4"))
                                                           (ExpFunctionCall ()
                                                                            (110:14)-(110:24)
                                                                            (ExpValue ()
                                                                                      (110:14)-(110:17)
                                                                                      (ValIntrinsic "real"))
                                                                            (Just AList ()
                                                                                        (110:21)-(110:22)
                                                                                        [Argument ()
                                                                                                  (110:21)-(110:22)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (110:21)-(110:22)
                                                                                                                     (ValVariable "i4")))]))),
                           BlStatement ()
                                       (111:7)-(111:24)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (111:7)-(111:24)
                                                           (ExpValue ()
                                                                     (111:7)-(111:10)
                                                                     (ValVariable "r4i8"))
                                                           (ExpFunctionCall ()
                                                                            (111:14)-(111:24)
                                                                            (ExpValue ()
                                                                                      (111:14)-(111:17)
                                                                                      (ValIntrinsic "real"))
                                                                            (Just AList ()
                                                                                        (111:21)-(111:22)
                                                                                        [Argument ()
                                                                                                  (111:21)-(111:22)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (111:21)-(111:22)
                                                                                                                     (ValVariable "i8")))]))),
                           BlStatement ()
                                       (112:7)-(112:24)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (112:7)-(112:24)
                                                           (ExpValue ()
                                                                     (112:7)-(112:10)
                                                                     (ValVariable "r8i4"))
                                                           (ExpFunctionCall ()
                                                                            (112:14)-(112:24)
                                                                            (ExpValue ()
                                                                                      (112:14)-(112:17)
                                                                                      (ValIntrinsic "dble"))
                                                                            (Just AList ()
                                                                                        (112:21)-(112:22)
                                                                                        [Argument ()
                                                                                                  (112:21)-(112:22)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (112:21)-(112:22)
                                                                                                                     (ValVariable "i4")))]))),
                           BlStatement ()
                                       (113:7)-(113:24)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (113:7)-(113:24)
                                                           (ExpValue ()
                                                                     (113:7)-(113:10)
                                                                     (ValVariable "r8i8"))
                                                           (ExpFunctionCall ()
                                                                            (113:14)-(113:24)
                                                                            (ExpValue ()
                                                                                      (113:14)-(113:17)
                                                                                      (ValIntrinsic "dble"))
                                                                            (Just AList ()
                                                                                        (113:21)-(113:22)
                                                                                        [Argument ()
                                                                                                  (113:21)-(113:22)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (113:21)-(113:22)
                                                                                                                     (ValVariable "i8")))]))),
                           BlStatement ()
                                       (115:7)-(116:43)
                                       Nothing
                                       (StWrite ()
                                                (115:7)-(116:43)
                                                (AList ()
                                                       (115:13)-(115:30)
                                                       [ControlPair ()
                                                                    (115:15)-(115:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (115:15)-(115:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (115:18)-(115:28)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (115:18)-(115:28)
                                                                              (ValString "(a,g26.6)"))])
                                                (Just AList ()
                                                            (116:9)-(116:43)
                                                            [ExpValue ()
                                                                      (116:9)-(116:37)
                                                                      (ValString "  r4i4 = real ( i4 ) =     "),
                                                             ExpValue ()
                                                                      (116:40)-(116:43)
                                                                      (ValVariable "r4i4")])),
                           BlStatement ()
                                       (117:7)-(118:43)
                                       Nothing
                                       (StWrite ()
                                                (117:7)-(118:43)
                                                (AList ()
                                                       (117:13)-(117:30)
                                                       [ControlPair ()
                                                                    (117:15)-(117:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (117:15)-(117:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (117:18)-(117:28)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (117:18)-(117:28)
                                                                              (ValString "(a,g26.6)"))])
                                                (Just AList ()
                                                            (118:9)-(118:43)
                                                            [ExpValue ()
                                                                      (118:9)-(118:37)
                                                                      (ValString "  r4i8 = real ( i8 ) =     "),
                                                             ExpValue ()
                                                                      (118:40)-(118:43)
                                                                      (ValVariable "r4i8")])),
                           BlStatement ()
                                       (119:7)-(120:43)
                                       Nothing
                                       (StWrite ()
                                                (119:7)-(120:43)
                                                (AList ()
                                                       (119:13)-(119:30)
                                                       [ControlPair ()
                                                                    (119:15)-(119:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (119:15)-(119:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (119:18)-(119:28)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (119:18)-(119:28)
                                                                              (ValString "(a,g26.6)"))])
                                                (Just AList ()
                                                            (120:9)-(120:43)
                                                            [ExpValue ()
                                                                      (120:9)-(120:37)
                                                                      (ValString "  r8i4 = dble ( i4 ) =     "),
                                                             ExpValue ()
                                                                      (120:40)-(120:43)
                                                                      (ValVariable "r8i4")])),
                           BlStatement ()
                                       (121:7)-(122:43)
                                       Nothing
                                       (StWrite ()
                                                (121:7)-(122:43)
                                                (AList ()
                                                       (121:13)-(121:30)
                                                       [ControlPair ()
                                                                    (121:15)-(121:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (121:15)-(121:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (121:18)-(121:28)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (121:18)-(121:28)
                                                                              (ValString "(a,g26.6)"))])
                                                (Just AList ()
                                                            (122:9)-(122:43)
                                                            [ExpValue ()
                                                                      (122:9)-(122:37)
                                                                      (ValString "  r8i8 = dble ( i8 ) =     "),
                                                             ExpValue ()
                                                                      (122:40)-(122:43)
                                                                      (ValVariable "r8i8")])),
                           BlStatement ()
                                       (124:7)-(124:27)
                                       Nothing
                                       (StWrite ()
                                                (124:7)-(124:27)
                                                (AList ()
                                                       (124:13)-(124:24)
                                                       [ControlPair ()
                                                                    (124:15)-(124:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (124:15)-(124:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (124:18)-(124:22)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (124:18)-(124:22)
                                                                              (ValString "(a)"))])
                                                (Just AList ()
                                                            (124:26)-(124:27)
                                                            [ExpValue ()
                                                                      (124:26)-(124:27)
                                                                      (ValString "")])),
                           BlStatement ()
                                       (125:7)-(126:61)
                                       Nothing
                                       (StWrite ()
                                                (125:7)-(126:61)
                                                (AList ()
                                                       (125:13)-(125:24)
                                                       [ControlPair ()
                                                                    (125:15)-(125:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (125:15)-(125:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (125:18)-(125:22)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (125:18)-(125:22)
                                                                              (ValString "(a)"))])
                                                (Just AList ()
                                                            (126:9)-(126:61)
                                                            [ExpValue ()
                                                                      (126:9)-(126:61)
                                                                      (ValString "  Convert real values of integers back to integers:")])),
                           BlStatement ()
                                       (127:7)-(127:27)
                                       Nothing
                                       (StWrite ()
                                                (127:7)-(127:27)
                                                (AList ()
                                                       (127:13)-(127:24)
                                                       [ControlPair ()
                                                                    (127:15)-(127:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (127:15)-(127:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (127:18)-(127:22)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (127:18)-(127:22)
                                                                              (ValString "(a)"))])
                                                (Just AList ()
                                                            (127:26)-(127:27)
                                                            [ExpValue ()
                                                                      (127:26)-(127:27)
                                                                      (ValString "")])),
                           BlStatement ()
                                       (129:7)-(129:27)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (129:7)-(129:27)
                                                           (ExpValue ()
                                                                     (129:7)-(129:12)
                                                                     (ValVariable "i4r4i4"))
                                                           (ExpFunctionCall ()
                                                                            (129:16)-(129:27)
                                                                            (ExpValue ()
                                                                                      (129:16)-(129:18)
                                                                                      (ValIntrinsic "int"))
                                                                            (Just AList ()
                                                                                        (129:22)-(129:25)
                                                                                        [Argument ()
                                                                                                  (129:22)-(129:25)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (129:22)-(129:25)
                                                                                                                     (ValVariable "r4i4")))]))),
                           BlStatement ()
                                       (130:7)-(130:27)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (130:7)-(130:27)
                                                           (ExpValue ()
                                                                     (130:7)-(130:12)
                                                                     (ValVariable "i4r8i4"))
                                                           (ExpFunctionCall ()
                                                                            (130:16)-(130:27)
                                                                            (ExpValue ()
                                                                                      (130:16)-(130:18)
                                                                                      (ValIntrinsic "int"))
                                                                            (Just AList ()
                                                                                        (130:22)-(130:25)
                                                                                        [Argument ()
                                                                                                  (130:22)-(130:25)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (130:22)-(130:25)
                                                                                                                     (ValVariable "r8i4")))]))),
                           BlStatement ()
                                       (131:7)-(131:28)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (131:7)-(131:28)
                                                           (ExpValue ()
                                                                     (131:7)-(131:12)
                                                                     (ValVariable "i8r4i8"))
                                                           (ExpFunctionCall ()
                                                                            (131:16)-(131:28)
                                                                            (ExpValue ()
                                                                                      (131:16)-(131:19)
                                                                                      (ValVariable "int8"))
                                                                            (Just AList ()
                                                                                        (131:23)-(131:26)
                                                                                        [Argument ()
                                                                                                  (131:23)-(131:26)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (131:23)-(131:26)
                                                                                                                     (ValVariable "r4i8")))]))),
                           BlStatement ()
                                       (132:7)-(132:28)
                                       Nothing
                                       (StExpressionAssign ()
                                                           (132:7)-(132:28)
                                                           (ExpValue ()
                                                                     (132:7)-(132:12)
                                                                     (ValVariable "i8r8i8"))
                                                           (ExpFunctionCall ()
                                                                            (132:16)-(132:28)
                                                                            (ExpValue ()
                                                                                      (132:16)-(132:19)
                                                                                      (ValVariable "int8"))
                                                                            (Just AList ()
                                                                                        (132:23)-(132:26)
                                                                                        [Argument ()
                                                                                                  (132:23)-(132:26)
                                                                                                  Nothing
                                                                                                  (ArgExpr (ExpValue ()
                                                                                                                     (132:23)-(132:26)
                                                                                                                     (ValVariable "r8i8")))]))),
                           BlStatement ()
                                       (134:7)-(135:45)
                                       Nothing
                                       (StWrite ()
                                                (134:7)-(135:45)
                                                (AList ()
                                                       (134:13)-(134:28)
                                                       [ControlPair ()
                                                                    (134:15)-(134:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (134:15)-(134:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (134:18)-(134:26)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (134:18)-(134:26)
                                                                              (ValString "(a,i26)"))])
                                                (Just AList ()
                                                            (135:9)-(135:45)
                                                            [ExpValue ()
                                                                      (135:9)-(135:37)
                                                                      (ValString "  i4r4i4 = int ( r4i4 ) =  "),
                                                             ExpValue ()
                                                                      (135:40)-(135:45)
                                                                      (ValVariable "i4r4i4")])),
                           BlStatement ()
                                       (136:7)-(137:45)
                                       Nothing
                                       (StWrite ()
                                                (136:7)-(137:45)
                                                (AList ()
                                                       (136:13)-(136:28)
                                                       [ControlPair ()
                                                                    (136:15)-(136:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (136:15)-(136:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (136:18)-(136:26)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (136:18)-(136:26)
                                                                              (ValString "(a,i26)"))])
                                                (Just AList ()
                                                            (137:9)-(137:45)
                                                            [ExpValue ()
                                                                      (137:9)-(137:37)
                                                                      (ValString "  i4r8i4 = int ( r8i4 ) =  "),
                                                             ExpValue ()
                                                                      (137:40)-(137:45)
                                                                      (ValVariable "i4r8i4")])),
                           BlStatement ()
                                       (138:7)-(139:46)
                                       Nothing
                                       (StWrite ()
                                                (138:7)-(139:46)
                                                (AList ()
                                                       (138:13)-(138:28)
                                                       [ControlPair ()
                                                                    (138:15)-(138:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (138:15)-(138:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (138:18)-(138:26)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (138:18)-(138:26)
                                                                              (ValString "(a,i26)"))])
                                                (Just AList ()
                                                            (139:9)-(139:46)
                                                            [ExpValue ()
                                                                      (139:9)-(139:38)
                                                                      (ValString "  i8r4i8 = int8 ( r4i8 ) =  "),
                                                             ExpValue ()
                                                                      (139:41)-(139:46)
                                                                      (ValVariable "i8r4i8")])),
                           BlStatement ()
                                       (140:7)-(141:46)
                                       Nothing
                                       (StWrite ()
                                                (140:7)-(141:46)
                                                (AList ()
                                                       (140:13)-(140:28)
                                                       [ControlPair ()
                                                                    (140:15)-(140:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (140:15)-(140:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (140:18)-(140:26)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (140:18)-(140:26)
                                                                              (ValString "(a,i26)"))])
                                                (Just AList ()
                                                            (141:9)-(141:46)
                                                            [ExpValue ()
                                                                      (141:9)-(141:38)
                                                                      (ValString "  i8r8i8 = int8 ( r8i8 ) =  "),
                                                             ExpValue ()
                                                                      (141:41)-(141:46)
                                                                      (ValVariable "i8r8i8")])),
                           BlStatement ()
                                       (143:7)-(143:12)
                                       Nothing
                                       (StReturn () (143:7)-(143:12) Nothing)]
                          Nothing,
             PUSubroutine ()
                          (145:7)-(220:9)
                          (Nothing, Nothing)
                          "timestamp"
                          Nothing
                          [BlComment ()
                                     (147:1)-(147:72)
                                     (Comment "*********************************************************************72"),
                           BlComment () (148:1)-(148:1) (Comment ""),
                           BlComment ()
                                     (149:1)-(149:63)
                                     (Comment "c timestamp prints out the current ymdhms date as a timestamp."),
                           BlComment () (150:1)-(150:1) (Comment ""),
                           BlComment ()
                                     (151:1)-(151:13)
                                     (Comment "  licensing:"),
                           BlComment () (152:1)-(152:1) (Comment ""),
                           BlComment ()
                                     (153:1)-(153:57)
                                     (Comment "    this code is distributed under the gnu lgpl license."),
                           BlComment () (154:1)-(154:1) (Comment ""),
                           BlComment ()
                                     (155:1)-(155:12)
                                     (Comment "  modified:"),
                           BlComment () (156:1)-(156:1) (Comment ""),
                           BlComment ()
                                     (157:1)-(157:17)
                                     (Comment "    12 june 2014"),
                           BlComment () (158:1)-(158:1) (Comment ""),
                           BlComment () (159:1)-(159:10) (Comment "  author:"),
                           BlComment () (160:1)-(160:1) (Comment ""),
                           BlComment ()
                                     (161:1)-(161:18)
                                     (Comment "    john burkardt"),
                           BlComment () (162:1)-(162:1) (Comment ""),
                           BlComment ()
                                     (163:1)-(163:14)
                                     (Comment "  parameters:"),
                           BlComment () (164:1)-(164:1) (Comment ""),
                           BlComment () (165:1)-(165:9) (Comment "    none"),
                           BlComment () (166:1)-(166:1) (Comment ""),
                           BlStatement ()
                                       (167:7)-(167:19)
                                       Nothing
                                       (StImplicit () (167:7)-(167:19) Nothing),
                           BlStatement ()
                                       (169:7)-(169:28)
                                       Nothing
                                       (StDeclaration ()
                                                      (169:7)-(169:28)
                                                      (TypeSpec ()
                                                                (169:7)-(169:23)
                                                                TypeCharacter
                                                                (Just Selector ()
                                                                               (169:17)-(169:23)
                                                                               (Just ExpValue ()
                                                                                              (169:19)-(169:23)
                                                                                              (ValInteger "8"
                                                                                                          Nothing))
                                                                               Nothing))
                                                      Nothing
                                                      (AList ()
                                                             (169:25)-(169:28)
                                                             [Declarator ()
                                                                         (169:25)-(169:28)
                                                                         (ExpValue ()
                                                                                   (169:25)-(169:28)
                                                                                   (ValVariable "ampm"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (170:7)-(170:15)
                                       Nothing
                                       (StDeclaration ()
                                                      (170:7)-(170:15)
                                                      (TypeSpec ()
                                                                (170:7)-(170:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (170:15)-(170:15)
                                                             [Declarator ()
                                                                         (170:15)-(170:15)
                                                                         (ExpValue ()
                                                                                   (170:15)-(170:15)
                                                                                   (ValVariable "d"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (171:7)-(171:28)
                                       Nothing
                                       (StDeclaration ()
                                                      (171:7)-(171:28)
                                                      (TypeSpec ()
                                                                (171:7)-(171:23)
                                                                TypeCharacter
                                                                (Just Selector ()
                                                                               (171:17)-(171:23)
                                                                               (Just ExpValue ()
                                                                                              (171:19)-(171:23)
                                                                                              (ValInteger "8"
                                                                                                          Nothing))
                                                                               Nothing))
                                                      Nothing
                                                      (AList ()
                                                             (171:25)-(171:28)
                                                             [Declarator ()
                                                                         (171:25)-(171:28)
                                                                         (ExpValue ()
                                                                                   (171:25)-(171:28)
                                                                                   (ValVariable "date"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (172:7)-(172:15)
                                       Nothing
                                       (StDeclaration ()
                                                      (172:7)-(172:15)
                                                      (TypeSpec ()
                                                                (172:7)-(172:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (172:15)-(172:15)
                                                             [Declarator ()
                                                                         (172:15)-(172:15)
                                                                         (ExpValue ()
                                                                                   (172:15)-(172:15)
                                                                                   (ValVariable "h"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (173:7)-(173:15)
                                       Nothing
                                       (StDeclaration ()
                                                      (173:7)-(173:15)
                                                      (TypeSpec ()
                                                                (173:7)-(173:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (173:15)-(173:15)
                                                             [Declarator ()
                                                                         (173:15)-(173:15)
                                                                         (ExpValue ()
                                                                                   (173:15)-(173:15)
                                                                                   (ValVariable "m"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (174:7)-(174:16)
                                       Nothing
                                       (StDeclaration ()
                                                      (174:7)-(174:16)
                                                      (TypeSpec ()
                                                                (174:7)-(174:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (174:15)-(174:16)
                                                             [Declarator ()
                                                                         (174:15)-(174:16)
                                                                         (ExpValue ()
                                                                                   (174:15)-(174:16)
                                                                                   (ValVariable "mm"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (175:7)-(175:33)
                                       Nothing
                                       (StDeclaration ()
                                                      (175:7)-(175:33)
                                                      (TypeSpec ()
                                                                (175:7)-(175:23)
                                                                TypeCharacter
                                                                (Just Selector ()
                                                                               (175:17)-(175:23)
                                                                               (Just ExpValue ()
                                                                                              (175:19)-(175:23)
                                                                                              (ValInteger "9"
                                                                                                          Nothing))
                                                                               Nothing))
                                                      Nothing
                                                      (AList ()
                                                             (175:25)-(175:33)
                                                             [Declarator ()
                                                                         (175:25)-(175:33)
                                                                         (ExpValue ()
                                                                                   (175:25)-(175:29)
                                                                                   (ValVariable "month"))
                                                                         (ArrayDecl (AList ()
                                                                                           (175:31)-(175:32)
                                                                                           [DimensionDeclarator ()
                                                                                                                (175:31)-(175:32)
                                                                                                                Nothing
                                                                                                                (Just ExpValue ()
                                                                                                                               (175:31)-(175:32)
                                                                                                                               (ValInteger "12"
                                                                                                                                           Nothing))]))
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (176:7)-(176:15)
                                       Nothing
                                       (StDeclaration ()
                                                      (176:7)-(176:15)
                                                      (TypeSpec ()
                                                                (176:7)-(176:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (176:15)-(176:15)
                                                             [Declarator ()
                                                                         (176:15)-(176:15)
                                                                         (ExpValue ()
                                                                                   (176:15)-(176:15)
                                                                                   (ValVariable "n"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (177:7)-(177:15)
                                       Nothing
                                       (StDeclaration ()
                                                      (177:7)-(177:15)
                                                      (TypeSpec ()
                                                                (177:7)-(177:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (177:15)-(177:15)
                                                             [Declarator ()
                                                                         (177:15)-(177:15)
                                                                         (ExpValue ()
                                                                                   (177:15)-(177:15)
                                                                                   (ValVariable "s"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (178:7)-(178:29)
                                       Nothing
                                       (StDeclaration ()
                                                      (178:7)-(178:29)
                                                      (TypeSpec ()
                                                                (178:7)-(178:24)
                                                                TypeCharacter
                                                                (Just Selector ()
                                                                               (178:17)-(178:24)
                                                                               (Just ExpValue ()
                                                                                              (178:19)-(178:24)
                                                                                              (ValInteger "10"
                                                                                                          Nothing))
                                                                               Nothing))
                                                      Nothing
                                                      (AList ()
                                                             (178:26)-(178:29)
                                                             [Declarator ()
                                                                         (178:26)-(178:29)
                                                                         (ExpValue ()
                                                                                   (178:26)-(178:29)
                                                                                   (ValVariable "time"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (179:7)-(179:15)
                                       Nothing
                                       (StDeclaration ()
                                                      (179:7)-(179:15)
                                                      (TypeSpec ()
                                                                (179:7)-(179:13)
                                                                TypeInteger
                                                                Nothing)
                                                      Nothing
                                                      (AList ()
                                                             (179:15)-(179:15)
                                                             [Declarator ()
                                                                         (179:15)-(179:15)
                                                                         (ExpValue ()
                                                                                   (179:15)-(179:15)
                                                                                   (ValVariable "y"))
                                                                         ScalarDecl
                                                                         Nothing
                                                                         Nothing])),
                           BlStatement ()
                                       (181:7)-(181:16)
                                       Nothing
                                       (StSave ()
                                               (181:7)-(181:16)
                                               (Just AList ()
                                                           (181:12)-(181:16)
                                                           [ExpValue ()
                                                                     (181:12)-(181:16)
                                                                     (ValVariable "month")])),
                           BlStatement ()
                                       (183:7)-(186:60)
                                       Nothing
                                       (StData ()
                                               (183:7)-(186:60)
                                               (AList ()
                                                      (183:12)-(186:60)
                                                      [DataGroup ()
                                                                 (183:12)-(186:60)
                                                                 (AList ()
                                                                        (183:12)-(183:16)
                                                                        [ExpValue ()
                                                                                  (183:12)-(183:16)
                                                                                  (ValVariable "month")])
                                                                 (AList ()
                                                                        (184:9)-(186:58)
                                                                        [ExpValue ()
                                                                                  (184:9)-(184:19)
                                                                                  (ValString "January  "),
                                                                         ExpValue ()
                                                                                  (184:22)-(184:32)
                                                                                  (ValString "February "),
                                                                         ExpValue ()
                                                                                  (184:35)-(184:45)
                                                                                  (ValString "March    "),
                                                                         ExpValue ()
                                                                                  (184:48)-(184:58)
                                                                                  (ValString "April    "),
                                                                         ExpValue ()
                                                                                  (185:9)-(185:19)
                                                                                  (ValString "May      "),
                                                                         ExpValue ()
                                                                                  (185:22)-(185:32)
                                                                                  (ValString "June     "),
                                                                         ExpValue ()
                                                                                  (185:35)-(185:45)
                                                                                  (ValString "July     "),
                                                                         ExpValue ()
                                                                                  (185:48)-(185:58)
                                                                                  (ValString "August   "),
                                                                         ExpValue ()
                                                                                  (186:9)-(186:19)
                                                                                  (ValString "September"),
                                                                         ExpValue ()
                                                                                  (186:22)-(186:32)
                                                                                  (ValString "October  "),
                                                                         ExpValue ()
                                                                                  (186:35)-(186:45)
                                                                                  (ValString "November "),
                                                                         ExpValue ()
                                                                                  (186:48)-(186:58)
                                                                                  (ValString "December ")])])),
                           BlStatement ()
                                       (188:7)-(188:39)
                                       Nothing
                                       (StCall ()
                                               (188:7)-(188:39)
                                               (ExpValue ()
                                                         (188:12)-(188:24)
                                                         (ValVariable "date_and_time"))
                                               (Just AList ()
                                                           (188:26)-(188:39)
                                                           [Argument ()
                                                                     (188:28)-(188:31)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (188:28)-(188:31)
                                                                                        (ValVariable "date"))),
                                                            Argument ()
                                                                     (188:34)-(188:37)
                                                                     Nothing
                                                                     (ArgExpr (ExpValue ()
                                                                                        (188:34)-(188:37)
                                                                                        (ValVariable "time")))])),
                           BlStatement ()
                                       (190:7)-(190:41)
                                       Nothing
                                       (StRead ()
                                               (190:7)-(190:41)
                                               (AList ()
                                                      (190:12)-(190:33)
                                                      [ControlPair ()
                                                                   (190:14)-(190:17)
                                                                   Nothing
                                                                   (ExpValue ()
                                                                             (190:14)-(190:17)
                                                                             (ValVariable "date")),
                                                       ControlPair ()
                                                                   (190:20)-(190:31)
                                                                   Nothing
                                                                   (ExpValue ()
                                                                             (190:20)-(190:31)
                                                                             (ValString "(i4,i2,i2)"))])
                                               (Just AList ()
                                                           (190:35)-(190:41)
                                                           [ExpValue ()
                                                                     (190:35)-(190:35)
                                                                     (ValVariable "y"),
                                                            ExpValue ()
                                                                     (190:38)-(190:38)
                                                                     (ValVariable "m"),
                                                            ExpValue ()
                                                                     (190:41)-(190:41)
                                                                     (ValVariable "d")])),
                           BlStatement ()
                                       (191:7)-(191:51)
                                       Nothing
                                       (StRead ()
                                               (191:7)-(191:51)
                                               (AList ()
                                                      (191:12)-(191:39)
                                                      [ControlPair ()
                                                                   (191:14)-(191:17)
                                                                   Nothing
                                                                   (ExpValue ()
                                                                             (191:14)-(191:17)
                                                                             (ValVariable "time")),
                                                       ControlPair ()
                                                                   (191:20)-(191:37)
                                                                   Nothing
                                                                   (ExpValue ()
                                                                             (191:20)-(191:37)
                                                                             (ValString "(i2,i2,i2,1x,i3)"))])
                                               (Just AList ()
                                                           (191:41)-(191:51)
                                                           [ExpValue ()
                                                                     (191:41)-(191:41)
                                                                     (ValVariable "h"),
                                                            ExpValue ()
                                                                     (191:44)-(191:44)
                                                                     (ValVariable "n"),
                                                            ExpValue ()
                                                                     (191:47)-(191:47)
                                                                     (ValVariable "s"),
                                                            ExpValue ()
                                                                     (191:50)-(191:51)
                                                                     (ValVariable "mm")])),
                           BlIf ()
                                (193:7)-(212:12)
                                Nothing
                                Nothing
                                [Just ExpBinary ()
                                                (193:12)-(193:20)
                                                LT
                                                (ExpValue ()
                                                          (193:12)-(193:12)
                                                          (ValVariable "h"))
                                                (ExpValue ()
                                                          (193:19)-(193:20)
                                                          (ValInteger "12"
                                                                      Nothing)),
                                 Just ExpBinary ()
                                                (195:17)-(195:25)
                                                EQ
                                                (ExpValue ()
                                                          (195:17)-(195:17)
                                                          (ValVariable "h"))
                                                (ExpValue ()
                                                          (195:24)-(195:25)
                                                          (ValInteger "12"
                                                                      Nothing)),
                                 Nothing]
                                [[BlStatement ()
                                              (194:9)-(194:19)
                                              Nothing
                                              (StExpressionAssign ()
                                                                  (194:9)-(194:19)
                                                                  (ExpValue ()
                                                                            (194:9)-(194:12)
                                                                            (ValVariable "ampm"))
                                                                  (ExpValue ()
                                                                            (194:16)-(194:19)
                                                                            (ValString "AM")))],
                                 [BlIf ()
                                       (196:9)-(200:14)
                                       Nothing
                                       Nothing
                                       [Just ExpBinary ()
                                                       (196:14)-(196:36)
                                                       And
                                                       (ExpBinary ()
                                                                  (196:14)-(196:21)
                                                                  EQ
                                                                  (ExpValue ()
                                                                            (196:14)-(196:14)
                                                                            (ValVariable "n"))
                                                                  (ExpValue ()
                                                                            (196:21)-(196:21)
                                                                            (ValInteger "0"
                                                                                        Nothing)))
                                                       (ExpBinary ()
                                                                  (196:29)-(196:36)
                                                                  EQ
                                                                  (ExpValue ()
                                                                            (196:29)-(196:29)
                                                                            (ValVariable "s"))
                                                                  (ExpValue ()
                                                                            (196:36)-(196:36)
                                                                            (ValInteger "0"
                                                                                        Nothing))),
                                        Nothing]
                                       [[BlStatement ()
                                                     (197:11)-(197:23)
                                                     Nothing
                                                     (StExpressionAssign ()
                                                                         (197:11)-(197:23)
                                                                         (ExpValue ()
                                                                                   (197:11)-(197:14)
                                                                                   (ValVariable "ampm"))
                                                                         (ExpValue ()
                                                                                   (197:18)-(197:23)
                                                                                   (ValString "Noon")))],
                                        [BlStatement ()
                                                     (199:11)-(199:21)
                                                     Nothing
                                                     (StExpressionAssign ()
                                                                         (199:11)-(199:21)
                                                                         (ExpValue ()
                                                                                   (199:11)-(199:14)
                                                                                   (ValVariable "ampm"))
                                                                         (ExpValue ()
                                                                                   (199:18)-(199:21)
                                                                                   (ValString "PM")))]]
                                       Nothing],
                                 [BlStatement ()
                                              (202:9)-(202:18)
                                              Nothing
                                              (StExpressionAssign ()
                                                                  (202:9)-(202:18)
                                                                  (ExpValue ()
                                                                            (202:9)-(202:9)
                                                                            (ValVariable "h"))
                                                                  (ExpBinary ()
                                                                             (202:13)-(202:18)
                                                                             Subtraction
                                                                             (ExpValue ()
                                                                                       (202:13)-(202:13)
                                                                                       (ValVariable "h"))
                                                                             (ExpValue ()
                                                                                       (202:17)-(202:18)
                                                                                       (ValInteger "12"
                                                                                                   Nothing)))),
                                  BlIf ()
                                       (203:9)-(211:14)
                                       Nothing
                                       Nothing
                                       [Just ExpBinary ()
                                                       (203:14)-(203:22)
                                                       LT
                                                       (ExpValue ()
                                                                 (203:14)-(203:14)
                                                                 (ValVariable "h"))
                                                       (ExpValue ()
                                                                 (203:21)-(203:22)
                                                                 (ValInteger "12"
                                                                             Nothing)),
                                        Just ExpBinary ()
                                                       (205:19)-(205:27)
                                                       EQ
                                                       (ExpValue ()
                                                                 (205:19)-(205:19)
                                                                 (ValVariable "h"))
                                                       (ExpValue ()
                                                                 (205:26)-(205:27)
                                                                 (ValInteger "12"
                                                                             Nothing))]
                                       [[BlStatement ()
                                                     (204:11)-(204:21)
                                                     Nothing
                                                     (StExpressionAssign ()
                                                                         (204:11)-(204:21)
                                                                         (ExpValue ()
                                                                                   (204:11)-(204:14)
                                                                                   (ValVariable "ampm"))
                                                                         (ExpValue ()
                                                                                   (204:18)-(204:21)
                                                                                   (ValString "PM")))],
                                        [BlIf ()
                                              (206:11)-(210:16)
                                              Nothing
                                              Nothing
                                              [Just ExpBinary ()
                                                              (206:16)-(206:38)
                                                              And
                                                              (ExpBinary ()
                                                                         (206:16)-(206:23)
                                                                         EQ
                                                                         (ExpValue ()
                                                                                   (206:16)-(206:16)
                                                                                   (ValVariable "n"))
                                                                         (ExpValue ()
                                                                                   (206:23)-(206:23)
                                                                                   (ValInteger "0"
                                                                                               Nothing)))
                                                              (ExpBinary ()
                                                                         (206:31)-(206:38)
                                                                         EQ
                                                                         (ExpValue ()
                                                                                   (206:31)-(206:31)
                                                                                   (ValVariable "s"))
                                                                         (ExpValue ()
                                                                                   (206:38)-(206:38)
                                                                                   (ValInteger "0"
                                                                                               Nothing))),
                                               Nothing]
                                              [[BlStatement ()
                                                            (207:13)-(207:29)
                                                            Nothing
                                                            (StExpressionAssign ()
                                                                                (207:13)-(207:29)
                                                                                (ExpValue ()
                                                                                          (207:13)-(207:16)
                                                                                          (ValVariable "ampm"))
                                                                                (ExpValue ()
                                                                                          (207:20)-(207:29)
                                                                                          (ValString "Midnight")))],
                                               [BlStatement ()
                                                            (209:13)-(209:23)
                                                            Nothing
                                                            (StExpressionAssign ()
                                                                                (209:13)-(209:23)
                                                                                (ExpValue ()
                                                                                          (209:13)-(209:16)
                                                                                          (ValVariable "ampm"))
                                                                                (ExpValue ()
                                                                                          (209:20)-(209:23)
                                                                                          (ValString "AM")))]]
                                              Nothing]]
                                       Nothing]]
                                Nothing,
                           BlStatement ()
                                       (214:7)-(217:21)
                                       Nothing
                                       (StWrite ()
                                                (214:7)-(217:21)
                                                (AList ()
                                                       (214:13)-(215:62)
                                                       [ControlPair ()
                                                                    (214:15)-(214:15)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (214:15)-(214:15)
                                                                              ValStar),
                                                        ControlPair ()
                                                                    (215:9)-(215:60)
                                                                    Nothing
                                                                    (ExpValue ()
                                                                              (215:9)-(215:60)
                                                                              (ValString "(i2,1x,a,1x,i4,2x,i2,a1,i2.2,a1,i2.2,a1,i3.3,1x,a)"))])
                                                (Just AList ()
                                                            (216:9)-(217:21)
                                                            [ExpValue ()
                                                                      (216:9)-(216:9)
                                                                      (ValVariable "d"),
                                                             ExpFunctionCall ()
                                                                             (216:12)-(216:28)
                                                                             (ExpValue ()
                                                                                       (216:12)-(216:15)
                                                                                       (ValVariable "trim"))
                                                                             (Just AList ()
                                                                                         (216:19)-(216:26)
                                                                                         [Argument ()
                                                                                                   (216:19)-(216:26)
                                                                                                   Nothing
                                                                                                   (ArgExpr (ExpSubscript ()
                                                                                                                          (216:19)-(216:26)
                                                                                                                          (ExpValue ()
                                                                                                                                    (216:19)-(216:23)
                                                                                                                                    (ValVariable "month"))
                                                                                                                          (AList ()
                                                                                                                                 (216:25)-(216:25)
                                                                                                                                 [IxSingle ()
                                                                                                                                           (216:25)-(216:25)
                                                                                                                                           Nothing
                                                                                                                                           (ExpValue ()
                                                                                                                                                     (216:25)-(216:25)
                                                                                                                                                     (ValVariable "m"))])))]),
                                                             ExpValue ()
                                                                      (216:31)-(216:31)
                                                                      (ValVariable "y"),
                                                             ExpValue ()
                                                                      (216:34)-(216:34)
                                                                      (ValVariable "h"),
                                                             ExpValue ()
                                                                      (216:37)-(216:39)
                                                                      (ValString ":"),
                                                             ExpValue ()
                                                                      (216:42)-(216:42)
                                                                      (ValVariable "n"),
                                                             ExpValue ()
                                                                      (216:45)-(216:47)
                                                                      (ValString ":"),
                                                             ExpValue ()
                                                                      (216:50)-(216:50)
                                                                      (ValVariable "s"),
                                                             ExpValue ()
                                                                      (216:53)-(216:55)
                                                                      (ValString "."),
                                                             ExpValue ()
                                                                      (216:58)-(216:59)
                                                                      (ValVariable "mm"),
                                                             ExpFunctionCall ()
                                                                             (217:9)-(217:21)
                                                                             (ExpValue ()
                                                                                       (217:9)-(217:12)
                                                                                       (ValVariable "trim"))
                                                                             (Just AList ()
                                                                                         (217:16)-(217:19)
                                                                                         [Argument ()
                                                                                                   (217:16)-(217:19)
                                                                                                   Nothing
                                                                                                   (ArgExpr (ExpValue ()
                                                                                                                      (217:16)-(217:19)
                                                                                                                      (ValVariable "ampm")))])])),
                           BlStatement ()
                                       (219:7)-(219:12)
                                       Nothing
                                       (StReturn () (219:7)-(219:12) Nothing)]
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
