//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true
URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)


class Usuario {
    var token : String = ""
}


var str = "Hello, playground"

/*  URLSession - manda e recebe http request
    URLSessionConfiguration - diversas configuracoes, timeout, caches, header
      .shared - para basic requests, possui limitacoes
      .default - parecido com o shared, mas deixa receber dados incrementalmente.
      .ephemeral - igual ao default, so que os dados ficam em memoria
      .background - roda em background e executa mesmo apos a saida do app
 
    URLSessionDownloadDelegate - Delegate obtem informacoes de varios eventos:
        falha de autenticacao
        dados chegando
        dados completos, etc
 
    URLSessionTask: (task podem ser canceladas, suspensas e continuadas)
      URLSessionDataTask - http get (manda e recebe dados usando NSData)
      URLSessionUploadTask - http post ou put (similar a DataTask, pode enviar dados em forma de arquivo e em background)
      URLSessionDownloadTask - faz download de um arquivo para um lugar temporario e suporta background download e upload quando a app nao esta rodando (pode ser pausado)
      URLSessionStreamTask - TCP/IP coneccao
 
    a API é async e retorna dados de duas maneiras, no completion quando termina a transferencia, ou para o delegate quando dados são recebidos ou completos
 
*/



func request(tipo: String, completionHandler: @escaping (HTTPURLResponse?, Any) -> ()) {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
    var request = URLRequest(url: url!)
    let usuario : Usuario? = nil
    let body : String? = nil

    request.httpMethod = tipo
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    if usuario != nil {
        let token = "JWT \(usuario!.token)"
        request.addValue(token, forHTTPHeaderField: "Authorization")
    }
    if body != nil {
        //            print(body!)
        let postData = try? JSONSerialization.data(withJSONObject: body!, options: [])
        request.httpBody = postData
    }

    URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {
        (data, response, error) in
        let httpResponse = response as? HTTPURLResponse
        
        if (error != nil) {
            completionHandler(httpResponse, [:])
        }else{
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) //as! [String : Any]
                completionHandler(httpResponse, json)
            }catch let error as NSError{
                completionHandler(httpResponse, [:])
                print(error)
            }
        }
    }).resume()
}

request(tipo: "GET", completionHandler: {
    (httpResponse, json) in
    print(httpResponse as Any)
    print(json as Any)
})
