Set Warnings "-notation-overridden,-parsing".
From Coq Require Export String.
From Lectures Require Import Lecture1.

Parameter MISSING: Type.

Module Check.

Ltac check_type A B :=
    match type of A with
    | context[MISSING] => idtac "Потеряли:" A
    | ?T => first [unify T B; idtac "Тип: OK" | idtac "Тип: НЕ тот - должно быть (" B ")"]
    end.

Ltac print_manual_grade A :=
    match eval compute in A with
    | Some (_ ?S ?C) =>
        idtac "Оценка:"  S;
        match eval compute in C with
          | ""%string => idtac "Комментарий: Нет"
          | _ => idtac "Комментарий:" C
        end
    | None =>
        idtac "Оценка: Не оценивается";
        idtac "Комментарий: Нет"
    end.

End Check.

Import Check.

Goal True.

idtac "-------------------  nandb  --------------------".
idtac " ".

idtac "#> test_nandb4".
idtac "Макс. баллов за задание: 1".
check_type @test_nandb4 ((nandb true true = false)).
idtac "Предположения:".
Abort.
Print Assumptions test_nandb4.
Goal True.
idtac " ".

idtac "-------------------  andb3  --------------------".
idtac " ".

idtac "#> test_andb34".
idtac "Макс. баллов за задание: 1".
check_type @test_andb34 ((andb3 true true false = false)).
idtac "Предположения:".
Abort.
Print Assumptions test_andb34.
Goal True.
idtac " ".

idtac "-------------------  factorial  --------------------".
idtac " ".

idtac "#> test_factorial2".
idtac "Макс. баллов за задание: 1".
check_type @test_factorial2 ((factorial 5 = 10 * 12)).
idtac "Предположения:".
Abort.
Print Assumptions test_factorial2.
Goal True.
idtac " ".

idtac "-------------------  ltb  --------------------".
idtac " ".

idtac "#> test_ltb3".
idtac "Макс. баллов за задание: 1".
check_type @test_ltb3 (((4 <? 2) = false)).
idtac "Предположения:".
Abort.
Print Assumptions test_ltb3.
Goal True.
idtac " ".

idtac "-------------------  plus_id_exercise  --------------------".
idtac " ".

idtac "#> plus_id_exercise".
idtac "Макс. баллов за задание: 1".
check_type @plus_id_exercise ((forall n m o : nat, n = m -> m = o -> n + m = m + o)).
idtac "Предположения:".
Abort.
Print Assumptions plus_id_exercise.
Goal True.
idtac " ".

idtac "-------------------  mult_n_1  --------------------".
idtac " ".

idtac "#> mult_n_1".
idtac "Макс. баллов за задание: 1".
check_type @mult_n_1 ((forall p : nat, p * 1 = p)).
idtac "Предположения:".
Abort.
Print Assumptions mult_n_1.
Goal True.
idtac " ".

idtac "-------------------  andb_true_elim2  --------------------".
idtac " ".

idtac "#> andb_true_elim2".
idtac "Макс. баллов за задание: 2".
check_type @andb_true_elim2 ((forall b c : bool, b && c = true -> c = true)).
idtac "Предположения:".
Abort.
Print Assumptions andb_true_elim2.
Goal True.
idtac " ".

idtac "-------------------  zero_nbeq_plus_1  --------------------".
idtac " ".

idtac "#> zero_nbeq_plus_1".
idtac "Макс. баллов за задание: 1".
check_type @zero_nbeq_plus_1 ((forall n : nat, (0 =? n + 1) = false)).
idtac "Предположения:".
Abort.
Print Assumptions zero_nbeq_plus_1.
Goal True.
idtac " ".

idtac "-------------------  identity_fn_applied_twice  --------------------".
idtac " ".

idtac "#> identity_fn_applied_twice".
idtac "Макс. баллов за задание: 1".
check_type @identity_fn_applied_twice (
(forall f : bool -> bool,
 (forall x : bool, f x = x) -> forall b : bool, f (f b) = b)).
idtac "Предположения:".
Abort.
Print Assumptions identity_fn_applied_twice.
Goal True.
idtac " ".

idtac "-------------------  negation_fn_applied_twice  --------------------".
idtac " ".

idtac "#> Manually graded: negation_fn_applied_twice".
idtac "Макс. баллов за задание: 1".
print_manual_grade manual_grade_for_negation_fn_applied_twice.
idtac " ".

