import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var scoreLabel: UILabel!
    @IBOutlet weak private var minusButton: UIButton!
    @IBOutlet weak private var plusButton: UIButton!
    @IBOutlet weak private var resetButton: UIButton!
    @IBOutlet weak private var historyTextView: UITextView!
    @IBOutlet weak private var resetHistory: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.text += "История изменений: \n"
        historyTextView.isEditable = false
        
    }
    
    private func data () -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let formattedDate = dateFormatter.string(from: Date())
        return (formattedDate)
        
    }
    
    private func updateScoreLabel() {
        scoreLabel.text = "\(labelScore)"
    }
    var labelScore: Int = 0 {
        didSet {
            updateScoreLabel()
        }
    }
    
    @IBAction private func didPressMinussButton(_ sender: Any) {
        let range = NSRange (location: -1, length: 1)
        historyTextView.scrollRangeToVisible(range)
        
        if labelScore >= 1 {
            labelScore -= 1
        } else {
            return (labelScore = 0)
        }
        
        if labelScore > 0 {
            historyTextView.text += "\(data()) Значение измененно на -1 \n"
        } else {
            return (historyTextView.text += "\(data()) Попытка уменьшить значение счётчика ниже 0 \n")
        }
        
    }
    
    @IBAction private func didPressPlusButton(_ sender: Any) {
        let range = NSRange (location: -1, length: 1)
        historyTextView.scrollRangeToVisible(range)
        
        labelScore += 1
        historyTextView.text += "\(data()) Значение измененно на +1 \n"
        
        
    }
    
    @IBAction private func resetScoreLabel(_ sender: Any) {
        let range = NSRange (location: -1, length: 1)
        historyTextView.scrollRangeToVisible(range)
        
        labelScore = 0
        historyTextView.text += "\(data()) Значение сброшено \n"
    }
    
    @IBAction private func resetHistoryTextView(_ sender: Any) {
        historyTextView.text = "История изменений: \n"
    }
    
}



