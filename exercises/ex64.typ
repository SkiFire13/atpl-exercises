#import "../common.typ": *

// Note 23b ex 5
#exercise[
  Does it make sense to add the subtyping rule for arrow types $A arrow B$ in FJ?
]

#solution[
  No since the only possible values are instances of objects, there are no values of type $arrow$ and the subtyping is already handled by object polymorphism and ensures that a subtype can be used wherever its supertype is expected.
]
