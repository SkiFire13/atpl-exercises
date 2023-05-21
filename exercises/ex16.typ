#import "../common.typ": *

// Note 9 ex 4
#exercise[
  Is the judgment $Gamma tack.r x app x : T$ derivable? If yes show a derivation (for some $Gamma, T$), otherwise prove that it is not derivable.
]
#solution[
  The judgement is not derivable because the only typing rule applicable is (T-APP), but it ends up requiring $x: U -> T$ and $x: U$, which can't be the same type.
]
