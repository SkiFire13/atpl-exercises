#import "../common.typ": *

// Note 22 ex 2
#exercise[
  Describe the semantics of the following terms:
]

#let pairFields = fwFields("Pair", "Object fst", "Object snd")

#solution[
  - ```java new Pair(new A(), new B()).snd```
    #align(center, box(prooftree(
      axiom(pairFields),
      axiom(fwLookup("Pair", "snd")),
      rule(n: 2, label: "(ProjNew)", fwReduction("new Pair(new A(), new B()).snd", "new B()"))
    )))

  - ```java (Pair) new Pair(new A(), new B())```
    #align(center, box(prooftree(
      axiom(label: "(Reflex)", $Pair <: Pair$),
      rule(label: "(CastNew)", fwReduction("(Pair) new Pair(new A(), new B())", "new Pair(new A(), new B())"))
    )))

  - ```java new Pair(new A(), new B()).setfst(new B())```
    #set text(size: 8pt)
    #align(center, box(prooftree(
      axiom(fwMBody("setfst", "Pair", "newfst", "new Pair(newfst, this.snd)")),
      axiom($1 = 1$),
      rule(n: 2, label: "(InvkNew)", fwReduction("new Pair(new A(), new B()).setfst(new B())", "new Pair(new B(), new Pair(new A(), new B()).snd)"))
    )))

    #set text(size: 10pt)
    #align(center, box(prooftree(
      axiom(pairFields),
      axiom(fwLookup("Pair", "snd")),
      rule(n: 2, label: "(ProjNew)", fwReduction("new Pair(new A(), new B()).snd", "new B()")),
      rule(label: "(newArg)", fwReduction("new Pair(new B(), new Pair(new A(), new B()).snd)", "new Pair(new B(), new B())"))
    )))

  #set text(size: 12pt)
  - ```java ((Pair) (new Pair(new Pair(new A(), new B()), new A()).fst)).snd```
    #set text(size: 8pt)
    #align(center, box(prooftree(
      axiom(pairFields),
      axiom(fwLookup("Pair", "fst")),
      rule(n: 2, label: "(PorojNew)", fwReduction("new Pair(new Pair(new A(), new B()), new A()).fst", "new Pair(new A(), new B())")),
      rule(label: "(Cast)", fwReduction("(Pair) (new Pair(new Pair(new A(), new B()), new A()).fst)", "(Pair) (new Pair(new A(), new B()))")),
      rule(label: "(Field)", fwReduction("((Pair) (new Pair(new Pair(new A(), new B()), new A()).fst)).snd", "((Pair) (new Pair(new A(), new B()))).snd"))
    )))

    #align(center, box(prooftree(
      axiom(label: "(Reflex)", $Pair <: Pair$),
      rule(label: "(CastNew)", fwReduction("(Pair) new Pair(new A(), new B())", "new Pair(new A(), new B())")),
      rule(label: "(Field)", fwReduction("((Pair) (new Pair(new A(), new B())).snd", "(new Pair(new A(), new B())).snd"))
    )))

    #align(center, box(prooftree(
      axiom(pairFields),
      axiom(fwLookup("Pair", "snd")),
      rule(n: 2, label: "(ProjNew)", fwReduction("(new Pair(new A(), new B())).snd", "new B()"))
    )))

    #set text(size: 12pt)
  - ```java (B) ((A)new C())```
    #align(center, box(prooftree(
      axiom(fwExtends("C", "B")),
      rule($C <: B$),
      axiom(fwExtends("B", "A")),
      rule($B <: A$),
      rule(n: 2, $C <: A$),
      rule(label: "(CastNew)", fwReduction("(A) new C()", "new C()")),
      rule(label: "(Cast)", fwReduction("(B) ((A) new C())", "(B) (new C())"))
    )))

    #align(center, box(prooftree(
      axiom(fwExtends("C", "B")),
      rule($C <: B$),
      rule(label: "(CastNew)", fwReduction("(B) (new C())", "new C()"))
    )))
]