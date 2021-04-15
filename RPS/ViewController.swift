//
//  ViewController.swift
//  RPS
//
//  Created by Paige Holisky on 4/8/21.
//  Copyright © 2021 Paige Holisky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IB Outlets
    
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsbutton: UIButton!
    @IBOutlet weak var lizardButton: UIButton!
    @IBOutlet weak var spockButton: UIButton!
    
    @IBOutlet weak var playAgain: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI(forState: .start)
    }

// MARK: - IB Actions
    @IBAction func rockChosen(_ sender: Any) {
        player(userSign: .rock)
    }
    @IBAction func paperChosen(_ sender: Any) {
        player(userSign: .paper)
    }
    @IBAction func scissorsChosen(_ sender: Any) {
        player(userSign: .scissors)
    }
    @IBAction func lizardChosen(_ sender: Any) {
        player(userSign: .lizard)
    }
    @IBAction func spockChosen(_ sender: Any) {
        player(userSign: .spock)
    }
    
    @IBAction func playAgain(_ sender: Any) {
        updateUI(forState: .start)
    }
    
    
    // MARK : IB - Instances Methods
    func updateUI(forState state: GameState) {
        statusLabel.text = state.status
        
        switch state {
        case.start:
            view.backgroundColor = .lightGray
            
            signLabel.text = "🐼"
            playAgain.isHidden = true
            
            rockButton.isHidden = false
            paperButton.isHidden = false
            scissorsbutton.isHidden = false
            lizardButton.isHidden = false
            spockButton.isHidden = false
            
            rockButton.isEnabled = true
            paperButton.isEnabled = true
            scissorsbutton.isEnabled = true
            lizardButton.isEnabled = true
            spockButton.isEnabled = true
            
        case.win:
            view.backgroundColor = UIColor(red: 0.651, green: 0.792, blue: 0.651, alpha: 1)
        case.lose:
            view.backgroundColor = UIColor(red: 0.851, green: 0.424, blue: 0.412, alpha: 1)
        case.draw:
            view.backgroundColor = UIColor(red: 0.663, green: 0.663, blue: 0.663, alpha: 1)
        }
    }
    
    func player(userSign: Sign) {
    let computerSign = randomSign()
    
    let gameState = userSign.gameState(against: computerSign)
        updateUI(forState: gameState)
        
        signLabel.text = computerSign.emoji
        
        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorsbutton.isHidden = true
        lizardButton.isHidden = true
        spockButton.isHidden = true
        
        
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsbutton.isEnabled = false
        lizardButton.isEnabled = false
        spockButton.isEnabled = false
        
        switch userSign {
        case.rock:
            rockButton.isHidden = false
        case.paper:
            paperButton.isHidden = false
        case.scissors:
            scissorsbutton.isHidden = false
        case.lizard:
            lizardButton.isHidden = false
        case.spock:
            spockButton.isHidden = false
        }
        
        playAgain.isHidden = false
        
    }
}

