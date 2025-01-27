#import "../common.typ": *

#let T-MATCH-DEFAULT = smallcaps("(T-Match-Default)")
#let RED-MATCH-DEFAULT = smallcaps("(Red-Match-Default)")
#let MATCH-DEFAULT = smallcaps("(Match-Default)")
#let MATCH-DEFAULT-CASE = smallcaps("(Match-Default-Case)")

// Note 13 ex 18
#exercise[
  Study a variant of this language that admits a default case in the pattern matching operation.
]
#solution[
  We add to the grammar of the language a new term:
  $M ::= ... | M  match { case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in 1..n), default M_f }$

  The following transition rules:
  #align(center, text(size: 7.5pt)[
    #box(prooftree(
      axiom($M arrow.r M'$),
      rule(label: RED-MATCH-DEFAULT, $M match { case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in 1..n), default M_f } arrow.r M' match { case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in 1..n), default M_f }$)
    ))

    #box(prooftree(
      axiom(""),
      rule(label: (left: MATCH-DEFAULT-CASE, right: $j in 1..n$), $angle.l ell_j = v_j angle.r match { case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in 1..n), default M_f } arrow.r M_j {x_j := v_j}$)
    ))

    #box(prooftree(
      axiom(""),
      rule(label: (left: MATCH-DEFAULT, right: $j in.not 1..n$), $angle.l ell_j = v_j angle.r match { case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in 1..n), default M_f } arrow.r M_f$)
    ))
  ])

  And the following typing rule:
  #align(center, text(size: 7.5pt, box(prooftree(
    axiom($Gamma tack.r M : angle.l ell_i : T_i #h(1pt) ^ (i in 1 .. m) angle.r$),
    axiom($m gt.eq n$),
    axiom($forall i in 1..n quad Gamma, x_i : T_i tack.r M_i : T$),
    axiom($Gamma tack.r M_f : T$),
    rule(n: 4, label: T-MATCH-DEFAULT,
        $Gamma tack.r M match { case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in 1..n), default M_f } : T$)
  ))))

  We also need to update our notion of free variables and substitution.

  - $fv(M match { case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in 1..n), default M_f }) =$
    $= fv(M) union fv(M_f) union union.big_(i in 1..n) fv(M_i) without {x_i}$

  - $M match { case ell_i = x_i => M_i  #h(1pt) ^ (i in 1..n), default M_f} {x := N} =$
    $= M { x:= N } match { case ell_i = x_i => M_i {x := N}  #h(1pt) ^ (i in 1..n), default M_f {x := N}}$ where $x != x_i$

  We can prove safety for the new language:
  - *Inversion of typing*: We add the following case:
    - if $Gamma tack.r M match { case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in 1..n), default M_f } : T$ then $exists T_1, ..., T_m$ such that $Gamma tack.r M : angle.l ell_i : T_i #h(1pt) ^ (i in 1..m) angle.r$, $forall i in 1..n quad Gamma, x_i : T_i tack.r M_i : T$ and $Gamma tack.r M_f : T$
  - *Canonical forms*: No new canonical form is needed.
  - *Progress theorem*: We add the following case:
    - #T-MATCH-DEFAULT: then $M = M' match { case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in 1..n), default M_f }$, and $emptyset tack.r M' : angle.l ell_i : T_i #h(1pt) ^ (i in 1..m) angle.r$, $forall i in 1..n quad emptyset, x_i : T_i tack.r M_i : T$ and $emptyset tack.r M_f : T$ all with height $<= k$. By inductive hypothesis on $emptyset tack.r M' : angle.l ell_i : T_i #h(1pt) ^ (i in 1..m) angle.r$ we can distinguish the following cases:
      - $M' arrow.r M''$ then by #RED-MATCH-DEFAULT $M arrow M'' match { case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in 1..n), default M_f }$
      - $M' = v$ then by canonical forms theorem $v = angle.l ell_j = v_j angle.r$
        - if $j in 1..n$ then by #MATCH-DEFAULT-CASE $M arrow M_j {x := v_j}$
        - if $j in.not 1..n$ by #MATCH-DEFAULT $M arrow M_f$
  - *Substitution lemma*: we add the following case:
    - #T-MATCH-DEFAULT then $Gamma, x : S tack.r M' match { case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in 1..n), default M_f }$, and $Gamma, x : S tack.r M' : angle.l ell_i : T_i #h(1pt) ^ (i in 1..m) angle.r$, $forall i in 1..n quad Gamma, x : S, x_i : T_i tack.r M_i : T$ and $Gamma, x : S tack.r M_f : T$ all with height $<= k$. By permutation lemma $forall i in 1..n quad Gamma, x_i : T_i, x : S tack.r M_i : T$ of the same height of $<= k$. We can apply the inductive hypothesis on all the premises and the rule #T-MATCH-DEFAULT to obtain $Gamma tack.r M' {x := N} match { case ell_i = x_i arrow.r.double M_i {x := N}, default M_f {x := N} } : T$
  - *Subject reduction*: we add the following cases:
    - #RED-MATCH-DEFAULT then $M = M' match { case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in 1..n), default M_f }$, $Gamma tack.r M : T$ and $M' arrow M''$ with height $k$, by inversion lemma $exists T_1, ..., T_m$ such that $Gamma tack.r M' : angle.l ell_i : T_i #h(1pt) ^ (i in 1..m) angle.r$, $forall i in 1..n quad Gamma, x_i : T_i tack.r M_i : T$ and $Gamma tack.r M_f : T$. By inductive hypothesis $Gamma tack.r M'' : angle.l ell_i : T_i #h(1pt) ^ (i in 1..m) angle.r$ and by #T-MATCH-DEFAULT $Gamma tack.r M'' match { case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in 1..n), default M_f } : T$
    - #MATCH-DEFAULT-CASE then $M = angle.l ell_j = v_j angle.r match {case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in 1..n), default M_f}$ and $j in 1..n$. By inversion lemma $exists T_1, ..., T_m$ such that $Gamma tack.r angle.l ell_j = v_j angle.r : angle.l ell_i : T_i #h(1pt) ^ (i in 1..m) angle.r$, $forall i in 1..n quad Gamma, x_i : T_i tack.r M_i : T$ and $Gamma tack.r M_f : T$. By substitution lemma $Gamma tack.r M_j {x_j := v_j} : T$

    - #MATCH-DEFAULT then $M = angle.l ell_j = v_j angle.r match {case ell_i = x_i arrow.r.double M_i #h(1pt) ^ (i in 1..n), default M_f}$ and $j in.not 1..n$. By inversion lemma $exists T_1, ..., T_m$ such that $Gamma tack.r angle.l ell_j = v_j angle.r : angle.l ell_i : T_i #h(1pt) ^ (i in 1..m) angle.r$, $forall i in 1..n quad Gamma, x_i : T_i tack.r M_i : T$ and $Gamma tack.r M_f : T$.
]
