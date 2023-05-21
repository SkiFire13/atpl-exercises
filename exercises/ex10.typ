#import "../common.typ": *

// Note 7 ex 10
#exercise[
  Consider the following function definitions in Scala:
  ```scala
  def square(x: Int): Int = x * x
  def sumOfSquare(x: Int, y: Int): Int = square(x) + square(y)
  ```
  - Describe the reduction steps of the expression `sumOfSquare(3, 4)` according to a call-by-value strategy similar to the one defined in the previous section. Also describe the reduction of the same expression according to the call-by-name strategy.
  - Describe the reduction steps of the expression `sumOfSquare(3, 2 + 2)` according to the call-by-value and call-by-name strategies.
]
#solution[
  - Reductions of `sumOfSquare(3, 4)`:
    + call-by-value: `sumOfSquare(3, 4)` $->$ `square(3) + square(4)` $->$ \ `3 * 3 + square(4)` $->$ `9 + square(4)` $->$ `9 + 4 * 4` $->$ `9 + 16` $->$ `25`
    + call-by-name: `sumOfSquare(3, 4)` $->$ `square(3) + square(4)` $->$ \ `3 * 3 + square(4)` $->$ `9 + square(4)` $->$ `9 + 4 * 4` $->$ `9 + 16` $->$ `25`
    The two reductions are the same.
  - Reductions of `sumOfSquare(3, 2 + 2)`:
    + call-by-value: `sumOfSquare(3, 2 + 2)` $->$ `sumOfSquare(3, 4)` $->$ \ `square(3) + square(4)` $->$ `3 * 3 + square(4)` $->$ `9 + square(4)` $->$ \ `9 + 4 * 4` $->$ `9 + 16` $->$ `25`
    + call-by-name: `sumOfSquare(3, 2 + 2)` $->$ `square(3) + square(2+2)` $->$ \ `3 * 3 + square(2 + 2)` $->$ `9 + square(2 + 2)` $->$ `9 + (2 + 2) * (2 + 2)` $->$ `9 + 4 * (2 + 2)` $->$ `9 + 4 * 4` $->$ `9 + 16` $->$ `25`
    The call-by-name reduction strategy required an additional reduction step, duplicating the work needed to execute the `2+2` term.
]
