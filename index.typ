#import "common.typ": *

#table(
  columns: (auto, auto),
  "1",   $size(e) >= 0$ + " and " + $depth(e)$,
  "",   "Syntax",
  "2",  "Higher order function",
  "3",  "Sub-terms",
  "4",  $mif x in.not fv(M) => M{x := N} = M$,
  "",   "Operational semantics",
  "5",  "Subtraction",
  "6",  "(Sum right new)",
  "7",  "(Sum 2)",
  "8",  "Evaluation of term + variant eval rule stuck earlier",
  "9",  "Call by name term",
  "9",  "Scala: Sum of squares",
  "11", "Scala: test",
  "12", "Scala: &&",
  "",   "Simple types",
  "13", $(Bool -> Bool) -> (Bool -> Bool), (Bool -> Nat) -> (Bool -> Nat)$,
  "14", $M = (fn x : Nat . mtrue) app mfalse$ + " well typed?",
  "15", $Gamma tack.r x app y app z$,
  "16", $Gamma tack.r x app x$,
  "",   "Type system properties",
  "17", $fn x : Bool -> Nat. fn y : Bool. mif y then y melse x + y$,
  "18", "Well typed sub-terms",
  "19", $Gamma tack.r M : T => fv(M) subset.eq Dom(Gamma)$,
  "20", "Strengthening",
  "21", "Subject reduction by induction on height",
  "22", "Opposite subject reduction",
  "23", "(App')",
  "24", "(App') and (Fun')",
  "25", "(True') (False')",
  "26", "(If')",
  "27", "Show terms are well typed",
  "",   "Unit",
  "28", "Safety for Unit",
  "",   "Pairs",
  "29", "Alternative semantics for pair",
  "30", "Formalize relationship different semantics",
  "31", "Evaluate terms",
  "32", "Safety for pairs",
  "",   "Records",
  "33", "Free vars and substitution for new terms",
  "34", "Inversion lemma for records",
  "35", "Safety for integers, booleans, functions and records",
  "",   "Variants",
  "36", "Substitution for records and variants",
  "37", "Prove "+$M_1 angle.l ell_1 = 5 angle.r$ + "well-typed with Bool",
  "38", "Inv. Lemma for variants + Safety theorem",
  "39", "(TYPE MATCH GEN 1)",
  "40", "(TYPE MATCH GEN 2)",
  "41", "Define a list",
  "42", "Default in pattern matching",
  "43", "Sub-typing for variants",
  "",   "Sub-typing",
  "44", "Derivation with sub-typing",
  "45", "Derivation with and without (ARROW)",
  "46", "Is term well typed with sub-typing?",
  "47", "Is term well typed without sub-typing?",
  "48", "For which types is the judgment derivable?",
  "49", "If we had defined sub-typing rules is such a way that...",
  "50", $emptyset tack.r {ell_1 = 10, ell_2 = mtrue + 2} : {ell_1 : Nat}$,
  "51", "Important! Prove safety for records and sub-typing",
  "52", "Term typable only with sub-typing",
  "53", "(New-Arrow)",
  "54", $S <:: T$ + " and " + $T lt.not :: T$,
  "",   "Exceptions",
  "55", "Steps evaluation",
  "56", "Operational semantics exception, unit, records and variants",
  "57", "Terms respect safety theorem",
  "58", "Safety exceptions",
  "59", "Closed and well-typed implies reduces to a value",
  "",   "FW-Java",
  "60", "Mutually recursive class",
  "61", "Semantics term new Pair",
  "62", "Program with overriding",
  "63", "Up-cast and down cast",
  "64", "Arrow types",
  "65", "Well typed terms",
)
