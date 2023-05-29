#import "../common.typ": *

// Note 11 ex 12
#exercise[
  If instead of the rules (T-APP) and (T-FUN) the following rule were defined, would the safety theorem still be true?
  #align(center)[
    #box(prooftree(
      axiom($Gamma tack.r M : T -> T$),
      axiom($Gamma tack.r N : T$),
      rule(n: 2, label: "(T-APP')", $Gamma tack.r M app N : T$)
    ))
    #box(prooftree(
      axiom($Gamma, x: T_1 tack.r M : T$),
      rule(label: "(T-FUN')", $Gamma tack.r fn x: T_1. M : T -> T$)
    ))
  ]
]
#solution[
  No because the proof for the canonical form lemma would fail and with it all the other proofs. For example $(fn x: Bool. mif x then 0 melse 0) app 0$ would be well typed, but after the first reduction we would get $mif 0 then 0 melse 0$ which is stuck and not well typed.
]
