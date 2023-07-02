#import "../common.typ": *

#let T-APP-NEW = smallcaps("(T-App')")

// Note 11 ex 11
#exercise[
  If instead of the rule #T-APP the following rule was defined, would the safety theorem still be true?
  #align(center, box(prooftree(
    axiom($Gamma tack.r M : T -> T$),
    axiom($Gamma tack.r N : T$),
    rule(n: 2, label: T-APP-NEW, $Gamma tack.r M app N : T$)
  )))
]
#solution[
  Yes, safety theorem still be true. Consider $tack.r_"APP'"$ as a logical implication that uses all the standard rules, with #T-APP replaced with #T-APP-NEW, and
  $tack.r_"both"$ as a logical implication that uses all the standard rules defined, including #T-APP, and #T-APP-NEW. Consider a term $M$ for which $Gamma tack.r_"APP'" M : T$ is derivable, then $Gamma tack.r_"both" M : T$ is also derivable, since all the rules allowed in $tack.r_"APP'"$ are also allowed in $tack.r_"both"$. We then prove that we can derive a proof of $Gamma tack.r_"both" M : T$ without using the rule #T-APP-NEW, thus being a valid derivation for $Gamma tack.r M : T$. We do this by induction on the number $n$ of uses of the rule #T-APP-NEW in the derivation of $Gamma tack.r_"both" M : T$:
  - Base case $n = 0$ : then no #T-APP-NEW rule has been used and thus the conclusion is trivially true;
  - Inductive case $n >= 1$: consider one use of the #T-APP-NEW rule and replace it with an instance of the #T-APP rule with $T_1 = T$ and $T_2 = T$, where $T$ is the type used in #T-APP-NEW and $T_1, T_2$ are types used in the premises of #T-APP. We have obtained a new valid derivation for $Gamma tack.r_"both" M : T$ with $n - 1$ uses of the #T-APP-NEW rule. Thus by inductive hypothesis we can find a derivation for $Gamma tack.r_"both" M : T$ with no uses of #T-APP-NEW, and the conclusion is true.
]