idtac "-------------------  letter_comparison  --------------------".
idtac " ".

idtac "#> LateDays.letter_comparison_Eq".
idtac "Макс. баллов за задание: 1".
check_type @LateDays.letter_comparison_Eq (
(forall l : LateDays.letter, LateDays.letter_comparison l l = LateDays.Eq)).
idtac "Предположения:".
Abort.
Print Assumptions LateDays.letter_comparison_Eq.
Goal True.
idtac " ".

idtac "-------------------  grade_comparison  --------------------".
idtac " ".

idtac "#> LateDays.test_grade_comparison1".
idtac "Макс. баллов за задание: 0.5".
check_type @LateDays.test_grade_comparison1 (
(LateDays.grade_comparison (LateDays.Grade LateDays.A LateDays.Minus)
   (LateDays.Grade LateDays.B LateDays.Plus) = LateDays.Gt)).
idtac "Предположения:".
Abort.
Print Assumptions LateDays.test_grade_comparison1.
Goal True.
idtac " ".

idtac "#> LateDays.test_grade_comparison2".
idtac "Макс. баллов за задание: 0.5".
check_type @LateDays.test_grade_comparison2 (
(LateDays.grade_comparison (LateDays.Grade LateDays.A LateDays.Minus)
   (LateDays.Grade LateDays.A LateDays.Plus) = LateDays.Lt)).
idtac "Предположения:".
Abort.
Print Assumptions LateDays.test_grade_comparison2.
Goal True.
idtac " ".

idtac "#> LateDays.test_grade_comparison3".
idtac "Макс. баллов за задание: 0.5".
check_type @LateDays.test_grade_comparison3 (
(LateDays.grade_comparison (LateDays.Grade LateDays.F LateDays.Plus)
   (LateDays.Grade LateDays.F LateDays.Plus) = LateDays.Eq)).
idtac "Предположения:".
Abort.
Print Assumptions LateDays.test_grade_comparison3.
Goal True.
idtac " ".

idtac "#> LateDays.test_grade_comparison4".
idtac "Макс. баллов за задание: 0.5".
check_type @LateDays.test_grade_comparison4 (
(LateDays.grade_comparison (LateDays.Grade LateDays.B LateDays.Minus)
   (LateDays.Grade LateDays.C LateDays.Plus) = LateDays.Gt)).
idtac "Предположения:".
Abort.
Print Assumptions LateDays.test_grade_comparison4.
Goal True.
idtac " ".

idtac "-------------------  lower_letter_lowers  --------------------".
idtac " ".

idtac "#> LateDays.lower_letter_lowers".
idtac "Макс. баллов за задание: 2".
check_type @LateDays.lower_letter_lowers (
(forall l : LateDays.letter,
 LateDays.letter_comparison LateDays.F l = LateDays.Lt ->
 LateDays.letter_comparison (LateDays.lower_letter l) l = LateDays.Lt)).
idtac "Предположения:".
Abort.
Print Assumptions LateDays.lower_letter_lowers.
Goal True.
idtac " ".

idtac "-------------------  lower_grade  --------------------".
idtac " ".

idtac "#> LateDays.lower_grade_A_Plus".
idtac "Макс. баллов за задание: 0.25".
check_type @LateDays.lower_grade_A_Plus (
(LateDays.lower_grade (LateDays.Grade LateDays.A LateDays.Plus) =
 LateDays.Grade LateDays.A LateDays.Natural)).
idtac "Предположения:".
Abort.
Print Assumptions LateDays.lower_grade_A_Plus.
Goal True.
idtac " ".

idtac "#> LateDays.lower_grade_A_Natural".
idtac "Макс. баллов за задание: 0.25".
check_type @LateDays.lower_grade_A_Natural (
(LateDays.lower_grade (LateDays.Grade LateDays.A LateDays.Natural) =
 LateDays.Grade LateDays.A LateDays.Minus)).
idtac "Предположения:".
Abort.
Print Assumptions LateDays.lower_grade_A_Natural.
Goal True.
idtac " ".

idtac "#> LateDays.lower_grade_A_Minus".
idtac "Макс. баллов за задание: 0.25".
check_type @LateDays.lower_grade_A_Minus (
(LateDays.lower_grade (LateDays.Grade LateDays.A LateDays.Minus) =
 LateDays.Grade LateDays.B LateDays.Plus)).
