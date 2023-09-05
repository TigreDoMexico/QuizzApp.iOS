//
//  ResultViewController.swift
//  QuizzApp
//
//  Created by David Tigre Moraes on 05/09/23.
//

import UIKit

class ResultViewController: UIViewController {

    var score: Int?
    var total: Int?
    var percentage: Float?
    
    @IBOutlet weak var scoreResultLabel: UILabel!
    @IBOutlet weak var scorePercentageLabel: UILabel!
    @IBOutlet weak var newQuizzButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureResults()
    }
    
    func configureLayout() {
        navigationItem.hidesBackButton = true
        newQuizzButton.layer.cornerRadius = 12.0
    }
    
    func configureResults() {
        guard let _score = score else { return }
        guard let _total = total else { return }
        guard let _percentage = percentage else { return }
        
        let scoreText = scoreResultLabel.text?
            .replacingOccurrences(of: "{score}", with: String(_score))
            .replacingOccurrences(of: "{total}", with: String(_total))
        
        print(_percentage)
        
        scoreResultLabel.text = scoreText
        
        let percentageText = scorePercentageLabel.text?
            .replacingOccurrences(of: "{percent}", with: String(format: "%.1f", _percentage))
        
        scorePercentageLabel.text = percentageText
    }
}
