#import "../common.typ": *

// Note 15 ex 6
#exercise[
  If we had defined the subtyping rules in such a way that ${ell: Nat} <: {ell: Nat, ell': Nat}$, which theorem would no longer be true? Identify it and give a counterexample. If we did not have the rule (ARROW), how would the properties of the type system change?
]
#solution[
  The progress theorem would no longer be true. Consider ${ell = 0}.ell'$: $emptyset tack.r {ell = 0}.ell' : Nat$ is derivable, but ${ell = 0}.ell'$ is not a value and ${ell = 0}.ell' arrow.r.not$.
  #align(center, box(prooftree(
    axiom(label: "(T-NAT)", $emptyset tack.r 0: Nat$),
    rule(label: "(T-RECORD)", $emptyset tack.r {ell = 0} : {ell: Nat}$),
    axiom(${ell: Nat} <: {ell: Nat, ell': Nat}$),
    rule(n: 2, label: "(SUBSUMPTION)", $emptyset tack.r {ell = 0} : {ell: Nat, ell': Nat}$),
    rule(label: "(T-SELECT)", $emptyset tack.r {ell = 0}.ell' : Nat$),
  )))

  If we removed the rule (ARROW) from the language we would not be able to prove function subtyping in all cases except when they are immediately called.
]
