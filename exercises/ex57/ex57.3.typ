#import "../../common.typ": *

#set text(size: 8pt)
#align(center)[
  #show: next(it => text(size: 6pt, it))
  #box(prooftree(
    axiom(""),
    rule(label: T-INT, $emptyset, x : Bool tack.r 0 : T_exn$),
    rule(label: T-RAISE, $emptyset, x : Bool tack.r throw 0 : Nat$),
    rule(label: T-FUN, $emptyset tack.r fn x:Bool. throw 0 : Bool -> Nat$),
    axiom(""),
    rule(label: T-FALSE, $emptyset tack.r mfalse : Bool$),
    rule(n : 2, label: T-APP, $emptyset tack.r (fn x:Bool. throw 0) app mfalse : Nat$),
    axiom(""),
    rule(label: T-INT, $emptyset tack.r 5 : Nat$),
    rule(n : 2, label: T-SUM, $emptyset tack.r ((fn x:Bool. throw 0) app mfalse) + 5 : Nat$),
    axiom(""),
    rule(label: T-VAR, $emptyset, y : T_exn tack.r y : Nat$),
    rule(label: T-FUN, $emptyset tack.r fn y.y : T_exn -> Nat$),
    rule(n : 2, label: T-TRY, $emptyset tack.r try ((fn x:Bool. throw 0) app mfalse) + 5 catch fn y.y : Nat$)
  ))
  #vspace
]
#align(center)[
  #box(prooftree(
    axiom(""),
    rule(label: BETA, $(fn x:Bool. throw 0) app mfalse-> throw 0$),
    rule(label: SUM-LEFT, $((fn x:Bool. throw 0) app mfalse) + 5 -> (throw 0) + 5$),
    rule(label: TRY, $try ((fn x:Bool. throw 0) app mfalse) + 5 catch fn y.y -> try (throw 0) + 5 catch fn y.y$)
  ))
  #vspace
  #box(prooftree(
    axiom(""),
    rule(label: RAISE-SUM-1, $(throw 0) + 5 -> throw 0$),
    rule(label: TRY, $try (throw 0) + 5 catch fn y.y -> try throw 0 catch fn y.y$)
  ))
  #vspace
  #box(prooftree(
    axiom(""),
    rule(label: TRY-HANDLE, $try throw 0 catch fn y.y -> (fn y.y) app 0$)
  ))
  #h(1cm)
  #box(prooftree(
    axiom(""),
    rule(label: BETA, $(fn y.y) app 0 -> 0$)
  ))
]
The term $M_3 = try ((fn x:Bool. throw 0) app mfalse) + 5 catch fn y.y$, is closed and well-typed with type Nat if $T_exn$ = Nat and reduces to the value 0 so it respects the safety theorem.
