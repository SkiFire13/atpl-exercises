#import "../common.typ": *

// Note 13 ex 17
#exercise[
  A further example of a variant type is the following type List, which represents lists of integers. Note that the type is defined recursively:
  $
    upright("Type") & #h(1em) "List" = angle.l "nil" : Unit, "cons" : ("int" * "List") angle.r \
    upright("Values") & #h(1em) angle.l "nil" = unit angle.r #h(1em) angle.l "cons" = (n , angle.l "nil" = unit angle.r) angle.r
  $
  Define the term corresponding to a list containing two elements, that is two integer constants.

]
#solution[
  $angle.l "cons" = (43 , angle.l "cons" = (16 , angle.l "nil" = unit angle.r) angle.r) angle.r$
]
