#import "../../common.typ": *

#let Mp = $M#sub[p]$

#[
  #set text(size: 9pt)
  #align(center)[
    #box(prooftree(
      axiom(""),
      rule(label: "(BETA)", $Mp app 3 -> mif even (3) then 3\/2 melse throw 3$),
      rule(label: "(TRY)", $try (Mp app 3) catch fn y.y + y -> try (mif even (3) then 3\/2 melse throw 3) catch fn y.y + y$)
    ))
    #v(1em)
    #box(prooftree(
      axiom(""),
      rule(label: "(MATH AX)", $even (3) -> mfalse$),
      rule(label: "(IF)", $mif even (3) then 3\/2 melse throw 3 -> mif mfalse then 3\/2 melse throw 3$),
      rule(label: "(TRY)", $try (mif even (3) then 3\/2 melse throw 3) catch fn y.y + y -> try (mif mfalse then 3\/2 melse throw 3 catch fn y.y + y$)
    ))
    #v(1em)
    #box(prooftree(
      axiom(""),
      rule(label: "(IF FALSE)", $mif mfalse then 3\/2 melse throw 3 -> throw 3$),
      rule(label: "(TRY)", $try (mif mfalse then 3\/2 melse throw 3 catch fn y.y + y -> try throw 3 catch fn y.y + y$)
    ))
    #v(1em)
    #box(prooftree(
    axiom(""),
    rule(label: "(TRY HANDLE)", $try throw 3 catch fn y.y + y -> (fn y. y + y) app 3$)
    ))
    #v(1em)
    #box(prooftree(
    axiom(""),
    rule(label: "(BETA)", $(fn y. y + y) app 3 -> 3 + 3$)
    ))
    #v(1em)
    #box(prooftree(
    axiom(""),
    rule(label: "(SUM)", $3 + 3 -> 6$)
    ))
  ]
]