//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    var choosenAnswer: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func AnswerChoosen(_ sender: UIButton) {
        sender.backgroundColor = UIColor.white
        choosenAnswer = (sender.titleLabel?.text!)!
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        let currStory = storyBrain.getNextStoryLine(choosenAnswer: choosenAnswer)
        storyLabel.text = currStory.title
        choice1Button.setTitle(currStory.choice1, for: .normal)
        choice2Button.setTitle(currStory.choice2, for: .normal)
        choice1Button.backgroundColor = UIColor.clear
        choice2Button.backgroundColor = UIColor.clear
    }
}

