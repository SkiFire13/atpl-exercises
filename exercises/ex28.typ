#import "../common.typ": *

// Note 12 ex 1
#exercise[
  Update the proofs of the progress and type preservation theorems, and the proof of substitution lemma in order to consider the language L extended with the term unit.
]
#solution[
  - *Progress theorem*: add a new base case for #T-UNIT; $unit$ is already a value so the conclusion is true;
  - *Substitution lemma*: add a new base case for #T-UNIT; $unit {x := N}$ is still $unit$ and $Gamma tack.r unit : Unit$.
]
