#import "../common.typ": *

#let Mp = $M#sub[p]$

// Note 16 ex 1
#exercise[
  - $Mp = fn x:Nat. (mif even (x) then x\/2 melse throw x)$
  - $try (Mp app 3) catch fn y.y + y$
  - $try (fn y:Nat. (Mp app y) app 5) catch fn y.y + y$
  - $try [fn z:Bool. (Mp app mif z then 3 melse 6) app mfalse] catch fn y.y + y$
  - $try (fn y.y + 2 app (Mp app 5)) catch fn z.print (z)$
  Show the operational semantics of the terms above, observing how the raising of the exception causes a non local jump of the control flow.
]
#solution[

  #include "ex55/ex55.1.typ"
  #include "ex55/ex55.2.typ"
  #include "ex55/ex55.3.typ"
  #include "ex55/ex55.4.typ"

  
]

// #v(1em)
// #box(prooftree(
//   axiom(""),
//   rule(label: "(TODO)", $$),
//   rule(label: "(IF)", $$),
//   rule(label: "(TRY)", $$)
// ))