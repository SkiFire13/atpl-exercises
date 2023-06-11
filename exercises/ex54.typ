#import "../common.typ": *

// Note 15 ex 11
#exercise[
  Find two terms $M$ and $N$ such that $M -> N$, $Gamma tack2r M: T$, $Gamma tack2r N : S$ with $S <:: T$ and $T lt.not:: S$. In other terms, exhibit a case where the type of a term decreases during the computation.
]
#solution[
  Consider $M = (fn x: {}. x) app { ell = 1 }$, $N = { ell = 1 }$, $T = {}$ and $S = { ell: Nat }$:

  - $M -> N$
  #align(center, box(prooftree(
    axiom(""),
    rule(label: "(APP)", $(fn x: {}. x) app { ell = 1 } -> x { x := { ell = 1 }}$),
  )))

  - $S <:: T$
  #align(center, box(prooftree(
    axiom(${} subset.eq { ell }$),
    rule(label: "(ALGO-SUB-RECORD)", ${ ell: Nat } <:: {}$),
  )))

  - $N : S$
  #align(center, box(prooftree(
    axiom(label: "(T-NAT)", $emptyset tack2r 1 : Nat$),
    rule(label: "(T-RECORD)", $emptyset tack2r { ell = 1 } : { ell : Nat }$),
  )))

  - $M : T$
  #text(10pt, align(center, box(prooftree(
    axiom(label: "(T-VAR)", $x: {} tack2r x: {}$),
    rule(label: "(T-FUN)", $emptyset tack2r fn x: {}. x : {} -> {}$),
    axiom($emptyset tack2r { ell = 1 } : { ell: Nat }$),
    axiom(${ ell: Nat } <:: {}$),
    rule(n: 3, label: "(ALGO-APP)", $emptyset tack2r (fn x: {}. x) app { ell = 1 } : {}$),
  ))))

  - $T lt.not:: S$: clearly ${} lt.not :: { ell : Nat }$ because otherwise ${}.ell$ would be well typed but stuck, which is ruled out by the safety theorem.
]
