#import "prooftree/prooftree.typ": *

#let typst_label = label

#let exercise(label: none, content)  = [
  #box[
    #heading(
      numbering: i => text(size: 12pt)[ Exercise #i. ],
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
  #v(2em)
]

#let sub_exercises(ex, amount) = {
    for i in range(amount) {
      include "exercises/ex" + str(ex) + "/ex" + str(ex) + "." + str(i + 1) + ".typ"
      if i + 1 != amount {
        v(2em)
        line(length: 100%)
        v(2em)
      }
  }
}

#let fwReduction(lhs, rhs) = [
  #raw(lhs, lang: "java") $arrow$ #raw(rhs, lang: "java")
]

#let fwFields(className, ..fields) = [
  $"fields"(#className) = {$
  #fields.pos().join(", ")
  $}$
]

#let fwLookup(className, field) = [
  $#field in "fields"(#className)$
]

#let fwMBody(method, className, ..args, body) = [
  $"mbody"(#method, #className) = (($
  #args.pos().join(", ")
  $),$
  #raw(body, lang: "java")
  $)$
]

#let fwExtends(A, B) = [
  $"CT"(#A) = $
  #raw("class " + A + " extends " + B + " {...}", lang: "java")
]

#let size = math.op("size")
#let depth = math.op("depth")
#let Dom = math.op("Dom")
#let fv = math.op("fv")

#let Llang = symbol("\u{2112}")
#let Terms = "Terms"
#let Subterms = "Subterms"

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

#let ell = text("\u{1D4C1}", font: "cmsy10")

#let emptyset = text(font: "sans-serif")[ \u{2205} ]

#let tack2r = "\u{22A9}"
