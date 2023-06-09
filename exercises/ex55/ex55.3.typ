#import "../../common.typ": *

#let Mp = $M#sub[p]$

#[
  #set text(size: 9pt)
  #align(center)[
    #box(prooftree(
      axiom(""),
      rule(label: "(BETA)", $fn z:Bool. (Mp app mif z then 3 melse 6) app mfalse] -> Mp app mif mfalse then 3 melse 6$),
      rule(label: "(TRY)", $try [fn z:Bool. (Mp app mif z then 3 melse 6) app mfalse] catch fn y.y + y -> try (Mp app mif mfalse then 3 melse 6) catch fn y.y + y$)
    ))
    #v(1em)
    #box(prooftree(
      axiom(""),
      rule(label: "(IF FALSE)", $mif mfalse then 3 melse 6 -> 6$),
      rule(label: "(APP 2)", $Mp app mif mfalse then 3 melse 6 -> Mp app 6$),
      rule(label: "(TRY)", $try (Mp app mif mfalse then 3 melse 6) catch fn y.y + y -> try (Mp app 6) catch fn y.y + y$)
    ))
    #v(1em)
    #box(prooftree(
      axiom(""),
      rule(label: "(BETA)", $Mp app 6 -> mif even (6) then 6\/2 melse throw 6$),
      rule(label: "(TRY)", $try (Mp app 6) catch fn y.y + y -> try (mif even (6) then 6\/2 melse throw 6) catch fn y.y + y$)
    ))
    #v(1em)
    #box(prooftree(
      axiom(""),
      rule(label: "(MATH AX)", $even (6) -> mtrue$),
      rule(label: "(IF)", $mif even (6) then 6\/2 melse throw 6 -> mif mtrue then 6\/2 melse throw 6$),
      rule(label: "(TRY)", $try (mif even (6) then 6\/2 melse throw 6) catch fn y.y + y -> try (mif mtrue then 6\/2 melse throw 6) catch fn y.y + y$)
    ))
    #v(1em)
    #box(prooftree(
      axiom(""),
      rule(label: "(IF TRUE)", $mif mtrue then 6\/2 melse throw 6 -> 6\/2$),
      rule(label: "(TRY)", $try (mif mtrue then 6\/2 melse throw 6) catch fn y.y + y -> try 6\/2 catch fn y.y + y$)
    ))
    #v(1em)
    #box(prooftree(
      axiom(""),
      rule(label: "(MATH AX)", $6\/2 -> 3$),
      rule(label: "(TRY)", $try 6\/2 catch fn y.y + y -> try 3 catch fn y. y + y$)
    ))
    #v(1em)
    #box(prooftree(
      axiom(""),
      rule(label: "(TRY VAL)", $try 3 catch fn y. y + y -> 3$)
    ))
  ]
]