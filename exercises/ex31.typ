#import "../common.typ": *

// Note 12 ex 4
#exercise[
  Describe the evaluation of the following terms:
  $
    M_1 = (4 + 1, mif mtrue then mfalse melse mfalse).\_1 \
    M_2 = (fn x: Nat * Nat. x.\_2) app (4 + 2, 3 + 1) \
    M_3 = [(3 + 2) + 1].\_2
  $
]
#solution[
  $
    M_1 -> (5, mif mtrue then mfalse melse mfalse).\_1 -> (5, mfalse).\_1 -> 5 \
    M_2 -> (fn x: Nat * Nat. x.\_2) app (6, 3 + 1) -> (fn x: Nat * Nat. x.\_2) app (6, 4) -> (6, 4).\_2 -> 4 \
    M_3 -> [(3 + 2) + 1].\_2 -> (5 + 1).\_2 -> (6).\_2 "stuck"
  $
]
