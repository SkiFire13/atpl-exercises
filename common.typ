#import "prooftree/prooftree.typ": *

#let exercise_counter = counter("exercise")
#let exercise(content)  = [
  #parbreak()
  #exercise_counter.step()
  *Exercise #exercise_counter.display().* #h(0.5em)
  #content
]
#let solution(content) = [
  #parbreak()
  *Solution.* #h(0.5em)
  #content
  #v(2em)
]

#let app = " "
#let fn = "fn"
#let mif = "if"
#let then = "then"
#let melse = "else"
#let mtrue = "true"
#let mfalse = "false"
#let Llang = symbol("\u{2112}")

#let emptyset = text(font: "sans-serif")[ \u{2205} ]
