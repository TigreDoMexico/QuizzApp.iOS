//
//  QuizzViewController.swift
//  QuizzApp
//
//  Created by David Tigre Moraes on 30/08/23.
//

import UIKit

class QuizzViewController: UIViewController {
    
    var score = 0
    var quizzCurrent = 0
    
    @IBOutlet weak var QuizzTitle: UILabel!
    @IBOutlet var AnswersButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureQuizz()
    }
    
    @IBAction func onClickAnswerButton(_ sender: UIButton) {
        let currentQuizz = quizzes[quizzCurrent]
        
        if sender.tag == currentQuizz.correta {
            score += 1
        }
        
        quizzCurrent += 1
        configureQuizz()
    }
    
    func configureLayout() {
        navigationItem.hidesBackButton = true
        QuizzTitle.numberOfLines = 0
        
        for btn in AnswersButtons {
            btn.layer.cornerRadius = 12.0
        }
    }
    
    func configureQuizz() {
        let currentQuizz = quizzes[quizzCurrent]
        
        QuizzTitle.text = currentQuizz.titulo
        
        for btn in AnswersButtons {
            let btnTitle = currentQuizz.respostas[btn.tag]
            btn.setTitle(btnTitle, for: .normal)
        }
    }
}
