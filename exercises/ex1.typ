#import "../common.typ": *

#let size = "size"
#let depth = "depth"

#exercise[Prove that $forall e in "Exp", size(e) > 0$ and $depth(e) > 0$.]

- $size(e) > 0$
  By induction on $e$:
  - $size(n) = 1 > 0$
  - $size(x) = 1 > 0$
  - $
      size(e_1 + e_2) &= 1 + size(e_1) + size(e_2) \
        &> 1 + size(e_2) & #h(1cm) ["By inductive hypothesis on " e_1] \
        &> 1             & #h(1cm) ["By inductive hypothesis on " e_2] \
        &> 0
    $
  - $
      size(e_1 * e_2) &= 1 + size(e_1) + size(e_2) \
        &> 1 + size(e_2) & #h(1cm) ["By inductive hypothesis on " e_1] \
        &> 1             & #h(1cm) ["By inductive hypothesis on " e_2] \
        &> 0
    $

- $depth(e) > 0$
  By induction on $e$:
  - $depth(n) = 1 > 0$
  - $depth(x) = 1 > 0$
  - $
      depth(e_1 + e_2) &= 1 + max(depth(e_1), depth(e_2)) & #h(0pt) \
        &>= 1 + depth(e_1) & \
        &> 1
        #h(2.1cm) ["By inductive hypothesis on either" e_1 "or" e_2] \
        &> 0 & 
    $
  - $
      depth(e_1 * e_2) &= 1 + max(depth(e_1), depth(e_2)) \
        &>= 1 + depth(e_1) & \
        &> 1
        #h(2.1cm) ["By inductive hypothesis on either" e_1 "or" e_2] \
        &> 0
    $
