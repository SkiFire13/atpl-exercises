#import "../common.typ": *

// Note 23b ex 4
#exercise[
  Why are there two typing rules for both upcast and downcast, while there is only a rule for up-cast in operational semantics?
]

#solution[
  The operational semantics provide knowledge of the type of every object at any given point during execution. This is because the upcast operation does not modify the object's type. As a result there is no need for a down cast operation since it would always result in a stuck term anyway.

  On the other hand, the typing rules are tracking the static type of objects. Cast operations explicitly change the types of objects. Therefore, both upcast and downcast operations are possible.
]
