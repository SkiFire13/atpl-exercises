#import "../common.typ": *

// Note 16 ex 3
#exercise[
  - $M_1 = (fn x:Bool. x) throw 0$
  - $M_2 = mif mtrue then 2 melse throw 0$
  - $M_3 = try ((fn x:Bool. throw 0) app mfalse) + 5 catch fn y.y$
  - $M_4 = try (throw 0 app mtrue) catch fn y.y$
  Prove that the terms $M_1, M_2, M_3, M_4$ defined above respect the safety theorem.
]
#solution[
  #sub_exercises(57, 4) 
]