idtac "Предположения:".
Abort.
Print Assumptions LateDays.lower_grade_A_Minus.
Goal True.
idtac " ".

idtac "#> LateDays.lower_grade_B_Plus".
idtac "Макс. баллов за задание: 0.25".
check_type @LateDays.lower_grade_B_Plus (
(LateDays.lower_grade (LateDays.Grade LateDays.B LateDays.Plus) =
 LateDays.Grade LateDays.B LateDays.Natural)).
idtac "Предположения:".
Abort.
Print Assumptions LateDays.lower_grade_B_Plus.
Goal True.
idtac " ".

idtac "#> LateDays.lower_grade_F_Natural".
idtac "Макс. баллов за задание: 0.25".
check_type @LateDays.lower_grade_F_Natural (
(LateDays.lower_grade (LateDays.Grade LateDays.F LateDays.Natural) =
 LateDays.Grade LateDays.F LateDays.Minus)).
idtac "Предположения:".
Abort.
Print Assumptions LateDays.lower_grade_F_Natural.
Goal True.
idtac " ".

idtac "#> LateDays.lower_grade_twice".
idtac "Макс. баллов за задание: 0.25".
check_type @LateDays.lower_grade_twice (
(LateDays.lower_grade
   (LateDays.lower_grade (LateDays.Grade LateDays.B LateDays.Minus)) =
 LateDays.Grade LateDays.C LateDays.Natural)).
idtac "Предположения:".
Abort.
Print Assumptions LateDays.lower_grade_twice.
Goal True.
idtac " ".

idtac "#> LateDays.lower_grade_thrice".
idtac "Макс. баллов за задание: 0.25".
check_type @LateDays.lower_grade_thrice (
(LateDays.lower_grade
   (LateDays.lower_grade
      (LateDays.lower_grade (LateDays.Grade LateDays.B LateDays.Minus))) =
 LateDays.Grade LateDays.C LateDays.Minus)).
idtac "Предположения:".
Abort.
Print Assumptions LateDays.lower_grade_thrice.
Goal True.
idtac " ".

idtac "#> LateDays.lower_grade_F_Minus".
idtac "Макс. баллов за задание: 0.25".
check_type @LateDays.lower_grade_F_Minus (
(LateDays.lower_grade (LateDays.Grade LateDays.F LateDays.Minus) =
 LateDays.Grade LateDays.F LateDays.Minus)).
idtac "Предположения:".
Abort.
Print Assumptions LateDays.lower_grade_F_Minus.
Goal True.
idtac " ".

idtac "-------------------  lower_grade_lowers  --------------------".
idtac " ".

idtac "#> LateDays.lower_grade_lowers".
idtac "Макс. баллов за задание: 3".
check_type @LateDays.lower_grade_lowers (
(forall g : LateDays.grade,
 LateDays.grade_comparison (LateDays.Grade LateDays.F LateDays.Minus) g =
 LateDays.Lt ->
 LateDays.grade_comparison (LateDays.lower_grade g) g = LateDays.Lt)).
idtac "Предположения:".
Abort.
Print Assumptions LateDays.lower_grade_lowers.
Goal True.
idtac " ".

idtac "-------------------  no_penalty_for_mostly_on_time  --------------------".
idtac " ".

idtac "#> LateDays.no_penalty_for_mostly_on_time".
idtac "Макс. баллов за задание: 2".
check_type @LateDays.no_penalty_for_mostly_on_time (
(forall (late_days : nat) (g : LateDays.grade),
 (late_days <? 9) = true -> LateDays.apply_late_policy late_days g = g)).
idtac "Предположения:".
Abort.
Print Assumptions LateDays.no_penalty_for_mostly_on_time.
Goal True.
idtac " ".

idtac "-------------------  graded_lowered_once  --------------------".
idtac " ".

idtac "#> LateDays.grade_lowered_once".
idtac "Макс. баллов за задание: 2".
check_type @LateDays.grade_lowered_once (
(forall (late_days : nat) (g : LateDays.grade),
 (late_days <? 9) = false ->
 (late_days <? 17) = true ->
 LateDays.apply_late_policy late_days g = LateDays.lower_grade g)).
idtac "Предположения:".
Abort.
Print Assumptions LateDays.grade_lowered_once.
Goal True.
idtac " ".

idtac "-------------------  binary  --------------------".
idtac " ".

