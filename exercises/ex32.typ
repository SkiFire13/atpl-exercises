#import "../common.typ": *

// Note 12 ex 5
#exercise[
  Update the proofs of the theorems of progress, type preservation and the substitution lemma by considering the extended language with pair terms.
]
#solution[
  - *Inversion of typing*: add cases:
    - if $Gamma tack.r (M_1, M_2): T$ is derivable then $exists T_1, T_2.$ $T = T_1 * T_2$ and $forall i in {1,2}.$ $Gamma tack.r M_i : T_i$. Proof immediate since only (T-PAIR) can apply.
    - if $Gamma tack.r M.\_1 : T_1$ is derivable then $exists T_2.$ $Gamma tack.r M : T_1 * T_2$ derivable (and viceversa for $.\_2$). Proof immediate since only (T-PROJECT-1) can apply.
  - *Canonical forms theorem*: if $v$ is a value and $Gamma tack.r v : T_1 * T_2$ then $v = (v_1, v_2)$, proof immediate;
  - *Progress theorem*: add the following inductive cases:
    - (T-PAIR): then $M = (M_1, M_2)$ and $emptyset tack.r M_i : T_i$ with height at most $k$. By inductive hypothesis on $emptyset tack.r M_1 : T_1$:
      - $exists M_1'. M_1 -> M_1'$, then by (EVAL-PAIR-1) $(M_1, M_2) -> (M_1', M_2)$
      - $M_1 = v_1$ is a value. By inductive hypothesis on $emptyset tack.r M_2 : T_2$:
        - $exists M_2'. M_2 -> M_2'$, then by (EVAL-PAIR-2) $(v_1, M_2) -> (v_1, M_2')$
        - $M_2 = v_2$ is a value. Then $M = (v_1, v_2)$ is also a value.
    - (T-PROJECT-i): then $M = M'.\_i$ and $emptyset tack.r M' : T_1 * T_2$ with height $k$. By inductive hypothesis on $emptyset tack.r M' : T_1 * T_2$:
      - $exists M''. M' -> M''$, then by (PROJECT-i) $M'.\_i -> M''.\_i$
      - $M' = v$ is a value. Then by canonical forms theorem $v = (v_1, v_2)$. Thus by (PAIR-i) $M'.\_i = (v_1, v_2).\_i -> v_i$.
  - *Substitution theorem*: add the following inductive cases:
    - (T-PAIR): then $M = (M_1, M_2)$ and $Gamma, x: S tack.r M_i : T_i$ by height at most $k$. By inductive hypothesis $Gamma tack.r M_i{x := N}: T_i$ and thus by (T-PAIR) $Gamma tack.r M{x := N} : T_1 * T_2$
    - (T-PROJECT-i): then $M = M'.\_i$ and $Gamma, x: S tack.r M' : T_1 * T_2$ of height $k$. By inductive hypothesis $Gamma tack.r M' {x := N} : T_1 * T_2$, thus by (T-PROJECT-i) $Gamma tack.r M{x := N} : T_i$
  - *Type preservation theorem*: add the following cases:
    - (PAIR-i): then from hypothesis $Gamma tack.r (v_1, v_2).\_i : T_i$ and by inversion lemma $exists T_1, T_2.$ $Gamma tack.r v_i : T_i$, which was the goal.
    - (PROJECT-i): then from hypothesis $Gamma tack.r M.\_i : T_i$ and by inversion lemma $exists T_1, T_2.$ $Gamma tack.r M : T_1 * T_2$. By inductive hypothesis $Gamma tack.r M' : T_1 * T_2$. Thus by (T-PROJECT-i), $Gamma tack.r M'.\_i : T_i$
    - (EVAL-PAIR-i): then from hypothesis $Gamma tack.r (M_1, M_2) : T$. By inversion lemma $exists T_1, T_2.$ $T = T_1 * T_2$ and $Gamma tack.r M_i : T_i$. By inductive hypothesis $Gamma tack.r M_i' : T_i$, thus by (T-PAIR) $Gamma tack.r (M_1', M_2') : T_1 * T_2$
]
