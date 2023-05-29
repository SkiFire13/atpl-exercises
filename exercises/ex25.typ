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
  No, the proof for the canonical form lemma would fail, moreover terms like $mtrue + 0$ would be well typed but would be stuck, thus being a counterexample to the safety theorem.
]
