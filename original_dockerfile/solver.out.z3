(set-option :print-success true)
OUT: success

(set-option :produce-models true)
OUT: success

(set-logic AUFLIA)
OUT: success

(declare-sort REF 0)
OUT: success

(declare-fun NULL () REF)
OUT: success

(declare-fun THIS () REF)
OUT: success

(declare-fun stringConcat (REF REF ) REF)
OUT: success

(declare-fun stringLength (REF ) Int)
OUT: success

(assert (distinct THIS NULL))
OUT: success

(declare-fun __JMLlength () (Array REF Int))
OUT: success

(assert (forall ((o REF) ) (>= (select __JMLlength o) 0)))
OUT: success

(assert (forall ((s1 REF) (s2 REF) ) (distinct (stringConcat s1 s2) NULL)))
OUT: success

(declare-fun asIntArray (REF ) (Array Int Int))
OUT: success

(declare-fun asREFArray (REF ) (Array Int REF))
OUT: success

(declare-fun intValue (REF ) Int)
OUT: success

(declare-fun booleanValue (REF ) Bool)
OUT: success

(declare-sort JMLTypeSort 0)
OUT: success

(declare-fun javaTypeOf (REF ) REF)
OUT: success

(declare-fun jmlTypeOf (REF ) JMLTypeSort)
OUT: success

(declare-fun typearg1_1 (JMLTypeSort ) JMLTypeSort)
OUT: success

(declare-fun typearg2_1 (JMLTypeSort ) JMLTypeSort)
OUT: success

(declare-fun typearg2_2 (JMLTypeSort ) JMLTypeSort)
OUT: success

(declare-fun javaSubType (REF REF ) Bool)
OUT: success

(declare-fun jmlSubType (JMLTypeSort JMLTypeSort ) Bool)
OUT: success

(declare-fun erasure (JMLTypeSort ) REF)
OUT: success

(assert (forall ((o REF) ) (= (erasure (jmlTypeOf o)) (javaTypeOf o))))
OUT: success

(declare-fun _makeArrayType (REF ) REF)
OUT: success

(declare-fun _isArrayType (REF ) Bool)
OUT: success

(declare-fun _makeJMLArrayType (JMLTypeSort ) JMLTypeSort)
OUT: success

(declare-fun _isJMLArrayType (JMLTypeSort ) Bool)
OUT: success

(declare-fun __arrayElemType (JMLTypeSort ) JMLTypeSort)
OUT: success

(assert (forall ((T JMLTypeSort) ) (= (erasure (_makeJMLArrayType T)) (_makeArrayType (erasure T)))))
OUT: success

(assert (forall ((T JMLTypeSort) ) (= (__arrayElemType (_makeJMLArrayType T)) T)))
OUT: success

(assert (forall ((T REF) ) (_isArrayType (_makeArrayType T))))
OUT: success

(assert (forall ((T JMLTypeSort) ) (_isJMLArrayType (_makeJMLArrayType T))))
OUT: success

(assert (forall ((T1 REF) (T2 REF) ) (= (javaSubType (_makeArrayType T1) (_makeArrayType T2)) (javaSubType T1 T2))))
OUT: success

(assert (forall ((T1 JMLTypeSort) (T2 JMLTypeSort) ) (= (jmlSubType (_makeJMLArrayType T1) (_makeJMLArrayType T2)) (jmlSubType T1 T2))))
OUT: success

(declare-fun nonnullelements (REF (Array REF (Array Int REF)) ) Bool)
OUT: success

(assert (forall ((a REF) (arrays (Array REF (Array Int REF))) ) (= (nonnullelements a arrays) (forall ((i Int) ) (=> (and (<= 0 i) (< i (select __JMLlength a))) (distinct NULL (select (select arrays a) i)))))))
OUT: success

(assert (forall ((t JMLTypeSort) (tt JMLTypeSort) ) (=> (jmlSubType t tt) (javaSubType (erasure t) (erasure tt)))))
OUT: success

(declare-fun _JMLT_1 (REF JMLTypeSort ) JMLTypeSort)
OUT: success

(assert (forall ((JVT REF) (JMLT JMLTypeSort) ) (= (erasure (_JMLT_1 JVT JMLT)) JVT)))
OUT: success

(assert (forall ((JVT REF) (JMLT JMLTypeSort) ) (= (typearg1_1 (_JMLT_1 JVT JMLT)) JMLT)))
OUT: success

(assert (forall ((JVT REF) (JMLT1 JMLTypeSort) (JMLT2 JMLTypeSort) ) (=> (= (_JMLT_1 JVT JMLT1) (_JMLT_1 JVT JMLT2)) (= JMLT1 JMLT2))))
OUT: success

(declare-fun _JMLT_2 (REF JMLTypeSort JMLTypeSort ) JMLTypeSort)
OUT: success

(assert (forall ((JVT REF) (JMLT1 JMLTypeSort) (JMLT2 JMLTypeSort) ) (= (erasure (_JMLT_2 JVT JMLT1 JMLT2)) JVT)))
OUT: success

(assert (forall ((JVT REF) (JMLT1 JMLTypeSort) (JMLT2 JMLTypeSort) ) (= (typearg2_2 (_JMLT_2 JVT JMLT1 JMLT2)) JMLT2)))
OUT: success

(assert (forall ((T1 REF) (T2 REF) (J1 JMLTypeSort) (J2 JMLTypeSort) ) (=> (= (_JMLT_1 T1 J1) (_JMLT_1 T2 J2)) (and (= T1 T2) (= J1 J2)))))
OUT: success

