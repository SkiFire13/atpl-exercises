#import "../common.typ": *

#let SUB = smallcaps("(Sub)")
#let SUB-LEFT = smallcaps("(Sub-Lef") + smallcaps("t)")
#let SUB-RIGHT = smallcaps("(Sub-Right)")
#let IF-LEFT = smallcaps("(If-Lef") + smallcaps("t)")
#let IF-RIGHT = smallcaps("(If-Right)")

// Note 6 / Note 7 ex 5
#exercise[
  - Add to the language $Llang$ a subtraction operation. What needs to be changed, the syntax of terms? the semantics? the syntax of values? the notion of free variables and substitution?
  - Define the reduction relation so that integer operations occur with a right-to-left strategy.
  - The given reduction relation defines an efficient strategy for the evaluation of the if-then-else term, i.e. allowing only the branch chosen by the evaluation of the Boolean guard to be evaluated. Redefine the operational semantics of the language so that it adopts an inefficient strategy for the if-then-else construct, evaluating both branches of the conditional construct before selecting one of them. Is the relationship thus defined ambiguous (nondeterministic)? What is the semantics of the term if false then 3 + true else 7?
]
#solution[
  - The syntax of terms needs to be extended with the following clause: \
    $Terms M ::= ... | M - M$ \
    The semantics also need to be changed to add three reduction rules for subtraction, equivalen to the ones for the sum. Since we only support natural numbers, this will be defined only when the result is non-negative: \
    #align(center)[
      #box(prooftree(
        axiom($n = n_1 -_NN n_2$),
        rule(label: SUB, $n_1 - n_2 -> n$),
      ))
    ]
    #align(center)[
      #box(prooftree(
        axiom($M -> M'$),
        rule(label: SUB-LEFT, $M - N -> M' - N$),
      ))
      #h(2em)
      #box(prooftree(
        axiom($M -> M'$),
        rule(label: SUB-RIGHT, $n - M -> n - M'$),
      ))
    ]
    Values remain the same since a substraction should be either reducible or a stuck term. \
    Free variables and substitution needs to be updated to account for subtraction: \
    #align(center, $fv(M_1 - M_2) = fv(M_1) union fv(M_2)$)
    #align(center, $(M_1 - M_2) {x := N} = M_1 {x := N} - M_2 {x := N}$)
  - We replace the #SUM-LEFT and #SUM-RIGHT rules with the following ones:
    #align(center)[
      #box(prooftree(
        axiom($N -> N'$),
        rule(label: SUM-RIGHT, $M + N -> M + N'$),
      ))
      #h(2em)
      #box(prooftree(
        axiom($M -> M'$),
        rule(label: SUM-LEFT, $M + n -> M' + n$),
      ))
    ]
    And add the new following rules:
    #align(center)[
      #box(prooftree(
        axiom($N -> N'$),
        rule(label: SUB-RIGHT, $M - N -> M - N'$),
      ))
      #h(2em)
      #box(prooftree(
        axiom($M -> M'$),
        rule(label: SUB-LEFT, $M - n -> M' - n$),
      ))
    ]
  - We replace the #IF-TRUE and #IF-FALSE rules with:
    #align(center)[
      #box(prooftree(
        axiom($M_1 -> M_1'$),
        rule(label: IF-LEFT, $mif v then M_1 melse M_2 -> mif v then M_1' melse M_2$),
      ))
      #box(prooftree(
        axiom($M -> M'$),
        rule(label: IF-RIGHT, $mif v_1 then v_2 melse M -> mif v_1 then v_2 melse M'$),
      ))
      #box(prooftree(
        axiom(""),
        rule(label: IF-TRUE, $mif mtrue then v_1 melse v_2 -> v_1$),
      ))
      #box(prooftree(
        axiom(""),
        rule(label: IF-FALSE, $mif mfalse then v_1 melse v_2 -> v_2$),
      ))
    ]
    This semantic is deterministic because it will always fully evaluate the true branch before evaluating the false branch. Under these semantics the given term would be stuck because it would not be possible to reduce the true branch to a value.
]
