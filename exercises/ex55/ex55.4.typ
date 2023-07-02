#import "../../common.typ": *

#let MATH-AX = smallcaps("(Math-Ax)")

#set text(size: 7pt)
#align(center)[
  #box(prooftree(
    axiom(""),
    rule(label: BETA, $M_p app 5 -> mif even (5) then 5\/2 melse throw 5$),
    rule(label: APP-2, $fn y.y + 2 app (M_p app 5) -> fn y.y + 2 app (mif even (5) then 5\/2 melse throw 5)$),
    rule(label: TRY, $try (fn y.y + 2 app (M_p app 5)) catch fn z.print (z) -> try (fn y.y + 2 app (mif even (5) then 5\/2 melse throw 5)) catch fn z.print (z)$)
  ))
  #vspace
  #box(prooftree(
    axiom(""),
    rule(label: MATH-AX, $even (5) -> mfalse$),
    rule(label: IF, $mif even (5) then 5\/2 melse throw 5 -> mif mfalse then 5\/2 melse throw 5$),
    rule(label: APP-2, $fn y.y + 2 app (mif even (5) then 5\/2 melse throw 5) -> fn y.y + 2 app (mif mfalse then 5\/2 melse throw 5)$),
    rule(label: TRY, $try (fn y.y + 2 app (mif even (5) then 5\/2 melse throw 5)) catch fn z.print (z) -> try (fn y.y + 2 app (mif mfalse then 5\/2 melse throw 5)) catch fn z.print (z)$)
  ))
  #vspace
  #box(prooftree(
    axiom(""),
    rule(label: IF-FALSE, $mif mfalse then 5\/2 melse throw 5 -> throw 5$),
    rule(label: APP-2, $fn y.y + 2 app (mif mfalse then 5\/2 melse throw 5) -> fn y.y + 2 app (throw 5)$),
    rule(label: TRY, $try (fn y.y + 2 app (mif mfalse then 5\/2 melse throw 5)) catch fn z.print (z) -> try (fn y.y + 2 app (throw 5)) catch fn z.print (z)$)
  ))
  #vspace
  #box(prooftree(
    axiom(""),
    rule(label: RAISE-APP-2, $fn y.y + 2 app (throw 5) -> throw 5$),
    rule(label: TRY, $try (fn y.y + 2 app (throw 5)) catch fn z.print (z) -> try throw 5 catch fn z.print (z)$)
  ))
  #vspace
  #box(prooftree(
    axiom(""),
    rule(label: TRY-HANDLE, $try throw 5 catch fn z.print (z) -> (fn z.print (z)) app 5$)
  ))
  #vspace
  #box(prooftree(
    axiom(""),
    rule(label: BETA, $(fn z.print (z)) app 5 -> print app 5$)
  ))
]
