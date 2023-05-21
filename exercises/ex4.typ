#import "../common.typ": *

// Note 6 ex 4
#exercise[
  Prove by structural induction the following statement: \ "If $x in.not fv(M)$ then the term $M {x := N }$ coincides with $M$."
]
#solution[
  We prove this by structural induction on $M$:
  - $M = y$: $x in.not fv(M) => y eq.not x => M {x := N} = y {x := N} = y = M$
  - $M = n$: $M {x := N} = n {x := N} = n = M$
  - $M = mtrue$: $M {x := N} = mtrue {x := N} = mtrue = M$
  - $M = mfalse$: $M {x := N} = mfalse {x := N} = mfalse = M$
  - $M = M_1 + M_2$: $x in.not fv(M) = fv(M_1) union fv(M_2) => x in.not fv(M_1), x in.not fv(M_2)$ \
    By inductive hypothesis $M_1 {x := N} = M_1$ and $M_2 {x := N} = M_2$ \
    Thus $M {x := N} = (M_1 + M_2) {x := N} = M_1 {x := N} + M_2 {x := N} =$ $= M_1 + M_2 = M$
  - $M = mif M_1 then M_2 melse M_3$: $x in.not fv(M) = fv(M_1) union fv(M_2) union fv(M_3) => x in.not fv(M_1), x in.not fv(M_2), x in.not fv(M_3)$ \
    By inductive hypothesis $M_1 {x := N} = M_1$, $M_2 {x := N} = M_2$ and $M_3 {x := N} = M_3$ \
    Thus $M {x := N} = (mif M_1 then M_2 melse M_3) {x := N} =$ $= mif M_1 {x := N} then M_2 {x := N} melse M_3 {x := N} = $ $= mif M_1 then M_2 melse M_3 = M$
  - $M = fn y. M'$: By $alpha$-conversion we can guarantee that $x != y$, thus
    $x in.not fv(M) = fv(M') without {y}, x != y => x in.not fv(M')$. \
    By inductive hypothesis $M' {x := N} = M'$, thus \
    $M {x := N} = (fn y. M') {x := N} = fn y. M' {x := N} = fn y. M' = M$
  - $M = M_1 app M_2$: $x in.not fv(M) = fv(M_1) union fv(M_2) => x in.not fv(M_1), x in.not fv(M_2)$ \
    By inductive hypothesis $M_1 {x := N} = M_1$ and $M_2 {x := N} = M_2$ \
    Thus $M {x := N} = (M_1 app M_2) {x := N} = M_1 {x := N} app M_2 {x := N} =$ $= M_1 app M_2 = M$
]
