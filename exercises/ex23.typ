#import "../common.typ": *

// Note 11 ex 11
#exercise[
  If instead of the rule (T-APP) the following rule was defined, would the safety theorem still be true?
  #align(center, box(prooftree(
    axiom($Gamma tack.r M : T -> T$),
    axiom($Gamma tack.r N : T$),
    rule(n: 2, label: "(T-APP')", $Gamma tack.r M app N : T$)
  )))
]
#solution[
  Yes, safety theorem still be true. Consider 
  $tack.r_"APP'"$ as a logical implication that uses all the standard rules defined, in which (APP') is replaced with (APP).
  In such a way it only needs to show by induction on the number $n$ of (APP') rules used in any derivation tree that the entire proof of a theorem would still hold:
  - Base case $n = 0$ : if $Gamma tack.r_"APP'" M : T$ holds without any application of (APP') in its derivation tree, then this derivation tree is the same of $Gamma tack.r M : T$
  
  - Suppose now as inductive step that the thesis holds forall the derivation trees that use a number $n <= n_0$ of the (APP') rule. Consider then a derivation tree with $n_0 + 1$ applications of (APP'):
    take the last application of (APP') and substitute it with (APP) rule with $T_1 = T$, $T_2 = T$, where $T$ is the type used in $"APP'"$ and $T_1, T_2$ are types used in the premises of (APP). Then we obtained a derivation tree with $n$ derivations of (APP') and then by inductive hypotesis we have a valid derivation tree also for $Gamma tack.r M : T$ . $qed$
]
