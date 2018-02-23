//
//  ViewController.swift
//  Quizzler
//
//  Created by Deep Patel
//

import UIKit

class ViewController: UIViewController {

    let allQuestions = QuestionBank()
    var selectedAnswer : Bool = false
    var scoreIncrement : Int = 0
    var questionNumber : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    /*
     * Everytime the view is loaded we want the next question to be called in order to display the next question
     * Also update the UI with the latest question number and score
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
        updateUI()
    }

    
    /**
     * When either true or false is pressed this function is called.
     * Which checks what was pressed using sender.
     * After which updates the variable to the selected answer
     * Makes calls to check answer and also display next question and update the UI
     */
    @IBAction func answerPressed(_ sender: AnyObject) {
        
        //True button has sender tag assigned to 1
        if sender.tag == 1 {
            selectedAnswer = true
            
        //false button has sender tag assigned to 2
        } else if sender.tag == 2 {
            selectedAnswer = false
        }
        
        checkAnswer()
        nextQuestion()
        updateUI()
    }
    
    /*
     * Update the UI by updating the score that the currently hold.
     * Updating the progress label and using the progressHUD also update the progressBar
     */
    func updateUI() {
        progressLabel.text = "\(questionNumber)/13"
        scoreLabel.text = "Score : \(scoreIncrement)"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber)
    }
    
    /*
     * Next question displays the next question.
     * Also Implements the question number
     */
    func nextQuestion() {
        // Since we know that there are 13 questions in the LinkedList, once we reach 13 questions just restart the app
        if questionNumber == 13 {
            //Create an alert letting the user know the questions are all completed and prompting to start again!
            let alert = UIAlertController(title: "Good Job!", message: "All the Questions are completed \n Would you like to start over?", preferredStyle: .alert)
            //Create a alert with an option to restart.
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        } else {
            //Pulling the next question and displaying it.
            questionLabel.text = allQuestions.list[questionNumber].questionText
            //incrementing question number
            questionNumber += 1
        }
        
    }
    
    /*
     * Checks the selectedAnswer is correct or not.
     * Also increments score based on correctness.
     * Showing the correct or not correct with the use progressHUD.
     */
    func checkAnswer() {
        if selectedAnswer == allQuestions.list[questionNumber-1].answer {
            ProgressHUD.showSuccess("Correct !")
            scoreIncrement += 1
        } else {
            ProgressHUD.showError("May be next time!")
        }
    }
    
    /*
     * Set score to 0
     * Set question Number to 0
     * Also display the next question for the user to See the question 1 (again) - After reset
     * Update UI with question number and score number
     */
    func startOver() {
        scoreIncrement = 0
        questionNumber = 0
        nextQuestion()
        updateUI()
    }
    

    
}
