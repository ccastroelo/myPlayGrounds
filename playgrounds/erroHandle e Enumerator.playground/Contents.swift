//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var erro : String
var motorLigado = false

enum defeito : Error {
    case faltaDeGasolina
    case pneuFurado
    case motor
    case poucaPressao(pressao: Int)
}


func ligaCarro(gasolina: Int, pressaoPneu: Int, motorKM: Int ) throws -> Bool {
    guard gasolina > 0 else {
        throw defeito.faltaDeGasolina
    }
    
    guard pressaoPneu > 5 else {
        if pressaoPneu > 0 {
            throw defeito.poucaPressao(pressao: pressaoPneu)
        }else{
            throw defeito.pneuFurado
        }
    }
    
    guard motorKM < 150000 else{
        throw defeito.motor
    }
    
    return true
    
}

do {
    motorLigado = try ligaCarro(gasolina: 10, pressaoPneu: 2, motorKM: 5000)
}catch defeito.faltaDeGasolina {
    erro = "falta gasolina"
}catch defeito.poucaPressao(let pressao) {
    erro = "pouca pressao \(pressao)"
}catch {
    erro = "pneu furado ou motor"
}

motorLigado




/**********/
enum erro2: Error {
    case RuntimeError(String)
}

func teste(a: Int) throws -> Int {
    if a > 10 {
        throw erro2.RuntimeError("ocorreu um erro")
    }
    return 1
}

// usar try? quando requerido e se trata o nil retornado
let x = try? teste(a: 11)

do {
    let y = try teste(a: 12)
}
catch erro2.RuntimeError(let mensagem){
    print(mensagem)
}

// usar try! quando se tem certeza de q o erro nao vai ocorrer




// muito bom, erro com localizade string

extension String: Error {}

extension String: LocalizedError {
    public var errorDescription: String? { return self }
}

func teste2(a: Int) throws -> Int {
    if a > 10 {
        throw "errrooouuu"
    }
    return 1
}

do {
    let b = try teste2(a: 11)
}
catch {
    error.localizedDescription
}

