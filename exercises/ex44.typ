#import "../common.typ": *

// Note 15 ex 1
#exercise[
  Show the derivations of the judgments
  - ${ell: {a: Nat, b: Nat}, ell': {m: Nat}} <: {ell: {a: Nat}, ell': {m: Nat}}$
  - ${ell: {a: Nat, b: Nat}, ell': {m: Nat}} <: {ell: {b: Nat}}$
]
#solution[
  #align(center, text(size: 11pt, box(prooftree(
    axiom(label: SUB-WIDTH, ${a: Nat, b: Nat} <: {a: Nat}$),
    axiom(label: REFLEX, ${m: Nat} <: {m: Nat}$),
    rule(n: 2, label: SUB-DEPTH, ${ell: {a: Nat, b: Nat}, ell': {m: Nat}} <: {ell: {a: Nat}, ell': {m: Nat}}$),
  ))))

  #align(center, text(size: 7.2pt, box(prooftree(
    axiom(label: SUB-WIDTH, ${ell: {a: Nat, b: Nat}, ell': {m: Nat}} <: {ell: {a: Nat, b: Nat}}$),
    axiom(label: SUB-WIDTH, ${a: Nat, b: Nat} <: {b: Nat}$),
    rule(label: SUB-DEPTH, ${ell: {a: Nat, b: Nat}} <: {ell: {b: Nat}}$),
    rule(n: 2, label: TRANS, ${ell: {a: Nat, b: Nat}, ell': {m: Nat}} <: {ell: {b: Nat}}$),
  ))))
]
