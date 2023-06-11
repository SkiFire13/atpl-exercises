#import "../common.typ": *

// Note 15 ex 3
#exercise[
  Is the term $mif mtrue then {a=1, b=0} melse {c=3, a=1}$ well-typed in the language with subtyping?
]
#solution[
  Yes, it is well typed with type ${a: Nat}$:

  #set text(size: 10pt)

  #align(center, box(prooftree(
    axiom(label: "(T-NAT)", $emptyset tack.r 1 : Nat$),
    axiom(label: "(T-NAT)", $emptyset tack.r 0 : Nat$),
    rule(n: 2, label: "(T-RECORD)", $emptyset tack.r {a=1, b=0}: {a: Nat, b: Nat}$),
    axiom(label: "(SUB-WIDTH)", ${a: Nat, b: Nat} <: {a: Nat}$),
    rule(n: 2, label: "(SUBSUMPTION)", $emptyset tack.r {a=1, b=0}: {a: Nat}$),
  )))

  #align(center, box(prooftree(
    axiom(label: "(T-NAT)", $emptyset tack.r 3 : Nat$),
    axiom(label: "(T-NAT)", $emptyset tack.r 1 : Nat$),
    rule(n: 2, label: "(T-RECORD)", $emptyset tack.r {c=3, a=1}: {a: Nat, b: Nat}$),
    axiom(label: "(SUB-WIDTH)", ${c: Nat, a: Nat} <: {a: Nat}$),
    rule(n: 2, label: "(SUBSUMPTION)", $emptyset tack.r {c=3, a=1}: {c: Nat, a: Nat}$),
  )))

  #align(center, box(prooftree(
    axiom(label: "(T-TRUE)", $emptyset tack.r mtrue: Bool$),
    axiom($emptyset tack.r {a=1, b=0}: {a: Nat}$),
    axiom($emptyset tack.r {c=3, a=1}: {c: Nat, a: Nat}$),
    rule(n: 3, label: "(T-IF)", $emptyset tack.r mif mtrue then {a=1, b=0} melse {c=3, a=1}: {a: Nat}$),
  )))
]
