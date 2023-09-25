//
//  ViewController.swift
//  Counter
//
//  Created by user on 22.09.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var history: UITextView!
    @IBOutlet weak var resetHistory: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        history.text += "История изменений: \n"
        history.isEditable = false

    }
    
    func data () -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let formattedDate = dateFormatter.string(from: Date())
        return (formattedDate)
        
    }
        
        private func updateScoreLabel() {
            score.text = "\(labelScore)"
        }
        var labelScore: Int = 0 {
            didSet {
                updateScoreLabel()
            }
        }
        
        @IBAction func minus(_ sender: Any) {
            let range = NSRange (location: -1, length: 1)
            history.scrollRangeToVisible(range)
            
            if labelScore >= 1 {
                labelScore -= 1
            } else {
                return (labelScore = 0)
            }
            if labelScore > 0 {
                history.text += "\(data()) Значение измененно на -1 \n"
            } else {
                return (history.text += "\(data()) Попытка уменьшить значение счётчика ниже 0 \n")
            }
            
        }
        
        @IBAction func plus(_ sender: Any) {
            let range = NSRange (location: -1, length: 1)
            history.scrollRangeToVisible(range)

            labelScore += 1
            history.text += "\(data()) Значение измененно на +1 \n"
            
            
        }
        
        @IBAction func resetScore(_ sender: Any) {
            let range = NSRange (location: -1, length: 1)
            history.scrollRangeToVisible(range)

            labelScore = 0
            history.text += "\(data()) Значение сброшено \n"
        }
        
        @IBAction func resetHistory(_ sender: Any) {
            history.text = "История изменений: \n"
        }
        
    }
    
    

