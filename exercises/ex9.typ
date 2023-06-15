#import "../common.typ": *

// Note 7 ex 9
#exercise[
  Write the transition rules corresponding to the call-by-name strategy, and evaluate the previous term according to this strategy.
]
#solution[
  We replace the rules (BETA) and (APP 2) with the new rule:
  #align(center, box(prooftree(
    axiom(""),
    rule(label: "(BETA NEW)", $(fn x. M) app N -> M {x := N}$)
  )))
  With this new rule the evaluation of the previous term becomes:
  #[
    #set text(size: 10pt)
    #align(center)[
      #box(prooftree(
        axiom(""),
        rule(label: "(BETA NEW)", $(fn x. 3) app (fn y. y) -> 3$),
        rule(label: "(APP 1)", $(fn x. 3) app (fn y. y)) app ((fn z. mif z then 1 melse 0) app (mfalse)
        -> 3 app ((fn z. mif z then 1 melse 0) app (mfalse))$)
      ))
    ]
  ]
  And it already becomes stuck because 3 is not a term of the form $fn x. M$
]
