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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultViewController else { return }
        
        let (score, total, percentage) = service.GetQuizzResults()
        
        resultVC.score = score
        resultVC.total = total
        resultVC.percentage = percentage
    }
    
    @IBAction func onClickAnswerButton(_ sender: UIButton) {
        let answerIsCorrect = service.UpdateScoreByOptionSelected(sender.tag)
        
        if answerIsCorrect {
            sender.backgroundColor = UIColor.correctColor
        } else {
            sender.backgroundColor = UIColor.wrongColor
        }
        
        if service.GoToNextQuizz() {
            configureNextQuizz()
        } else {
            goToResult()
        }
    }
    
    func configureLayout() {
        navigationItem.hidesBackButton = true
        QuizzTitle.numberOfLines = 0
        
        for btn in AnswersButtons {
            btn.layer.cornerRadius = 12.0
        }
    }
    
    @objc func configureQuizz() {
        let currentQuizz = service.GetCurrentQuizz()
        
        QuizzTitle.text = currentQuizz.titulo
        
        for btn in AnswersButtons {
            let btnTitle = currentQuizz.respostas[btn.tag]

            btn.setTitle(btnTitle, for: .normal)
            btn.backgroundColor = UIColor.defaultColor
        }
    }
    
    func configureNextQuizz() {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(configureQuizz), userInfo: nil, repeats: false)
    }
    
    func goToResult() {
        performSegue(withIdentifier: "goToResultView", sender: nil)
    }
}
