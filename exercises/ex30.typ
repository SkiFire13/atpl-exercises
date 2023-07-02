#import "../common.typ": *

// Note 12 ex 3
#exercise[
  Formalise a statement expressing the relationship between the alternative operational semantics developed in the previous exercise and the standard semantics defined above.
]
#solution[
  The alternative operational semantics are a lazy version of the standard ones. They allow strictly more programs to evaluate to values by ignoring if one side of the pair becomes stuck. Formally, if $M -> v$ then $M ~> v$ too, and if $M cancel(arrow.squiggly)$ then $M arrow.not$. However $M ~> v$ could be true but $M arrow.not$, for example $(0, 0 + mtrue)._1 ~> 0$ by #PAIR-1 by $(0, 0 + mtrue) arrow.not$ because $0 + mtrue$ is stuck.
]
