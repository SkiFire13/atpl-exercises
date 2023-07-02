#import "../common.typ": *

// Note 10 ex 6
#exercise[
  Prove that every subterm of a well-typed term is well-typed. Start by precisely formalizing the statement to be proved.
]
#solution[
  #let ST = "ST"
  We consider the definition of subterm from exercise 3. We want to prove that, given $Gamma tack.r M : T$ then $forall M' in ST(M). exists Gamma', T'. Gamma' tack.r M' : T'$. We prove this by induction on the height of the judgement $Gamma tack.r M: T$. We distinguish the following cases:
  - Base cases:
    - #T-VAR: then $M = x$, $ST(M) = {x}$ and the conclusion is already true;
    - #T-INT: then $M = n$, $ST(M) = {n}$ and the conclusion is already true;
    - #T-TRUE: then $M = mtrue$, $ST(M) = {mtrue}$ and the conclusion is already true;
    - #T-FALSE: then $M = mfalse$, $ST(M) = {mfalse}$ and the conclusion is already true.
  - Inductive cases (height $k+1$):
    - #T-SUM: then $M = M_1 + M_2$, $ST(M) = {M} union ST(M_1) union ST(M_2)$ and $Gamma tack.r M_1 : Nat$ and $Gamma tack.r M_2 : Nat$ derivable with height at most $k$. By inductive hypothesis $forall i$ $forall M' in ST(M_i). exists Gamma', T'. Gamma' tack.r M': T'$. Thus the property holds $forall M' in ST(M)$;
    - #T-IF: then $M = mif M_1 then M_2 melse M_3$, $ST(M) = {M} union ST(M_1) union ST(M_2) union ST(M_3)$ and $Gamma tack.r M_1: Bool$, $Gamma tack.r M_2: T$ and $Gamma tack.r M_3: T$ derivable with height at most $k$. By inductive hypothesis $forall i$ $forall M' in ST(M_i). Gamma tack.r M': T'$. Thus the property holds $forall M' in ST(M)$;
    - #T-FUN: then $M = fn x: T_1. M_1$, $T = T_1 -> T_2$, $ST(M) = {M} union ST(M_1)$ and $Gamma, x: T_1 tack.r M_1 : T_2$ derivable with height $k$. By inductive hypothesis $forall M' in ST(M_1). exists Gamma', T'. Gamma' tack.r M': T'$. Thus the property holds $forall M' in ST(M)$;
    - #T-APP: then $M = M_1 app M_2$, $ST(M) = {M} union ST(M_1) union ST(M_2)$ and $Gamma tack.r M_1 : T_2 -> T$ and $Gamma tack.r M_2 : T_2$ derivable with height at most $k$. By inductive hypothesis $forall i$ $forall M' in ST(M_i). exists Gamma', T'. Gamma' tack.r M': T'$. Thus the property holds $forall M' in ST(M)$.
]
