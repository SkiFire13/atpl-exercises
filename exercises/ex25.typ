#import "../common.typ": *

// Note 11 ex 13
#exercise[
  If the following two axioms were added to the typing system, would the safety theorem still be true?
  #align(center)[
    #box(prooftree(
      axiom(""),
      rule(label: "(T-TRUE')", $Gamma tack.r mtrue : Nat$)
    ))
    #h(2cm)
    #box(prooftree(
      axiom(""),
      rule(label: "(T-FALSE')", $Gamma tack.r mfalse : Nat$)
    ))
  ]
]
#solution[
  No, the proof for the canonical form lemma would fail.

  The term $mtrue + 0$ would be a well typed but stuck term:
  #align(center, box(prooftree(
    axiom(label: "(T-TRUE')", $emptyset tack.r mtrue : Nat$),
    axiom(label: "(T-Int)", $emptyset tack.r 0 : Nat$),
    rule(n: 2, label: "(T-Sum)", $emptyset tack.r mtrue + 0 : Nat$)
  )))
  // moreover terms like $mtrue + 0$ would be well typed but would be stuck, thus being a counterexample to the safety theorem.
]
