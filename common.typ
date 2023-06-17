#import "prooftree/prooftree.typ": *

#let vspace = v(0.5em)
#let font_size = 10pt

#let typst_label = label

#let next(f) = it => {
  if(it.has("children")) {
    f(it.children.first())
    it.children.slice(1).join()
  } else {
    f(it)
  }
}

#let exercise(label: none, content)  = [
  #box[
    #heading(
      numbering: i => text(size: font_size)[ Exercise #i. ],
      supplement: "",
      ""
    )
    #place[
      #show figure.where(supplement: "Exercise"): it => {}
      #figure(
        {},
        supplement: "Exercise",
        outlined: false
      )
      #if label != none { typst_label(label) }
    ]
  ]
  #h(0.5em)
  #content
]
#let solution(content) = [
  #parbreak()
  *Solution.* #h(0.5em)
  #content
  #vspace
]

#let sub_exercises(ex, amount) = {
  range(amount)
    .map(i => include "exercises/ex" + str(ex) + "/ex" + str(ex) + "." + str(i + 1) + ".typ")
    .join(vspace + line(length: 100%) + vspace)
}

#let size = math.op("size")
#let depth = math.op("depth")
#let Dom = math.op("Dom")
#let fv = math.op("fv")

#let Llang = symbol("\u{2112}")
#let Terms = "Terms"
#let Subterms = "ST"

#let Bool = "Bool"
#let Nat = "Nat"
#let Unit = "Unit"
#let Pair = "Pair"

#let unit = "unit"
#let app = " "
#let fn = "fn"
#let mif = "if"
#let then = "then"
#let melse = "else"
#let mtrue = "true"
#let mfalse = "false"
#let match = "match"
#let case = "case"
#let default = "default"
#let try = "try"
#let throw = "throw"
#let catch = "catch"
#let even = "even"
#let print = "print"
#let exn = "exn"

#let ell = text("\u{1D4C1}", font: ())
#let emptyset = text("\u{2205}", font: ())
#let tack2r = "\u{22A9}"

#let SUM = smallcaps("(Sum)")
#let SUM-LEFT = smallcaps("(Sum-Lef") + smallcaps("t)")
#let SUM-RIGHT = smallcaps("(Sum-Right)")
#let IF = smallcaps("(If)")
#let IF-TRUE = smallcaps("(If-True)")
#let IF-FALSE = smallcaps("(If-False)")
#let APP-1 = smallcaps("(App-1)")
#let APP-2 = smallcaps("(App-2)")
#let BETA = smallcaps("(Beta)")
#let PAIR-1 = smallcaps("(Pair-1)")
#let PAIR-2 = smallcaps("(Pair-2)")
#let EVAL-PAIR-1 = smallcaps("(Eval-Pair-1)")
#let EVAL-PAIR-2 = smallcaps("(Eval-Pair-2)")
#let PROJECT-1 = smallcaps("Project-1")
#let PROJECT-2 = smallcaps("Project-2")
#let EVAL-RECORD = smallcaps("(Eval-Record)")
#let SELECT = smallcaps("(Select)")
#let EVAL-SELECT = smallcaps("(Eval-Select)")
#let VARIANT = smallcaps("(Variant)")
#let RED-MATCH = smallcaps("(Red-Match)")
#let MATCH = smallcaps("(Match)")
#let RAISE-1 = smallcaps("(Raise-1)")
#let RAISE-2 = smallcaps("(Raise-2)")
#let RAISE-SUM-1 = smallcaps("(Raise-Sum-1)")
#let RAISE-SUM-2 = smallcaps("(Raise-Sum-2)")
#let RAISE-APP-1 = smallcaps("(Raise-App-1)")
#let RAISE-APP-2 = smallcaps("(Raise-App-2)")
#let RAISE-IF = smallcaps("(Raise-If)")
#let RAISE-SELECT = smallcaps("(Raise-Select)")
#let RAISE-RECORD = smallcaps("(Raise-Record)")
#let RAISE-VARIANT = smallcaps("(Raise-Variant)")
#let RAISE-MATCH = smallcaps("(Raise-Match)")
#let TRY = smallcaps("(Try)")
#let TRY-HANDLE = smallcaps("(Try-Handle)")
#let TRY-VAL = smallcaps("(Try-Val)")

#let T-APP = smallcaps("(T-App)")
#let T-VAR = smallcaps("(T-Var)")
#let T-INT = smallcaps("(T-Int)")
#let T-TRUE = smallcaps("(T-True)")
#let T-FALSE = smallcaps("(T-False)")
#let T-SUM = smallcaps("(T-Sum)")
#let T-IF = smallcaps("(T-If)")
#let T-FUN = smallcaps("(T-Fun)")
#let T-APP = smallcaps("(T-App)")
#let T-UNIT = smallcaps("(T-Unit)")
#let T-PAIR = smallcaps("(T-Pair)")
#let T-PROJECT-1 = smallcaps("(T-Project-1)")
#let T-PROJECT-2 = smallcaps("(T-Project-2)")
#let T-RECORD = smallcaps("(T-Record)")
#let T-SELECT = smallcaps("(T-Select)")
#let T-VARIANT = smallcaps("(T-Variant)")
#let T-MATCH = smallcaps("(T-Match)")
#let T-TRY = smallcaps("(T-Try)")
#let T-RAISE = smallcaps("(T-Raise)")

#let ARROW = smallcaps("(Arrow)")
#let SUBSUMPTION = smallcaps("(Subsumption)")
#let SUB-WIDTH = smallcaps("(Sub-Width)")
#let REFLEX = smallcaps("(Reflex)")
#let SUB-DEPTH = smallcaps("(Sub-Depth)")
#let TRANS = smallcaps("(Trans)")

#let PROJ-NEW = smallcaps("(ProjNew)")
#let CAST-NEW = smallcaps("(CastNew)")
#let INVK-NEW = smallcaps("(InvkNew)")
#let NEW-ARG = smallcaps("(NewArg)")
#let NEW = smallcaps("(New)")
#let CAST = smallcaps("(Cast)")
#let FIELD = smallcaps("(Field)")
#let INVK-RECV = smallcaps("(InvkRecv)")
#let DCAST = smallcaps("(Dcast)")
#let S-CLASS = smallcaps("(S-Class)")

#let fwReduction(lhs, rhs) = [
  #raw(lhs, lang: "java") $arrow$ #raw(rhs, lang: "java")
]

#let fwFields(className, ..fields) = [
  $"fields"(#className) = { #fields.pos().join(", ") }$
]

#let fwLookup(className, field) = $#field in "fields"(#className)$

#let fwMBody(method, className, ..args, body) = [
  $"mbody"(#method, #className)
  = ( #args.pos().join(", ") , #raw(body, lang: "java") )$
]

#let fwExtends(A, B) = [
  $"CT"(#A) = #raw("class " + A + " extends " + B + " {...}", lang: "java")$
]

#let fwType(context, term, type) = [
  $#context tack.r #raw(term, lang: "java") : #type$
]
