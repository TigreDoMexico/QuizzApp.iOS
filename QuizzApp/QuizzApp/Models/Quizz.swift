//
//  Quizz.swift
//  QuizzApp
//
//  Created by David Tigre Moraes on 03/09/23.
//

import Foundation

struct Quizz {
    var titulo: String
    var respostas: [String]
    var correta: Int
}

let quizzes: [Quizz] = [
    Quizz(titulo: "Pergunta 1 Lorem ipsum dolor sit amet", respostas: ["Resposta A", "Resposta B", "Resposta C"], correta: 2),
    Quizz(titulo: "Pergunta 2 Lorem ipsum dolor sit amet", respostas: ["Resposta D", "Resposta E", "Resposta F"], correta: 1),
    Quizz(titulo: "Pergunta 3 Lorem ipsum dolor sit amet, consectetur ", respostas: ["Resposta G", "Resposta H", "Resposta I"], correta: 0),
]
