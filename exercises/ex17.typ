#import "../common.typ": *

// Note 10 ex 5
#exercise[
  Prove that the term $fn x : Bool -> Nat. fn y : Bool. mif y then 1 melse x + y$ is not well-typed.
]
#solution[
  Assume $emptyset tack.r fn x : Bool -> Nat. fn y : Bool. mif y then 1 melse x + y: T$ to be derivable. \
  By inversion lemma (7) $exists T_1. emptyset, x: Bool -> Nat tack.r fn y : Bool. mif y then 1 melse x + y: T_1$ is derivable. \
  By inversion lemma (7) $exists T_2. emptyset x: Bool -> Nat, y: Bool tack.r mif y then 1 melse x + y: T_2$ is derivable \
  By inversion lemma (5) $emptyset, x: Bool -> Nat, y: Bool tack.r x + y: T_2$ is derivable. \
  By inversion lemma (4) $emptyset, x: Bool -> Nat, y: Bool tack.r x: Nat$ is derivable \
  By inversion lemma (6) $x: Nat in emptyset, x: Bool -> Nat, y: Bool$, but this is false. \
  Thus the initial assumption is false.
]
