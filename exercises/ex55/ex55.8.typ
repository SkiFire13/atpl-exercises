#import "../../common.typ": *

#set text(size: 6pt)
#align(center)[
  #box(prooftree(
    axiom(""),
    rule(label: "(BETA)", $M_p app 5-> mif even(5) then 5\/2 melse throw 5$),
    rule(label: "(TRY)", $try (M_p app 5) catch fn z.z+z -> try (mif even(5) then 5\/2 melse throw 5) catch fn z.z+z$),
    rule(label: "(APP 2)", $2 app (try (M_p app 5) catch fn z.z+z) -> 2 app (try (mif even(5) then 5\/2 melse throw 5) catch fn z.z+z)$),
    rule(label: "(SUM RIGHT)", $fn y.y + 2 app (try (M_p app 5) catch fn z.z+z) -> fn y.y + 2 app (try (mif even(5) then 5\/2 melse throw 5) catch fn z.z+z)$),
    rule(label: "(TRY)", $try (fn y.y + 2 app (try (M_p app 5) catch fn z.z+z)) catch fn z.print(z) -> try (fn y.y + 2 app (try (mif even(5) then 5\/2 melse throw 5) catch fn z.z+z)) catch fn z.print(z)$)
  ))
  #v(1em)
  #box(prooftree(
    axiom(""),
    rule(label: "(MATH AX)", $even(5) -> mfalse$),
    rule(label: "(IF)", $mif even(5) then 5\/2 melse throw 5 -> mif mfalse then 5\/2 melse throw 5$),
    rule(label: "(TRY)", $try (mif even(5) then 5\/2 melse throw 5) catch fn z.z+z -> try (mif mfalse then 5\/2 melse throw 5) catch fn z.z+z$),
    rule(label: "(APP 2)", $2 app (try (mif even(5) then 5\/2 melse throw 5) catch fn z.z+z) -> 2 app (try (mif mfalse then 5\/2 melse throw 5) catch fn z.z+z)$),
    rule(label: "(SUM RIGHT)", $fn y.y + 2 app (try (mif even(5) then 5\/2 melse throw 5) catch fn z.z+z) -> fn y.y + 2 app (try (mif mfalse then 5\/2 melse throw 5) catch fn z.z+z)$),
    rule(label: "(TRY)", $try (fn y.y + 2 app (try (mif even(5) then 5\/2 melse throw 5) catch fn z.z+z)) catch fn z.print(z) -> try (fn y.y + 2 app (try (mif mfalse then 5\/2 melse throw 5) catch fn z.z+z)) catch fn z.print(z)$)
  ))
  #v(1em)
  #box(prooftree(
    axiom(""),
    rule(label: "(IF FALSE)", $mif mfalse then 5\/2 melse throw 5 -> throw 5$),
    rule(label: "(TRY)", $try (mif mfalse then 5\/2 melse throw 5) catch fn z.z+z -> try throw 5 catch fn z.z+z$),
    rule(label: "(APP 2)", $2 app (try (mif mfalse then 5\/2 melse throw 5) catch fn z.z+z) -> 2 app (try throw 5 catch fn z.z+z)$),
    rule(label: "(SUM RIGHT)", $fn y.y + 2 app (try (mif mfalse then 5\/2 melse throw 5) catch fn z.z+z) -> fn y.y + 2 app (try throw 5 catch fn z.z+z)$),
    rule(label: "(TRY)", $try (fn y.y + 2 app (try (mif mfalse then 5\/2 melse throw 5) catch fn z.z+z)) catch fn z.print(z) -> try (fn y.y + 2 app (try throw 5 catch fn z.z+z)) catch fn z.print(z)$)
  ))
  #v(1em)
  #set text(size: 7pt)
  #box(prooftree(
    axiom(""),
    rule(label: "(TRY HANDLE)", $try throw 5 catch fn z.z+z -> (fn z.z+z) app 5$),
    rule(label: "(APP 2)", $2 app (try throw 5 catch fn z.z+z) -> 2 app ((fn z.z+z) app 5)$),
    rule(label: "(SUM RIGHT)", $fn y.y + 2 app (try throw 5 catch fn z.z+z) -> fn y.y + 2 app ((fn z.z+z) app 5)$),
    rule(label: "(TRY)", $try (fn y.y + 2 app (try throw 5 catch fn z.z+z)) catch fn z.print(z) -> try (fn y.y + 2 app ((fn z.z+z) app 5)) catch fn z.print(z)$)
  ))
  #v(1em)
  #box(prooftree(
    axiom(""),
    rule(label: "(BETA)", $(fn z.z+z) app 5 -> 5 + 5$),
    rule(label: "(APP 2)", $2 app ((fn z.z+z) app 5 -> 2 app (5 + 5)$),
    rule(label: "(SUM RIGHT)", $fn y.y + 2 app ((fn z.z+z) app 5) -> fn y.y + 2 app (5 + 5)$),
    rule(label: "(TRY)", $try (fn y.y + 2 app ((fn z.z+z) app 5)) catch fn z.print(z) -> try (fn y.y + 2 app (5 + 5)) catch fn z.print(z)$)
  ))
  #v(1em)
  #box(prooftree(
    axiom(""),
    rule(label: "(SUM)", $5 + 5 -> 10$),
    rule(label: "(APP 2)", $2 app (5 + 5) -> 2 app 10$),
    rule(label: "(SUM RIGHT)", $fn y.y + 2 app (5 + 5) -> fn y.y + 2 app 10$),
    rule(label: "(TRY)", $try (fn y.y + 2 app (5 + 5)) catch fn z.print(z) -> try (fn y.y + 2 app 10) catch fn z.print(z)$)
  ))
  #v(1em)

  $try (fn y.y + 2 app 10) catch fn z.print(z)$ \u{219B}
]