idtac "#> test_bin_incr1".
idtac "Макс. баллов за задание: 0.5".
check_type @test_bin_incr1 ((incr (B1 Z) = B0 (B1 Z))).
idtac "Предположения:".
Abort.
Print Assumptions test_bin_incr1.
Goal True.
idtac " ".

idtac "#> test_bin_incr2".
idtac "Макс. баллов за задание: 0.5".
check_type @test_bin_incr2 ((incr (B0 (B1 Z)) = B1 (B1 Z))).
idtac "Предположения:".
Abort.
Print Assumptions test_bin_incr2.
Goal True.
idtac " ".

idtac "#> test_bin_incr3".
idtac "Макс. баллов за задание: 0.5".
check_type @test_bin_incr3 ((incr (B1 (B1 Z)) = B0 (B0 (B1 Z)))).
idtac "Предположения:".
Abort.
Print Assumptions test_bin_incr3.
Goal True.
idtac " ".

idtac "#> test_bin_incr4".
idtac "Макс. баллов за задание: 0.5".
check_type @test_bin_incr4 ((bin_to_nat (B0 (B1 Z)) = 2)).
idtac "Предположения:".
Abort.
Print Assumptions test_bin_incr4.
Goal True.
idtac " ".

idtac "#> test_bin_incr5".
idtac "Макс. баллов за задание: 0.5".
check_type @test_bin_incr5 ((bin_to_nat (incr (B1 Z)) = 1 + bin_to_nat (B1 Z))).
idtac "Предположения:".
Abort.
Print Assumptions test_bin_incr5.
Goal True.
idtac " ".

idtac "#> test_bin_incr6".
idtac "Макс. баллов за задание: 0.5".
check_type @test_bin_incr6 ((bin_to_nat (incr (incr (B1 Z))) = 2 + bin_to_nat (B1 Z))).
idtac "Предположения:".
Abort.
Print Assumptions test_bin_incr6.
Goal True.
idtac " ".

idtac "-------------------  basic_induction  --------------------".
idtac " ".

idtac "#> mul_0_r".
idtac "Макс. баллов за задание: 0.5".
check_type @mul_0_r ((forall n : nat, n * 0 = 0)).
idtac "Предположения:".
Abort.
Print Assumptions mul_0_r.
Goal True.
idtac " ".

idtac "#> plus_n_Sm".
idtac "Макс. баллов за задание: 0.5".
check_type @plus_n_Sm ((forall n m : nat, S (n + m) = n + S m)).
idtac "Предположения:".
Abort.
Print Assumptions plus_n_Sm.
Goal True.
idtac " ".

idtac "#> add_comm".
idtac "Макс. баллов за задание: 0.5".
check_type @add_comm ((forall n m : nat, n + m = m + n)).
idtac "Предположения:".
Abort.
Print Assumptions add_comm.
Goal True.
idtac " ".

idtac "#> add_assoc".
idtac "Макс. баллов за задание: 0.5".
check_type @add_assoc ((forall n m p : nat, n + (m + p) = n + m + p)).
idtac "Предположения:".
Abort.
Print Assumptions add_assoc.
Goal True.
idtac " ".

idtac "-------------------  double_plus  --------------------".
idtac " ".

idtac "#> double_plus".
idtac "Макс. баллов за задание: 2".
check_type @double_plus ((forall n : nat, double n = n + n)).
idtac "Предположения:".
Abort.
Print Assumptions double_plus.
Goal True.
idtac " ".

idtac "-------------------  eqb_refl  --------------------".
idtac " ".

idtac "#> eqb_refl".
idtac "Макс. баллов за задание: 2".
check_type @eqb_refl ((forall n : nat, (n =? n) = true)).
idtac "Предположения:".
Abort.
Print Assumptions eqb_refl.
Goal True.
idtac " ".

idtac "-------------------  add_comm_informal  --------------------".
idtac " ".

idtac "#> Manually graded: add_comm_informal".
idtac "Продвинутое".
idtac "Макс. баллов за задание: 2".
print_manual_grade manual_grade_for_add_comm_informal.
idtac " ".

idtac "-------------------  mul_comm  --------------------".
idtac " ".

idtac "#> add_shuffle3".
idtac "Макс. баллов за задание: 1".
check_type @add_shuffle3 ((forall n m p : nat, n + (m + p) = m + (n + p))).
idtac "Предположения:".
Abort.
Print Assumptions add_shuffle3.
Goal True.
idtac " ".

