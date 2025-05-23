Set Warnings "-notation-overridden,-parsing".
From Coq Require Export String.
From Lectures Require Import Lecture5.

Parameter MISSING: Type.

Module Check.

Ltac check_type A B :=
    match type of A with
    | context[MISSING] => idtac "Missing:" A
    | ?T => first [unify T B; idtac "Type: ok" | idtac "Type: wrong - should be (" B ")"]
    end.

Ltac print_manual_grade A :=
    match eval compute in A with
    | Some (_ ?S ?C) =>
        idtac "Score:"  S;
        match eval compute in C with
          | ""%string => idtac "Comment: None"
          | _ => idtac "Comment:" C
        end
    | None =>
        idtac "Score: Ungraded";
        idtac "Comment: None"
    end.

End Check.

From Lectures Require Import Lecture5.
Import Check.

Goal True.

idtac "-------------------  t_update_same  --------------------".
idtac " ".

idtac "#> t_update_same".
idtac "Possible points: 2".
check_type @t_update_same (
(forall (A : Type) (m : total_map A) (x : string), (x !-> m x; m) = m)).
idtac "Assumptions:".
Abort.
Print Assumptions t_update_same.
Goal True.
idtac " ".

idtac "-------------------  t_update_permute  --------------------".
idtac " ".

idtac "#> t_update_permute".
idtac "Possible points: 3".
check_type @t_update_permute (
(forall (A : Type) (m : total_map A) (v1 v2 : A) (x1 x2 : string),
 x2 <> x1 -> (x1 !-> v1; x2 !-> v2; m) = (x2 !-> v2; x1 !-> v1; m))).
idtac "Assumptions:".
Abort.
Print Assumptions t_update_permute.
Goal True.
idtac " ".

idtac "-------------------  optimize_0plus_b_sound  --------------------".
idtac " ".

idtac "#> AExp.optimize_0plus_b_test1".
idtac "Possible points: 0.5".
check_type @AExp.optimize_0plus_b_test1 (
(AExp.optimize_0plus_b
   (AExp.BNot
      (AExp.BGt (AExp.APlus (AExp.ANum 0) (AExp.ANum 4)) (AExp.ANum 8))) =
 AExp.BNot (AExp.BGt (AExp.ANum 4) (AExp.ANum 8)))).
idtac "Assumptions:".
Abort.
Print Assumptions AExp.optimize_0plus_b_test1.
Goal True.
idtac " ".

idtac "#> AExp.optimize_0plus_b_test2".
idtac "Possible points: 0.5".
check_type @AExp.optimize_0plus_b_test2 (
(AExp.optimize_0plus_b
   (AExp.BAnd
      (AExp.BLe (AExp.APlus (AExp.ANum 0) (AExp.ANum 4)) (AExp.ANum 5))
      AExp.BTrue) =
 AExp.BAnd (AExp.BLe (AExp.ANum 4) (AExp.ANum 5)) AExp.BTrue)).
idtac "Assumptions:".
Abort.
Print Assumptions AExp.optimize_0plus_b_test2.
Goal True.
idtac " ".

idtac "#> AExp.optimize_0plus_b_sound".
idtac "Possible points: 2".
check_type @AExp.optimize_0plus_b_sound (
(forall b : AExp.bexp, AExp.beval (AExp.optimize_0plus_b b) = AExp.beval b)).
idtac "Assumptions:".
Abort.
Print Assumptions AExp.optimize_0plus_b_sound.
Goal True.
idtac " ".

idtac "-------------------  bevalR  --------------------".
idtac " ".

idtac "#> AExp.bevalR_iff_beval".
idtac "Possible points: 3".
check_type @AExp.bevalR_iff_beval (
(forall (b : AExp.bexp) (bv : bool), AExp.bevalR b bv <-> AExp.beval b = bv)).
idtac "Assumptions:".
Abort.
Print Assumptions AExp.bevalR_iff_beval.
Goal True.
idtac " ".

idtac "-------------------  ceval_example2  --------------------".
idtac " ".

idtac "#> ceval_example2".
idtac "Possible points: 2".
check_type @ceval_example2 (
(empty_st =[ X := (ANum 0); Y := (ANum 1); Z := (ANum 2)
 ]=> @t_update nat (@t_update nat (X !-> 0) Y 1) Z 2)).
idtac "Assumptions:".
Abort.
Print Assumptions ceval_example2.
Goal True.
idtac " ".

idtac "-------------------  loop_never_stops  --------------------".
idtac " ".

idtac "#> loop_never_stops".
idtac "Possible points: 3".
check_type @loop_never_stops ((forall st st' : state, ~ st =[ loop ]=> st')).
idtac "Assumptions:".
Abort.
Print Assumptions loop_never_stops.
Goal True.
idtac " ".

