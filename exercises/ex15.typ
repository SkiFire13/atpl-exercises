#import "../common.typ": *

// Note 9 ex 3
#exercise[
  Find a context $Gamma$ such that the judgment $Gamma tack.r z app x app y: Bool$ is derivable.
]
#solution[
  The required context is $Gamma = emptyset, z: Bool -> Bool -> Bool, x: Bool, y: Bool$:
  #[
    #set text(size: 11pt)
    #align(center, prooftree(
          axiom(""),
          rule(label: T-VAR, $Gamma tack.r z: Bool -> Bool -> Bool$),
          axiom(""),
          rule(label: T-VAR, $Gamma tack.r x: Bool$),
        rule(n: 2, label: T-APP, $Gamma tack.r z app x: Bool -> Bool$),

        axiom(""),
        rule(label: T-VAR, $Gamma tack.r y: Bool$),

      rule(n: 2, label: T-APP, $Gamma tack.r z app x app y: Bool$)
    ))
  ]
]
