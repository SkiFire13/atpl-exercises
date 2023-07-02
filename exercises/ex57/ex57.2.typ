#import "../../common.typ": *

#set text(size: 9pt)
#align(center)[
  #box(prooftree(
    axiom(""),
    rule(label: T-TRUE, $emptyset tack.r mtrue : Bool$),
    axiom(""),
    rule(label: T-INT, $emptyset tack.r 2 : Nat$),
    axiom(""),
    rule(label: T-INT, $emptyset tack.r 0 : T_exn$),
    rule(label: T-RAISE, $emptyset tack.r throw 0 : Nat$),
    rule(n : 3, label: T-IF, $emptyset tack.r mif mtrue then 2 melse throw 0 : Nat$)
  ))
  #vspace
]
#align(center)[
  #box(prooftree(
    axiom(""),
    rule(label: IF-TRUE, $mif mtrue then 2 melse throw 0 -> 2$)
  ))
  #vspace
]
The term $M_2 = mif mtrue then 2 melse throw 0$, is closed and well-typed with type Nat if $T_exn$ = Nat and reduces to the value 2 so it respects the safety theorem.
