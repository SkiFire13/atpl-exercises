#import "template.typ": template

#set text(font: "New Computer Modern", size: 10pt)
#set enum(indent: 1em)
#set list(indent: 1em)
#set page(
  margin: 10pt,
  flipped: true,
  columns: 2,
  footer: v(-0.5cm) + align(right, counter(page).display() + h(0.5cm))
)

#for i in range(66) {
  include "exercises/ex" + str(i+1) + ".typ"
}
