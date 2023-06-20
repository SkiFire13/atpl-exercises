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
  - *Progress theorem*: we add the following case:
    - (SUBSUMPTION): then $exists S.$ $Gamma tack.r M : S$ with height at most $k$. By inductive hypothesis either $M$ is a value or $M -> M'$
  - *Type preservation theorem*: We add/change the following cases:
    - (BETA): then$(fn x: S_1. M) app v -> M {x := v}$. By hypothesis $Gamma tack.r (fn x: S_1. M) app v : T_2$ and by inversion lemma $Gamma tack.r v : S_1$ derivable, $Gamma tack.r fn x: S_1. M : S_1 -> T_2$. By inversion lemma $Gamma, x: S_1 tack.r M : T_2$. By substitution lemma $Gamma tack.r M { x:=v } : T_2$.
    - (APP 1): then $Gamma tack.r M app N : T_2$, $M app N -> M' app N$ and the premise is that $M -> M'$ with heigth $k$. By inversion lemma $Gamma tack.r M : T_1 -> T_2$ and $Gamma tack.r N : T_1$ derivable. By inductive hypothesis $Gamma tack.r M' : T_1 -> T_2$. By (T-APP) $Gamma tack.r M' N : T_2$
    - (APP 2): same as the previous case
    - (SELECT): then $M = { ell_i = v_i #h(1pt) ^ (i in 1..n) }.ell_j -> v_j$ and $Gamma tack.r M : T_j$ derivable. By inversion lemma $exists T_1..T_n$ s.t. $Gamma tack.r { ell_i = v_i #h(1pt) ^ (i in 1..n) } : { ell_i : T_i #h(1pt) ^ (i in 1..n) }$ derivable. By inversion lemma $Gamma tack.r v_j : T_j$.
    - (EVAL-SELECT): then $Gamma tack.r M.ell_j : T_j$, $M.ell_j -> M'.ell_j$ and $M -> M'$ derivable with heigth $k$. By inversion lemma $exists T_1..T_n.$ $Gamma tack.r M : { ell_i : T_i #h(1pt) ^ (i in 1..n) }$ derivable. By inductive hypothesis $Gamma tack.r M' : { ell_i : T_i #h(1pt) ^ (i in 1..n) }$ derivable. Thus by (T-SELECT) $Gamma tack.r M'.ell_j : T_j$ derivable.
    - (EVAL-RECORD): then $M = { ell_i = v_i #h(1pt) ^ (i in 1..j-1), ell_j = M_j, ell_k = M_k #h(1pt) ^ (k in j+1..n) }$, $Gamma tack.r M : T$ derivable and $M_j -> M_j'$ with height $k$. By inversion lemma $exists T_1..T_n. forall i. Gamma tack.r M_i : T_i$. By inductive hypothesis $Gamma tack.r M_j' : T_j$, thus by (T-RECORD) $Gamma tack.r M' : T$
  - *Safety theorem*: Immediate from progress theorem and subject reduction.
]
