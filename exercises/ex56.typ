#import "../common.typ": *

// Note 16 ex 2
#exercise[
  Define the operational semantics of the language that contains exceptions together with unit, records and variants.
]
#solution[
  #align(center, text(size: 11pt)[
    #box(prooftree(
      axiom(""),
      rule(label: RAISE-SELECT, $(throw v).l -> throw v$)
    ))
    #vspace
    #box(prooftree(
      axiom(""),
      rule(label: RAISE-RECORD, ${l_i=v_i #h(1pt) ^ (i in 1..j-1), ell_j=throw v_j, ell_k=M_k #h(1pt) ^ (k in j+1..n)} -> throw v_j$)
    ))
    #vspace
    #box(prooftree(
      axiom(""),
      rule(label: RAISE-VARIANT, $angle.l l = throw v angle.r -> throw v$)
    ))
    #vspace
    #box(prooftree(
      axiom(""),
      rule(label: RAISE-MATCH, $(throw v) match { case ell_i = x_i => M_i #h(1pt) ^ (i in 1..n)} -> throw v$)
    ))
  ])
]
