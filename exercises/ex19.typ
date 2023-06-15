#import "../common.typ": *

// Note 10 / Note 11 ex 7
#exercise[
  Prove that if $Gamma tack.r M: T$ is a derivable judgement, then $fv(M) subset.eq Dom(Gamma)$.
]
#solution[
  We prove this by structural induction on $M$:
  - $M = x$: by inversion lemma (6), $x: T in Gamma$, thus $fv(x) = {x} subset.eq Dom(Gamma)$
  - $M = n$: $fv(n) = emptyset subset.eq Dom(Gamma)$
  - $M = mtrue$: $fv(mtrue) = emptyset subset.eq Dom(Gamma)$
  - $M = mfalse$: $fv(mfalse) = emptyset subset.eq Dom(Gamma)$
  - $M = M_1 + M_2$: by inversion lemma (4) $Gamma tack.r M_1: Nat$ and $Gamma tack.r M_2: Nat$ are derivable. By inductive hypothesis $fv(M_1) subset.eq Dom(Gamma)$ and $fv(M_2) subset.eq Dom(Gamma)$, thus $fv(M) = fv(M_1) union fv(M_2) subset.eq Dom(Gamma)$
  - $M = mif M_1 then M_2 melse M_3$: by inversion lemma (5) $Gamma tack.r M_1: Bool$, $Gamma tack.r M_2: T$ and $Gamma tack.r M_3: T$ are derivable. By inductive hypothesis $fv(M_1) subset.eq Dom(Gamma)$, $fv(M_2) subset.eq Dom(Gamma)$ and $fv(M_3) subset.eq Dom(Gamma)$, thus $fv(M) = fv(M_1) union fv(M_2) union fv(M_3) subset.eq Dom(Gamma)$
  - $M = fn x: T_1. M'$: by inversion lemma (7) $exists T_2. Gamma, x: T_1 tack.r M': T_2$ is derivable. By inductive hypothesis $fv(M') subset.eq Dom(Gamma, x: T_1) = Dom(Gamma) union {x}$, thus $fv(M) = fv(M') without {x} subset.eq Dom(Gamma) = Dom(Gamma) union {x} without {x}$
  - $M = M_1 app M_2$: by inversion lemma (8) $exists T_1. Gamma tack.r M_1: T_1 -> T$ and $Gamma tack.r M_2: T_1$ are derivable. By inductive hypothesis $fv(M_1) subset.eq Dom(Gamma)$ and $fv(M_2) subset.eq Dom(Gamma)$, thus $fv(M) = fv(M_1) union fv(M_2) subset.eq Dom(Gamma)$
]
