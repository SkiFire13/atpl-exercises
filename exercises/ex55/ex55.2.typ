#import "../../common.typ": *

#let Mp = $M#sub[p]$

#[
    #set text(size: 9pt)
    #align(center)[
      #box(prooftree(
        axiom(""),
        rule(label: "(BETA)", $fn y:Nat. (Mp app y) app 5 -> Mp app 5$),
        rule(label: "(TRY)", $try (fn y:Nat. (Mp app y) app 5) catch fn y.y + y -> try (Mp app 5) catch fn y.y + y$)
      ))
      #v(1em)
      #box(prooftree(
        axiom(""),
        rule(label: "(BETA)", $Mp app 5 -> mif even (5) then 5\/2 melse throw 5$),
        rule(label: "(TRY)", $try (Mp app 5) catch fn y.y + y -> try (mif even (5) then 5\/2 melse throw 5) catch fn y.y + y$)
      ))
      #v(1em)
      #box(prooftree(
        axiom(""),
        rule(label: "(MATH AX)", $even (5) -> mfalse$),
        rule(label: "(IF)", $mif even (5) then 5\/2 melse throw 5 -> mif mfalse then 5\/2 melse throw 5$),
        rule(label: "(TRY)", $try (mif even (5) then 5\/2 melse throw 5) catch fn y.y + y -> try (mif mfalse then 5\/2 melse throw 5 catch fn y.y + y$)
      ))
      #v(1em)
      #box(prooftree(
        axiom(""),
        rule(label: "(IF FALSE)", $mif mfalse then 5\/2 melse throw 5 -> throw 5$),
        rule(label: "(TRY)", $try (mif mfalse then 5\/2 melse throw 5 catch fn y.y + y -> try throw 5 catch fn y.y + y$)
      ))
      #v(1em)
      #box(prooftree(
      axiom(""),
      rule(label: "(TRY HANDLE)", $try throw 5 catch fn y.y + y -> (fn y. y + y) app 5$)
      ))
      #v(1em)
      #box(prooftree(
      axiom(""),
      rule(label: "(BETA)", $(fn y. y + y) app 5 -> 5 + 5$)
      ))
      #v(1em)
      #box(prooftree(
      axiom(""),
      rule(label: "(SUM)", $5 + 5 -> 10$)
      ))
    ]
  ]