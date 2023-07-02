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
      rule(label: "(Sum)", $4 + 1 -> 5$),
      rule(label: "(Eval Pair 1)", $(4 + 1, mif mtrue then mfalse melse mfalse) -> (5, mif mtrue then mfalse melse mfalse)$),
      rule(label: "(Project 1)", $(4 + 1, mif mtrue then mfalse melse mfalse).\_1 -> (5, mif mtrue then mfalse melse mfalse).\_1$)
    )))

    #align(center, box(prooftree(
      axiom($$),
      rule(label: "(If-True)", $mif mtrue then mfalse melse mfalse -> mfalse$),
      rule(label: "(Eval Pair 2)", $(5, mif mtrue then mfalse melse mfalse) -> (5, mfalse)$),
      rule(label: "(Project 1)", $(5, mif mtrue then mfalse melse mfalse).\_1 -> (5, mfalse).\_1$)
    )))

    #align(center, box(prooftree(
      axiom($$),
      rule(label: "(Pair 1)", $(5, mfalse).\_1 -> 1$)
    )))

  - $M_2$:
    #align(center, box(prooftree(
      axiom($$),
      rule(label: "(Sum)", $4 + 2 -> 6$),
      rule(label: "(Eval Pair 1)", $(4 + 2, 3 + 1) -> (6, 3 + 1)$),
      rule(label: "(App 2)", $(fn x: Nat * Nat. x.\_2) app (4 + 2, 3 + 1) -> (fn x: Nat * Nat. x.\_2) app (6, 3 + 1)$),
    )))

    #align(center, box(prooftree(
      axiom($$),
      rule(label: "(Sum)", $3 + 1 -> 4$),
      rule(label: "(Eval Pair 2)", $(6, 3 + 1) -> (6, 4)$),
      rule(label: "(App 2)", $(fn x: Nat * Nat. x.\_2) app (6, 3 + 1) -> (fn x: Nat * Nat. x.\_2) app (6, 4)$),
    )))


    #align(center, box(prooftree(
      axiom($$),
      rule(label: "(Beta)", $(fn x: Nat * Nat. x.\_2) app (6, 4) -> (6, 4).\_2 $),
    )))

    #align(center, box(prooftree(
      axiom($$),
      rule(label: "(Pair 2)", $(6, 4).\_2 -> 4 $),
    )))

  - $M_3$:
    #align(center, box(prooftree(
      axiom($$),
      rule(label: "Sum", $3 + 2 -> 5$),
      rule(label: "Sum Left", $(3 + 2) + 1 -> 5 + 1$),
      rule(label: "(Project 2)", $[(3 + 2) + 1].\_2 -> (5 + 1).\_2$),
    )))

    #align(center, box(prooftree(
      axiom($$),
      rule(label: "Sum", $5 + 1 -> 6$),
      rule(label: "(Project 2)", $(5 + 1).\_2 -> 6.\_2$),
    )))

    And it's stuck.

]
