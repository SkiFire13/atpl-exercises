#import "../common.typ": *

// Note 15 ex 9
#exercise[
  Define a term $M$ that does not evolve to a stuck term and that is well-typed only in the language with subtyping.
]
#solution[
  Consider $M = (fn x: {}. x) app { ell = 1}$

  It is well typed in the language with subtyping
  #set text(size: 10pt)
  #align(center, box(prooftree(
    axiom(label: "(T-VAR)", $x : {} tack.r x : {}$),
    rule(label: "(T-FUN)", $emptyset tack.r fn x: {}. x : {} -> {}$),
    axiom(label: "(T-NAT)", $emptyset tack.r 1 : Nat$),
    rule(label: "(T-RECORD)", $emptyset tack.r { ell = 1 } : { ell : Nat }$),
    axiom(label: "(SUB-WIDTH)", ${ ell: Nat } <: {}$),
    rule(n: 2, label: "(SUBSUMPTION)", $emptyset tack.r { ell = 1} : {}$),
    rule(n: 2, label: "(T-APP)", $emptyset tack.r (fn x: {}. x) app { ell = 1} : {}$),
  )))

  It evolves to a value:
  #align(center, box(prooftree(
    axiom($$),
    rule(label: "(BETA)", $(fn x: {}. x) {ell = 1} -> {ell = 1}$)
  )))


  But in the language without subtyping isn't well typed:

  Suppose it is $emptyset tack.r (fn x : {} . x) {ell = 1}$, by inversion lemma we
  know that $emptyset tack.r {ell = 1} : {}$
  #align(center, box(prooftree(
    axiom(label: "(T-NAT)", $emptyset tack.r 1 : Nat$),
    rule(label: "(T-RECORD)", $emptyset tack.r { ell = 1 } : { ell : Nat }$),
  )))
  By unicty of typing that would mean ${} = {ell : Nat}$ absurd.
]
