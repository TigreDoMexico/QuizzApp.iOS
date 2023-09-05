//
//  ViewController.swift
//  QuizzApp
//
//  Created by David Tigre Moraes on 28/08/23.
//

import UIKit

class MainController: UIViewController {

    @IBOutlet weak var botaoQuizz: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraLayout()
    }
    
    @IBAction func BotaoPressionado(_ sender: Any) {
        print("OLA MUNDO")
    }
    
    func configuraLayout() {
        navigationItem.hidesBackButton = true
        botaoQuizz.layer.cornerRadius = 12.0
    }
}

