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
    var counter = 0
    var checkrandomRepeat = 0
    var level = 1
    
    
    
    
    
    
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
        
        counter = 20
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(hideBall), userInfo: nil, repeats: true)
        hideBall()
        
        let previousHeighestScore = UserDefaults.standard.object(forKey: "heighestScore")
        if let bestScore = previousHeighestScore as? Int {
            heighestScore = bestScore
        }
    }


    @objc func increaseScore() {
        score = score + 1
        scoreBoard.text = "Score: \(score)"
    }
    
    @objc func hideBall(){
        for ball in ballImages {
            ball.isHidden = true
        }
     
        var random = Int(arc4random_uniform(UInt32(ballImages.count-1)))
        if checkrandomRepeat == random{
            random = Int(arc4random_uniform(UInt32(ballImages.count-1)))
        } else {
            checkrandomRepeat = random
        }
        ballImages[random].isHidden = false
    }
    
    @objc func countDown(){
        
            counter = counter - 1
            if counter == 0 {
                level += 1
                timer.invalidate()
                hideTimer.invalidate()
                
                for ball in ballImages{
                    ball.isHidden = true
                }
                if score > heighestScore {
                    heighestScore = score
                    UserDefaults.standard.set(heighestScore, forKey: "heighestScore")
                }
                
                if level == 9{
                          level = 0
                          let alert = UIAlertController(title: "Game Complete", message: "Yasss!!! You have completed the game. Want to replay?", preferredStyle: UIAlertController.Style.alert)
                          let okButton = UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel, handler: nil)
                          let replayButton = UIAlertAction(title: "Let's Play", style: UIAlertAction.Style.default) { (UIAlertAction) in
                              //replay function
                              
                              //self.level = self.level + 1
                              print("level: \(self.level)")
                            self.score = 0
                              self.scoreBoard.text = "Score: \(self.score)"
                              self.counter = 20
                              
                              
                              let levelProgressHideInterval = (1.0 - ((Double(self.level)-1.0)/10.0))
                              print(levelProgressHideInterval)
                              self.timer = Timer.scheduledTimer(timeInterval:1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                              self.hideTimer = Timer.scheduledTimer(timeInterval: levelProgressHideInterval, target: self, selector: #selector(self.hideBall), userInfo: nil, repeats: true)
                          }
                          
                          alert.addAction(okButton)
                          alert.addAction(replayButton)
                          self.present(alert, animated: true, completion: nil)
                          
                } else {
                    let alert = UIAlertController(title: "Level \(level - 1) Complete", message: "Ready to speed up things to next level?", preferredStyle: UIAlertController.Style.alert)
                              let okButton = UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel, handler: nil)
                              
                              let replayButton = UIAlertAction(title: "Let's Play", style: UIAlertAction.Style.default) { (UIAlertAction) in
                                  //replay function
                                  
                                  //self.score = 0
                                  //self.level = self.level + 1
                                  print("level: \(self.level)")
                                  self.scoreBoard.text = "Score: \(self.score)"
                                  self.counter = 20
                                  
                                  
                                  let levelProgressHideInterval = (1.0 - ((Double(self.level)-1.0)/10.0))
                                  print(levelProgressHideInterval)
                                  self.timer = Timer.scheduledTimer(timeInterval:1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                                  self.hideTimer = Timer.scheduledTimer(timeInterval: levelProgressHideInterval, target: self, selector: #selector(self.hideBall), userInfo: nil, repeats: true)
                              }
                              
                              alert.addAction(okButton)
                              alert.addAction(replayButton)
                              self.present(alert, animated: true, completion: nil)
                }
            
            
          
            
            
            }}
        }

