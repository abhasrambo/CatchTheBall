//
//  ViewController.swift
//  CatchTheBall
//
//  Created by Abhas Kumar on 7/12/20.
//  Copyright © 2020 Abhas Kumar. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

