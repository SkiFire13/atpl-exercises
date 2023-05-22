#import "../common.typ": *

// Note 10 ex 6
#exercise[
  Prove that every subterm of a well-typed term is well-typed. Start by precisely formalizing the statement to be proved.
]
#solution[
  We consider the definition of subterm from exercise 3. We prove by structural induction on $M$ that:
  #align(center, $exists Gamma, T. Gamma tack.r M: T => forall M' in Subterms(M). exists Gamma', T'. Gamma' tack.r M': T'$)
  - $M = x$, then $Subterms(M) = {x}$. \
    Since we know $Gamma tack.r M: T$, we immediately show this is true for all $M' in Subterms(M)$
  - $M = n$, then $Subterms(M) = {n}$.\
   Since we know $Gamma tack.r M: T$, we immediately show this is true for all $M' in Subterms(M)$
  - $M = mtrue$, then $Subterms(M) = {mtrue}$. \
    Since we know $Gamma tack.r M: T$, we immediately show this is true for all $M' in Subterms(M)$
  - $M = mfalse$, then $Subterms(M) = {mfalse}$. \
    Since we know $Gamma tack.r M: T$, we immediately show this is true for all $M' in Subterms(M)$
  - $M = M_1 + M_2$, then $Subterms(M) = {M} union Subterms(M_1) union Subterms(M_2)$. \
    Since $Gamma tack.r M_1 + M_2: T$, by inversion lemma (4) we know that $Gamma tack.r M_1: Nat$ and $Gamma tack.r M_2: Nat$. \
    Thus by inductive hypothesis $forall M' in Subterms(M_i). exists Gamma', T'. Gamma' tack.r M': T'$.\
    Thus the property holds $forall M' in Subterms(M)$
  - $M = mif M_1 then M_2 melse M_3$, then $Subterms(M) = {M} union Subterms(M_1) union Subterms(M_2) union Subterms(M_3)$ \
    Since $Gamma tack.r mif M_1 then M_2 melse M_3: T$ by inversion lemma (5) $Gamma tack.r M_1 : Bool$, $Gamma tack.r M_2: T$ and $Gamma tack.r M_3: T$. \
    Thus by inductive hypothesis $forall M' in Subterms(M_i). Gamma tack.r M': T'$ \
    Thus the property holds $forall M' in Subterms(M)$
  - $M = fn x: T_1. M'$, then $Subterms(M) = {M} union Subterms(M')$. \
    Since $Gamma tack.r fn x: T_1. M : T$, by inversion lemma (7) $exists T_2. Gamma, x: T_1 tack.r M' : T_2$. \
    Thus by inductive hypothesis $forall M'' in Subterms(M'). exists Gamma', T'. Gamma' tack.r M'': T''$. \
    Thus the property holds $forall M'' in Subterms(M)$
  - $M = M_1 app M_2$, then $Subterms(M) = {M} union Subterms(M_1) union Subterms(M_2)$. \
    Since $Gamma tack.r M_1 app M_2: T$, by inversion lemma (8) $exists T_1. Gamma tack.r M_1 : T_1 -> T$ and $Gamma tack.r M_2: T_1$ are derivable. \
    Thus by inductive hypothesis $forall M' in Subterms(M_i). exists Gamma', T'. Gamma' tack.r M': T'$. \
    Thus the property holds $forall M' in Subterms(M)$
]
