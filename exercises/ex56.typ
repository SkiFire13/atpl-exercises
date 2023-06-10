#import "../common.typ": *

// Note 16 ex 2
#exercise[
  Define the operational semantics of the language that contains exceptions together with unit, records and variants.
]
#solution[
  #set text(size: 11pt)
  #align(center)[
    #box(prooftree(
      axiom(""),
      rule(label: "(RAISE SELECT)", $(throw v).l -> throw v$)
    ))
    #v(1em)
    #box(prooftree(
      axiom(""),
      rule(label: "(RAISE RECORD)", ${l_i=v_i #h(1pt) ^ (i in 1..j-1), l_j=throw v_j, l_k=M_k #h(1pt) ^ (k in j+1..n)} -> throw v_j$)
    ))
    #v(1em)
    #box(prooftree(
      axiom(""),
      rule(label: "(RAISE VARIANT)", $angle.l l = throw v angle.r -> throw v$)
    ))
    #v(1em)
    #box(prooftree(
      axiom(""),
      rule(label: "(RAISE MATCH)", $(throw v) match { case l_i = x_i => M_i #h(1pt) ^ (i in 1..n)} -> throw v$)
    ))
    
  ]
]