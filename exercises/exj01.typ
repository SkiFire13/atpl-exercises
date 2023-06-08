#import "../common.typ": *

// Note 22 ex 1
#exercise[
  Observe that a class table can contain mutually recursive class definitions; write an example.
]

#solution[
  ```java
  class A extends Object {
    B b;
    A() {
      super();
      this.b = new B();
    }
  }

  class B extends Object {
    A a;
    B() {
      super();
      this.a = new A();
    }
  }
  ```
]
