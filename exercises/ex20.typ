#import "../common.typ": *

// Note 10 / Note 11 ex 8
#exercise[
  Think of a possible Strengthening Lemma which, in contrast to the Weakening Lemma, strengthens the contextual assumptions.
]
#solution[
  A possible Strengthening Lemma could be: \
  If $Gamma, x: T_1 tack.r M: T$ is a derivable judgement and $x in.not fv(M)$ then $Gamma tack.r M: T$ is derivable with a proof tree of the same height.
]

#solution[
   If $Gamma, x: T_1 tack.r M: T$ is a derivable judgement and $x in.not fv(M)$ then $Gamma tack.r M: T$ is derivable with a proof tree of the same height. \
   We prove this by structural induction on the height of the judgement $Gamma, x: T_1 tack.r M: T$:
  - Base cases:
      - #T-TRUE: $Gamma, x: T_1 tack.r mtrue: Bool$ derivable and $x in.not fv(mtrue) = emptyset$, #T-TRUE applies and then $Gamma tack.r mtrue: Bool$ derivable;
      - #T-FALSE: $Gamma, x: T_1 tack.r mfalse: Bool$ derivable and $x in.not fv(mfalse) = emptyset$, #T-FALSE applies and then $Gamma tack.r mfalse: Bool$ derivable;
      - #T-INT: $Gamma, x: T_1 tack.r n: Nat$ derivable and $x in.not fv(n) = emptyset$, #T-INT applies and then $Gamma tack.r mtrue: Nat$ derivable;
      - #T-VAR: $Gamma, x: T_1 tack.r y: T$ derivable and $x in.not fv(y) = {y}$, then $x eq.not y$ and $y in Dom(Gamma) subset.eq Dom(Gamma "," x: T_1)$. Hence #T-VAR applies and then $Gamma tack.r y: T$ derivable;
 - Inductive cases (height $k+1$):
    - #T-SUM: then $M = M_1 + M_2$, and $Gamma, x: T_1 tack.r M: T$ derivable judgment of height $<= k$ and $x in.not fv(M) = fv(M_1) union fv(M_2)$ and in particular $x in.not fv(M_1)$ and $x in.not fv(M_2)$. From the validity of premises of #T-SUM, $Gamma, x: T_1 tack.r M_1: Nat$ and $Gamma, x: T_1 tack.r M_2: Nat$ are derivable with a derivation tree of height k and then by inductive hypotesis follows that $Gamma, x : T_1 tack.r M_1 : Nat$ and $Gamma, x : T_1 tack.r M_2: Nat$ are derivable. Hence, #T-SUM applies and $Gamma tack.r M: T$ is derivable; 
    - #T-IF: then $M = mif M_1 then M_2 melse M_3$, and $Gamma, x: T_1 tack.r M: T$ derivable judgment of height $<=k$ and $x in.not fv(M) = fv(M_1) union fv(M_2) union fv(M_3)$. In particular $x in.not fv(M_1)$ and $x in.not fv(M_2)$ and $x in.not fv(M_3)$. From the validity of premises of #T-IF, $Gamma, x: T_1 tack.r M_1: Bool$, $Gamma, x: T_1 tack.r M_2: T$ and $Gamma, x: T_1 tack.r M_3: T$ are derivable with a derivation tree of height k and then by inductive hypotesis follows that $Gamma tack.r M_1 : Bool$ and $Gamma tack.r M_2 : T$ and $Gamma tack.r M_3 : T$ Hence, #T-IF applies and $Gamma tack.r M: T$ is  derivable; 
    - #T-FUN: then $M = fn y : T_1. M_1 $ and $Gamma, x : T' tack.r M : T$ derivable and $x in.not fv(M) = fv(M_1) without {y}$ and then $x in.not fv(M_1)$. By $alpha$-equivalence we can assume $x != y$. From the validity of premises of #T-FUN $exists T_2$ s.t $T = T_1 -> T_2$ and $Gamma, x : T', y : T_1 tack.r M_1 : T_2$ derivable, and by permutation lemma also $Gamma, y : T_1,  x : T' tack.r M_1 : T_2$ is derivable. Since the derivation tree has height $<= k$ applying the inductive hypothesis $Gamma, y : T_1 tack.r M_1 : T_2$ derivable. Thus #T-FUN applies and $Gamma tack.r M : T$ derivable.
    - #T-APP: then $M = M_1  M_2$ and $Gamma, x : T' tack.r M : T$ derivable and $x in.not fv(M) = fv(M_1) union fv(M_2)$, then $x in.not fv(M_1)$ and $x in.not fv(M_1)$. From the validity of premises of (T-APP), $exists T_1 s.t Gamma, x : T' tack.r M_1 : T_1 -> T$ and $Gamma, x : T' tack.r M_2 : T_1$ are derivable. Since the derivation trees have height $<= k$ applying the inductive hypothesis we obtain that $Gamma tack.r M_1 : T_1->T$ and $M_2 : T$ derivable. Hence #T-APP applies and $Gamma tack.r M : T$ derivable.
]

 