(assert (forall ((T1 REF) (T2 REF) (J1 JMLTypeSort) ) (=> (javaSubType T1 T2) (jmlSubType (_JMLT_1 T1 J1) (_JMLT_1 T2 J1)))))
OUT: success

(assert (forall ((T1 REF) (T2 REF) (J1 JMLTypeSort) (J2 JMLTypeSort) ) (=> (and (javaSubType T1 T2) (distinct J1 J2)) (not (jmlSubType (_JMLT_1 T1 J1) (_JMLT_1 T2 J2))))))
OUT: success

(assert (forall ((T1 REF) (J1 JMLTypeSort) (J2 JMLTypeSort) ) (= (jmlSubType (_JMLT_1 T1 J1) (_JMLT_1 T1 J2)) (= J1 J2))))
OUT: success

(assert (forall ((T1 REF) (T2 REF) ) (=> (= T1 T2) (javaSubType T1 T2))))
OUT: success

(assert (forall ((T1 JMLTypeSort) (T2 JMLTypeSort) ) (=> (= T1 T2) (jmlSubType T1 T2))))
OUT: success

(assert (forall ((T1 JMLTypeSort) (T2 JMLTypeSort) ) (=> (jmlSubType T1 T2) (javaSubType (erasure T1) (erasure T2)))))
OUT: success

(declare-fun T_java_lang_Object () REF)
OUT: success

(assert (not (_isArrayType T_java_lang_Object)))
OUT: success

(declare-fun JMLT_java_lang_Object () JMLTypeSort)
OUT: success

(assert (not (_isJMLArrayType JMLT_java_lang_Object)))
OUT: success

(assert (= (erasure JMLT_java_lang_Object) T_java_lang_Object))
OUT: success

(declare-fun T_org_jmlspecs_lang_JMLDataGroup () REF)
OUT: success

(assert (not (_isArrayType T_org_jmlspecs_lang_JMLDataGroup)))
OUT: success

(assert (forall ((t REF) ) (=> (javaSubType t T_org_jmlspecs_lang_JMLDataGroup) (= t T_org_jmlspecs_lang_JMLDataGroup))))
OUT: success

(declare-fun JMLT_org_jmlspecs_lang_JMLDataGroup () JMLTypeSort)
OUT: success

(assert (not (_isJMLArrayType JMLT_org_jmlspecs_lang_JMLDataGroup)))
OUT: success

(assert (= (erasure JMLT_org_jmlspecs_lang_JMLDataGroup) T_org_jmlspecs_lang_JMLDataGroup))
OUT: success

(assert (forall ((t JMLTypeSort) ) (=> (jmlSubType t JMLT_org_jmlspecs_lang_JMLDataGroup) (= t JMLT_org_jmlspecs_lang_JMLDataGroup))))
OUT: success

(declare-fun T_java_lang_RuntimeException () REF)
OUT: success

(assert (not (_isArrayType T_java_lang_RuntimeException)))
OUT: success

(declare-fun JMLT_java_lang_RuntimeException () JMLTypeSort)
OUT: success

(assert (not (_isJMLArrayType JMLT_java_lang_RuntimeException)))
OUT: success

(assert (= (erasure JMLT_java_lang_RuntimeException) T_java_lang_RuntimeException))
OUT: success

(declare-fun T_java_lang_Exception () REF)
OUT: success

(assert (not (_isArrayType T_java_lang_Exception)))
OUT: success

(declare-fun JMLT_java_lang_Exception () JMLTypeSort)
OUT: success

(assert (not (_isJMLArrayType JMLT_java_lang_Exception)))
OUT: success

(assert (= (erasure JMLT_java_lang_Exception) T_java_lang_Exception))
OUT: success

(declare-fun T_java_lang_String () REF)
OUT: success

(assert (not (_isArrayType T_java_lang_String)))
OUT: success

(assert (forall ((t REF) ) (=> (javaSubType t T_java_lang_String) (= t T_java_lang_String))))
OUT: success

(declare-fun JMLT_java_lang_String () JMLTypeSort)
OUT: success

(assert (not (_isJMLArrayType JMLT_java_lang_String)))
OUT: success

(assert (= (erasure JMLT_java_lang_String) T_java_lang_String))
OUT: success

(assert (forall ((t JMLTypeSort) ) (=> (jmlSubType t JMLT_java_lang_String) (= t JMLT_java_lang_String))))
OUT: success

(assert (distinct T_java_lang_Object T_org_jmlspecs_lang_JMLDataGroup T_java_lang_RuntimeException T_java_lang_Exception T_java_lang_String))
OUT: success

(assert (distinct JMLT_java_lang_Object JMLT_org_jmlspecs_lang_JMLDataGroup JMLT_java_lang_RuntimeException JMLT_java_lang_Exception JMLT_java_lang_String))
OUT: success

(assert (javaSubType T_java_lang_Object T_java_lang_Object))
OUT: success

(assert (javaSubType (_makeArrayType T_java_lang_Object) (_makeArrayType T_java_lang_Object)))
OUT: success

(assert (jmlSubType JMLT_java_lang_Object JMLT_java_lang_Object))
OUT: success

(assert (jmlSubType (_makeJMLArrayType JMLT_java_lang_Object) (_makeJMLArrayType JMLT_java_lang_Object)))
OUT: success

(assert (not (javaSubType T_java_lang_Object T_org_jmlspecs_lang_JMLDataGroup)))
OUT: success

(assert (not (javaSubType (_makeArrayType T_java_lang_Object) (_makeArrayType T_org_jmlspecs_lang_JMLDataGroup))))
OUT: success

