#import "../common.typ": *

// Note 16 ex 1
#exercise[
  - $M_p = fn x:Nat. (mif even(x) then x\/2 melse throw x)$
  - $N_p = fn x:Nat. try (mif even(x) then x\/2 melse throw x) catch fn z.0$

  + $try (M_p app 3) catch fn y.y + y$
  + $try (fn y:Nat. (M_p app y) app 5) catch fn y.y + y$
  + $try [fn z:Bool. (M_p app mif z then 3 melse 6) app mfalse] catch fn y.y + y$
  + $try (fn y.y + 2 app (M_p app 5)) catch fn z.print (z)$
  + $try (fn y.y + 2 app (M_p app throw 2)) catch fn z.print(z)$
  + $try (N_p app 3) catch fn y.y$
  + $try [fn y:Nat. (try (M_p app y) catch fn z.print(z)) app 5] catch fn y.y + y$
  + $try (fn y.y + 2 app (try (M_p app 5) catch fn z.z+z)) catch fn z.print(z)$
  + $try (fn x.x app throw 1) app (try (M_p app 5) catch fn z.z+z) catch fn z.print(z)$
  Show the operational semantics of the terms above, observing how the raising of the exception causes a non local jump of the control flow.
]
#solution[
  #sub_exercises(55, 9)
]
