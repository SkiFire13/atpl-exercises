#import "../common.typ": *

// Note 10 / Note 11 ex 8
#exercise[
  Think of a possible Strengthening Lemma which, in contrast to the Weakening Lemma, strengthens the contextual assumptions.
]
#solution[
  A possible Strengthening Lemma could be: \
  If $Gamma, x: T_1 tack.r M: T$ is a derivable judgement and $x in.not fv(M)$ then $Gamma tack.r M: T$ is derivable with a proof tree of the same height.
]


/*Leila version
Note 10 / Note 11 ex 8

#solution[
   If $Gamma, x: T_1 tack.r M: T$ is a derivable judgement and $x in.not fv(M)$ then $Gamma tack.r M: T$ is derivable with a proof tree of the same height. \
   We prove this by structural induction on the height of the judgement $Gamma, x: T_1 tack.r M: T$:
  - Base cases:
      - #T-TRUE: $Gamma, x: T_1 tack.r mtrue: Bool$ derivable and $x in.not fv(mtrue) = emptyset$, then $Gamma tack.r mtrue: Bool$ derivable, and so #T-TRUE applies;
      - #T-FALSE: $Gamma, x: T_1 tack.r mfalse: Bool$ derivable and $x in.not fv(mfalse) = emptyset$, then $Gamma tack.r mfalse: Bool$ derivable, and so #T-FALSE applies;
      - #T-INT: $Gamma, x: T_1 tack.r n: Nat$ derivable and $x in.not fv(n) = emptyset$, then $Gamma tack.r mtrue: Nat$ derivable, and so #T-INT applies;
      - #T-VAR: $Gamma, x: T_1 tack.r y: T$ derivable and $x in.not fv(y) = {y}$, then $x eq.not y$ and $y in Dom(Gamma) subset.eq Dom(Gamma "," x: T_1)$. Hence $Gamma tack.r y: T$ derivable, and so #T-VAR applies;
 - Inductive cases (height $k+1$):
    - #T-SUM: then $M = M_1 + M_2$, and $Gamma, x: T_1 tack.r M: T$ derivable judgment of height k and $x in.not fv(M) = fv(M_1) union fv(M_2)$. By inversion lemma, $Gamma, x: T_1 tack.r M_1: Nat$ and $Gamma, x: T_1 tack.r M_2: Nat$ are derivable. Hence, #T-SUM applies and $Gamma tack.r M: T$ derivable; 
    - #T-IF: then $M = mif M_1 then M_2 melse M_3$, and $Gamma, x: T_1 tack.r M: T$ derivable judgment of height k and $x in.not fv(M) = fv(M_1) union fv(M_2) union fv(M_3)$. By inversion lemma, $Gamma, x: T_1 tack.r M_1: Bool$, $Gamma, x: T_1 tack.r M_2: T$ and $Gamma, x: T_1 tack.r M_3: T$ are derivable. Hence, #T-IF applies and $Gamma tack.r M: T$ derivable; 
    - #T-FUN: then $M = fn y : T_1. M_1 $ and $Gamma, x : T' tack.r M : T$ derivable and $x in.not fv(M) = fv(M_1)\{x}$ then $x in.not  fv(M_1)$ and by Inverson Lemma $exists T_2 s.t T = T_1 -> T_1$ and $Gamma, x : T', y : T_1 tack.r M_1 : T_2$ derivable. Since the derivation tree has height $k$ applying the inductive hypothesis $Gamma, y : T_1 tack.r M_1 : T_2$ derivable. Thus #T-FUN applies and $Gamma tack.r M : T$ derivable. If $y = x$ we can use $alpha-$equivalence to obtain an equivalent term without the $y : fn y : T_1. M_1 =_alpha fn z : T_1 . M_1 {y:=z}$, with $z in.not Dom(Gamma,x : T')$, thus the proof then follows same steps.
    - #T-APP: then $M = M_1 M_2$ and $Gamma, x : T' tack.r M : T$ derivable and $x in.not fv(M) = fv(M_1) union fv(M_2)$, then $x in.not fv(M_1)$ and $x in.not fv(M_1)$. By Inversion Lemma $exists T_1 s.t Gamma, x : T' tack.r M_1 : T_1 -> T$ and $Gamma, x : T' tack.r M_2 : T_1$ are derivable. Since the derivation trees have height $k$ applying the inductive hypothesis we obtain that $Gamma tack.r M_1 : T_1->T$ and $M_2 : T$ derivable. Hence #T-APP applies and $Gamma tack.r M : T$ derivable.
]*/