(assert (not (jmlSubType JMLT_java_lang_Object JMLT_org_jmlspecs_lang_JMLDataGroup)))
OUT: success

(assert (not (jmlSubType (_makeJMLArrayType JMLT_java_lang_Object) (_makeJMLArrayType JMLT_org_jmlspecs_lang_JMLDataGroup))))
OUT: success

(assert (not (javaSubType T_java_lang_Object T_java_lang_RuntimeException)))
OUT: success

(assert (not (javaSubType (_makeArrayType T_java_lang_Object) (_makeArrayType T_java_lang_RuntimeException))))
OUT: success

(assert (not (jmlSubType JMLT_java_lang_Object JMLT_java_lang_RuntimeException)))
OUT: success

(assert (not (jmlSubType (_makeJMLArrayType JMLT_java_lang_Object) (_makeJMLArrayType JMLT_java_lang_RuntimeException))))
OUT: success

(assert (not (javaSubType T_java_lang_Object T_java_lang_Exception)))
OUT: success

(assert (not (javaSubType (_makeArrayType T_java_lang_Object) (_makeArrayType T_java_lang_Exception))))
OUT: success

(assert (not (jmlSubType JMLT_java_lang_Object JMLT_java_lang_Exception)))
OUT: success

(assert (not (jmlSubType (_makeJMLArrayType JMLT_java_lang_Object) (_makeJMLArrayType JMLT_java_lang_Exception))))
OUT: success

(assert (not (javaSubType T_java_lang_Object T_java_lang_String)))
OUT: success

(assert (not (javaSubType (_makeArrayType T_java_lang_Object) (_makeArrayType T_java_lang_String))))
OUT: success

(assert (not (jmlSubType JMLT_java_lang_Object JMLT_java_lang_String)))
OUT: success

(assert (not (jmlSubType (_makeJMLArrayType JMLT_java_lang_Object) (_makeJMLArrayType JMLT_java_lang_String))))
OUT: success

(assert (javaSubType T_org_jmlspecs_lang_JMLDataGroup T_java_lang_Object))
OUT: success

(assert (javaSubType (_makeArrayType T_org_jmlspecs_lang_JMLDataGroup) (_makeArrayType T_java_lang_Object)))
OUT: success

(assert (jmlSubType JMLT_org_jmlspecs_lang_JMLDataGroup JMLT_java_lang_Object))
OUT: success

(assert (jmlSubType (_makeJMLArrayType JMLT_org_jmlspecs_lang_JMLDataGroup) (_makeJMLArrayType JMLT_java_lang_Object)))
OUT: success

(assert (javaSubType T_org_jmlspecs_lang_JMLDataGroup T_org_jmlspecs_lang_JMLDataGroup))
OUT: success

(assert (javaSubType (_makeArrayType T_org_jmlspecs_lang_JMLDataGroup) (_makeArrayType T_org_jmlspecs_lang_JMLDataGroup)))
OUT: success

(assert (jmlSubType JMLT_org_jmlspecs_lang_JMLDataGroup JMLT_org_jmlspecs_lang_JMLDataGroup))
OUT: success

(assert (jmlSubType (_makeJMLArrayType JMLT_org_jmlspecs_lang_JMLDataGroup) (_makeJMLArrayType JMLT_org_jmlspecs_lang_JMLDataGroup)))
OUT: success

(assert (not (javaSubType T_org_jmlspecs_lang_JMLDataGroup T_java_lang_RuntimeException)))
OUT: success

(assert (not (javaSubType (_makeArrayType T_org_jmlspecs_lang_JMLDataGroup) (_makeArrayType T_java_lang_RuntimeException))))
OUT: success

(assert (not (jmlSubType JMLT_org_jmlspecs_lang_JMLDataGroup JMLT_java_lang_RuntimeException)))
OUT: success

(assert (not (jmlSubType (_makeJMLArrayType JMLT_org_jmlspecs_lang_JMLDataGroup) (_makeJMLArrayType JMLT_java_lang_RuntimeException))))
OUT: success

(assert (not (javaSubType T_org_jmlspecs_lang_JMLDataGroup T_java_lang_Exception)))
OUT: success

(assert (not (javaSubType (_makeArrayType T_org_jmlspecs_lang_JMLDataGroup) (_makeArrayType T_java_lang_Exception))))
OUT: success

(assert (not (jmlSubType JMLT_org_jmlspecs_lang_JMLDataGroup JMLT_java_lang_Exception)))
OUT: success

(assert (not (jmlSubType (_makeJMLArrayType JMLT_org_jmlspecs_lang_JMLDataGroup) (_makeJMLArrayType JMLT_java_lang_Exception))))
OUT: success

(assert (not (javaSubType T_org_jmlspecs_lang_JMLDataGroup T_java_lang_String)))
OUT: success

(assert (not (javaSubType (_makeArrayType T_org_jmlspecs_lang_JMLDataGroup) (_makeArrayType T_java_lang_String))))
OUT: success

(assert (not (jmlSubType JMLT_org_jmlspecs_lang_JMLDataGroup JMLT_java_lang_String)))
OUT: success

(assert (not (jmlSubType (_makeJMLArrayType JMLT_org_jmlspecs_lang_JMLDataGroup) (_makeJMLArrayType JMLT_java_lang_String))))
OUT: success

(assert (javaSubType T_java_lang_RuntimeException T_java_lang_Object))
OUT: success

(assert (javaSubType (_makeArrayType T_java_lang_RuntimeException) (_makeArrayType T_java_lang_Object)))
OUT: success

