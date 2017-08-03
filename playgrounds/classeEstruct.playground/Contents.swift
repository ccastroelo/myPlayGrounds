//: Playground - noun: a place where people can play

import UIKit

struct Address {
    var streetAddress: String
    var city: String
    var state: String
    var postalCode: String
}

class Person {
    var name: String
    var address: Address
    init(name: String, address: Address) {
        self.name = name
        self.address = address
    }
}

let endereco = Address(streetAddress: "Rua 1", city: "Sao Luis", state: "Ma", postalCode: "75070")

let pessoa1 = Person(name: "Claudio", address: endereco)
let pessoa2 = Person(name: "jose", address: endereco)


pessoa1.address.streetAddress = "Rua 8"

pessoa1.address.streetAddress
pessoa2.address.streetAddress



class Address2 {
    var streetAddress: String
    var city: String
    var state: String
    var postalCode: String
    init (streetAddress: String, city: String, state: String, postalCode: String) {
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.postalCode = postalCode
    }
}

class Person2 {
    var name: String
    var address: Address2
    init(name: String, address: Address2) {
        self.name = name
        self.address = address
    }
}



let endereco2 = Address2(streetAddress: "Rua 1", city: "Sao Luis", state: "Ma", postalCode: "75070")

let pessoa3 = Person2(name: "Claudio", address: endereco2)
let pessoa4 = Person2(name: "jose", address: endereco2)

pessoa3.address.streetAddress = "Rua 8"

pessoa3.address.streetAddress
pessoa4.address.streetAddress
