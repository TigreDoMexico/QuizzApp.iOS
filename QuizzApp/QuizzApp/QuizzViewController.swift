//
//  QuizzViewController.swift
//  QuizzApp
//
//  Created by David Tigre Moraes on 30/08/23.
//

import UIKit

class QuizzViewController: UIViewController {
    
    var service = QuizzService()
    
    @IBOutlet weak var QuizzTitle: UILabel!
    @IBOutlet var AnswersButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureQuizz()
    }
    
    @IBAction func onClickAnswerButton(_ sender: UIButton) {
        service.UpdateScoreByOptionSelected(sender.tag)
        if service.GoToNextQuizz() {
            configureQuizz()
        }
    }
    
    func configureLayout() {
        navigationItem.hidesBackButton = true
        QuizzTitle.numberOfLines = 0
        
        for btn in AnswersButtons {
            btn.layer.cornerRadius = 12.0
        }
    }
    
    func configureQuizz() {
        let currentQuizz = service.GetCurrentQuizz()
        
        QuizzTitle.text = currentQuizz.titulo
        
        for btn in AnswersButtons {
            let btnTitle = currentQuizz.respostas[btn.tag]
            btn.setTitle(btnTitle, for: .normal)
        }
    }
}
