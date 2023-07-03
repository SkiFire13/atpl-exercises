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
    Proof by induction on the height of the tree $Gamma tack.r M : T$ with two cases: one immediate and the other due to #SUBSUMPTION which is still true by inductive hypothesis.
  - *Canonical forms*: we add/change the following cases:
    - If $v$ is a value and $Gamma tack.r v : T_1 -> T_2$ then $v$ is $fn x: S_1. M$
    - If $v$ is a value and $Gamma tack.r v : { ell_i : T_i #h(1pt) ^ (i in 1..n) }$ then $v$ is ${ k_j = v_j #h(1pt) ^ (j in 1..m) }$ with ${ ell_i #h(1pt) ^ (i in 1..n) } subset.eq { k_j #h(1pt) ^ (j in 1..m) }$
    Proof by induction on the height of the tree $Gamma tack.r M : T$ with two cases: one immediate and the other due to #SUBSUMPTION which is still true by inductive hypothesis.
  - *Substitution lemma*: we add the following case:
    - #SUBSUMPTION: then $Gamma, x: S tack.r M : U$ derivable with heigth at most $k$ and $U <: T$. By inductive hypothesis $Gamma tack.r M {x := N} : U$ derivable. By #SUBSUMPTION $Gamma tack.r M {x := N}: T$ derivable.
  - *Progress theorem*: we add the following case:
    - #T-APP: then $M = M_1 M_2$, $Gamma tack.r M_1: T_2 -> T$ and $Gamma tack.r M_2 : T_2$ with height at most $k$. By inductive hypothesis we distinguish two cases:
      - $M_1 -> M_1'$, then by #APP-1 $M -> M_1' M_2$
      - $M_1 = v_1$. By inductive hypothesis we distinguish two cases:
        - $M_2 -> M_2'$ then by #APP-2 $M -> v_1 M_2'$
        - $M_2 = v_2$. Then by canonical form theorem $v_1 = fn x: S_1. M'$. By #BETA $M -> M' { x := v_2 }$
    - #T-SELECT: then $M = M'.ell_j$ and $emptyset tack.r M' : {ell_i : T_i #h(1pt) ^ (i in 1..n)}$ with height $k$ and $j in 1..n$. By inductive hypothesis we distinguish two cases:
      - $M' -> M''$, then by #EVAL-SELECT $M -> M''.ell_j$
      - $M'$ is a value. Then by canonical form theorem $M' = { k_j = v_j #h(1pt) ^ (j in 1..m) }$ and ${ ell_i #h(1pt) ^ (i in 1..n) } subset.eq { k_j #h(1pt) ^ (j in 1..m) }$, thus $ell_j in { k_j #h(1pt) ^ (j in 1..m) }$ and by #SELECT $M -> v_j$
    - #SUBSUMPTION: then $exists S.$ $emptyset tack.r M : S$ with height at most $k$. By inductive hypothesis either $M$ is a value or $M -> M'$
  - *Type preservation theorem*: We add/change the following cases:
    - #BETA: then $M = (fn x: S_1. M_1) app v -> M_1 { x := v }$. By inversion lemma $Gamma tack.r fn x: S_1. M_1 : S_1 -> T$ and $Gamma tack.r v : S_1$ derivable. By inversion lemma $exists T_1, T_2.$ $S_1 -> T = T_1 -> T_2$, $T_1 <: S_1$, $Gamma, x: S_1 tack.r M_1 : T_2$ derivable, thus $T = T_2$ and $Gamma, x: S_1 tack.r M_1 : T$. By substitution lemma $Gamma tack.r M_1 { x := v } : T$.
    - #SELECT: then $M = { ell_i = v_i #h(1pt) ^ (i in 1..n) }.ell_j -> v_j$ and $Gamma tack.r M : T_j$ derivable. By inversion lemma $exists m. j in 1..m$, $exists T_1..T_m.$ $Gamma tack.r { ell_i = v_i #h(1pt) ^ (i in 1..n) } : { ell_i : T_i #h(1pt) ^ (i in 1..m) }$ derivable. By inversion lemma $exists S_1..S_n.$ $forall i in 1..n. Gamma tack.r v_i : S_i$ and ${ell_i : S_i #h(1pt) ^ (i in 1..n)} <: {ell_i : T_i #h(1pt) ^ (i in 1..m)}$. By inversion of subtyping $forall i in m. S_i <: T_i$. Since $j in 1..m$, $Gamma tack.r S_j <: T_j$. By #SUBSUMPTION $Gamma tack.r v_j : T_j$.
    - #EVAL-SELECT: then $Gamma tack.r M.ell_j : T_j$, $M.ell_j -> M'.ell_j$ and $M -> M'$ derivable with heigth $k$. By inversion lemma $exists n. j in 1..n$, $exists T_1..T_n.$ $Gamma tack.r M : { ell_i : T_i #h(1pt) ^ (i in 1..n) }$ derivable. By inductive hypothesis $Gamma tack.r M' : { ell_i : T_i #h(1pt) ^ (i in 1..n) }$ derivable. Thus by #T-SELECT $Gamma tack.r M'.ell_j : T_j$ derivable.
    - #EVAL-RECORD: then $M = { ell_i = v_i #h(1pt) ^ (i in 1..j-1), ell_j = M_j, ell_k = M_k #h(1pt) ^ (k in j+1..n) }$, $Gamma tack.r M : T$ derivable and $M_j -> M_j'$ with height $k$. By inversion lemma $exists S_1..S_n. forall i in 1..n. Gamma tack.r M_i : S_i$ and ${ ell_i : S_i #h(1pt) ^ (i in 1..n) } <: T$. By inductive hypothesis $Gamma tack.r M_j' : S_j$, thus by #T-RECORD $Gamma tack.r M' : { ell_i : S_i #h(1pt) ^ (i in 1..n) }$. By #SUBSUMPTION $Gamma tack.r M' : T$.
  - *Safety theorem*: Immediate from progress theorem and subject reduction.
]
