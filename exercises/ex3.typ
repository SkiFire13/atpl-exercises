#import "../common.typ": *

// Note 5b ex 3
#exercise[
  Give a formal definition of the notion of subterms of a term M of the language $Llang$.
]
#solution[
  We can define the set of subterms of a term $M$ of $Llang$ by structural induction on $M$:
  - $Subterms(x) = { x }$
  - $Subterms(n) = { n }$
  - $Subterms(mtrue) = { mtrue }$
  - $Subterms(mfalse) = { mfalse }$
  - $Subterms(M_1 + M_2) = {M_1 + M_2} union Subterms(M_1) union Subterms(M_2)$
  - $Subterms(mif M_1 then M_2 melse M_3) = { M } union Subterms(M_1) union$ $union Subterms(M_2) union Subterms(M_3)$
  - $Subterms(fn x. M) = {fn x. M} union Subterms(M)$
  - $Subterms(M_1 app M_2) = {M_1 app M_2} union Subterms(M_1) union Subterms(M_2)$
]
