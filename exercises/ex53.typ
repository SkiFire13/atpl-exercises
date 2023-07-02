#import "../common.typ": *

#let ARROW = smallcaps("(Arrow)")
#let NEW-ARROW = smallcaps("(New-Arrow)")

// Note 15 ex 10
#exercise[
  Consider the following modification of the rule #ARROW:
  #align(center, box(prooftree(
    axiom($S_1 <: T_1$),
    axiom($S_2 <: T_2$),
    rule(n: 2, label: NEW-ARROW, $S_1 -> S_2 <: T_1 -> T_2$),
  )))
  Prove that the safety teorema sill holds, or exhibit a counterexample.
]
#solution[
  Consider $M = (fn x: { ell: Nat }. x.ell) {}$. $M$ is well typed:
  #text(size: 7.5pt, align(center, box(prooftree(
    axiom(label: T-VAR, $x : { ell: Nat } tack.r x : { ell: Nat }$),
    rule(label: T-SELECT, $x : { ell: Nat } tack.r x.ell : Nat$),
    rule(label: T-FUN, $emptyset tack.r fn x: { ell: Nat }. x.ell : { ell: Nat } -> Nat$),
    axiom(label: SUB-WIDTH, ${ ell : Nat} <: {}$),
    axiom(label: REFLEX, $Nat <: Nat$),
    rule(n: 2, label: NEW-ARROW, ${ ell : Nat } -> Nat <: {} -> Nat$),
    rule(n: 2, label: SUBSUMPTION, $emptyset tack.r fn x: { ell: Nat }. x.ell : {} -> Nat$),
    axiom(label: T-RECORD, $emptyset tack.r {} : {}$),
    rule(n: 2, label: T-APP, $emptyset tack.r (fn x: { ell: Nat }. x.ell) app {} : Nat$),
  ))))
  However $M -> {}.ell$ by #BETA, and ${}.ell$ is a stuck term, thus the safety theorem doesn't hold.
]
