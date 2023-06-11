#import "../common.typ": *

// Note 15 ex 9
#exercise[
  Define a term $M$ that does not evolve to a stuck term and that is well-typed only in the language with subtyping.
]
#solution[
  Consider $M = (fn x: {}. x) app { ell = 1}$. $M -> { ell = 1 }$ which is a value. In the language without subtyping $M$ is not well typed due to having to prove $emptyset tack.r { ell = 1 } : {}$, which is false because the field names do not coincide. However in the language with subtyping it is well typed:
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
]
