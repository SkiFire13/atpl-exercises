#import "../common.typ": *

// Note 11 ex 15
#exercise[
  Show that the following terms are well-typed:
  - $fn x: T_1. fn y: T_2. mif y then x melse mtrue$
  - $fn x: Nat -> Bool. x$
  - $fn f: T. fn x: T'. f (mif mtrue then x melse f app x)$
  - $fn f: T_1. fn g: T_2. mif (f (g mtrue)) then f (fn x: T_3 .mtrue) melse f (fn x: T_4. x)$
]
#solution[
  #set text(size: 10pt)
  #align(center, box(prooftree(
    axiom(label: "(T-VAR)", $x : Bool, y : Bool tack.r y : Bool$),
    axiom(label: "(T-VAR)", $x : Bool, y : Bool tack.r x : Bool$),
    axiom(label: "(T-TRUE)", $x : Bool, y : Bool tack.r mtrue : Bool$),
    rule(label: "(T-IF)", n: 3, $x : Bool, y : Bool tack.r mif y then x melse mtrue : Bool$),
    rule(label: "(T-FUN)", $x : Bool tack.r fn y: Bool. mif y then x melse mtrue : Bool -> Bool$),
    rule(label: "(T-FUN)", $emptyset tack.r fn x: Bool. fn y: Bool. mif y then x melse mtrue : Bool -> Bool -> Bool$)
  )))

  #align(center, box(prooftree(
    axiom(label: "(T-VAR)", $x: Nat -> Bool tack.r x : Nat -> Bool$),
    rule(label: "(T-FUN)", $emptyset tack.r fn x: Nat -> Bool. x : (Nat -> Bool) -> (Nat -> Bool)$),
  )))

  #set text(size: 6pt)
  #align(center, box(prooftree(
    axiom(label: "(T-VAR)", $f : T -> T, x : T tack.r f : T -> T$),
    axiom(label: "(T-TRUE)", $f : T -> T, x : T tack.r mtrue : Bool$),
    axiom(label: "(T-VAR)", $f : T -> T, x : T tack.r x : T$),
    axiom(label: "(T-VAR)", $f : T -> T, x : T tack.r f : T -> T$),
    axiom(label: "(T-VAR)", $f : T -> T, x : T tack.r x : T$),
    rule(n: 2, label: "(T-APP)", $f : T -> T, x : T tack.r f app x : T$),
    rule(n: 3, label: "(T-IF)", $f : T -> T, x : T tack.r mif mtrue then x melse f app x : T$),
    rule(n: 2, label: "(T-APP)", $f : T -> T, x : T tack.r f (mif mtrue then x melse f app x) : T$),
    rule(label: "(T-FUN)", $f: T -> T tack.r fn x: T. f (mif mtrue then x melse f app x) : T -> T$),
    rule(label: "(T-FUN)", $emptyset tack.r fn f: T -> T. fn x: T. f (mif mtrue then x melse f app x) : (T -> T) -> T -> T$),
  )))

  #set text(size: 5pt)
  #align(center, h(-2.7cm) + box(prooftree(
    axiom(label: "(T-VAR)", $Gamma tack.r f : (B -> B) -> B$),
    axiom(label: "(T-VAR)", $Gamma tack.r g : B -> (B -> B)$),
    axiom(label: "(T-TRUE)", $Gamma tack.r mtrue : B$),
    rule(n: 2, label: "(T-APP)", $Gamma tack.r g mtrue : B -> B$),
    rule(n: 2, label: "(T-APP)", $Gamma tack.r f (g mtrue): B$),
    axiom(label: "(T-VAR)", $Gamma tack.r f : (B -> B) -> B$),
    axiom(label: "(T-TRUE)", $Gamma, x: B tack.r mtrue: B$),
    rule(label: "(T-FUN)", $Gamma tack.r fn x: B. mtrue: B -> B$),
    rule(n: 2, label: "(T-APP)", $Gamma tack.r  f (fn x: B. mtrue) : B$),    axiom(label: "(T-VAR)", $Gamma tack.r f : (B -> B) -> B$),
    axiom(label: "(T-VAR)", $Gamma, x: B tack.r x: B$),
    rule(label: "(T-FUN)", $Gamma tack.r fn x: B. x: B -> B$),
    rule(n: 2, label: "(T-APP)", $Gamma tack.r  f (fn x: B. x) : B$),
    rule(n: 3, label: "(T-IF)", $f: (B -> B) -> B, g: B -> (B -> B) tack.r mif (f (g mtrue)) then f (fn x: B .mtrue) melse f (fn x: B. x) : B$),
    rule(label: "(T-FUN)", $f: (B -> B) -> B tack.r fn g: B -> (B -> B). mif (f (g mtrue)) then f (fn x: B .mtrue) melse f (fn x: B. x) : (B -> (B -> B)) -> B$),
    rule(label: "(T-FUN)", $emptyset tack.r fn f: (B -> B) -> B. fn g: B -> (B -> B). mif (f (g mtrue)) then f (fn x: B .mtrue) melse f (fn x: B. x) : ((B -> B) -> B) -> (B -> (B -> B)) -> B$),
  )))
]
