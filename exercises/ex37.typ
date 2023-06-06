#import "../common.typ": *

// Note 13 ex 12
#exercise[
  Prove that the term $(M_f app angle.l ell_1 = 5 angle.r)$ is well-typed with $Bool$ type.
]
#solution[
  #set text(size: 6.5pt)
  #align(center, box(prooftree(
    axiom(label: "T-VAR", $x: angle.l ell_1 : Nat, ell_2 : Bool angle.r tack.r x : angle.l ell_1 : Nat, ell_2 : Bool angle.r$),
    axiom(label: "T-TRUE", $x: angle.l ell_1 : Nat, ell_2 : Bool angle.r, x_1: Nat tack.r mtrue : Bool$),
    axiom(label: "T-VAR", $x: angle.l ell_1 : Nat, ell_2 : Bool angle.r, x_2: Bool tack.r x_2 : Bool$),
    rule(n: 3, label: "T-MATCH", $x: angle.l ell_1 : Nat, ell_2 : Bool angle.r tack.r x match { case ell_1 = x_1 => mtrue, case ell_2 = x_2 => x_2 } : Bool$),
    rule(label: "T-FUN", $emptyset tack.r fn x: angle.l ell_1 : Nat, ell_2 : Bool angle.r. x match { case ell_1 = x_1 => mtrue, case ell_2 = x_2 => x_2 } : angle.l ell_1 : Nat, ell_2 : Bool angle.r -> Bool$),
  )))

  #set text(size: 10pt)
  #align(center, box(prooftree(
    axiom($emptyset tack.r M_f : angle.l ell_1 : Nat, ell_2 : Bool angle.r -> Bool$),
    rule(label: "T-FUN", $emptyset tack.r M_f : angle.l ell_1 : Nat, ell_2 : Bool angle.r -> Bool$),
    axiom(label: "T-NAT", $emptyset tack.r 5 : Nat$),
    rule(label: "T-VARIANT", $emptyset tack.r angle.l ell_1 = 5 angle.r : angle.l ell_1 : Nat, ell_2 : Bool angle.r$),
    rule(n: 2, label: "T-APP", $emptyset tack.r M_f app angle.l ell_1 = 5 angle.r : Bool$),
  )))
]
