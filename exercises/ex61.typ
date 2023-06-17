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
      rule(n: 2, label: PROJ-NEW, fwReduction("new Pair(new A(), new B()).snd", "new B()"))
    )))

  - ```java (Pair) new Pair(new A(), new B())```
    #align(center, box(prooftree(
      axiom(label: REFLEX, $Pair <: Pair$),
      rule(label: CAST-NEW, fwReduction("(Pair) new Pair(new A(), new B())", "new Pair(new A(), new B())"))
    )))

  - ```java new Pair(new A(), new B()).setfst(new B())```
    #text(size: 8.5pt, align(center, box(prooftree(
      axiom(fwMBody("setfst", "Pair", "newfst", "new Pair(newfst, this.snd)")),
      axiom($1 = 1$),
      rule(n: 2, label: INVK-NEW, fwReduction("new Pair(new A(), new B()).setfst(new B())", "new Pair(new B(), new Pair(new A(), new B()).snd)"))
    ))))

    #text(size: 10pt, align(center, box(prooftree(
      axiom(pairFields),
      axiom(fwLookup("Pair", "snd")),
      rule(n: 2, label: PROJ-NEW, fwReduction("new Pair(new A(), new B()).snd", "new B()")),
      rule(label: NEW-ARG, fwReduction("new Pair(new B(), new Pair(new A(), new B()).snd)", "new Pair(new B(), new B())"))
    ))))

  - ```java ((Pair) (new Pair(new Pair(new A(), new B()), new A()).fst)).snd```
    #text(size: 7pt, align(center, h(-3cm) + box(prooftree(
      axiom(pairFields),
      axiom(fwLookup("Pair", "fst")),
      rule(n: 2, label: PROJ-NEW, fwReduction("new Pair(new Pair(new A(), new B()), new A()).fst", "new Pair(new A(), new B())")),
      rule(label: CAST, fwReduction("(Pair) (new Pair(new Pair(new A(), new B()), new A()).fst)", "(Pair) (new Pair(new A(), new B()))")),
      rule(label: FIELD, fwReduction("((Pair) (new Pair(new Pair(new A(), new B()), new A()).fst)).snd", "((Pair) (new Pair(new A(), new B()))).snd"))
    ))))

    #text(size: 9pt, align(center, box(prooftree(
      axiom(label: REFLEX, $Pair <: Pair$),
      rule(label: CAST-NEW, fwReduction("(Pair) new Pair(new A(), new B())", "new Pair(new A(), new B())")),
      rule(label: FIELD, fwReduction("(Pair) (new Pair(new A(), new B())).snd", "(new Pair(new A(), new B())).snd"))
    ))))

    #align(center, box(prooftree(
      axiom(pairFields),
      axiom(fwLookup("Pair", "snd")),
      rule(n: 2, label: PROJ-NEW, fwReduction("(new Pair(new A(), new B())).snd", "new B()"))
    )))

  - ```java (B) ((A)new C())```
    #text(size: 8pt, align(center, box(prooftree(
      axiom(fwExtends("C", "B")),
      rule(label: S-CLASS, $C <: B$),
      axiom(fwExtends("B", "A")),
      rule(label: S-CLASS, $B <: A$),
      rule(n: 2, label: TRANS, $C <: A$),
      rule(label: CAST-NEW, fwReduction("(A) new C()", "new C()")),
      rule(label: CAST, fwReduction("(B) ((A) new C())", "(B) (new C())"))
    ))))

    #align(center, box(prooftree(
      axiom(fwExtends("C", "B")),
      rule(label: S-CLASS, $C <: B$),
      rule(label: CAST-NEW, fwReduction("(B) (new C())", "new C()"))
    )))
]
