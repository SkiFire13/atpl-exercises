#import "../common.typ": *

// Note 15 ex 5
#exercise[
  For which types the judgment $emptyset tack.r {ell_1 = 1, ell_2 = 2, ell_3 = 3} : T$ is derivable?
]
#solution[
  It is derivable for the types:
  - $T = {}$
  - $T = {ell_1: Nat}$
  - $T = {ell_2: Nat}$
  - $T = {ell_3: Nat}$
  - $T = {ell_1: Nat, ell_2: Nat}$
  - $T = {ell_1: Nat, ell_3: Nat}$
  - $T = {ell_2: Nat, ell_3: Nat}$
  - $T = {ell_1: Nat, ell_2: Nat, ell_3: Nat}$

  #align(center, text(size: 7.5pt, box(prooftree(
    axiom(label: T-INT, $emptyset tack.r 1 : Nat$),
    axiom(label: T-INT, $emptyset tack.r 2 : Nat$),
    axiom(label: T-INT, $emptyset tack.r 3 : Nat$),
    rule(n: 3, label: T-RECORD, $emptyset tack.r {ell_1 = 1, ell_2 = 2, ell_3 = 3} : {ell_1: Nat, ell_2: Nat, ell_3: Nat}$),
    axiom(label: SUB-WIDTH, ${ell_1: Nat, ell_2: Nat, ell_3: Nat} <: T$),
    rule(n: 2, label: SUBSUMPTION, $emptyset tack.r {ell_1 = 1, ell_2 = 2, ell_3 = 3} : T$),
  ))))
]
