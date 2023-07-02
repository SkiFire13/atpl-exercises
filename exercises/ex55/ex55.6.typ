#import "../../common.typ": *

#let MATH-AX = smallcaps("(Math-Ax)")

#set text(size: 7pt)
#align(center)[
  #box(prooftree(
    axiom(""),
    rule(label: BETA, $N_p app 3 -> try (mif even(3) then 3\/2 melse throw 3)$),
    rule(label: TRY, $try (N_p app 3) catch fn y.y -> try (try (mif even(3) then 3\/2 melse throw 3) catch fn z.0) catch fn y.y$)
  ))
  #v(1em)
  #box(prooftree(
    axiom(""),
    rule(label: MATH-AX, $even(3) -> mfalse$),
    rule(label: IF, $mif even(3) then 3\/2 melse throw 3 -> mif mfalse then 3\/2 melse throw 3$),
    rule(label: TRY, $try (mif even(3) then 3\/2 melse throw 3) catch fn z.0 -> try (mif mfalse then 3\/2 melse throw 3) catch fn z.0$),
    rule(label: TRY, $try (try (mif even(3) then 3\/2 melse throw 3) catch fn z.0) catch fn y.y -> try (try (mif mfalse then 3\/2 melse throw 3) catch fn z.0) catch fn y.y$)
  ))
  #v(1em)
  #box(prooftree(
    axiom(""),
    rule(label: IF-FALSE, $mif mfalse then 3\/2 melse throw 3 -> throw 3$),
    rule(label: TRY, $try (mif mfalse then 3\/2 melse throw 3) catch fn z.0 -> try throw 3 catch fn z.0$),
    rule(label: TRY, $try (try (mif mfalse then 3\/2 melse throw 3) catch fn z.0) catch fn y.y -> try (try throw 3 catch fn z.0) catch fn y.y$)
  ))
  #v(1em)
  #box(prooftree(
    axiom(""),
    rule(label: TRY-HANDLE, $try throw 3 catch fn z.0 -> (fn z.0) app 3$),
    rule(label: TRY, $try (try throw 3 catch fn z.0) catch fn y.y -> try ((fn z.0) app 3) catch fn y.y$)
  ))
  #v(1em)
  #box(prooftree(
    axiom(""),
    rule(label: BETA, $(fn z.0) app 3 -> 0$),
    rule(label: TRY, $try ((fn z.0) app 3) catch fn y.y -> try 0 catch fn y.y$)
  ))
  #v(1em)
  #box(prooftree(
    axiom(""),
    rule(label: TRY-VAL, $try 0 catch fn y.y -> 0$)
  ))
]
