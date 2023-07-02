#import "../common.typ": *

// Note 16 ex 5
#exercise[
  Prove the following statement or find a counterexample:
  
  Let $try M catch N$ be a closed and well-typed term, then it surely evolves to a final value $v$.
]
#solution[
  The statement above is not true. A closed and well-typed term $try M catch N$ may evolve to a final term $M' = throw v$, for some value $v$.

  For instance if:
  - $M = throw 0$
  - $N = fn x. throw 0$
  The term - $try throw 0 catch fn x. throw 0$ - as proved below is closed and well-typed with type Nat (if $T_exn = Nat$) and evolves to a final term $throw 0$ which respects the safety theorem but is not a value.

  #align(center)[
    #box(prooftree(
      axiom(""),
      rule(label: T-INT, $emptyset tack.r 0 : T_exn$),
      rule(label: T-RAISE, $emptyset tack.r throw 0 : Nat$),
      axiom(""),
      rule(label: T-INT, $emptyset, x : T_exn tack.r 0 : T_exn$),
      rule(label: T-RAISE, $emptyset, x : T_exn tack.r throw 0 : Nat$),
      rule(label: T-FUN, $emptyset tack.r fn x. throw 0 : T_exn -> Nat$),
      rule(n : 2, label: T-TRY, $emptyset tack.r try throw 0 catch fn x. throw 0 : Nat$)
    ))
    #v(1em)
    #box(prooftree(
      axiom(""),
      rule(label: TRY-HANDLE, $try throw 0 catch fn x. throw 0 -> (fn x.throw 0) app 0$)
    ))
    #v(1em)
    #box(prooftree(
      axiom(""),
      rule(label: BETA, $(fn x.throw 0) app 0 -> throw 0$)
    ))
  ]
]
