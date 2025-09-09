Require Import List.
Import ListNotations.

Theorem app_length :
  forall (A : Type) (l1 l2 : list A),
    length (l1 ++ l2) = length l1 + length l2.
Proof.
  intros A l1 l2.
  induction l1 as [| h t IH].
  - simpl.
    reflexivity.
  - simpl.
    rewrite IH.
    reflexivity.
Qed.

