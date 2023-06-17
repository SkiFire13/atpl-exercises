#import "../common.typ": *

// Note 22 ex 1
#exercise[
  Observe that a class table can contain mutually recursive class definitions; write an example.
]

#solution[ \
  #box(```java
  class A extends Object {
    B b;
    A(B b) {
      super();
      this.b = b;
    }
  }
  ```)
  #h(3cm)
  #box(```java
  class B extends Object {
    A a;
    B(A a) {
      super();
      this.a = a;
    }
  }
  ```)
]
