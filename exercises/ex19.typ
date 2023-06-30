#import "../common.typ": *

// Note 10 / Note 11 ex 7
#exercise[
  Prove that if $Gamma tack.r M: T$ is a derivable judgement, then $fv(M) subset.eq Dom(Gamma)$.
]
#solution[
  We prove this by structural induction on the height of the judgement $Gamma tack.r M: T$:
  - Base cases:
    - (T-VAR): then $M = x$ and $x: T in Gamma$, thus $fv(x) = {x} subset.eq Dom(Gamma)$;
    - (T-NAT): then $M = n$ and $fv(n) = emptyset subset.eq Dom(Gamma)$;
    - (T-TRUE): then $M = mtrue$ and $fv(mtrue) = emptyset subset.eq Dom(Gamma)$;
    - (T-FALSE): then $M = mfalse$ and $fv(mfalse) = emptyset subset.eq Dom(Gamma)$.
  - Inductive cases (height $k+1$):
    - (T-SUM): then $M = M_1 + M_2$ and $Gamma tack.r M_1: Nat$ and $Gamma tack.r M_2: Nat$ derivable with height at most $k$. By inductive hypothesis $fv(M_1) subset.eq Dom(Gamma)$ and $fv(M_2) subset.eq Dom(Gamma)$, thus $fv(M) = fv(M_1) union fv(M_2) subset.eq Dom(Gamma)$;
    - (T-IF): then $M = mif M_1 then M_2 melse M_3$ and $Gamma tack.r M_1: Bool$, $Gamma tack.r M_2: T$ and $Gamma tack.r M_3: T$ derivable with height at most $k$. By inductive hypothesis $fv(M_1) subset.eq Dom(Gamma)$, $fv(M_2) subset.eq Dom(Gamma)$ and $fv(M_3) subset.eq Dom(Gamma)$, thus $fv(M) = fv(M_1) union fv(M_2) union fv(M_3) subset.eq Dom(Gamma)$;
    - (T-FUN): then $M = fn x: T_1. M_1$, $T = T_1 -> T_2$ and $Gamma, x: T_1 tack.r M_1: T_2$ derivable with height $k$. By inductive hypothesis $fv(M_1) subset.eq Dom(Gamma "," x: T_1)$, thus $fv(M) = fv(M_1) without {x} subset.eq Dom(Gamma "," x: T_1) without {x} = Dom(Gamma)$;
    - (T-APP): then $M = M_1 app M_2$ and $Gamma tack.r M_1: T_2 -> T$ and $Gamma tack.r M_2: T_2$ are derivable with height at most $k$. By inductive hypothesis $fv(M_1) subset.eq Dom(Gamma)$ and $fv(M_2) subset.eq Dom(Gamma)$, thus $fv(M) = fv(M_1) union fv(M_2) subset.eq Dom(Gamma)$.
]