idtac "#> mul_comm".
idtac "Макс. баллов за задание: 2".
check_type @mul_comm ((forall m n : nat, m * n = n * m)).
idtac "Предположения:".
Abort.
Print Assumptions mul_comm.
Goal True.
idtac " ".

idtac "-------------------  binary_commute  --------------------".
idtac " ".

idtac "#> bin_to_nat_pres_incr".
idtac "Макс. баллов за задание: 3".
check_type @bin_to_nat_pres_incr (
(forall b : bin, bin_to_nat (incr b) = 1 + bin_to_nat b)).
idtac "Предположения:".
Abort.
Print Assumptions bin_to_nat_pres_incr.
Goal True.
idtac " ".

idtac "-------------------  nat_bin_nat  --------------------".
idtac " ".

idtac "#> nat_bin_nat".
idtac "Макс. баллов за задание: 3".
check_type @nat_bin_nat ((forall n : nat, bin_to_nat (nat_to_bin n) = n)).
idtac "Предположения:".
Abort.
Print Assumptions nat_bin_nat.
Goal True.
idtac " ".

idtac "-------------------  double_bin  --------------------".
idtac " ".

idtac "#> double_incr".
idtac "Продвинутое".
idtac "Макс. баллов за задание: 0.5".
check_type @double_incr ((forall n : nat, double (S n) = S (S (double n)))).
idtac "Предположения:".
Abort.
Print Assumptions double_incr.
Goal True.
idtac " ".

idtac "#> double_bin_zero".
idtac "Продвинутое".
idtac "Макс. баллов за задание: 0.5".
check_type @double_bin_zero ((double_bin Z = Z)).
idtac "Предположения:".
Abort.
Print Assumptions double_bin_zero.
Goal True.
idtac " ".

idtac "#> double_incr_bin".
idtac "Продвинутое".
idtac "Макс. баллов за задание: 1".
check_type @double_incr_bin (
(forall b : bin, double_bin (incr b) = incr (incr (double_bin b)))).
idtac "Предположения:".
Abort.
Print Assumptions double_incr_bin.
Goal True.
idtac " ".

idtac "-------------------  bin_nat_bin  --------------------".
idtac " ".

idtac "#> bin_nat_bin".
idtac "Продвинутое".
idtac "Макс. баллов за задание: 6".
check_type @bin_nat_bin ((forall b : bin, nat_to_bin (bin_to_nat b) = normalize b)).
idtac "Предположения:".
Abort.
Print Assumptions bin_nat_bin.
Goal True.
idtac " ".

idtac " ".

