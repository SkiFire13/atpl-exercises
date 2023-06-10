#import "../../common.typ": *

#set text(size: 9pt)
#align(center)[
  #box(prooftree(
    axiom(""),
    rule(label: "(T-VAR)", $emptyset, x : Bool tack.r x : Bool$),
    rule(label: "(T-FUN)", $emptyset tack.r fn x:Bool. x : Bool -> Bool$),
    axiom(""),
    rule(label: "(T-NAT)", $emptyset tack.r 0 : T_exn$),
    rule(label: "(T-RAISE)", $emptyset tack.r throw 0 : Bool$),
    rule(n : 2, label: "(T-APP)", $emptyset tack.r (fn x:Bool. x) throw 0 : Bool$)
  ))
  #v(1em)
]
#align(center)[
  #box(prooftree(
    axiom(""),
    rule(label: "(RAISE APP 2)", $(fn x:Bool. x) throw 0 -> throw 0$)
  ))
  #v(1em)
]
The term $M_1 = (fn x:Bool. x) throw 0$, is closed and well-typed with type Bool if $T_exn$ = Nat and reduces to the term $throw 0$ so it respects the safety theorem.