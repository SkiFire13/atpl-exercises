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
  - (T-FUN) then $M = fn x. M'$ and $fn x. M' arrow.r.not$
  Inductive cases, with height $k+1$:
  - (T-SUM) then $M = M_1 + M_2$, $Gamma tack.r M_i : Nat$ with height at most $k$ and $T = Nat$. We distinguish 3 cases on $M -> M'$:
    - (SUM): thus $M_1 = n_1$, $M_2 = n_2$ and $M = n$ where $n = n_1 +_N n_2$. Thus by (T-INT) $Gamma tack.r n : Nat$
    - (SUM-LEFT): thus $M_1 -> M_1'$. By inductive hypothesis $Gamma tack.r M_1' : Nat$, thus by (T-SUM) $Gamma tack.r M_1' + M_2 : Nat$
    - (SUM-RIGHT): thus $M_2 -> M_2'$. By inductive hypothesis $Gamma tack.r M_2' : Nat$. Thus by (T-SUM) $Gamma tack.r M_1 + M_2' : Nat$
  - (T-IFTHENELSE) then $M = mif M_1 then M_2 melse M_3$, $Gamma tack.r M_1 : Bool$ and $Gamma tack.r M_{2,3}: T$ with height at most $k$. We distinguish 3 cases on $M -> M'$:
    - (IF-TRUE): thus $M -> M_2$ and we already know $Gamma tack.r M_2 : T$
    - (IF-FALSE): thus $M -> M_3$ and we already know $Gamma tack.r M_3 : T$
    - (IF): thus $M_1 -> M_1'$. By inductive hypothesis $Gamma tack.r M_1' : Bool$ and thus by (T-IFTHENELSE) $Gamma tack.r mif M_1' then M_2 melse M_3$
  - (T-APP) then $M = M_1 app M_2$, $exists T'. Gamma tack.r M_1 : T' -> T$ and $Gamma tack.r M_2 : T'$ with height at most $k$. We distinguish 3 cases on $M -> M'$:
    - (APP 1): thus $M_1 -> M_1'$. By inductive hypothesis $Gamma tack.r M_1' : T' -> T$ and thus by (T-APP) $Gamma tack.r M_1' app M_2 : T$
    - (APP 2): thus $M_2 -> M_2'$. By inductive hypothesis $Gamma tack.r M_2' : T'$ and thus by (T-APP) $Gamma tack.r M_1 app M_2' : T$
    - (BETA): thus $M_1 = fn x. M'$, $Gamma, x : T' tack.r M' : T$, $M_2 = v$ and $M -> M'{x := v}$. By substitution lemma $Gamma tack.r M' {x := v} : T$
]
