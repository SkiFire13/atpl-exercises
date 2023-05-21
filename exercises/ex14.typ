#import "../common.typ": *

#let Nat = "Nat"

// Note 9 ex 2
#exercise[
  Consider the term $M = (fn x: Nat. mtrue) app mfalse$. Is it a well-typed term? Is it a term whose execution produces a runtime error?
]
#solution[
  This is not a well typed term. The only rule that can apply is (T-APP), but it requires $mfalse: Nat$ which is clearly false. It however produces no runtime error, successfully evaluating to $mtrue$.
]
