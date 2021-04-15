//
//  GameState.swift
//  RPS
//
//  Created by Paige Holisky on 4/8/21.
//  Copyright © 2021 Paige Holisky. All rights reserved.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    
    var status: String {
        switch self {
        case.start:
            return "Play rock paper scissors?"
        case.win:
            return "Wow! You won!"
        case.lose:
            return "You lost!"
        case.draw:
            return "It's a tie!"
        }
    }
}
