#import "../common.typ": *

#let Mp = $M#sub[p]$
#let Np = $N#sub[p]$

// Note 16 ex 1
#exercise[
  - $Mp = fn x:Nat. (mif even (x) then x\/2 melse throw x)$
  - $Np = fn x:Nat. try (mif even(x) then x\/2 melse throw x) catch fn z.0$

  + $try (Mp app 3) catch fn y.y + y$
  + $try (fn y:Nat. (Mp app y) app 5) catch fn y.y + y$
  + $try [fn z:Bool. (Mp app mif z then 3 melse 6) app mfalse] catch fn y.y + y$
  + $try (fn y.y + 2 app (Mp app 5)) catch fn z.print (z)$
  + $try (fn y.y + 2 app (Mp app throw 2)) catch fn z.print(z)$
  + $try (Np app 3) catch fn y.y$
  + $try [fn y:Nat. (try (Mp app y) catch fn z.print(z)) app 5] catch fn y.y + y$
  + $try (fn y.y + 2 app (try (Mp app 5) catch fn z.z+z)) catch fn z.print(z)$
  + $try (fn x.x app throw 1) app (try (Mp app 5) catch fn z.z+z) catch fn z.print(z)$
  Show the operational semantics of the terms above, observing how the raising of the exception causes a non local jump of the control flow.
]
#solution[
  #for i in range(9) {
    [
      #include "ex55/ex55." + {str(i + 1)} + ".typ"
      #if i + 1 != 9 [
        #v(2em)
        #line(length: 100%)
        #v(2em)
      ]
    ]
  }
]