(assert (jmlSubType JMLT_java_lang_RuntimeException JMLT_java_lang_Object))
OUT: success

(assert (jmlSubType (_makeJMLArrayType JMLT_java_lang_RuntimeException) (_makeJMLArrayType JMLT_java_lang_Object)))
OUT: success

(assert (not (javaSubType T_java_lang_RuntimeException T_org_jmlspecs_lang_JMLDataGroup)))
OUT: success

(assert (not (javaSubType (_makeArrayType T_java_lang_RuntimeException) (_makeArrayType T_org_jmlspecs_lang_JMLDataGroup))))
OUT: success

(assert (not (jmlSubType JMLT_java_lang_RuntimeException JMLT_org_jmlspecs_lang_JMLDataGroup)))
OUT: success

(assert (not (jmlSubType (_makeJMLArrayType JMLT_java_lang_RuntimeException) (_makeJMLArrayType JMLT_org_jmlspecs_lang_JMLDataGroup))))
OUT: success

(assert (javaSubType T_java_lang_RuntimeException T_java_lang_RuntimeException))
OUT: success

(assert (javaSubType (_makeArrayType T_java_lang_RuntimeException) (_makeArrayType T_java_lang_RuntimeException)))
OUT: success

(assert (jmlSubType JMLT_java_lang_RuntimeException JMLT_java_lang_RuntimeException))
OUT: success

(assert (jmlSubType (_makeJMLArrayType JMLT_java_lang_RuntimeException) (_makeJMLArrayType JMLT_java_lang_RuntimeException)))
OUT: success

(assert (javaSubType T_java_lang_RuntimeException T_java_lang_Exception))
OUT: success

(assert (javaSubType (_makeArrayType T_java_lang_RuntimeException) (_makeArrayType T_java_lang_Exception)))
OUT: success

(assert (jmlSubType JMLT_java_lang_RuntimeException JMLT_java_lang_Exception))
OUT: success

(assert (jmlSubType (_makeJMLArrayType JMLT_java_lang_RuntimeException) (_makeJMLArrayType JMLT_java_lang_Exception)))
OUT: success

(assert (not (javaSubType T_java_lang_RuntimeException T_java_lang_String)))
OUT: success

(assert (not (javaSubType (_makeArrayType T_java_lang_RuntimeException) (_makeArrayType T_java_lang_String))))
OUT: success

(assert (not (jmlSubType JMLT_java_lang_RuntimeException JMLT_java_lang_String)))
OUT: success

(assert (not (jmlSubType (_makeJMLArrayType JMLT_java_lang_RuntimeException) (_makeJMLArrayType JMLT_java_lang_String))))
OUT: success

(assert (javaSubType T_java_lang_Exception T_java_lang_Object))
OUT: success

(assert (javaSubType (_makeArrayType T_java_lang_Exception) (_makeArrayType T_java_lang_Object)))
OUT: success

(assert (jmlSubType JMLT_java_lang_Exception JMLT_java_lang_Object))
OUT: success

(assert (jmlSubType (_makeJMLArrayType JMLT_java_lang_Exception) (_makeJMLArrayType JMLT_java_lang_Object)))
OUT: success

(assert (not (javaSubType T_java_lang_Exception T_org_jmlspecs_lang_JMLDataGroup)))
OUT: success

(assert (not (javaSubType (_makeArrayType T_java_lang_Exception) (_makeArrayType T_org_jmlspecs_lang_JMLDataGroup))))
OUT: success

(assert (not (jmlSubType JMLT_java_lang_Exception JMLT_org_jmlspecs_lang_JMLDataGroup)))
OUT: success

(assert (not (jmlSubType (_makeJMLArrayType JMLT_java_lang_Exception) (_makeJMLArrayType JMLT_org_jmlspecs_lang_JMLDataGroup))))
OUT: success

(assert (not (javaSubType T_java_lang_Exception T_java_lang_RuntimeException)))
OUT: success

(assert (not (javaSubType (_makeArrayType T_java_lang_Exception) (_makeArrayType T_java_lang_RuntimeException))))
OUT: success

(assert (not (jmlSubType JMLT_java_lang_Exception JMLT_java_lang_RuntimeException)))
OUT: success

(assert (not (jmlSubType (_makeJMLArrayType JMLT_java_lang_Exception) (_makeJMLArrayType JMLT_java_lang_RuntimeException))))
OUT: success

(assert (javaSubType T_java_lang_Exception T_java_lang_Exception))
OUT: success

(assert (javaSubType (_makeArrayType T_java_lang_Exception) (_makeArrayType T_java_lang_Exception)))
OUT: success

(assert (jmlSubType JMLT_java_lang_Exception JMLT_java_lang_Exception))
OUT: success

(assert (jmlSubType (_makeJMLArrayType JMLT_java_lang_Exception) (_makeJMLArrayType JMLT_java_lang_Exception)))
OUT: success

(assert (not (javaSubType T_java_lang_Exception T_java_lang_String)))
OUT: success

(assert (not (javaSubType (_makeArrayType T_java_lang_Exception) (_makeArrayType T_java_lang_String))))
OUT: success

(assert (not (jmlSubType JMLT_java_lang_Exception JMLT_java_lang_String)))
OUT: success

(assert (not (jmlSubType (_makeJMLArrayType JMLT_java_lang_Exception) (_makeJMLArrayType JMLT_java_lang_String))))
OUT: success

(assert (javaSubType T_java_lang_String T_java_lang_Object))
OUT: success

(assert (javaSubType (_makeArrayType T_java_lang_String) (_makeArrayType T_java_lang_Object)))
OUT: success

