//
//  QuizzService.swift
//  QuizzApp
//
//  Created by David Tigre Moraes on 04/09/23.
//

import Foundation

class QuizzService {
    
    var score: Int = 0
    var currentQuizz: Int = 0
    
    func UpdateScoreByOptionSelected(_ optionSelected: Int) -> Bool {
        if optionSelected == GetCurrentQuizz().correta {
            score += 1
            return true
        }
        
        return false
    }
    
    func GoToNextQuizz() -> Bool {
        if currentQuizz < (quizzes.count - 1) {
            currentQuizz += 1
            return true
        }
        
        return false
    }
    
    func GetCurrentQuizz() -> Quizz {
        return quizzes[currentQuizz]
    }
    
    func GetQuizzResults() -> (Int, Int, Float) {
        return (
            score: score,
            total: quizzes.count,
            percentage: Float(score) / Float(quizzes.count) * 100.0
        )
    }
}
