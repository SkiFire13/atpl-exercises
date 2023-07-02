#import "../common.typ": *

#let SUB-WIDTH-VARIANT = smallcaps("Sub-Width-Variant")
#let SUB-DEPTH-VARIANT = smallcaps("Sub-Depth-Variant")
#let SUB-PERMUTATION-VARIANT = smallcaps("Sub-Permutation-Variant")

// Note 13 ex 19
#exercise[
  What might be the subtyping relation for variant types? (pag 196 of the book of B.Pierce)
]

#solution[
  #align(center, box(prooftree(
    axiom(label: SUB-WIDTH-VARIANT, $angle.l ell_i : T_i #h(1pt) ^ (i in I) angle.r <: angle.l ell_i : T_i #h(1pt) ^ (i in I union I') angle.r$)
  )))

  #align(center, box(prooftree(
    axiom($forall i in I quad S_i <: T_i$),
    rule(label: SUB-DEPTH-VARIANT, $angle.l ell_i : S_i #h(1pt) ^ (i in I) angle.r <: angle.l ell_j : T_j #h(1pt) ^ (j in I) angle.r$)
  )))

  #align(center, box(prooftree(
    axiom($angle.l k_j : S_j #h(1pt) ^ (j in I) angle.r "is a permutation of" angle.l ell_i : T_i #h(1pt) ^ (i in I) angle.r$),
    rule(label: SUB-PERMUTATION-VARIANT, $angle.l k_j : S_j #h(1pt) ^ (j in I) angle.r <: angle.l ell_i : T_i #h(1pt) ^ (i in I) angle.r$)
  )))
]
