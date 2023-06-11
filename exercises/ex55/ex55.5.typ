#import "../../common.typ": *

#set text(size: 9pt)
#align(center)[
  #box(prooftree(
    axiom(""),
    rule(label: "(RAISE APP 2)", $M_p app throw 2 -> throw 2$),
    rule(label: "(APP 2)", $2 app (M_p app throw 2) -> 2 app (throw 2)$),
    rule(label: "(SUM RIGHT)", $fn y.y + 2 app (M_p app throw 2) -> fn y.y + 2 app (throw 2)$),
    rule(label: "(TRY)", $try (fn y.y + 2 app (M_p app throw 2)) catch fn z.print(z) -> try (fn y.y + 2 app (throw 2)) catch fn z.print(z)$)
  ))
  #v(1em)
  #box(prooftree(
    axiom(""),
    rule(label: "(RAISE APP 2)", $2 app (throw 2) -> throw 2$),
    rule(label: "(SUM RIGHT)", $fn y.y + 2 app (throw 2) -> fn y.y + throw 2$),
    rule(label: "(TRY)", $try (fn y.y + 2 app (throw 2)) catch fn z.print(z) -> try (fn y.y + throw 2) catch fn z.print(z)$)
  ))
  #v(1em)
  #box(prooftree(
    axiom(""),
    rule(label: "(RAISE SUM 2)", $fn y.y + throw 2 -> throw 2$),
    rule(label: "(TRY)", $try (fn y.y + throw 2) catch fn z.print (z) -> try throw 2 catch fn z.print (z)$)
  ))
  #v(1em)
  #box(prooftree(
    axiom(""),
    rule(label: "(TRY HANDLE)", $try throw 2 catch fn z.print (z) -> (fn z.print (z)) app 2$)
  ))
  #v(1em)
  #box(prooftree(
    axiom(""),
    rule(label: "(BETA)", $(fn z.print (z)) app 2 -> print app 2$)
  ))
]
