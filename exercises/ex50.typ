#import "../common.typ": *

// Note 15 ex 7
#exercise[
  Is the judgment $emptyset tack.r {ell_1 = 10, ell_2 = mtrue + 2} : {ell_1: Nat}$ derivable?
]
#solution[
  No, because it requires $mtrue + 2$ to be well typed, but it isn't. In fact this judgement can't be derivable because ${ell_1 = 10, ell_2 = mtrue + 2}$ is a stuck term, so if it was derivable then the safety theorem would be false.
]
