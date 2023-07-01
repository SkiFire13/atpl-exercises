#import "../common.typ": *

// Note 15 ex 4
#exercise[
  Is the term $mif mtrue then 1 melse mfalse$ well-typed in the language with subtyping?
]
#solution[
<<<<<<< HEAD
  No, proceding by absurd, assume M well-typed.
  So $Gamma tack.r mif mtrue then 1 melse mfalse : T$ then by Inversion Lemma:
  - $Gamma tack.r mtrue:Bool$
  - $Gamma tack.r 1:T$
  - $Gamma tack.r mfalse:T$
  Applying again the inversion lemma $T=Bool$ and $T=Nat$ which is a contraddiction therfore M is not well-typed.
=======
  No, proceding by absurd, assume the judgement is derivable.
  Then by Inversion Lemma $exists S_1, S_2$ s.t $emptyset tack.r 10 : S_1 and emptyset tack.r mtrue + 2 : S_2$ derivable
  Applying again the inversion lemma $S_1=Nat$ and $S_2=Nat$ but $emptyset tack.r mtrue : Nat$ is not derivable hence judgement too so this is contraddiction with the premises therfore the judgment is not derivable.
>>>>>>> 0c503a0 (Ex 47 formal version)
]
