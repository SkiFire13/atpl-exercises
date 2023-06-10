#import "../../common.typ": *

#set text(size: 9pt)
#align(center)[
  #box(prooftree(
    axiom(""),
    rule(label: "(T-NAT)", $emptyset tack.r 0 : T_exn$),
    rule(label: "(T-RAISE)", $emptyset tack.r throw 0 : Bool -> Nat$),
    axiom(""),
    rule(label: "(T-TRUE)", $emptyset tack.r mtrue : Bool$),
    rule(n : 2, label: "(T-APP)", $emptyset tack.r throw 0 app mtrue : Nat$),
    axiom(""),
    rule(label: "(T-VAR)", $emptyset, y : T_exn tack.r y : Nat$),
    rule(label: "(T-FUN)", $emptyset tack.r fn y.y : T_exn -> Nat$),
    rule(n : 2, label: "(T-TRY)", $emptyset tack.r try (throw 0 app mtrue) catch fn y.y : Nat$)
  ))
  #v(1em)
]
#align(center)[
  #box(prooftree(
    axiom(""),
    rule(label: "(RAISE APP 1)", $throw 0 app mtrue -> throw 0$),
    rule(label: "(TRY)", $try (throw 0 app mtrue) catch fn y.y -> try throw 0 catch fn y.y$)
  ))
  #v(1em)
  #box(prooftree(
    axiom(""),
    rule(label: "(TRY HANDLE)", $try throw 0 catch fn y.y -> (fn y.y) app 0$)
  ))
  #v(1em)
  #box(prooftree(
    axiom(""),
    rule(label: "(BETA)", $(fn y.y) app 0 -> 0$)
  ))
]
The term $M_4 = try (throw 0 app mtrue) catch fn y.y$, is closed and well-typed with type Nat if $T_exn$ = Nat and reduces to the value 0 so it respects the safety theorem.