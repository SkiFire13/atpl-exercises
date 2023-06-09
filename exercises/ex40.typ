#import "../common.typ": *

// Note 13 ex 16
#exercise[
  Consider the following variant and rule (TYPE MATCH)

  #set text(size: 10pt)
  #align(center, box(prooftree(
    axiom($Gamma tack.r M : angle.l l_i : T_i #h(1pt) ^ (i in J) angle.r$),
    axiom($J subset.eq I$),
    axiom($forall i in J quad Gamma, x_i : T_i tack.r M_i : T$),
    rule(n: 3, label: "TYPE MATCH GEN 2",
        $Gamma tack.r M match { case l_i = x_i arrow.r.double M_i #h(1pt) ^ (i in I) } : T$)
  )))
  Prove that the safety theorem still holds or give a counterexample.
]
#solution[

  - *Inversion of typing*: We add the following case:
    - if $Gamma tack.r M match { case l_i = x_i arrow.r.double M_i #h(1pt) ^ (i in I) } : T$ then $exists T_1, ... T_j$ such that $Gamma tack.r angle.l l_i : T_i #h(1pt) ^ (i in J) angle.r$, $forall i in J quad Gamma, x_i : T_i tack.r M_i : T$.

  - *Canonical forms*: No new canonical form is needed.
  - *Progress theorem*: We add the following case:
    - (TYPE MATCH GEN 2): then $M = M' match { case l_i = x_i arrow.r.double M_i #h(1pt) ^ (i in I)}$ and by inversion lemma $exists T_1, ..., T_j$ such that $Gamma tack.r angle.l l_i : T_i #h(1pt) ^ (i in J) angle.r$, $forall i in J quad Gamma, x_i : T_i tack.r M_i : T$ all with height at most $k$.
    By inductive hypothesis on $Gamma tack.r M' : angle.l l_i : T_i #h(1pt) ^ (i in J) angle.r$ we can distinguish the following cases:
    - $M' arrow.r M''$ then by (RED MATCH) $M arrow M'' match { case l_i = x_i arrow.r.double M_i #h(1pt) ^ (i in J) }$
    - $M' = v$ then by canonical forms theorem $v = angle.l l_j = v_j angle.r$ and we can apply the rule (MATCH) $M' arrow M_j{x_j := v_j}$
  - *Substitution lemma*: we add the following case:
    - (TYPE MATCH GEN 2) then $M = M' match { case l_i = x_i arrow.r.double M_i #h(1pt) ^ (i in I)}$ and by inversion lemma $exists T_1, ..., T_j$ such that $Gamma tack.r angle.l l_i : T_i #h(1pt) ^ (i in J) angle.r$, $forall i in J quad Gamma, x_i : T_i tack.r M_i : T$ all with height at most $k$.
     We can apply the inductive hypothesis on all the premises and the rule (TYPE MATCH GEN 2) to obtain $Gamma tack.r M'{x := N} match { case l_i = x_i arrow.r.double M_i{x := N}} : T$, (note that we don't care bout the branches outside of $J$).
  - *Subject reduction*: we add the following cases:
    - (RED MATCH) then $M = M' match { case l_i = x_i arrow.r.double M_i #h(1pt) ^ (i in I)}$, $Gamma tack.r M : T$ and $M' arrow M''$ with height $k$, by inversion lemma $exists T_1, ..., T_j$ such that $Gamma tack.r M' : angle.l l_i : T_i #h(1pt) ^ (i in J) angle.r$, $forall i in J quad Gamma, x_i : T_i tack.r M_i : T$ and $Gamma tack.r M_f : T$ derivable. By inductive hypothesis $Gamma tack.r M'' angle.l l_i : T_i #h(1pt) ^ (i in J) angle.r$ and by (TYPE MATCH GEN 2) $Gamma tack.r M'' match { case l_i = x_i arrow.r.double M_i #h(1pt) ^ (i in I)} : T$
    - (MATCH) then $M = angle.l l_j = v_j angle.r match {case l_i = x_i arrow.r.double M_i #h(1pt) ^ (i in I)}$ and $j in J$. By inversion lemma $exists T_1, ..., T_j$ such that $Gamma tack.r angle.l l_j = v_j angle.r : angle.l l_i : T_i #h(1pt) ^ (i in J) angle.r$, $forall i in J quad Gamma, x_i : T_i tack.r M_i : T$ and $Gamma tack.r M_f : T$. By substitution lemma $Gamma tack.r M_j{x_j := v_j} : T$

]