idtac "Макс. баллов - стандартные: 28+15=43".
idtac "Макс. баллов - с продвинутыми: 28+25=53".
idtac "".
idtac "Разрешённые аксиомы:".
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
idtac "********** Резюме **********".
idtac "".
idtac "Ниже резюмировано автоматическое оценивание упражнений.".
idtac "".
idtac "Возможен один из следующих выводов для каждого упражнения:".
idtac "  - 'Closed under the global context', если оно полностью выполнено".
idtac "  - 'РУЧНОЕ ОЦЕНИВАНИЕ', если оно оценивается вручную".
idtac "  - Список утверждений, ожидающих доказательства. В данном случае".
idtac "    упражнение считается выполненным, если все утверждения из списка".
idtac "    находятся в списке Разрешённых аксиом.".
idtac "".
idtac "********** Стандартные **********".
idtac "---------- test_nandb4 ---------".
Print Assumptions test_nandb4.
idtac "---------- test_andb34 ---------".
Print Assumptions test_andb34.
idtac "---------- test_factorial2 ---------".
Print Assumptions test_factorial2.
idtac "---------- test_ltb3 ---------".
Print Assumptions test_ltb3.
idtac "---------- plus_id_exercise ---------".
Print Assumptions plus_id_exercise.
idtac "---------- mult_n_1 ---------".
Print Assumptions mult_n_1.
idtac "---------- andb_true_elim2 ---------".
Print Assumptions andb_true_elim2.
idtac "---------- zero_nbeq_plus_1 ---------".
Print Assumptions zero_nbeq_plus_1.
idtac "---------- identity_fn_applied_twice ---------".
Print Assumptions identity_fn_applied_twice.
idtac "---------- negation_fn_applied_twice ---------".
idtac "РУЧНОЕ ОЦЕНИВАНИЕ".
idtac "---------- LateDays.letter_comparison_Eq ---------".
Print Assumptions LateDays.letter_comparison_Eq.
idtac "---------- LateDays.test_grade_comparison1 ---------".
Print Assumptions LateDays.test_grade_comparison1.
idtac "---------- LateDays.test_grade_comparison2 ---------".
Print Assumptions LateDays.test_grade_comparison2.
idtac "---------- LateDays.test_grade_comparison3 ---------".
Print Assumptions LateDays.test_grade_comparison3.
idtac "---------- LateDays.test_grade_comparison4 ---------".
Print Assumptions LateDays.test_grade_comparison4.
idtac "---------- LateDays.lower_letter_lowers ---------".
Print Assumptions LateDays.lower_letter_lowers.
idtac "---------- LateDays.lower_grade_A_Plus ---------".
Print Assumptions LateDays.lower_grade_A_Plus.
idtac "---------- LateDays.lower_grade_A_Natural ---------".
Print Assumptions LateDays.lower_grade_A_Natural.
idtac "---------- LateDays.lower_grade_A_Minus ---------".
Print Assumptions LateDays.lower_grade_A_Minus.
idtac "---------- LateDays.lower_grade_B_Plus ---------".
Print Assumptions LateDays.lower_grade_B_Plus.
idtac "---------- LateDays.lower_grade_F_Natural ---------".
Print Assumptions LateDays.lower_grade_F_Natural.
idtac "---------- LateDays.lower_grade_twice ---------".
Print Assumptions LateDays.lower_grade_twice.
idtac "---------- LateDays.lower_grade_thrice ---------".
Print Assumptions LateDays.lower_grade_thrice.
idtac "---------- LateDays.lower_grade_F_Minus ---------".
Print Assumptions LateDays.lower_grade_F_Minus.
idtac "---------- LateDays.lower_grade_lowers ---------".
Print Assumptions LateDays.lower_grade_lowers.
idtac "---------- LateDays.no_penalty_for_mostly_on_time ---------".
Print Assumptions LateDays.no_penalty_for_mostly_on_time.
idtac "---------- LateDays.grade_lowered_once ---------".
Print Assumptions LateDays.grade_lowered_once.
idtac "---------- test_bin_incr1 ---------".
Print Assumptions test_bin_incr1.
idtac "---------- test_bin_incr2 ---------".
Print Assumptions test_bin_incr2.
idtac "---------- test_bin_incr3 ---------".
Print Assumptions test_bin_incr3.
idtac "---------- test_bin_incr4 ---------".
Print Assumptions test_bin_incr4.
idtac "---------- test_bin_incr5 ---------".
Print Assumptions test_bin_incr5.
idtac "---------- test_bin_incr6 ---------".
Print Assumptions test_bin_incr6.
idtac "---------- mul_0_r ---------".
Print Assumptions mul_0_r.
idtac "---------- plus_n_Sm ---------".
Print Assumptions plus_n_Sm.
idtac "---------- add_comm ---------".
Print Assumptions add_comm.
idtac "---------- add_assoc ---------".
Print Assumptions add_assoc.
idtac "---------- double_plus ---------".
Print Assumptions double_plus.
idtac "---------- eqb_refl ---------".
Print Assumptions eqb_refl.
idtac "---------- add_shuffle3 ---------".
Print Assumptions add_shuffle3.
idtac "---------- mul_comm ---------".
Print Assumptions mul_comm.
idtac "---------- bin_to_nat_pres_incr ---------".
Print Assumptions bin_to_nat_pres_incr.
idtac "---------- nat_bin_nat ---------".
Print Assumptions nat_bin_nat.
idtac "".
idtac "********** Продвинутые **********".
idtac "---------- add_comm_informal ---------".
idtac "РУЧНОЕ ОЦЕНИВАНИЕ".
idtac "---------- double_incr ---------".
Print Assumptions double_incr.
idtac "---------- double_bin_zero ---------".
Print Assumptions double_bin_zero.
idtac "---------- double_incr_bin ---------".
Print Assumptions double_incr_bin.
idtac "---------- bin_nat_bin ---------".
Print Assumptions bin_nat_bin.
Abort.

(* 2025-03-01 16:00 *)

(* 2025-03-01 16:00 *)
