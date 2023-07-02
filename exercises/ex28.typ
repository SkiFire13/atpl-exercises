#import "../common.typ": *

// Note 12 ex 1
#exercise[
  Update the proofs of the progress and type preservation theorems, and the proof of substitution lemma in order to consider the language L extended with the term unit.
]
#solution[
  - *Progress theorem*: add a new base case for #T-UNIT, thus $M = unit$ which is already a value;
  - *Type preservation*: no new case is needed because no reduction rule has been added;
  - *Substitution lemma*: add a new base case for #T-UNIT, thus $M = unit$, $unit {x := N} = unit$ and by #T-UNIT $Gamma tack.r unit : Unit$.
]
