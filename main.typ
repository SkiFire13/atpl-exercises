#import "template.typ": template
#import "common.typ": font_size

#set text(font: "New Computer Modern", size: font_size)
#set enum(indent: 1em)
#set list(indent: 1em)
#set page(
  margin: 10pt,
  flipped: true,
  columns: 2,
  footer: v(-0.5cm) + align(right, counter(page).display() + h(0.5cm))
)

#for i in range(65) {
  include "exercises/ex" + str(i+1) + ".typ"
}
