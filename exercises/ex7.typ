#import "../common.typ": *

#let SUM-2 = smallcaps("(Sum-2)")

// Note 7 ex 7
#exercise[
  Examine how the semantics of the language would change by replacing the rules #SUM-RIGHT and #SUM-LEFT with the following rule:
  #align(center, box(prooftree(
    axiom($M_1 -> M_1'$),
    axiom($M_2 -> M_2'$),
    rule(n: 2, label: SUM-2, $M_1 + M_2 -> M_1' + M_2'$),
  )))
  What would be the semantics of the term (5 + 2) + 4?
]
#solution[
  Many terms would now become stuck even though we would logically consider them reducible. In particular this forces every sum term to allow the same amount of reductions on both sides or be eventually stuck. For example the given term would now be stuck because although $5 + 2 -> 7$, $4$ is already a value and thus not reducible to nothing.
]
