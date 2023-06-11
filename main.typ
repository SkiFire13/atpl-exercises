#import "template.typ": template

#show: template(
  title: "Advanced Topics in Programming Languages\nExercises",
  author: "Stevanato Giacomo",
  date: "2nd Semester 2022/23",
)

#outline(title: "Table of Exercises")

#for i in range(66) {
  include "exercises/ex" + str(i+1) + ".typ"
}
