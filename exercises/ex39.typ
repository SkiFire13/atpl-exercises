#import "../common.typ": *

#let TYPE-MATCH-GEN-1 = smallcaps("(Type-Match-Gen-1)")

// Note 13 ex 15
#exercise[
  Consider the following variant and rule #smallcaps("(Type Match)")

  #align(center, text(size: 10pt, box(prooftree(
    axiom($Gamma tack.r M : angle.l ell_i : T_i #h(1pt) ^ (i in 1 .. m) angle.r$),
    axiom($m gt.eq n$),
    axiom($forall i in 1..n quad Gamma, x_i : T_i tack.r M_i : T$),
    rule(n: 3, label: TYPE-MATCH-GEN-1,
        $Gamma tack.r M match { case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in 1..n) } : T$)
  ))))
  Prove that the safety theorem still holds or give a counterexample.
]

#solution[
  Let $M = angle.l ell_2 = mtrue angle.r match { case ell_1 = x_1 arrow.r.double 0 }$ is well typed of type $Nat$

  #align(center, text(size: 10pt, box(prooftree(
    axiom(label: T-TRUE, $emptyset tack.r mtrue : Bool$),
    rule(label: T-VARIANT, $emptyset tack.r angle.l ell_2 = mtrue angle.r : angle.l ell_1 : Nat, ell_2 : Bool angle.r$),
    axiom($2 gt.eq 1$),
    axiom(label: T-INT, $x_1 : Nat tack.r 0 : Nat$),
    rule(n: 3, label: TYPE-MATCH-GEN-1, $emptyset tack.r angle.l ell_2 = mtrue angle.r match { case ell_1 = x_1 arrow.r.double 0 } : Nat$)
  ))))

  But it it's stuck term, giving a counterexample to the safety theorem.
]
