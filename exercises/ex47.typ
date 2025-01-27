#import "../common.typ": *

// Note 15 ex 4
#exercise[
  Is the term $mif mtrue then 1 melse mfalse$ well-typed in the language with subtyping?
]
#solution[
  No, proceding by absurd, assume $mif mtrue then 1 melse mfalse$ well-typed.
  So $Gamma tack.r mif mtrue then 1 melse mfalse : T$ then by Inversion Lemma $Gamma tack.r 1: T$ and $Gamma tack.r mfalse: T$ derivable. Applying again the inversion lemma $T=Bool$ and $T=Nat$ which is a contraddiction therefore the term cannot be well-typed.
]
