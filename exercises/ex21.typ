#import "../common.typ": *

// Note 11 ex 9
#exercise[
  Prove the Subject Reduction theorem by induction on the height of the derivation of the judgment $Gamma tack.r M : T$.
]
#solution[
  Basic cases:
  - (T-TRUE) then $M = mtrue$ and $mtrue arrow.r.not$
  - (T-FALSE) then $M = mfalse$ and $mfalse arrow.r.not$
  - (T-INT) then $M = n$ and $n arrow.r.not$
  - (T-VAR) then $M = x$ and $x arrow.r.not$
  Inductive cases, with height $k+1$:
  - (T-SUM) then $M = M_1 + M_2$, $Gamma tack.r M_i : Nat$ with height at most $k$ and $T = Nat$. By the progress theorem we distinguish three cases:
    - $exists M_1'. M_1 -> M_1'$, then by (SUM LEFT) $M' = M_1' + M_2$. By inductive hypothesis $Gamma tack.r M_1' : Nat$, thus by (T-SUM) $Gamma tack.r M_1' + M_2 : Nat$
    - $M_1 = v$, $exists M_2'. M_2 -> M_2'$. By the canonical form theorem $v = n$. Then by (SUM RIGHT) $M' = n + M_2'$. By inductive hypothesis $Gamma tack.r M_2' : Nat$, thus by (T-SUM) $Gamma tack.r n + M_2 : Nat$
    - $M_1 = v_1, M_2 = v_2$. By the canonical form theorem $v_1 = n_1$ and $v_2 = n_2$. Then by (SUM) $M' = n$ with $n = n_1 +_N n_2$, thus by (T-INT")) $Gamma tack.r n : Nat$
  - (T-IFTHENELSE) then $M = mif M_1 then M_2 melse M_3$, $Gamma tack.r M_1 : Bool$ and $Gamma tack.r M_{1,2}: T$. By progress theorem we distinguish two cases:
    - $M_1 = v$. Then by canonical form theorem we distinguish two cases:
      - $v = mtrue$, then by (IF-TRUE) $M -> M_1$ and $Gamma tack.r M_1 : T$
      - $v = mfalse$, then by (IF-FALSE) $M -> M_2$ and $Gamma tack.r M_2 : T$
    - $exists M_1'. M_1 -> M_1'$
]
