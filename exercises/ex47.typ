#import "../common.typ": *

// Note 15 ex 4
#exercise[
  Is the term $mif mtrue then 1 melse mfalse$ well-typed in the language with subtyping?
]
#solution[
  No, proceding by absurd, assume the judgement is derivable.
  Then by Inversion Lemma $exists S_1, S_2$ s.t $emptyset tack.r 10 : S_1 and emptyset tack.r mtrue + 2 : S_2$ derivable
  Applying again the inversion lemma $S_1=Nat$ and $S_2=Nat$ but $emptyset tack.r mtrue : Nat$ is not derivable hence judgement too so this is contraddiction with the premises therfore the judgment is not derivable.
]
