#import "../common.typ": *

// Note 11 ex 14
#exercise[
  If the following rule were added to the typing system, where would the proof of the safety theorem fail?
  #align(center, box(prooftree(
    axiom($Gamma tack.r M_1 : Bool$),
    axiom($Gamma tack.r M_2 : T_2$),
    axiom($Gamma tack.r M_3 : T_3$),
    rule(n: 3, label: "(T-IF')", $Gamma tack.r mif M_1 then M_2 melse M_3 : T$)
  )))
]
#solution[
  The proof for the inversion lemma would fail and thus the case for (IF-TRUE) and (IF-FALSE) in the subject reduction theorem. For example $(mif mtrue then 0 melse 0) app 0$ would be well typed, but it evolves to $0 app 0$ which is stuck and not well typed.
]
