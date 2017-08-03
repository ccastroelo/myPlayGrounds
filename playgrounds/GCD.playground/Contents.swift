//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true

var str = "Hello, playground"
// Sync espera a tarefa acabar
// aSync não espera

// 3 tipos de queue
// Main - serial
// Global - concorrentes (prioridades: high, default, low, background)
// Custom - serial ou concorrentes 
// a prioridade de concorrentes queues não é setada diretamente, é especificado um QoS.
// QoS - .default: roda em main - (UI e PEQUENOS trabalhos)
//     - .userInitiated: roda em global high, tarefas iniciadas pela UI, devem ser async, dve ser usada quando o usuário está esperando por um resultado imediato.
//     - .utility: roda em global baixa - longas tarefas normalmente com um indicador de progresso (calculo, I/O, network)
 //    - .background: global background - tarefas de manutenção onde o tempo não é problema.

// atrasando uma execucao (delay)
DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
    print("atraso")
}

DispatchQueue.global(qos: .userInitiated).async {
    // download file
    
    DispatchQueue.main.async {
        // update UI
    }
}