(assert (jmlSubType JMLT_java_lang_String JMLT_java_lang_Object))
OUT: success

(assert (jmlSubType (_makeJMLArrayType JMLT_java_lang_String) (_makeJMLArrayType JMLT_java_lang_Object)))
OUT: success

(assert (not (javaSubType T_java_lang_String T_org_jmlspecs_lang_JMLDataGroup)))
OUT: success

(assert (not (javaSubType (_makeArrayType T_java_lang_String) (_makeArrayType T_org_jmlspecs_lang_JMLDataGroup))))
OUT: success

(assert (not (jmlSubType JMLT_java_lang_String JMLT_org_jmlspecs_lang_JMLDataGroup)))
OUT: success

(assert (not (jmlSubType (_makeJMLArrayType JMLT_java_lang_String) (_makeJMLArrayType JMLT_org_jmlspecs_lang_JMLDataGroup))))
OUT: success

(assert (not (javaSubType T_java_lang_String T_java_lang_RuntimeException)))
OUT: success

(assert (not (javaSubType (_makeArrayType T_java_lang_String) (_makeArrayType T_java_lang_RuntimeException))))
OUT: success

(assert (not (jmlSubType JMLT_java_lang_String JMLT_java_lang_RuntimeException)))
OUT: success

(assert (not (jmlSubType (_makeJMLArrayType JMLT_java_lang_String) (_makeJMLArrayType JMLT_java_lang_RuntimeException))))
OUT: success

(assert (not (javaSubType T_java_lang_String T_java_lang_Exception)))
OUT: success

(assert (not (javaSubType (_makeArrayType T_java_lang_String) (_makeArrayType T_java_lang_Exception))))
OUT: success

(assert (not (jmlSubType JMLT_java_lang_String JMLT_java_lang_Exception)))
OUT: success

(assert (not (jmlSubType (_makeJMLArrayType JMLT_java_lang_String) (_makeJMLArrayType JMLT_java_lang_Exception))))
OUT: success

(assert (javaSubType T_java_lang_String T_java_lang_String))
OUT: success

(assert (javaSubType (_makeArrayType T_java_lang_String) (_makeArrayType T_java_lang_String)))
OUT: success

(assert (jmlSubType JMLT_java_lang_String JMLT_java_lang_String))
OUT: success

(assert (jmlSubType (_makeJMLArrayType JMLT_java_lang_String) (_makeJMLArrayType JMLT_java_lang_String)))
OUT: success

(assert (forall ((t1 REF) (t2 REF) (t3 REF) ) (=> (and (javaSubType t1 t2) (javaSubType t2 t3)) (javaSubType t1 t3))))
OUT: success

(assert (forall ((t1 JMLTypeSort) (t2 JMLTypeSort) (t3 JMLTypeSort) ) (=> (and (jmlSubType t1 t2) (jmlSubType t2 t3)) (jmlSubType t1 t3))))
OUT: success

(declare-fun _heap___0 () Int)
OUT: success

(declare-fun java.lang.Object_owner_1585 () (Array REF REF))
OUT: success

(declare-fun java.lang.Object_objectTimesFinalized_9204 () (Array REF Int))
OUT: success

(declare-fun java.lang.Object_objectState_1211 () (Array REF REF))
OUT: success

(declare-fun java.lang.Object_privateState_1345 () (Array REF REF))
OUT: success

(declare-fun java.lang.CharSequence_charArray_1068 () (Array REF REF))
OUT: success

(declare-fun _isalloc___7 () (Array REF Bool))
OUT: success

(declare-fun java.lang.Object_theHashCode_2129 () (Array REF Int))
OUT: success

(declare-fun java.lang.Object_theString_6957 () (Array REF REF))
OUT: success

(declare-fun args_0 () REF)
OUT: success

(declare-fun _JML___exception_206_206___1 () REF)
OUT: success

(declare-fun _JML___termination_206_206___2 () Int)
OUT: success

(declare-fun args_218 () REF)
OUT: success

(declare-fun Pre_2_0_206___3 () Bool)
OUT: success

(declare-fun Pre_2_0_206___4 () Bool)
OUT: success

(declare-fun ASSERT_66_206_206___5 () Bool)
OUT: success

(declare-fun ASSERT_68_1123_1123___6 () Bool)
OUT: success

(declare-fun ASSERT_70_43_43___7 () Bool)
OUT: success

(declare-fun privateState_1345_34___8 () (Array REF REF))
OUT: success

(declare-fun charArray_1068_34___9 () (Array REF REF))
OUT: success

(declare-fun theHashCode_2129_34___10 () (Array REF Int))
OUT: success

(declare-fun owner_1585_34___11 () (Array REF REF))
OUT: success

(declare-fun objectTimesFinalized_9204_34___12 () (Array REF Int))
OUT: success

(declare-fun objectState_1211_34___13 () (Array REF REF))
OUT: success

(declare-fun _isalloc___7_34___14 () (Array REF Bool))
OUT: success

(declare-fun theString_6957_34___15 () (Array REF REF))
OUT: success

(declare-fun _JML___exceptionCall_307_307___16 () REF)
OUT: success

(declare-fun _JML___exception_206_307___17 () REF)
OUT: success

(declare-fun _JML___termination_206_307___18 () Int)
OUT: success

(declare-fun ASSERT_64_206_206___19 () Bool)
OUT: success

(declare-fun ASSERT_74_206_206___20 () Bool)
OUT: success

(declare-fun BL_206Start_1 () Bool)
OUT: success

(declare-fun BL_225bodyBegin_2 () Bool)
OUT: success

