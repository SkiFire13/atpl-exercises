#import "../common.typ": *

// Note 13 ex 14
#exercise[
  Define inversion lemmas for the extended language with variant types. Prove the safety theorem for the new language.
]
#solution[
  - *Inversion of typing*: we add the following cases:
    - if $Gamma tack.r angle.l ell_j = M angle.r : T$ is derivable then $exists n.$ $j in 1..n$, $exists T_1...T_n.$ $T = angle.l ell_i: T_i #h(1pt) ^ (i in 1..n) angle.r$ and $Gamma tack.r M : T_j$ derivable;
    - if $Gamma tack.r M match { case ell_i = x_i => M_i #h(1pt) ^ (i in 1..n) } : T$ is derivable then $exists T_1..T_n. forall i in 1..n. Gamma, x_i: T_i tack.r M_i : T$ and $Gamma tack.r M : angle.l ell_i : T_i #h(1pt) ^ (i in 1..n) angle.r$ derivable.
  - *Canonical forms*: we add the following cases:
    - if $v$ is a value and $Gamma tack.r v : angle.l ell_i : T_i #h(1pt) ^ (i in 1..n) angle.r$ then $exists j in 1..n.$ $v = angle.l ell_j = v_j angle.r$
  - *Substitution lemma*: we add the following cases:
    - #T-VARIANT: then $M = angle.l ell_j = M_j angle.r$, $T = angle.l ell_i : T_i #h(1pt) ^ (i in 1..n) angle.r$ and $Gamma, x: S tack.r M_j : T_j$ derivable of height $k$. By inductive hypothesis $Gamma tack.r M_j { x := N } : T_j$. By #T-VARIANT $Gamma tack.r angle.l ell_j = M_j { x := N } angle.r: angle.l ell_i : T_i #h(1pt) ^ (i in 1..n) angle.r$
    - #T-MATCH: then $M = M' match { case ell_i = x_i => M_i #h(1pt) ^ (i in 1..n) }$ and $exists T_1..T_n.$ $Gamma, x: S tack.r M' : angle.l ell_i : T_i #h(1pt) ^ (i in 1..n) angle.r$, $forall i. Gamma, x: S, x_i: T_i tack.r M_i : T$ derivable with height $<= k$. By permutation lemma $forall i. Gamma, x_i: T_i, x: S tack.r M_i : T$ with the same height of $<= k$. By inductive hypothesis $Gamma tack.r M' { x := N } : angle.l ell_i : T_i #h(1pt) ^ (i in 1..n) angle.r$ and $forall i. Gamma, x_i : T_i tack.r M_i { x := N } : T$. By #T-MATCH $Gamma tack.r M' { x := N } match { case ell_i = x_i => M_i { x := N } #h(1pt) ^ (i in 1..n) } : T$
  - *Progress theorem*: we add the following cases:
    - #T-VARIANT: then $M = angle.l ell_j = M_j angle.r$ and $emptyset tack.r M_j : T_j$ derivable of height $k$. By inductive hypothesis we distinguish two cases:
      - $M_j = v_j$ is a value, then $M = angle.l ell_j = v_j angle.r$ is also a value;
      - $M_j -> M_j'$, then by #VARIANT $M -> angle.l ell_j = M_j' angle.r$
    - #T-MATCH: then $M = M' match { case ell_i = x_i => M_i #h(1pt) ^ (i in 1..n) }$ and $exists T_1..T_n.$ $emptyset tack.r M' : angle.l ell_i : T_i #h(1pt) ^ (i in 1..n) angle.r$, $forall i. emptyset, x_i: T_i tack.r M_i : T$ derivable with height $<= k$. By inductive hypothesis on $M'$ we distinguish two cases:
      - $M' -> M''$, then by #RED-MATCH $M -> M'' match { case ell_i = x_i => M_i #h(1pt) ^ (i in 1..n) }$
      - $M' = v$, then by canonical forms theorem $v = angle.l ell_j = v_j angle.r$ and by #MATCH $M -> M_j {x_j := v_j}$
  - *Subject reduction*: we add the following cases:
    - #MATCH: then $M = angle.l ell_j = v_j angle.r match { case ell_i = x_i => M_i #h(1pt) ^ (i in 1..n) }$ and $Gamma tack.r M : T$ derivable. By inversion lemma $exists T_1..T_n.$ $forall i. Gamma, x_i : T_i tack.r M_i : T$ and $Gamma tack.r angle.l ell_j = v_j angle.r : angle.l ell_i : T_i #h(1pt) ^ (i in 1..n)angle.r$ derivable. By inversion lemma $exists m. j in 1..m$, $exists S_1, ..., S_m.$ $Gamma tack.r v_j : S_j$ derivable and $angle.l ell_i : T_i #h(1pt) ^ (i in 1..n) angle.r = angle.l ell_i : S_i #h(1pt) ^ (i in 1..m) angle.r$. Thus $n = m$ and $forall i. T_i = S_i$ and $Gamma tack.r v_j : T_j$ derivable. By substitution lemma $Gamma tack.r M_j {x_j := v_j} : T$
    - #RED-MATCH: then $M = M' match { case ell_i = x_i => M_i #h(1pt) ^ (i in 1..n) }$, $Gamma tack.r M : T$ derivable and $M' -> M''$ derivable with height $k$. By inversion lemma $exists T_1..T_n.$ $Gamma tack.r M' : angle.l ell_i : T_i #h(1pt) ^ (i in 1..n) angle.r$ and $forall i. Gamma, x_i : T_i tack.r M_i : T$ derivable. By inductive hypothesis $Gamma tack.r M'' : angle.l ell_i : T_i #h(1pt) ^ (i in 1..n) angle.r$ and by #T-MATCH $M'' match { case ell_i = x_i => M_i #h(1pt) ^ (i in 1..n) } : T$
    - #VARIANT: then $M = angle.l ell_j = M_j angle.r$, $Gamma tack.r M : T$ derivable and $M_j -> M_j'$ derivable with height $k$. By inversion lemma $exists n. j in 1..n$, $exists T_1..T_n.$ $Gamma tack.r M_j : T_j$ and $T = angle.l ell_i : T_i #h(1pt) ^ (i in 1..n) angle.r$. By inductive hypothesis $Gamma tack.r M_j' : T_j$ derivable. By #T-VARIANT $Gamma tack.r angle.l ell_j = M_j' angle.r : T$ derivable.
]
