#import "../common.typ": *

// Note 7 ex 11
#exercise[
  Consider the following function definition in Scala:
  ```scala
  def test(x: Int, y: Int): Int = x * x
  ```
  Compare the speed (i.e. number of steps) of reduction of the following expressions according to the CBV and CBN strategies, indicating which is faster:
  - `test(2, 3)`
  - `test(3 + 4, 8)`
  - `test(7, 2 * 4)`
  - `test(3 + 4, 2 * 4)`
]
#solution[
  - `test(2, 3)`: both strategies will use the same amount of steps;
  - `test(3 + 4, 8)`: the CBN strategy will duplicate the work to execute `3 + 4`, requiring one additional step;
  - `test(7, 2 * 4)`: the CBN will skip the `2 * 4` instruction while the CBV will execute it, requiring one additional step;
  - `test(3 + 4, 2 * 4)`: the CBN strategy will skip the `2 * 4` instruction but will duplicate the step needed to execute `3 + 4`, while the CBV strategy will execute `2 * 4` but don't duplicate the execution of `3 + 4`, resulting in the same amount of steps required.
]