(declare-fun BL_206_AfterLabel_10 () Bool)
OUT: success

(declare-fun BL_255_then_12 () Bool)
OUT: success

(declare-fun BL_255_else_13 () Bool)
OUT: success

(declare-fun BL_255_afterIf_11 () Bool)
OUT: success

(declare-fun BL_307_AfterLabel_14 () Bool)
OUT: success

(declare-fun BL_35_then_16 () Bool)
OUT: success

(declare-fun BL_35_else_17 () Bool)
OUT: success

(declare-fun BL_35_afterIf_15 () Bool)
OUT: success

(declare-fun BL_307_then_19 () Bool)
OUT: success

(declare-fun BL_307_else_20 () Bool)
OUT: success

(declare-fun BL_307_afterIf_18 () Bool)
OUT: success

(declare-fun BL_307_then_22 () Bool)
OUT: success

(declare-fun BL_35_then_25 () Bool)
OUT: success

(declare-fun BL_35_else_26 () Bool)
OUT: success

(declare-fun BL_35_afterIf_24 () Bool)
OUT: success

(declare-fun BL_307_else_23 () Bool)
OUT: success

(declare-fun BL_35_then_28 () Bool)
OUT: success

(declare-fun BL_35_else_29 () Bool)
OUT: success

(declare-fun BL_35_afterIf_27 () Bool)
OUT: success

(declare-fun BL_307_throw_30 () Bool)
OUT: success

(declare-fun BL_307_afterIf_21 () Bool)
OUT: success

(declare-fun BL_206tryTarget_4 () Bool)
OUT: success

(declare-fun BL_206noException_6 () Bool)
OUT: success

(declare-fun BL_206nocatch_7 () Bool)
OUT: success

(declare-fun BL_206_finally_5 () Bool)
OUT: success

(declare-fun BL_206_then_32 () Bool)
OUT: success

(declare-fun BL_206_else_33 () Bool)
OUT: success

(declare-fun BL_206_afterIf_31 () Bool)
OUT: success

(declare-fun BL_206finallyNormal_8 () Bool)
OUT: success

(declare-fun BL_206finallyExit_9 () Bool)
OUT: success

(declare-fun BL_206_AfterTry_3 () Bool)
OUT: success

(assert (= BL_206Start_1 BL_225bodyBegin_2))
OUT: success

(declare-fun __JML_AssumeCheck_ () Int)
OUT: success

(define-fun PRE_args_218 () REF args_218)
OUT: success

(declare-fun _java.lang.CharSequence.equal (REF REF ) Bool)
OUT: success

(declare-fun _java.lang.String.lessThan (REF REF ) Bool)
OUT: success

(declare-fun _JMLSMT_tmp_1 () Bool)
OUT: success

(assert (= _JMLSMT_tmp_1 (forall ((s1 REF) (s2 REF) ) (=> (and (distinct s1 NULL) (distinct s2 NULL)) (or (not (not (_java.lang.CharSequence.equal s1 s2))) (distinct (_java.lang.String.lessThan s1 s2) (_java.lang.String.lessThan s2 s1)))))))
OUT: success

(declare-fun _java.lang.String.equals (REF REF ) Bool)
OUT: success

(declare-fun _JMLSMT_tmp_2 () Bool)
OUT: success

(assert (= _JMLSMT_tmp_2 (forall ((s1 REF) (s2 REF) (s3 REF) ) (or (not (_java.lang.String.equals s1 s2)) (= (_java.lang.String.equals s1 s3) (_java.lang.String.equals s2 s3))))))
OUT: success

(declare-fun _JMLSMT_tmp_3 () Bool)
OUT: success

(assert (= _JMLSMT_tmp_3 (forall ((s REF) (ss REF) ) (or (not (_java.lang.String.equals s ss)) (_java.lang.String.equals ss s)))))
OUT: success

(declare-fun length (REF ) Int)
OUT: success

(declare-fun _JMLSMT_tmp_4 () Bool)
OUT: success

(assert (= _JMLSMT_tmp_4 (forall ((s REF) (ss REF) ) (or (not (_java.lang.String.equals s ss)) (= (length s) (length ss))))))
OUT: success

(declare-fun _JMLSMT_tmp_5 () Bool)
OUT: success

(assert (= _JMLSMT_tmp_5 (forall ((a REF) (b REF) (c REF) ) (=> (and (and (distinct a NULL) (distinct b NULL)) (distinct c NULL)) (or (not (and (_java.lang.CharSequence.equal a b) (_java.lang.CharSequence.equal b c))) (_java.lang.CharSequence.equal a c))))))
OUT: success

(declare-fun _JMLSMT_tmp_6 () Bool)
OUT: success

(assert (= _JMLSMT_tmp_6 (forall ((a REF) (b REF) ) (=> (and (distinct a NULL) (distinct b NULL)) (= (_java.lang.CharSequence.equal a b) (_java.lang.CharSequence.equal b a))))))
OUT: success

(declare-fun _JMLSMT_tmp_7 () Bool)
OUT: success

(assert (= _JMLSMT_tmp_7 (forall ((a REF) ) (=> (distinct a NULL) (_java.lang.CharSequence.equal a a)))))
OUT: success

