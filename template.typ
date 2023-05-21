#let make_title(title, author, date) = [
  #[ #align(center, text(size: 20pt, title)) ]
  #[ #align(center, text(size: 14pt, author)) ]
  #[ #align(center, text(size: 14pt, date)) ]
  #v(1em)
]

#let template(title: none, author: none, date: none) = doc => [
  #set text(font: "New Computer Modern", size: 12pt)
  #set enum(indent: 1em)
  #set list(indent: 1em)
  #set page(margin: 1in, footer: align(center, counter(page).display()))

  #set document(title: title, author: author)
  #make_title(title, author, date)

  #doc
]
