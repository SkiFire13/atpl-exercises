#let exercise_counter = counter("exercise")
#let exercise(content)  = [
  #exercise_counter.step()
  *Exercise #exercise_counter.display().*
  #content
]
