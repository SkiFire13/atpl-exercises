#import "../common.typ": *

// Note 22 ex 3
#exercise[
  Write a program that contains the overriding of a method. Show its evaluation and highlight the dynamic binding in the method invocation.
]

#solution[
  ```java
  class A extends Object {
    A() {
      super();
    }

    A m() {
      return new A();
    }
  }

  class B extends A {
    B() {
      super();
    }

    A m() {
      return new B();
    }
  }
  ```

  ```java ((A) new B()).m()```

  #align(center, box(prooftree(
    axiom(fwExtends("B", "A")),
    rule(label: S-CLASS, $B <: A$),
    rule(label: CAST-NEW, fwReduction("(A) new B()", "new B()")),
    rule(label: INVK-RECV, fwReduction("((A) new B()).m()", "(new B()).m()"))
  )))

  #align(center, box(prooftree(
    axiom(fwMBody("m", "B", "new B()")),
    axiom($0 = 0$),
    rule(n: 2, label: INVK-NEW, fwReduction("(new B()).m()", "new B() {this := new B()}"))
  )))
]