idtac "-------------------  no_whiles_eqv  --------------------".
idtac " ".

idtac "#> no_whiles_eqv".
idtac "Possible points: 3".
check_type @no_whiles_eqv ((forall c : com, no_whiles c = true <-> no_whilesR c)).
idtac "Assumptions:".
Abort.
Print Assumptions no_whiles_eqv.
Goal True.
idtac " ".

idtac "-------------------  no_whiles_terminating  --------------------".
idtac " ".

idtac "#> Manually graded: no_whiles_terminating".
idtac "Possible points: 6".
print_manual_grade manual_grade_for_no_whiles_terminating.
idtac " ".

idtac "-------------------  stack_compiler  --------------------".
idtac " ".

idtac "#> s_execute1".
idtac "Possible points: 1".
check_type @s_execute1 (
(s_execute empty_st (@nil nat)
   (SPush 5 :: SPush 3 :: SPush 1 :: SMinus :: @nil sinstr) =
 (2 :: 5 :: @nil nat)%list)).
idtac "Assumptions:".
Abort.
Print Assumptions s_execute1.
Goal True.
idtac " ".

idtac "#> s_execute2".
idtac "Possible points: 0.5".
check_type @s_execute2 (
(s_execute (X !-> 3) (3 :: 4 :: @nil nat)
   (SPush 4 :: SLoad X :: SMult :: SPlus :: @nil sinstr) =
 (15 :: 4 :: @nil nat)%list)).
idtac "Assumptions:".
Abort.
Print Assumptions s_execute2.
Goal True.
idtac " ".

idtac "#> s_compile1".
idtac "Possible points: 1.5".
check_type @s_compile1 (
(s_compile <{ (AId X) - (ANum 2) * (AId Y) }> =
 (SLoad X :: SPush 2 :: SLoad Y :: SMult :: SMinus :: @nil sinstr)%list)).
idtac "Assumptions:".
Abort.
Print Assumptions s_compile1.
Goal True.
idtac " ".

idtac "-------------------  execute_app  --------------------".
idtac " ".

idtac "#> execute_app".
idtac "Possible points: 3".
check_type @execute_app (
(forall (st : state) (p1 p2 : list sinstr) (stack : list nat),
 s_execute st stack (p1 ++ p2) = s_execute st (s_execute st stack p1) p2)).
idtac "Assumptions:".
Abort.
Print Assumptions execute_app.
Goal True.
idtac " ".

idtac "-------------------  stack_compiler_correct  --------------------".
idtac " ".

idtac "#> s_compile_correct_aux".
idtac "Possible points: 2.5".
check_type @s_compile_correct_aux (
(forall (st : state) (e : aexp) (stack : list nat),
 s_execute st stack (s_compile e) = (aeval st e :: stack)%list)).
idtac "Assumptions:".
Abort.
Print Assumptions s_compile_correct_aux.
Goal True.
idtac " ".

idtac "#> s_compile_correct".
idtac "Possible points: 0.5".
check_type @s_compile_correct (
(forall (st : state) (e : aexp),
 s_execute st (@nil nat) (s_compile e) = (aeval st e :: @nil nat)%list)).
idtac "Assumptions:".
Abort.
Print Assumptions s_compile_correct.
Goal True.
idtac " ".

idtac "-------------------  break_imp  --------------------".
idtac " ".

