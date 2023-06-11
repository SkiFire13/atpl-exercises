#import "../../common.typ": *

#set text(size: 7pt)
#align(center)[
  #box(prooftree(
    axiom(""),
    rule(label: "(BETA)", $fn y:Nat. (try (M_p app y) catch fn z.print(z)) app 5 -> try (M_p app 5) catch fn z.print(z)$),
    rule(label: "(TRY)", $try [fn y:Nat. (try (M_p app y) catch fn z.print(z)) app 5] catch fn y.y + y -> try (try (M_p app 5) catch fn z.print(z)) catch fn y.y + y$)
  ))
  #v(1em)
  #box(prooftree(
    axiom(""),
    rule(label: "(BETA)", $M_p app 5 -> mif even (5) then 5\/2 melse throw 5$),
    rule(label: "(TRY)", $try (M_p app 5) catch fn z.print(z) -> try (mif even (5) then 5\/2 melse throw 5) catch fn z.print(z)$),
    rule(label: "(TRY)", $try (try (M_p app 5) catch fn z.print(z)) catch fn y.y + y -> try (try (mif even (5) then 5\/2 melse throw 5) catch fn z.print(z)) catch fn y.y + y$)
  ))
  #v(1em)
  #set text(size: 6pt)
  #box(prooftree(
    axiom(""),
    rule(label: "(MATH AX)", $even (5) -> mfalse$),
    rule(label: "(IF)", $mif even (5) then 5\/2 melse throw 5 -> mif mfalse then 5\/2 melse throw 5$),
    rule(label: "(TRY)", $try (mif even (5) then 5\/2 melse throw 5) catch fn z.print(z) -> try (mif mfalse then 5\/2 melse throw 5) catch fn z.print(z)$),
    rule(label: "(TRY)", $try (try (mif even (5) then 5\/2 melse throw 5) catch fn z.print(z)) catch fn y.y + y -> try (try (mif mfalse then 5\/2 melse throw 5) catch fn z.print(z)) catch fn y.y + y$)
  ))
  #v(1em)
  #set text(size: 7pt)
  #box(prooftree(
    axiom(""),
    rule(label: "(IF FALSE)", $mif mfalse then 5\/2 melse throw 5 -> throw 5$),
    rule(label: "(TRY)", $try (mif mfalse then 5\/2 melse throw 5) catch fn z.print(z) -> try throw 5 catch fn z.print(z)$),
    rule(label: "(TRY)", $try (try (mif mfalse then 5\/2 melse throw 5) catch fn z.print(z)) catch fn y.y + y -> try (try throw 5 catch fn z.print(z)) catch fn y.y + y$)
  ))
  #v(1em)
  #box(prooftree(
    axiom(""),
    rule(label: "(TRY HANDLE)", $try throw 5 catch fn z.print(z) -> (fn z.print(z)) app 5$),
    rule(label: "(TRY)", $try (try throw 5 catch fn z.print(z)) catch fn y.y + y -> try (fn z.print(z)) app 5 catch fn y.y + y$)
  ))
  #v(1em)
  #box(prooftree(
    axiom(""),
    rule(label: "(BETA)", $(fn z.print(z)) app 5 -> print(5)$),
    rule(label: "(TRY)", $try (fn z.print(z)) app 5 catch fn y.y + y -> try print(5) catch fn y.y + y$)
  ))
  #v(1em)
  #align(left)[Since it is not defined, "print(5)" is considered as a value:]

  #box(prooftree(
    axiom(""),
    rule(label: "(TRY VAL)", $try print(5) catch fn y.y + y -> print(5)$)
  ))
]
