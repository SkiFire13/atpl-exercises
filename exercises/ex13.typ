#import "../common.typ": *

#let Bool = "Bool"
#let Nat = "Nat"

// Note 8 ex 1
#exercise[
  Write a term of type (Bool -> Bool) -> (Bool -> Bool), and a term of type (Bool -> Nat) -> (Bool -> Nat).
]
#solution[
  - $fn x: Bool -> Bool. x$
  - $fn x: Bool -> Nat. x$
]
