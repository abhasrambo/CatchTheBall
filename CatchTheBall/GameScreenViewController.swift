//
//  GameViewController.swift
//  CatchTheBall
//
//  Created by Abhas Kumar on 7/12/20.
//  Copyright © 2020 Abhas Kumar. All rights reserved.
//

import UIKit

class GameScreenViewController: UIViewController {

    @IBOutlet weak var ballOne: UIImageView!
    @IBOutlet weak var ballTwo: UIImageView!
    @IBOutlet weak var ballThree: UIImageView!
    @IBOutlet weak var ballFour: UIImageView!
    @IBOutlet weak var ballFive: UIImageView!
    @IBOutlet weak var ballSix: UIImageView!
    @IBOutlet weak var ballSeven: UIImageView!
    @IBOutlet weak var ballEight: UIImageView!
    @IBOutlet weak var ballNine: UIImageView!
    @IBOutlet weak var ballTen: UIImageView!
    @IBOutlet weak var ballEleven: UIImageView!
    @IBOutlet weak var ballTwelve: UIImageView!
    @IBOutlet weak var scoreBoard: UILabel!
    
    var ballImages = [UIImageView]()
    var score = 0
    var timer = Timer()
    var hideTimer = Timer()
    var heighestScore = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ballImages = [ballOne, ballTwo, ballThree, ballFour, ballFive, ballSix, ballSeven, ballEight, ballNine, ballTen, ballEleven, ballTwelve]
        
        scoreBoard.text = "Score: \(score)"
        
        let recogniserOne = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recogniserTwo = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recogniserThree = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recogniserFour = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recogniserFive = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recogniserSix = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recogniserSeven = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recogniserEight = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recogniserNine = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recogniserTen = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recogniserEleven = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recogniserTwelve = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        ballOne.addGestureRecognizer(recogniserOne)
        ballTwo.addGestureRecognizer(recogniserTwo)
        ballThree.addGestureRecognizer(recogniserThree)
        ballFour.addGestureRecognizer(recogniserFour)
        ballFive.addGestureRecognizer(recogniserFive)
        ballSix.addGestureRecognizer(recogniserSix)
        ballSeven.addGestureRecognizer(recogniserSeven)
        ballEight.addGestureRecognizer(recogniserEight)
        ballNine.addGestureRecognizer(recogniserNine)
        ballTen.addGestureRecognizer(recogniserTen)
        ballEleven.addGestureRecognizer(recogniserEleven)
        ballTwelve.addGestureRecognizer(recogniserTwelve)
    }


    @objc func increaseScore() {
        score = score + 1
        scoreBoard.text = "Score: \(score)"
    }
}
