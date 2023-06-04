#import "../common.typ": *

// Note 12 ex 3
#exercise[
  Formalise a statement expressing the relationship between the alternative operational semantics developed in the previous exercise and the standard semantics defined above.
]
#solution[
  The alternative operational semantics are a lazy version of the standard ones. They allow strictly more programs to evaluate to values by ignoring if one side of the pair becomes stuck. Formally, if $M -> v != (v_1, v_2)$ then $M ~> v$ too, but the opposite is not true.
]
