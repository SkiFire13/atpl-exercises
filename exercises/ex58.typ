#import "../common.typ": *

// Note 16 ex 4
#exercise[
  Prove the theorems of type preservation, progress and safety for the language with exceptions
]
#solution[
  - *Inversion lemmas*:
    - If $Gamma tack.r throw M : T$ then $Gamma tack.r M : T_exn$
    - If $Gamma tack.r try M catch N : T$ then $Gamma tack.r M : T$ and $Gamma tack.r N : T_exn -> T$
  - *Type Preservation Theorem*: We add the following cases:
    - #TRY: $M = try M_1 catch N -> M' = try M_1' catch N$ has a derivation tree of height k+1 and $M_1 -> M_1'$ has a derivation tree of height k, by inversion lemma $Gamma tack.r M_1 : T$ and $Gamma tack.r N : T_exn -> T$, by inductive hypothesis $Gamma tack.r M_1' : T$ so by #T-TRY $Gamma tack.r M' : T$
    - #TRY-HANDLE: $try throw v catch M -> M app v$, by inversion lemma $Gamma tack.r throw v : T$ and $Gamma tack.r M : T_exn -> T$, by inversion lemma again $Gamma tack.r v : T_exn$ and so by #T-APP $Gamma tack.r M app v : T$
    - #TRY-VAL: $try v catch M -> v$ and by inversion lemma $Gamma tack.r v : T$
    - #RAISE-1: $M = throw M_1 -> M' = throw M_1'$, by inversion lemma $Gamma tack.r M_1 : T_exn$, by inductive hypothesis $Gamma tack.r M_1' : T_exn$ and so by #T-RAISE $Gamma tack.r M' = throw M_1' : T$
    - #RAISE-2: $throw (throw v) -> throw v$, by inversion lemma $Gamma tack.r throw v : T_exn$, by inversion lemma again $Gamma tack.r v : T_exn$ so by #T-RAISE $Gamma tack.r throw v : T$
    - #RAISE-APP-1: $(throw v) app M -> throw v$, by inversion lemma $exists T_1. Gamma tack.r throw v : T_1 -> T$, by inversion lemma again $Gamma tack.r v : T_exn$ and so by #T-RAISE $Gamma tack.r throw v : T$
    - #RAISE-APP-2: $v_1 app (throw v_2) -> throw v_2$, by inversion lemma $exists T_1. Gamma tack.r throw v_2 : T_1$, by inversion lemma again $Gamma tack.r v_2 : T_exn$ and so by #T-RAISE $Gamma tack.r throw v_2 : T$
    - #RAISE-IF: $mif throw v then M melse N -> throw v$, by inversion lemma $Gamma tack.r throw v : Bool$, by inversion lemma again $Gamma tack.r v : T_exn$ and so by #T-RAISE $Gamma tack.r throw v : T$
    - #RAISE-SUM-1: $throw v + M -> throw v$, by inversion lemma $Gamma tack.r throw v : Nat$, by inversion lemma again $Gamma tack.r v : T_exn$ and so by #T-RAISE $Gamma tack.r throw v : T$
    - #RAISE-SUM-2: $v_1 + throw v_2 -> throw v_2$, by inversion lemma $Gamma tack.r throw v_2 : Nat$, by inversion lemma again $Gamma tack.r v_2 : T_exn$ and so by #T-RAISE $Gamma tack.r throw v_2 : T$

  - *Progress Theorem*: Let $M$ be a closed and well-typed term, i.e. $emptyset tack.r M : T$ then either $M$ is a value, or $exists M'.M -> M'$ or $exists v. M = throw v$. We add the following cases:
    - #T-RAISE: $M = throw M_1$ and $emptyset tack.r throw M_1 : T$ has a derivation tree of height k+1 while $emptyset tack.r M_1 : T_exn$ has a derivation tree of height k. By inductive hypothesis we distinguish three cases:
      - $M_1 = v$ is a value, then $M = throw v$ satisfies our thesis.
      - $M_1 -> M_1'$, then by #RAISE-1 $M = throw M_1 -> M' = throw M_1'$
      - $exists v. M_1 = throw v$, then by #RAISE-2 $M = throw (throw v) -> M' = throw v$
    - #T-TRY: $M = try M_1 catch N$ and $emptyset tack.r try M_1 catch N : T$ has a derivation tree of height k+1 while $emptyset tack.r M_1 : T$ and $emptyset tack.r N : T_exn -> T$ have a derivation tree of height $<= k$. By inductive hypothesis on $M_1$ we distinguish three cases:
      - $M_1 = v$ is a value, then by #TRY-VAL $M = try v catch N -> M' = v$ 
      - $M_1 -> M_1'$, then by #TRY $M = try M_1 catch N -> M' = try M_1' catch N$
      - $exists v. M_1 = throw v$, then by #TRY-HANDLE $M = try throw v catch N -> M' = N app v$
    - #T-SUM: we need to add the following cases to the application of inductive hypothesis of the derivation:
      - $M_1 = throw v_1$ then we can apply #RAISE-SUM-1 and obtain $M_1 + M_2 -> throw v_1$
      - $M_1 = v_1$ and $M_2 = throw v_2$ then we can apply #RAISE-SUM-2 and obtain $M_1 + M_2 -> throw v_2$
    - #T-IF: we need to add the following case to the application of inductive hypothesis of the derivation:
      - $M_1 = throw v_1$ we can apply #RAISE-IF and obtain $mif M_1 then M_2 melse M_3 -> throw v_1$
    - #T-APP: we need to add the following cases to the application of inductive hypothesis of the derivation:
      - $M_1 = throw v_1$ then we can apply the rule #RAISE-APP-1 and obtain $M_1 app M_2 -> throw v_1$
	    - $M_1 = v_1$ and $M_2 = throw v_2$ then we can apply the rule #RAISE-APP-2 and obtain $M_1 app M_2-> throw v_2$

  - *Safety Theorem*: Let $M$ be a closed and well-typed term, then $M$ does not evolve to a stuck term, that is, if $emptyset tack.r M : T$ and $M ->^* M'$ with $M' arrow.r.not$, then $exists v$ such that either $M' = v$ or $M' = throw v$.

    Proof: From $emptyset tack.r M : T$ by the corollary of the Type Preservation Theorem we have that $emptyset tack.r M' : T$ and by the Progress Theorem there are three cases:
    - $M'$ is a value
    - $M' -> M''$
    - $M' = throw v$
    Since we know $M' arrow.r.not$ from the hypothesis, we conclude that $M'$ must be a value or $M' = throw v$ $qed$
]
