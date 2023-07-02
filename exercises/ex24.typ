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
  No because the proof for the inversion lemma would fail and with it all the other proofs. For example $(fn x: Bool. mif x then 0 melse 0) app 0$ would be well typed:

  #align(center, box(prooftree(
    axiom(label: "(T-var)", $x : Bool tack.r x : Bool$),
    axiom(label: "(T-Int)", $x : Bool tack.r 0 : Nat$),
    axiom(label: "(T-Int)", $x : Bool tack.r 0 : Nat$),
    rule(n: 3, label: "(T-If)", $x : Bool tack.r mif x then 0 melse 0 : Nat$),
    rule(label: "(T-FUN')", $emptyset tack.r fn x : Bool. mif x then 0 melse 0 : Nat -> Nat$),
    axiom(label: "", $emptyset tack.r 0 : Nat$),
    rule(n: 2, label: "(T-APP')", $emptyset tack.r (fn x: Bool. mif x then 0 melse 0) app 0 : Nat$)
  )))

  But after the first reduction we would get a stuck term:

  #align(center, box(prooftree(
    axiom(""),
    rule(label: "(Beta)", $(fn x : Bool. mif x then 0 melse 0) app 0 -> mif 0 then 0 melse 0$)
  )))
  $ mif 0 then 0 melse 0 arrow.r.not $
  /// $mif 0 then 0 melse 0$ which is stuck and not well typed.
]
