#import "../common.typ": *

// Note 12 ex 2
#exercise[
  Define an alternative semantics $M ~> M'$ that encodes a different strategy for the evaluation of pairs.
]
#solution[
  #align(center)[
    #h(1fr)
    #box(prooftree(
      axiom(""),
      rule(label: PAIR-1, $(M_1, M_2).\_1 ~> M_1$),
    ))
    #h(1fr)
    #box(prooftree(
      axiom(""),
      rule(label: PAIR-2, $(M_1, M_2).\_2 ~> M_2$),
    ))
    #h(1fr)
    \ \
    #h(1fr)
    #box(prooftree(
      axiom($M_1 ~> M_1'$),
      rule(label: EVAL-PAIR-1, $(M_1, M_2) ~> (M_1', M_2)$),
    ))
    #h(1fr)
    #box(prooftree(
      axiom($M_2 ~> M_2'$),
      rule(label: EVAL-PAIR-2, $(v_1, M_2) ~> (v_1, M_2')$),
    ))
    #h(1fr)
  ]
]
