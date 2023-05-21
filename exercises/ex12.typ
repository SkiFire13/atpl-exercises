#import "../common.typ": *

#let unit = "unit"

#exercise[
  Consider the logical construct `x && y` commonly used in the programming languages, which only evaluates the second argument if `x` is true:
  - define a term $M_amp$ in the language $Llang$ that behaves as `x && y`. Does the term $M_amp$ respect the intended semantics of the construct `x && y` only with the call-by-value evaluation strategy, only with the call-by-name strategy, with both?
  - Define in Scala a function `and` that behaves as the logical construct `x && y`.
]
#solution[
  - If we had the unit element, we could define $M_amp$ in $Llang$ as:
    $M_amp = fn x. fn y. mif x then (y unit) melse mfalse$
  - In Scala we can define `and` as:
    ```scala
    def and(x: Boolean, y: () => Boolean): Boolean = if(x) y() else false
    ```
]
