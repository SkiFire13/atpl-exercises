#import "../common.typ": *

#let TYPE-MATCH-GEN-2 = smallcaps("(Type-Match-Gen-2)")

// Note 13 ex 16
#exercise[
  Consider the following variant and rule #smallcaps("(Type Match)")

  #align(center, text(size: 10pt, box(prooftree(
    axiom($Gamma tack.r M : angle.l ell_i : T_i #h(1pt) ^ (i in J) angle.r$),
    axiom($J subset.eq I$),
    axiom($forall i in J quad Gamma, x_i : T_i tack.r M_i : T$),
    rule(n: 3, label: TYPE-MATCH-GEN-2,
        $Gamma tack.r M match { case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in I) } : T$)
  ))))
  Prove that the safety theorem still holds or give a counterexample.
]
#solution[

  - *Inversion of typing*: We add the following case:
    - if $Gamma tack.r M match { case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in I) } : T$ then $exists J subset.eq I. forall j in J. exists T_j.$ $Gamma tack.r M : angle.l ell_i : T_i #h(1pt) ^ (i in J) angle.r$ and $forall i in J. Gamma, x_i : T_i tack.r M_i : T$.
  - *Canonical forms*: No new canonical form is needed.
  - *Progress theorem*: We add the following case:
    - #TYPE-MATCH-GEN-2: then $M = M' match { case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in I)}$ and $exists J subset.eq I. forall j in J. exists T_j.$ $emptyset tack.r M' : angle.l ell_i : T_i #h(1pt) ^ (i in J) angle.r$ and $forall i in J. emptyset, x_i : T_i tack.r M_i : T$ all with height $<= k$.
      By inductive hypothesis on $emptyset tack.r M' : angle.l ell_i : T_i #h(1pt) ^ (i in J) angle.r$ we can distinguish the following cases:
      - $M' arrow.r M''$ then by #RED-MATCH $M arrow M'' match { case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in J) }$
      - $M' = v$ then by canonical forms theorem $exists j in J.$ $v = angle.l ell_j = v_j angle.r$ and by #MATCH $M arrow M_j {x_j := v_j}$
  - *Permutation lemma*: Same as before;
  - *Substitution lemma*: We add the following case:
    - #TYPE-MATCH-GEN-2 then $M = M' match { case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in I)}$. By $alpha$-equivalence we assume $x_i != x$. By hypothesis $exists J subset.eq I. exists T_1, ..., T_j$ such that $Gamma, x: S tack.r M' : angle.l ell_i : T_i #h(1pt) ^ (i in J) angle.r$, $forall i in J. Gamma, x: S, x_i : T_i tack.r M_i : T$ all with height $<= k$. By permutation lemma $forall i in J. Gamma, x_i: T_i, x: S tack.r M_i: T$ with the same height of $<= k$. We can apply the inductive hypothesis to get $Gamma tack.r M' {x := N} : angle.l ell_i: T_i #h(1pt) ^ (i in J) angle.r$ and $forall i in J. Gamma, x_i: T_i tack.r M_i {x := N} : T$. Then we can apply the rule #TYPE-MATCH-GEN-2 to obtain $Gamma tack.r M'{x := N} match { case ell_i = x_i arrow.r.double M_i {x := N} #h(1pt) ^ (i in I)} : T$
  - *Subject reduction*: We add the following cases:
    - #RED-MATCH then $M = M' match { case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in I)}$, $Gamma tack.r M : T$ and $M' arrow M''$ with height $k$, by inversion lemma $exists J subset.eq I. forall j in J. exists T_j.$ $Gamma tack.r M' : angle.l ell_i : T_i #h(1pt) ^ (i in J) angle.r$ and $forall i in J. Gamma, x_i : T_i tack.r M_i : T$ derivable. By inductive hypothesis $Gamma tack.r M'' : angle.l ell_i : T_i #h(1pt) ^ (i in J) angle.r$ and by #TYPE-MATCH-GEN-2 $Gamma tack.r M'' match { case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in I)} : T$
    - #MATCH then $M = angle.l ell_j = v_j angle.r match {case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in I)}$, $j in I$ and $M -> M_j {x_j := v_j}$. By inversion lemma $exists J subset.eq I. forall j in J. exists T_j$ such that $Gamma tack.r angle.l ell_j = v_j angle.r : angle.l ell_i : T_i #h(1pt) ^ (i in J) angle.r$ and $forall i in J. Gamma, x_i : T_i tack.r M_i : T$. By inversion lemma $exists K. exists T_1, ..., T_k.$ $j in K$ and $angle.l ell_i : T_i #h(1pt) ^ (i in J) angle.r = angle.l ell_i : T_i #h(1pt) ^ (i in K) angle.r$. Thus $J = K$ and so $j in J$. Thus $Gamma, x_j: T_j tack.r M_j : T$ and by substitution lemma $Gamma tack.r M_j {x_j := v_j} : T$
]
