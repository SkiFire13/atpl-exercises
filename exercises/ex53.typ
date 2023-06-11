#import "../common.typ": *

// Note 15 ex 10
#exercise[
  Consider the following modification of the rule (ARROW):
  #align(center, box(prooftree(
    axiom($S_1 <: T_1$),
    axiom($S_2 <: T_2$),
    rule(n: 2, label: "(NEW-ARROW)", $S_1 -> S_2 <: T_1 -> T_2$),
  )))
  Prove that the safety teorema sill holds, or exhibit a counterexample.
]
#solution[
  
]
