//
//  ViewController.swift
//  Magic 8 Ball - Challenge
//
//  Created by School on 2017-11-18.
//  Copyright © 2017 DeepxD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelChanger: UILabel!
    @IBOutlet weak var ballImage1: UIImageView!
    var randomizerBallImage : Int = 0
    
    // Different ball images show different answers
    let ballImagesArray = ["ball1","ball2","ball3","ball4","ball5",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     * Call the function shakeOrAskPressed when the button ask is pressed.
     */
    @IBAction func askPressed(_ sender: UIButton) {
        shakeOrAskPressed()
    }
    
    /**
     * The shakeOrAskPressed method
     * Randomizes a number between 1 to 5
     * Changes the top label text and then new image according to the randomized number
     */
    func shakeOrAskPressed(){
        randomizerBallImage = Int(arc4random_uniform(5))
        
        labelChanger.text = "Told you so! Goodluck!"
        labelChanger.center.x = self.view.center.x
        labelChanger.sizeToFit()
        
        ballImage1.image = UIImage(named: ballImagesArray[randomizerBallImage])
    }
    
    /**
     * Call the function shakeOrAskPressed when the phone is shaked.
     */
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        shakeOrAskPressed()
    }
    
}

