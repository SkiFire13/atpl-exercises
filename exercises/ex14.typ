#import "../common.typ": *

// Note 9 ex 2
#exercise[
  Consider the term $M = (fn x: Nat. mtrue) app mfalse$. Is it a well-typed term? Is it a term whose execution produces a runtime error?
]
#solution[
  This is not a well typed term.

  Suppose the term $M$ is well typed $emptyset tack.r M : S$
  By inversion lemma then $emptyset tack.r (fn x : Nat . mtrue) : U -> S$
  and $emptyset tack.r mfalse : U$.
  By inversion lemma again on the first judgment we obtain $U = Nat$

  But we can also prove
  #align(center, box(prooftree(
    axiom(label: T-FALSE, $emptyset tack.r mfalse : Bool$)
  )))

  From unicity of typing $Bool = U = Nat$ absurd.


  It however produces no runtime error, successfully evaluating to $mtrue$.
  #align(center, box(prooftree(
    axiom(""),
    rule(label: BETA, $(fn x : Nat .mtrue) app mfalse -> mtrue$)
  )))
]