(assert (= BL_225bodyBegin_2 (=> (= _JML___exception_206_206___1 NULL) (=> (= _JML___termination_206_206___2 0) (=> _JMLSMT_tmp_7 (=> _JMLSMT_tmp_6 (=> _JMLSMT_tmp_5 (=> _JMLSMT_tmp_4 (=> _JMLSMT_tmp_3 (=> _JMLSMT_tmp_2 (=> _JMLSMT_tmp_1 (=> (and (<= (- 2147483648) (select java.lang.Object_objectTimesFinalized_9204 THIS)) (<= (select java.lang.Object_objectTimesFinalized_9204 THIS) 2147483647)) (=> (distinct (select java.lang.Object_theString_6957 THIS) NULL) (=> (select _isalloc___7 (select java.lang.Object_theString_6957 THIS)) (=> (or (= (select java.lang.Object_theString_6957 THIS) NULL) (and (and (distinct (select java.lang.Object_theString_6957 THIS) NULL) (javaSubType (javaTypeOf (select java.lang.Object_theString_6957 THIS)) T_java_lang_String)) (jmlSubType (jmlTypeOf (select java.lang.Object_theString_6957 THIS)) JMLT_java_lang_String))) (=> (and (<= (- 2147483648) (select java.lang.Object_theHashCode_2129 THIS)) (<= (select java.lang.Object_theHashCode_2129 THIS) 2147483647)) (=> (or (= (select java.lang.Object_owner_1585 THIS) NULL) (select _isalloc___7 (select java.lang.Object_owner_1585 THIS))) (=> (or (= (select java.lang.Object_owner_1585 THIS) NULL) (and (and (distinct (select java.lang.Object_owner_1585 THIS) NULL) (javaSubType (javaTypeOf (select java.lang.Object_owner_1585 THIS)) T_java_lang_Object)) (jmlSubType (jmlTypeOf (select java.lang.Object_owner_1585 THIS)) JMLT_java_lang_Object))) (=> (distinct (select java.lang.Object_privateState_1345 THIS) NULL) (=> (select _isalloc___7 (select java.lang.Object_privateState_1345 THIS)) (=> (or (= (select java.lang.Object_privateState_1345 THIS) NULL) (and (and (distinct (select java.lang.Object_privateState_1345 THIS) NULL) (javaSubType (javaTypeOf (select java.lang.Object_privateState_1345 THIS)) T_org_jmlspecs_lang_JMLDataGroup)) (jmlSubType (jmlTypeOf (select java.lang.Object_privateState_1345 THIS)) JMLT_org_jmlspecs_lang_JMLDataGroup))) (=> (distinct (select java.lang.Object_objectState_1211 THIS) NULL) (=> (select _isalloc___7 (select java.lang.Object_objectState_1211 THIS)) (=> (or (= (select java.lang.Object_objectState_1211 THIS) NULL) (and (and (distinct (select java.lang.Object_objectState_1211 THIS) NULL) (javaSubType (javaTypeOf (select java.lang.Object_objectState_1211 THIS)) T_org_jmlspecs_lang_JMLDataGroup)) (jmlSubType (jmlTypeOf (select java.lang.Object_objectState_1211 THIS)) JMLT_org_jmlspecs_lang_JMLDataGroup))) (=> (distinct args_218 NULL) (=> (select _isalloc___7 args_218) (=> (or (= args_218 NULL) (and (jmlSubType (jmlTypeOf args_218) (_makeJMLArrayType JMLT_java_lang_String)) (jmlSubType (__arrayElemType (jmlTypeOf args_218)) JMLT_java_lang_String))) (=> (= Pre_2_0_206___3 false) (=> (= Pre_2_0_206___4 (distinct args_218 NULL)) (=> Pre_2_0_206___4 (=> (= ASSERT_66_206_206___5 (distinct __JML_AssumeCheck_ 1)) (and ASSERT_66_206_206___5 BL_206_AfterLabel_10))))))))))))))))))))))))))))))))
OUT: success

(declare-fun STRINGLIT1 () REF)
OUT: success

(define-fun _JML__tmp5 () REF STRINGLIT1)
OUT: success

(assert (= BL_206_AfterLabel_10 (=> (distinct _JML__tmp5 NULL) (and BL_255_then_12 BL_255_else_13))))
OUT: success

(assert (= BL_255_then_12 (=> (distinct _JML__tmp5 NULL) (=> (= ASSERT_68_1123_1123___6 (or (not (and true (distinct (select java.lang.CharSequence_charArray_1068 _JML__tmp5) NULL))) (distinct (select java.lang.CharSequence_charArray_1068 _JML__tmp5) NULL))) (and ASSERT_68_1123_1123___6 (=> (= (select java.lang.Object_owner_1585 (select java.lang.CharSequence_charArray_1068 _JML__tmp5)) _JML__tmp5) BL_255_afterIf_11))))))
OUT: success

(assert (= BL_255_else_13 (=> (not (distinct _JML__tmp5 NULL)) BL_255_afterIf_11)))
OUT: success

(define-fun _JML__tmp6 () Int 2)
OUT: success

(define-fun _JML__tmp7 () Int 3)
OUT: success

(declare-fun _JML__tmp8 () Int)
OUT: success

(assert (= BL_255_afterIf_11 BL_307_AfterLabel_14))
OUT: success

(define-fun _JML__tmp10 () Bool (and (> _JML__tmp6 0) (> _JML__tmp7 0)))
OUT: success

(assert (= BL_307_AfterLabel_14 (=> (= ASSERT_70_43_43___7 _JML__tmp10) (and ASSERT_70_43_43___7 (and BL_35_then_16 BL_35_else_17)))))
OUT: success

(assert (= BL_35_then_16 (=> _JML__tmp10 BL_35_afterIf_15)))
OUT: success

