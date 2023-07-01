#import "../common.typ": *

// Note 15 ex 8
#exercise[
  *(Important)* Prove the theorems of type preservation, progress and safety for the base language extended with records and subtyping. Observe how the proof changes due to the presence of substyping.
]
#solution[
  - *Inversion lemma*: we add/change the following cases:
    - If $Gamma tack.r x : T$ then $exists S$ such that $x : S in Gamma$ and $S <: T$;
    - If $Gamma tack.r fn x: S_1. M : T$ is derivable, then $exists T_1, T_2$ such that $T = T_1 -> T_2$, with $T_1 <: S_1$ and $Gamma, x: S_1 tack.r M : T_2$ is derivable;
    - If $Gamma tack.r { ell_i = M_i #h(1pt) ^ (i in 1..n) } : T$ is derivable then $exists S_1, ...S_n$ such that $Gamma tack.r M_i : S_i$ is derivable for each $i in 1..n$ and ${ ell_i : S_i #h(1pt) ^ (i in 1..n) } <: T$.
    Proof by induction on the height of the tree $Gamma tack.r M : T$ with two cases: one immediate and the other due to (SUBSUMPTION) which is still true by inductive hypothesis.
  - *Canonical forms*: we add/change the following cases:
    - If $v$ is a value and $Gamma tack.r v : T_1 -> T_2$ then $v$ is $fn x: S_1. M$
    - If $v$ is a value and $Gamma tack.r v : { ell_i : T_i #h(1pt) ^ (i in 1..n) }$ then $v$ is ${ k_j = v_j #h(1pt) ^ (j in 1..m) }$ with ${ ell_i #h(1pt) ^ (i in 1..n) } subset.eq { k_j #h(1pt) ^ (j in 1..m) }$
    Proof by induction on the height of the tree $Gamma tack.r M : T$ with two cases: one immediate and the other due to (SUBSUMPTION) which is still true by inductive hypothesis.
  - *Substitution lemma*: we add the following case:
    - (SUBSUMPTION): then $Gamma, x: S tack.r M : U$ derivable with heigth at most $k$ and $U <: T$. By inductive hypothesis $Gamma tack.r M {x := N} : U$ derivable. By (SUBSUMPTION) $Gamma tack.r M {x := N}: T$ derivable.
    - (T-RECORD) then $M = {ell_i = M_i^(#h(1pt)i in 1..n)}$ by inversion lemma $exists S_1, ...S_n$ such that $Gamma, x: S tack.r M_i : S_i$ is derivable with height $<=k$ for each $i in 1..n$ and ${ ell_i : S_i #h(1pt) ^ (i in 1..n) } <: T$. We can apply the inductive hypothesis on all of those judgements and obtain $Gamma tack.r M_i {x := N} : S_i$. By applying the rule (T-Record) we obtain $Gamma tack.r M{x := N} : {ell_i : S_i^(#h(1pt) i in 1..n)}$ and by (SUBSUMPTION) $Gamma tack.r M{x := N} : T$.
  - *Progress theorem*: we add the following case:
    - (SUBSUMPTION): then $exists S.$ $emptyset tack.r M : S$ with height at most $k$. By inductive hypothesis either $M$ is a value or $M -> M'$
    - (T-RECORD) then $M = {ell_i : M_i^(#h(1pt) i in 1..n)}$ then by inversion lemma $exists S_1, ..., S_n$ such that $emptyset tack.r M_i : S_i$ is derivable all with height $<= k$, we can apply the inductive hypothesis on all of them and distringuish the following 2 cases:
      - $exists i in 1...n$ such that $M_i -> M_i'$ pick $i'$ the smallest satisfing such condition
        thus the rule (EVAL-RECORD) can by applied.
      - $forall i in 1...n$ $M_i = v_i$ then $M$ is also a value.
  - *Type preservation theorem*: We add/change the following cases:
    - (BETA): then $M = (fn x: S_1. M_1) app v -> M_1 { x := v }$. By inversion lemma $Gamma tack.r fn x: S_1. M_1 : S_1 -> T$ derivable and $Gamma tack.r v : S_1$ derivable. By inversion lemma $exists T_1, T_2.$ $T_1 <: S_1$, $Gamma, x: S_1 tack.r M_1 : T_2$ derivable and $S_1 -> T = T_1 -> T_2$, thus $T = T_2$ and $Gamma, x: S_1 tack.r M_1 : T$. By substitution lemma $Gamma tack.r M_1 { x := v } : T$.
    - (SELECT): then $M = { ell_i = v_i #h(1pt) ^ (i in 1..n) }.ell_j -> v_j$ and $Gamma tack.r M : T_j$ derivable. By inversion lemma $exists T_1..T_n$ s.t. $Gamma tack.r { ell_i = v_i #h(1pt) ^ (i in 1..n) } : { ell_i : T_i #h(1pt) ^ (i in 1..n) }$ derivable. By inversion lemma $exists S_1..S_n.$ $Gamma tack.r v_i : S_i$ and ${ell_i : S_i #h(1pt) ^ (i in 1..n)} <: {ell_i : T_i #h(1pt) ^ (i in 1..n)}$. By inversion of subtyping $forall i. S_i <: T_i$. By (SUBSUMPTION) $Gamma tack.r v_j : T_j$.
    - (EVAL-SELECT): then $Gamma tack.r M.ell_j : T_j$, $M.ell_j -> M'.ell_j$ and $M -> M'$ derivable with heigth $k$. By inversion lemma $exists T_1..T_n.$ $Gamma tack.r M : { ell_i : T_i #h(1pt) ^ (i in 1..n) }$ derivable. By inductive hypothesis $Gamma tack.r M' : { ell_i : T_i #h(1pt) ^ (i in 1..n) }$ derivable. Thus by (T-SELECT) $Gamma tack.r M'.ell_j : T_j$ derivable.
    - (EVAL-RECORD): then $M = { ell_i = v_i #h(1pt) ^ (i in 1..j-1), ell_j = M_j, ell_k = M_k #h(1pt) ^ (k in j+1..n) }$, $Gamma tack.r M : T$ derivable and $M_j -> M_j'$ with height $k$. By inversion lemma $exists T_1..T_n. forall i. Gamma tack.r M_i : T_i$. By inductive hypothesis $Gamma tack.r M_j' : T_j$, thus by (T-RECORD) $Gamma tack.r M' : T$
  - *Safety theorem*: Immediate from progress theorem and subject reduction.
]
