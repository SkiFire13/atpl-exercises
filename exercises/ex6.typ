#import "../common.typ": *

#let SUM-RIGHT-NEW = smallcaps("(Sum-Right-New)")

// Note 7 ex 6
#exercise[
  Examine how the semantics of the language would change by replacing the rule #SUM-RIGHT with the following:
  #align(center, box(prooftree(
    axiom($M_2 -> M_2'$),
    rule(label: SUM-RIGHT-NEW, $M_1 + M_2 -> M_1 + M_2'$)
  )))
  Is this new modified semantics deterministic? Is it possible for a term M to evolve to two different (final) values? If a program reduced to a value or a stuck term, respectively, in the original semantics, does it now reduce to the same value or stuck term?
]
#solution[
  The modified semantics is no longer deterministic because both #SUM-LEFT and #SUM-RIGHT-NEW rules apply for a term $M_1 + M_2$ where $M_1 -> M_1'$ and $M_2 -> M_2'$. $M$ cannot however evolve to two different final values because by induction all the other terms are still deterministic, and by inductive hypothesis so are the final values for $M_1$ and $M_2$; thus since #SUM is still deterministic, the final value will also be deterministic. \
  If a program reduced to a stuck term in the original semantics it may now reduce to a different stuck term. This happens because the rule #SUM-RIGHT-NEW may now apply when $M_1$ is a stuck term, reducing the right part. The result will still be a stuck term however, because there's no rule that is able to further reduce $M_1$.
]
