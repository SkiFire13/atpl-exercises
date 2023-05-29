#import "../common.typ": *

// Note 11 ex 10
#exercise[
  Is the opposite of subject reduction true? i.e. If $Gamma tack.r M' : T$ and $M -> M'$, then $Gamma tack.r M : T$ (this is called subject expansion). Either prove it or show a counter-example.
]
#solution[
  This is not true. For example consider $M = mif mtrue then 0 melse mfalse$ and $M -> M' = 0$ by (IF-TRUE). $Gamma tack.r 0: Nat$ is derivable by (NAT). Assume the opposite of the subject reduction true, thus $Gamma tack.r M: Nat$. By inversion lemma (5) $Gamma tack.r mfalse: Nat$ is derivable. But by inversion lemma (2) $Nat = Bool$ which is a contradiction, thus the assumption is false.
]
