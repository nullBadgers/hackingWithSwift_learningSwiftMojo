//
//  ViewController.swift
//  hws_project2
//
//  Created by mojo on 27/04/2020.
//  Copyright © 2020 Mojo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0  //property that holds the correct answer
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        //creates a border 1px wide around each button
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        //this creates a light grey border around each button
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion()
        
        let segmentBarItem = UIBarButtonItem(customView: segmentedControl)
        navigationItem.rightBarButtonItem = segmentBarItem
        
    }
    
    // NIL = there is no UI action for this
    func askQuestion(action: UIAlertAction! = nil) {
        
        //this will shuffle all the countries in the array
        countries.shuffle()
        
        //give me a value between 0 and 2 inclusive
        correctAnswer = Int.random(in: 0...2)
        
        //button1.setImage sets the UIImage
        //for .normal sets the standard state of the button
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String
        
        //this will display the current score and add or subtract depeding the answer selected
        if sender.tag == correctAnswer {
            title = "WIN"
            score += 1
        } else {
            title = "NEIN"
            score -= 1
        }
                
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        //users the UIAlert type to add a button to the alert to the user
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        //UIAlertControler to the first parameter
        present(ac ,animated: true)
    }
    
}

