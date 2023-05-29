#import "../common.typ": *

// Note 11 ex 11
#exercise[
  If instead of the rule (T-APP) the following rule were defined, would the safety theorem still be true?
  #align(center, box(prooftree(
    axiom($Gamma tack.r M : T -> T$),
    axiom($Gamma tack.r N : T$),
    rule(n: 2, label: "(T-APP')", $Gamma tack.r M app N : T$)
  )))
]
#solution[
  Yes, because if a term satisfies (T-APP') then it also satisfies (T-APP) and thus the premises of the safety theorem. However the opposite is not true, so some terms that are well types with (T-APP) may not be well types with (T-APP'), for example $(fn x: Nat. mtrue) app 0$
]
