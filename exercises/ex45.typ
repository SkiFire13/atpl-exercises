#import "../common.typ": *

// Note 15 ex 2
#exercise[
  Show a derivation of the judgment $emptyset tack.r (fn r:{ell: Nat}. r.ell + 2) app {ell = 0, ell' = 1} : Nat$ that uses an instance of the rule #ARROW, and a second derivation of the same judgment that does not use that rule.
]
#solution[
  #align(center, text(size: 7.5pt, box(prooftree(
    axiom(label: T-VAR, $r: {ell: Nat} tack.r r : {ell: Nat}$),
    rule(label: T-SELECT, $r: {ell: Nat} tack.r r.ell: Nat$),
    axiom(label: T-INT, $r: {ell: Nat} tack.r 2: Nat$),
    rule(n: 2, label: T-SUM, $r: {ell: Nat} tack.r r.ell + 2: Nat$),
    rule(label: T-FUN, $emptyset tack.r fn r:{ell: Nat}. r.ell + 2: {ell: Nat} -> Nat$),

    axiom(label: SUB-WIDTH, ${ell: Nat, ell': Nat} <: {ell: Nat}$),
    axiom(label: REFLEX, $Nat <: Nat$),
    rule(n: 2, label: ARROW, ${ell: Nat} -> Nat <: {ell: Nat, ell': Nat} -> Nat$),

    rule(n: 2, label: SUBSUMPTION, $emptyset tack.r fn r:{ell: Nat}. r.ell + 2: {ell: Nat, ell': Nat} -> Nat$),
  ))))
  #align(center, text(size: 8pt, box(prooftree(
    axiom($emptyset tack.r fn r:{ell: Nat}. r.ell + 2: {ell: Nat, ell': Nat} -> Nat$),

    axiom(label: T-INT, $emptyset tack.r 0: Nat$),
    axiom(label: T-INT, $emptyset tack.r 1: Nat$),
    rule(n: 2, label: T-RECORD, $emptyset tack.r {ell = 0, ell' = 1} : {ell: Nat, ell': Nat}$),

    rule(n: 2, label: T-APP, $emptyset tack.r (fn r:{ell: Nat}. r.ell + 2) app {ell = 0, ell' = 1} : Nat$),
  ))))

  #vspace
  #line(length: 100%)
  #vspace

  #align(center, text(size: 10pt, box(prooftree(
    axiom(label: T-INT, $emptyset tack.r 0: Nat$),
    axiom(label: T-INT, $emptyset tack.r 1: Nat$),
    rule(n: 2, label: T-RECORD, $emptyset tack.r {ell = 0, ell' = 1} : {ell: Nat, ell': Nat}$),
    axiom(label: SUB-WIDTH, ${ell: Nat, ell': Nat} <: {ell: Nat}$),
    rule(n: 2, label: SUBSUMPTION, $emptyset tack.r {ell = 0, ell' = 1} : {ell: Nat}$),
  ))))

  #align(center, text(size: 9pt, box(prooftree(
    axiom(label: T-VAR, $r: {ell: Nat} tack.r r : {ell: Nat}$),
    rule(label: T-SELECT, $r: {ell: Nat} tack.r r.ell: Nat$),
    axiom(label: T-INT, $r: {ell: Nat} tack.r 2: Nat$),
    rule(n: 2, label: T-SUM, $r: {ell: Nat} tack.r r.ell + 2: Nat$),
    rule(label: T-FUN, $emptyset tack.r fn r:{ell: Nat}. r.ell + 2: {ell: Nat} -> Nat$),
    axiom($emptyset tack.r {ell = 0, ell' = 1} : {ell: Nat}$),
    rule(n: 2, label: T-APP, $emptyset tack.r (fn r:{ell: Nat}. r.ell + 2) app {ell = 0, ell' = 1} : Nat$),
  ))))
]
