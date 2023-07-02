#import "../common.typ": *

// Note 12 ex 4
#exercise[
  Describe the evaluation of the following terms:
  $
    M_1 = (4 + 1, mif mtrue then mfalse melse mfalse).\_1 \
    M_2 = (fn x: Nat * Nat. x.\_2) app (4 + 2, 3 + 1) \
    M_3 = [(3 + 2) + 1].\_2
  $
]
#solution[
  - $M_1$:
    #align(center, box(prooftree(
      axiom($$),
      rule(label: SUM, $4 + 1 -> 5$),
      rule(label: EVAL-PAIR-1, $(4 + 1, mif mtrue then mfalse melse mfalse) -> (5, mif mtrue then mfalse melse mfalse)$),
      rule(label: PROJECT-1, $(4 + 1, mif mtrue then mfalse melse mfalse).\_1 -> (5, mif mtrue then mfalse melse mfalse).\_1$)
    )))

    #align(center, box(prooftree(
      axiom($$),
      rule(label: IF-TRUE, $mif mtrue then mfalse melse mfalse -> mfalse$),
      rule(label: EVAL-PAIR-2, $(5, mif mtrue then mfalse melse mfalse) -> (5, mfalse)$),
      rule(label: PROJECT-1, $(5, mif mtrue then mfalse melse mfalse).\_1 -> (5, mfalse).\_1$)
    )))

    #align(center, box(prooftree(
      axiom($$),
      rule(label: PAIR-1, $(5, mfalse).\_1 -> 1$)
    )))

  - $M_2$:
    #align(center, box(prooftree(
      axiom($$),
      rule(label: SUM, $4 + 2 -> 6$),
      rule(label: EVAL-PAIR-1, $(4 + 2, 3 + 1) -> (6, 3 + 1)$),
      rule(label: APP-2, $(fn x: Nat * Nat. x.\_2) app (4 + 2, 3 + 1) -> (fn x: Nat * Nat. x.\_2) app (6, 3 + 1)$),
    )))

    #align(center, box(prooftree(
      axiom($$),
      rule(label: SUM, $3 + 1 -> 4$),
      rule(label: EVAL-PAIR-2, $(6, 3 + 1) -> (6, 4)$),
      rule(label: APP-2, $(fn x: Nat * Nat. x.\_2) app (6, 3 + 1) -> (fn x: Nat * Nat. x.\_2) app (6, 4)$),
    )))


    #align(center, box(prooftree(
      axiom($$),
      rule(label: BETA, $(fn x: Nat * Nat. x.\_2) app (6, 4) -> (6, 4).\_2 $),
    )))

    #align(center, box(prooftree(
      axiom($$),
      rule(label: PAIR-2, $(6, 4).\_2 -> 4 $),
    )))

  - $M_3$:
    #align(center, box(prooftree(
      axiom($$),
      rule(label: SUM, $3 + 2 -> 5$),
      rule(label: SUM-LEFT, $(3 + 2) + 1 -> 5 + 1$),
      rule(label: PROJECT-2, $[(3 + 2) + 1].\_2 -> (5 + 1).\_2$),
    )))

    #align(center, box(prooftree(
      axiom($$),
      rule(label: SUM, $5 + 1 -> 6$),
      rule(label: PROJECT-2, $(5 + 1).\_2 -> 6.\_2$),
    )))

    And it's stuck.

]
