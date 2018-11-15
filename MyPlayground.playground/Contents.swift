//: Playground - noun: a place where people can play

import UIKit




var arrayDeNumeros: [Int] = []


for _ in 0...50 {
    let n = arc4random_uniform(100)
    arrayDeNumeros.append(Int(n))
}

arrayDeNumeros.sort()

print(arrayDeNumeros)


