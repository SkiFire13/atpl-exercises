#import "../common.typ": *

// Note 12 ex 6
#exercise[
  Extend the definition of free variables (definition 1.2) and substitution (definition 1.4) to the new terms introduced in the language.
]
#solution[
  - $fv$, we add the following cases:
    $
      fv(unit) &= emptyset \
      fv((M_1, M_2)) &= fv(M_1) union fv(M_2) \ 
      fv(M.\_1) &= fv(M) \
      fv(M.\_2) &= fv(M) \
      fv(M.ell) &= fv(M) \
      fv({ell_i = M_i #h(1pt) ^ (i in 1..n)}) &= union.big_(i in 1..n) fv(M_i)
    $
  - substitutions, we add the following cases:
    $
      unit{x:=N} &= unit \
      (M_1, M_2){x:=N} &= (M_1{x:=N}, M_2{x:=N}) \
      M.\_1{x:=N} &= (M{x:=N}).\_1 \
      M.\_2{x:=N} &= (M{x:=N}).\_2 \ 
      M.ell {x := N} &= (M{ x := N }).ell \
      {ell_i = M_i #h(1pt) ^ (i in 1..n)} {x := N} &= { ell_i = M_i{x := N} #h(1pt) ^ (i in 1..n) }
    $
]