(assert (= BL_35_else_17 (=> (not _JML__tmp10) (=> (= privateState_1345_34___8 java.lang.Object_privateState_1345) (=> (= charArray_1068_34___9 java.lang.CharSequence_charArray_1068) (=> (= theHashCode_2129_34___10 java.lang.Object_theHashCode_2129) (=> (= owner_1585_34___11 java.lang.Object_owner_1585) (=> (= objectTimesFinalized_9204_34___12 java.lang.Object_objectTimesFinalized_9204) (=> (= objectState_1211_34___13 java.lang.Object_objectState_1211) (=> (= _isalloc___7_34___14 _isalloc___7) (=> (= theString_6957_34___15 java.lang.Object_theString_6957) BL_35_afterIf_15)))))))))))
OUT: success

(assert (= BL_35_afterIf_15 (and BL_307_then_19 BL_307_else_20)))
OUT: success

(assert (= BL_307_then_19 (=> (= _JML___exception_206_206___1 NULL) BL_307_afterIf_18)))
OUT: success

(assert (= BL_307_else_20 (=> (not (= _JML___exception_206_206___1 NULL)) BL_307_afterIf_18)))
OUT: success

(assert (= BL_307_afterIf_18 (and BL_307_then_22 BL_307_else_23)))
OUT: success

(assert (= BL_307_then_22 (=> (= _JML___exceptionCall_307_307___16 NULL) (and BL_35_then_25 BL_35_else_26))))
OUT: success

(assert (= BL_35_then_25 (=> _JML__tmp10 (=> (= _JML__tmp8 (+ _JML__tmp6 _JML__tmp7)) BL_35_afterIf_24))))
OUT: success

(assert (= BL_35_else_26 (=> (not _JML__tmp10) BL_35_afterIf_24)))
OUT: success

(assert (= BL_35_afterIf_24 BL_307_afterIf_21))
OUT: success

(assert (= BL_307_else_23 (=> (not (= _JML___exceptionCall_307_307___16 NULL)) (=> (= _JML___exception_206_307___17 _JML___exceptionCall_307_307___16) (=> (= _JML___termination_206_307___18 (- 307)) (=> (and (and (distinct _JML___exception_206_307___17 NULL) (javaSubType (javaTypeOf _JML___exception_206_307___17) T_java_lang_RuntimeException)) (and (distinct _JML___exception_206_307___17 NULL) (javaSubType (javaTypeOf _JML___exception_206_307___17) T_java_lang_Exception))) (and BL_35_then_28 BL_35_else_29)))))))
OUT: success

(assert (= BL_35_then_28 (=> _JML__tmp10 (=> (or false (and (distinct _JML___exception_206_307___17 NULL) (javaSubType (javaTypeOf _JML___exception_206_307___17) T_java_lang_RuntimeException))) BL_35_afterIf_27))))
OUT: success

(assert (= BL_35_else_29 (=> (not _JML__tmp10) BL_35_afterIf_27)))
OUT: success

(assert (= BL_35_afterIf_27 BL_307_throw_30))
OUT: success

(assert (= BL_307_throw_30 BL_206tryTarget_4))
OUT: success

(assert (= BL_307_afterIf_21 (=> (= _JML___exception_206_307___17 _JML___exception_206_206___1) (=> (= _JML___termination_206_307___18 _JML___termination_206_206___2) BL_206tryTarget_4))))
OUT: success

(assert (= BL_206tryTarget_4 (and BL_206noException_6 BL_206nocatch_7)))
OUT: success

(assert (= BL_206noException_6 (=> (= _JML___exception_206_307___17 NULL) BL_206_finally_5)))
OUT: success

(assert (= BL_206nocatch_7 (=> (distinct _JML___exception_206_307___17 NULL) BL_206_finally_5)))
OUT: success

(assert (= BL_206_finally_5 (and BL_206_then_32 BL_206_else_33)))
OUT: success

(assert (= BL_206_then_32 (=> (= _JML___exception_206_307___17 NULL) BL_206_afterIf_31)))
OUT: success

(assert (= BL_206_else_33 (=> (not (= _JML___exception_206_307___17 NULL)) (=> (= ASSERT_64_206_206___19 (and (distinct _JML___exception_206_307___17 NULL) (javaSubType (javaTypeOf _JML___exception_206_307___17) T_java_lang_RuntimeException))) (and ASSERT_64_206_206___19 BL_206_afterIf_31)))))
OUT: success

(assert (= BL_206_afterIf_31 (=> (= ASSERT_74_206_206___20 (distinct __JML_AssumeCheck_ 2)) (and ASSERT_74_206_206___20 (and BL_206finallyNormal_8 BL_206finallyExit_9)))))
OUT: success

(assert (= BL_206finallyNormal_8 (=> (= _JML___termination_206_307___18 0) BL_206_AfterTry_3)))
OUT: success

(assert (= BL_206finallyExit_9 (=> (distinct _JML___termination_206_307___18 0) BL_206_AfterTry_3)))
OUT: success

(assert (= BL_206_AfterTry_3 true))
OUT: success

(assert (not BL_206Start_1))
OUT: success

(push 1)
OUT: success

(assert (= __JML_AssumeCheck_ 0))
OUT: success

(push 1)
OUT: success

(check-sat)
OUT: unsat

(pop 1)
OUT: success

(pop 1)
OUT: success

(push 1)
OUT: success

(assert (= __JML_AssumeCheck_ 1))
OUT: success

(check-sat)
OUT: unknown

(pop 1)
OUT: success

(push 1)
OUT: success

(assert (= __JML_AssumeCheck_ 2))
OUT: success

(check-sat)
OUT: unknown

(exit)
OUT: success

Exiting solver
