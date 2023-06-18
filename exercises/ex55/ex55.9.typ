#import "../../common.typ": *

#set text(size: 8pt)
#align(center)[
  #box(prooftree(
    axiom(""),
    rule(label: "(RAISE APP 2)", $fn x.x app throw 1 -> throw 1$),
    rule(label: "(APP 1)", $(fn x.x app throw 1) app (try (M_p app 5) catch fn z.z+z) -> (throw 1) app (try (M_p app 5) catch fn z.z+z)$),
    rule(label: "(TRY)", $try (fn x.x app throw 1) app (try (M_p app 5) catch fn z.z+z) catch fn z.print(z) -> try (throw 1) app (try (M_p app 5) catch fn z.z+z) catch fn z.print(z)$)
  ))
  #v(1em)
  #box(prooftree(
    axiom(""),
    rule(label: "(RAISE APP 1)", $(throw 1) app (try (M_p app 5) catch fn z.z+z) -> throw 1$),
    rule(label: "(TRY)", $try (throw 1) app (try (M_p app 5) catch fn z.z+z) catch fn z.print(z) -> try throw 1 catch fn z.print(z)$)
  ))
  #v(1em)
  #box(prooftree(
    axiom(""),
    rule(label: "(TRY HANDLE)", $try throw 1 catch fn z.print(z) -> (fn z.print(z)) app 1$)
  ))
  #v(1em)
        #box(prooftree(
    axiom(""),
    rule(label: "(BETA)", $(fn z.print(z)) app 1 -> print(1)$)
  ))
]
