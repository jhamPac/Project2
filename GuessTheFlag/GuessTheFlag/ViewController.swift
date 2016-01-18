//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by jhampac on 1/18/16.
//  Copyright © 2016 jhampac. All rights reserved.
//

import GameplayKit
import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGrayColor().CGColor
        button2.layer.borderColor = UIColor.lightGrayColor().CGColor
        button3.layer.borderColor = UIColor.lightGrayColor().CGColor
        askQuestion()
    }
    
    @IBAction func buttonTapped(sender: UIButton)
    {
        var title: String
        
        if sender.tag == correctAnswer
        {
            title = "Correct"
            ++score
        }
        
        else
        {
            title = "Wrong"
            --score
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Contine", style: .Default, handler: askQuestion)
        ac.addAction(action)
        presentViewController(ac, animated: true, completion: nil)
    }
    
    
    // sets button images
    func askQuestion(action: UIAlertAction! = nil)
    {
        // randomize array
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
        
        // hardcode to set images to be the first 3 in the array
        button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        button3.setImage(UIImage(named: countries[2]), forState: .Normal)
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
        title = countries[correctAnswer].uppercaseString
    }
}

