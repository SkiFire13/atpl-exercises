#import "../common.typ": *

// Note 5b ex 2
#exercise[
  - Think about the difference between the terms $fn x. 2 + x$ and $fn x. (fn y. (y + x) app 2)$
  - Write a term representing a higher order function, i.e. a function that takes a function as a parameter. Also write a program that somehow uses a higher order function. And finally write a function that returns a function.
  - Find two terms $M_1$ , $M_2$ of the language $Llang$ that correspond to the Scala terms `sum` and `sumThree` above.
]
#solution[
  - They are different values, but any application of them will produce the same result. We could say that they are extensionally equal, but not definitionally.
  -
    + $fn f. f app 1$ is a higher order function because it takes as input a function $f$.
    + $(fn f. f app 42)app (fn x. x + 1)$ uses a higher order function to evaluate another function on a specific value.
    + $fn x. fn y. x + y$ is a function that returns another function.
  - $fn x. fn y. x + y$ corresponds to `sum` and $(fn x. fn y. x + y) app 3$ corresponds to `sumThree`.
]
