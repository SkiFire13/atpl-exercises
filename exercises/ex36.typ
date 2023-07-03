#import "../common.typ": *

// Note 13 ex 12
#exercise[
  Define the substitution $M {x := N }$ in the language extended with records and variants.
]
#solution[
  We add the following cases:
  - ${ ell_i = M_i #h(1pt) ^ (i in 1..n) } { x := N } = { ell_i = M_i {x := N } #h(1pt) ^ (i in 1..n) }$
  - $M.ell_j {x := N} = (M {x := N}).ell_j$
  - $angle.l ell = M angle.r {x := N} = angle.l ell = M { x := N} angle.r$
  - $M match { case ell_i = x_i => M_i #h(1pt) ^ (i in 1..n)} {x := N} =$
    $= M { x:= N } match { case ell_i = x_i => M_i {x := N} #h(1pt) ^ (i in 1..n) }$ where $x != x_i$
]
