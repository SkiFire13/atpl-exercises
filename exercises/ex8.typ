#import "../common.typ": *

#let APP-2-NEW = smallcaps("(App-2-New)")

// Note 7 ex 8
#exercise[
  Show the evaluation of the term $((fn x. 3) app (fn y. y)) app ((fn z. mif z then 1 melse 0) app (mfalse))$. Define a variant of the evaluation rules so that, by keeping a call-by-value strategy, the previous term evolves to a stuck term in fewer reduction steps.
]
#solution[
  #[
    #set text(size: 10pt)
    #align(center)[
      #box(prooftree(
        axiom(""),
        rule(label: BETA, $(fn x. 3) app (fn y. y) -> 3$),
        rule(label: APP-1, $(fn x. 3) app (fn y. y)) app ((fn z. mif z then 1 melse 0) app (mfalse)
        -> 3 app ((fn z. mif z then 1 melse 0) app (mfalse))$)
      ))
      #v(1em)
      #box(prooftree(
        axiom(""),
        rule(label: BETA, $(fn z. mif z then 1 melse 0) app (mfalse) -> mif mfalse then 1 melse 0$),
        rule(label: APP-2, $3 app ((fn z. mif z then 1 melse 0) app (mfalse)) -> 3 app (mif mfalse then 1 melse 0)$)
      ))
      #v(1em)
      #box(prooftree(
        axiom(""),
        rule(label: IF-FALSE, $mif mfalse then 1 melse 0 -> 0$),
        rule(label: APP-2, $3 app (mif mfalse then 1 melse 0) -> 3 app 0$)
      ))
    ]
  ]
  And $3 app 0$ is a stuck term. The term could have evolved to a stuck term faster if we replaced the #APP-2 rule with the following:
  #align(center, box(prooftree(
    axiom($N -> N'$),
    rule(label: APP-2-NEW, $(fn x. M) app N -> (fn x. M) app N'$)
  )))
  With this rule way the term $3 app ((fn z. mif z then 1 melse 0) app (mfalse))$ would have been stuck already after one step. This is still a call-by-value strategy because we didn't change the order of evaluation, we simply changed #APP-2 to evaluate only those terms that won't become stuck, since the only way to do so is to use the #BETA rule that requires a function on the left side of the application.
]