idtac "#> BreakImp.break_ignore".
idtac "Advanced".
idtac "Possible points: 1.5".
check_type @BreakImp.break_ignore (
(forall (c : BreakImp.com) (st st' : state) (s : BreakImp.result),
 BreakImp.ceval (BreakImp.CSeq BreakImp.CBreak c) st s st' -> st = st')).
idtac "Assumptions:".
Abort.
Print Assumptions BreakImp.break_ignore.
Goal True.
idtac " ".

idtac "#> BreakImp.while_continue".
idtac "Advanced".
idtac "Possible points: 1.5".
check_type @BreakImp.while_continue (
(forall (b : bexp) (c : BreakImp.com) (st st' : state) (s : BreakImp.result),
 BreakImp.ceval (BreakImp.CWhile b c) st s st' -> s = BreakImp.SContinue)).
idtac "Assumptions:".
Abort.
Print Assumptions BreakImp.while_continue.
Goal True.
idtac " ".

idtac "#> BreakImp.while_stops_on_break".
idtac "Advanced".
idtac "Possible points: 1".
check_type @BreakImp.while_stops_on_break (
(forall (b : bexp) (c : BreakImp.com) (st st' : state),
 beval st b = true ->
 BreakImp.ceval c st BreakImp.SBreak st' ->
 BreakImp.ceval (BreakImp.CWhile b c) st BreakImp.SContinue st')).
idtac "Assumptions:".
Abort.
Print Assumptions BreakImp.while_stops_on_break.
Goal True.
idtac " ".

idtac "#> BreakImp.seq_continue".
idtac "Advanced".
idtac "Possible points: 1".
check_type @BreakImp.seq_continue (
(forall (c1 c2 : BreakImp.com) (st st' st'' : state),
 BreakImp.ceval c1 st BreakImp.SContinue st' ->
 BreakImp.ceval c2 st' BreakImp.SContinue st'' ->
 BreakImp.ceval (BreakImp.CSeq c1 c2) st BreakImp.SContinue st'')).
idtac "Assumptions:".
Abort.
Print Assumptions BreakImp.seq_continue.
Goal True.
idtac " ".

idtac "#> BreakImp.seq_stops_on_break".
idtac "Advanced".
idtac "Possible points: 1".
check_type @BreakImp.seq_stops_on_break (
(forall (c1 c2 : BreakImp.com) (st st' : state),
 BreakImp.ceval c1 st BreakImp.SBreak st' ->
 BreakImp.ceval (BreakImp.CSeq c1 c2) st BreakImp.SBreak st')).
idtac "Assumptions:".
Abort.
Print Assumptions BreakImp.seq_stops_on_break.
Goal True.
idtac " ".

idtac " ".

idtac "Max points - standard: 34".
idtac "Max points - advanced: 40".
idtac "".
idtac "Allowed Axioms:".
idtac "functional_extensionality".
idtac "FunctionalExtensionality.functional_extensionality_dep".
idtac "plus_le".
idtac "le_trans".
idtac "le_plus_l".
idtac "add_le_cases".
idtac "Sn_le_Sm__n_le_m".
idtac "O_le_n".
idtac "".
idtac "".
idtac "********** Summary **********".
idtac "".
idtac "Below is a summary of the automatically graded exercises that are incomplete.".
idtac "".
idtac "The output for each exercise can be any of the following:".
idtac "  - 'Closed under the global context', if it is complete".
idtac "  - 'MANUAL', if it is manually graded".
idtac "  - A list of pending axioms, containing unproven assumptions. In this case".
idtac "    the exercise is considered complete, if the axioms are all allowed.".
idtac "".
idtac "********** Standard **********".
idtac "---------- t_update_same ---------".
Print Assumptions t_update_same.
idtac "---------- t_update_permute ---------".
Print Assumptions t_update_permute.
idtac "---------- AExp.optimize_0plus_b_test1 ---------".
Print Assumptions AExp.optimize_0plus_b_test1.
idtac "---------- AExp.optimize_0plus_b_test2 ---------".
Print Assumptions AExp.optimize_0plus_b_test2.
idtac "---------- AExp.optimize_0plus_b_sound ---------".
Print Assumptions AExp.optimize_0plus_b_sound.
idtac "---------- AExp.bevalR_iff_beval ---------".
Print Assumptions AExp.bevalR_iff_beval.
idtac "---------- ceval_example2 ---------".
Print Assumptions ceval_example2.
idtac "---------- loop_never_stops ---------".
Print Assumptions loop_never_stops.
idtac "---------- no_whiles_eqv ---------".
Print Assumptions no_whiles_eqv.
idtac "---------- no_whiles_terminating ---------".
idtac "MANUAL".
idtac "---------- s_execute1 ---------".
Print Assumptions s_execute1.
idtac "---------- s_execute2 ---------".
Print Assumptions s_execute2.
idtac "---------- s_compile1 ---------".
Print Assumptions s_compile1.
idtac "---------- execute_app ---------".
Print Assumptions execute_app.
idtac "---------- s_compile_correct_aux ---------".
Print Assumptions s_compile_correct_aux.
idtac "---------- s_compile_correct ---------".
Print Assumptions s_compile_correct.
idtac "".
idtac "********** Advanced **********".
idtac "---------- BreakImp.break_ignore ---------".
Print Assumptions BreakImp.break_ignore.
idtac "---------- BreakImp.while_continue ---------".
Print Assumptions BreakImp.while_continue.
idtac "---------- BreakImp.while_stops_on_break ---------".
Print Assumptions BreakImp.while_stops_on_break.
idtac "---------- BreakImp.seq_continue ---------".
Print Assumptions BreakImp.seq_continue.
idtac "---------- BreakImp.seq_stops_on_break ---------".
Print Assumptions BreakImp.seq_stops_on_break.
Abort.

(* 2025-04-09 16:07 *)
