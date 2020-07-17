//
//  ViewController.swift
//  CatchTheBall
//
//  Created by Abhas Kumar on 7/12/20.
//  Copyright © 2020 Abhas Kumar. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {

    @IBOutlet weak var heighestScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let previousHeighestScore = UserDefaults.standard.object(forKey: "heighestScore")
        if previousHeighestScore == nil {
            heighestScore.text = "Heighest Score: 0"
        } else {
            if let scoreToDisplayAsHeighestScore = previousHeighestScore as? Int{
               heighestScore.text = "Heighest Score: \(String(describing: scoreToDisplayAsHeighestScore))"
            }
            
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let previousHeighestScore = UserDefaults.standard.object(forKey: "heighestScore")
        if previousHeighestScore == nil {
            heighestScore.text = "Heighest Score: 0"
        } else {
            if let scoreToDisplayAsHeighestScore = previousHeighestScore as? Int{
               heighestScore.text = "Heighest Score: \(String(describing: scoreToDisplayAsHeighestScore))"
            }
            
        }
    }

    @IBAction func startGame(_ sender: UIButton) {
        print("Segue Executed")
        DispatchQueue.main.async() {
            self.performSegue(withIdentifier: "toGameScreen", sender: nil)
            
        }

        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toGameScreen" {
//            // as -- casting
//            let destinationVC = segue.destination as! GameScreenViewController
//            destinationVC.myName = userName
//        }
//    }
    
}

