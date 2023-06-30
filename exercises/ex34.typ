#import "../common.typ": *

// Note 12 ex 7
#exercise[
  State the inversion lemmas for the language extended with records.
]
#solution[
  We add the following cases:
  - if $Gamma tack.r {ell_i = M_i #h(1pt) ^ (i in 1..n)} : T$ derivable then $exists T_1, ..., T_n$ such that $T = {ell_i : T_i #h(1pt) ^ (i in 1..n)}$ and $forall i in 1..n.$ $Gamma tack.r M_i : T_i$ derivable;
  - if $Gamma tack.r M.ell_j : T_j$ derivable then $exists n >= j.$ $exists T_1, ..., T_n.$ $Gamma tack.r M : { ell_i : T_i #h(1pt) ^ (i in 1..n) }$ derivable.
]
