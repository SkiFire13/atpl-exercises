#import "../common.typ": *

// Note 12 ex 8
#exercise[
  Prove the safety theorem for the language containing integers, Booleans, functions and records.
]
#solution[
  - *Inversion of typing*: see previous exercise.
  - *Canonical forms*: we add the following case:
    - if $v$ is a value and $emptyset tack.r v : { ell_i : T_i #h(1pt) ^ (i in 1..n) }$ is derivable then $v = { ell_i = v_i #h(1pt) ^ (i in 1..n) }$. Proof is immediate.
  - *Substitution lemma*: we add the following cases:
    - #T-RECORD: then $M = { ell_i = M_i #h(1pt) ^ (i in 1..n)}$, $T = { ell_i = T_i #h(1pt) ^ (i in 1..n) }$ and $forall i. Gamma, x: S tack.r M_i : T_i$ with height at most $k$. By inductive hypothesis $forall i. Gamma tack.r M_i {x := N} : T_i$. By #T-RECORD $Gamma tack.r { ell_i = M_i { x := N } #h(1pt) ^ (i in 1..n) } : { ell_i = T_i #h(1pt) ^ (i in 1..n) }$
    - #T-SELECT: then $M = M'.ell_j$, $Gamma, x: S tack.r M' : {ell_i : T_i #h(1pt) ^ (i in 1..n)}$ with height $k$, $T = T_j$ and $j in 1..n$. By inductive hypothesis $forall i. Gamma tack.r M' { x := N } : {ell_i : T_i #h(1pt) ^ (i in 1..n)}$. By #T-SELECT $Gamma tack.r M' { x := N } .ell_j : T_j$
  - *Progress theorem*: we add the following cases:
    - #T-RECORD: then $M = { ell_i = M_i #h(1pt) ^ (i in 1..n)}$ and $forall i. emptyset tack.r M_i : T_i$ with height at most $k$. By inductive hypothesis $M_i = v_i$ or $M_i -> M_i'$. We distinguish two cases:
      - $exists i. M_i -> M_i'$, let $i$ be the smallest index that satisfies this condition, thus $forall j < i. M_j = v_j$. Thus #EVAL-RECORD applies and $M -> M'$
      - $forall i. M_i = v_i$, then $M$ is also a value.
    - #T-SELECT: then $M = M'.ell_j$ and $emptyset tack.r M' : {ell_i : T_i #h(1pt) ^ (i in 1..n)}$ with height $k$ and $j in 1..n$. By inductive hypothesis we distinguish two cases:
      - $M' -> M''$, then by #EVAL-SELECT $M -> M''.ell_j$
      - $M'$ is a value. Then by canonical form theorem $M' = { ell_i = v_i #h(1pt) ^ (i in 1..n) }$, thus #SELECT applies and $M -> v_j$
  - *Subject reduction*: we add the following cases:
    - #SELECT: then $M = { ell_i = v_i #h(1pt) ^ (i in 1..n) }.ell_j -> v_j$ and $Gamma tack.r M : T_j$ derivable. By inversion lemma $exists T_1..T_n. forall i.$ $Gamma tack.r v_i : T_i$ derivable, thus $Gamma tack.r v_j : T_j$ derivable.
    - #EVAL-SELECT: then $M = M'.ell_j$, $Gamma tack.r M : T_j$ derivable and $M' -> M''$ with height $k$. By inversion lemma $exists n. j in 1..n$, $exists T_1..T_n.$ $Gamma tack.r M' : { ell_i : T_i #h(1pt) ^ (i in 1..n) }$ derivable. By inductive hypothesis $Gamma tack.r M'' : { ell_i : T_i #h(1pt) ^ (i in 1..n) }$, thus by #T-SELECT $Gamma tack.r M''.ell_j : T_j$
    - #EVAL-RECORD: then $M = { ell_i = v_i #h(1pt) ^ (i in 1..j-1), ell_j = M_j, ell_k = M_k #h(1pt) ^ (k in j+1..n) }$, $Gamma tack.r M : T$ derivable and $M_j -> M_j'$ with height $k$. By inversion lemma $exists T_1..T_n. forall i. Gamma tack.r M_i : T_i$. By inductive hypothesis $Gamma tack.r M_j' : T_j$, thus by #T-RECORD $Gamma tack.r M' : T$
  - *Safety theorem*: Immediate from progress theorem and subject reduction.
]
