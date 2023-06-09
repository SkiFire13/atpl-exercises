#import "../common.typ": *

// Note 13 ex 15
#exercise[
  Consider the following variant and rule (TYPE MATCH)

  #set text(size: 10pt)
  #align(center, box(prooftree(
    axiom($Gamma tack.r M : angle.l l_i : T_i #h(1pt) ^ (i in 1 .. m) angle.r$),
    axiom($m gt.eq n$),
    axiom($forall i in 1..n quad Gamma, x_i : T_i tack.r M_i : T$),
    rule(n: 3, label: "TYPE MATCH GEN 1",
        $Gamma tack.r M match { case l_i = x_i arrow.r.double M_i #h(1pt) ^ (i in 1..n) } : T$)
  )))
  Prove that the safety theorem still holds or give a counterexample.
]

#solution[
  Let $M = angle.l l_2 = mtrue angle.r match { case l_1 = x_1 arrow.r.double 0 }$ is well typed of type $Nat$

  #set text(size: 10pt)
  #align(center, box(prooftree(
    axiom(label: "T-TRUE", $emptyset tack.r mtrue : Bool$),
    rule(label: "T-VARIANT", $emptyset tack.r angle.l l_2 = mtrue angle.r : angle.l l_1 : Nat, l_2 : Bool angle.r$),
    axiom($2 gt.eq 1$),
    axiom(label: "T-NAT", $x_1 : Nat tack.r 0 : Nat$),
    rule(n: 3, label: "TYPE MATCH GEN 1", $emptyset tack.r angle.l l_2 = mtrue angle.r match { case l_1 = x_1 arrow.r.double 0 } : Nat$)
  )))

  But it it's stuck term, giving a counterexample to the safety theorem.
]