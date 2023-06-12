#import "../common.typ": *

// Note 23b ex 6
#exercise[
  Consider the terms:
  - ```java ((Pair) (new Pair(new Pair(new A(), new B()), new A()).fst)).snd```
  - ```java (new Pair(new Pair(new A(), new B()), new A()).fst).snd```
  Discuss if they are well typed and if they reduce to a final value.
]

#let pairFields = fwFields("Pair", "Object fst", "Object snd")

#solution[
  - ```java ((Pair) (new Pair(new Pair(new A(), new B()), new A()).fst)).snd```

  It is well-typed:

    #set text(size: 12pt)
    $pi_("av") =$
    #align(center, box(prooftree(
      axiom($0 = 0$),
      axiom(fwFields("A")),
      rule(n: 2, label: "(New)", fwType(emptyset, "new A()", "A")),
    )))

    #set text(size: 12pt)
    $pi_("at") =$
    #align(center, box(prooftree(
      axiom(fwExtends("A", "Object")),
      rule($"A" <: "Object"$)
    )))

    #set text(size: 12pt)
    $pi_("pt") =$
    #align(center, box(prooftree(
      axiom(fwExtends("Pair", "Object")),
      rule($"Pair" <: "Object"$)
    )))

    #set text(size: 12pt)
    $pi_("bv") =$
    #align(center, box(prooftree(
      axiom(fwExtends("B", "Object")),
      rule($"B" <: "Object"$),
    )))

    #set text(size: 12pt)
    $pi_1 =$
    #set text(size: 8pt)
    #align(center, box(prooftree(
      axiom($2 = 2$),
      axiom(pairFields),
      axiom($0 = 0$),
      axiom(fwFields("B")),
      rule(n: 2, label: "(New)", fwType(emptyset, "new B()", "B")),
      axiom($pi_("bv")$),
      axiom($pi_("av")$),
      axiom($pi_("at")$),
      rule(n: 6, label: "(New)", fwType(emptyset, "new Pair(new A(), new B())", "Object"))
    )))

    #set text(size: 12pt)
    $pi_2 =$
    #set text(size: 10pt)
    #align(center, box(prooftree(
      axiom($2 = 2$),
      axiom(pairFields),
      axiom($pi_1$),
      axiom($pi_("pt")$),
      axiom($pi_("av")$),
      axiom($pi_("at")$),
      rule(n: 6, label: "(New)", fwType(emptyset, "new Pair(new Pair(new A(), new B()), new A())", "Object")),
    )))

    #set text(size: 12pt)
    $pi_("f ") =$
    #set text(size: 10pt)
    #align(center, box(prooftree(
      axiom($pi_2$),
      axiom(pairFields),
      axiom(fwLookup("fst", "Pair")),
      rule(n: 3, label: "(Field)", fwType(emptyset, "new Pair(new Pair(new A(), new B()), new A()).fst", "Object")),
      axiom($pi_("pt")$),
      axiom($"Pair" eq.not "Object"$),
      rule(n: 3, label: "(DCast)", fwType(emptyset, "(Pair) (new Pair(new Pair(new A(), new B()), new A()).fst)", "Pair")),
    )))

    #v(2em)

    #set text(size: 11pt)
    #align(center, box(prooftree(
      axiom($pi_("f ")$),
      axiom(pairFields),
      axiom(fwLookup("snd", "Pair")),
      rule(n: 3, label: "(Field)", fwType(emptyset, "((Pair) (new Pair(new Pair(new A(), new B()), new A()).fst)).snd", "Object"))
    )))

  #set text(size: 12pt)
  It reduces to a value:

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
  - ```java (new Pair(new Pair(new A(), new B()), new A()).fst).snd```

    #set text(size: 10pt)
    It is not well-typed:
      Suppose that it is well typed, by inversion lemma $exists T$ s.t. #fwType(emptyset, "new Pair(new Pair(new A(), new B()), new A()).fst", "T")
      and #fwLookup("T", "snd").
      But

      #set text(size: 10pt)
      #align(center, box(prooftree(
        axiom($pi_2$),
        axiom(pairFields),
        axiom(fwLookup("fst", "Pair")),
        rule(n: 3, label: "(Field)", fwType(emptyset, "new Pair(new Pair(new A(), new B()), new A()).fst", "Object")),
      )))

      #set text(size: 10pt)
      that implies $T = "Object"$ but #fwFields("Object") witch is a contraddiction.

    #set text(size: 12pt)
    It reduces to a value:

      #set text(size: 8pt)
      #align(center, box(prooftree(
        axiom(pairFields),
        axiom(fwLookup("Pair", "fst")),
        rule(n: 2, label: "(PorojNew)", fwReduction("new Pair(new Pair(new A(), new B()), new A()).fst", "new Pair(new A(), new B())")),
        rule(label: "(Field)", fwReduction("(new Pair(new Pair(new A(), new B()), new A()).fst)).snd", "(new Pair(new A(), new B())).snd"))
      )))

      #align(center, box(prooftree(
        axiom(pairFields),
        axiom(fwLookup("Pair", "snd")),
        rule(n: 2, label: "(ProjNew)", fwReduction("(new Pair(new A(), new B())).snd", "new B()"))
      )))
]