#import "../common.typ": *

// Note 7 ex 12
#exercise[
  Consider the logical construct `x && y` commonly used in the programming languages, which only evaluates the second argument if `x` is true:
  - define a term $M_amp$ in the language $Llang$ that behaves as `x && y`. Does the term $M_amp$ respect the intended semantics of the construct `x && y` only with the call-by-value evaluation strategy, only with the call-by-name strategy, with both?
  - Define in Scala a function `and` that behaves as the logical construct `x && y`.
]
#solution[
  - We could define $M_amp = fn x. fn y. mif x then y melse mfalse$, but this works correctly only with a call-by-name evaluation strategy, because in a call-by-value evaluation strategy $y$ will always be evaluated, even though the intended semantics didn't evaluate it.
  - If we had the unit element, we could define $M_amp$ in $Llang$ as:
    $M_amp = fn x. fn y. mif x then (y unit) melse mfalse$ where $y$ is a function taking $unit$ and returing a boolean. This would respect the intended semantics with both a call-by-name and a call-by-value evaluation strategy.
  - In Scala we can define `and` as:
    ```scala
    def and(x: Boolean, y: => Boolean): Boolean = if(x) y else false
    ```
]
