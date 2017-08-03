//: Playground - noun: a place where people can play

import UIKit

func compara<A,T>(obj1: T, obj2: A){
    print("teste \(obj1) - \(obj2)")
}

func invert<T>(array: inout [T]) {
    var auxiliar = [T]()
    var k = array.count
    
    for _ in array {
        k = k-1
        auxiliar.append(array[k])
    }
    array = auxiliar
}


var str = "Hello, playground"

var a = 1
var b = 2

compara(obj1: a, obj2: b)

compara(obj1: str, obj2: b)


var letrasENum = ["A", "B", "C", "1", "2", "3"]

invert(array:&letrasENum)

var letrasENum2 = [3, 4, 5, 1, 2, 8]

invert(array:&letrasENum2)


var teste: [Any] = ["A", "B", 1, 2]

invert(array:&teste)
