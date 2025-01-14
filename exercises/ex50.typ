#import "../common.typ": *

// Note 15 ex 7
#exercise[
  Is the judgment $emptyset tack.r {ell_1 = 10, ell_2 = mtrue + 2} : {ell_1: Nat}$ derivable?
]
#solution[
  No, proceding by absurd, assume the judgement is derivable.
  Then by Inversion Lemma $exists S_1, S_2.$ $emptyset tack.r 10 : S_1$ and $emptyset tack.r mtrue + 2 : S_2$ derivable.
  Applying again the Inversion Lemma $emptyset tack.r mtrue : Nat$.
  Applying the Inversion Lemma on this term we obtain $Nat = Bool$ which is a contraddiction so the term cannot be well-typed.
]
