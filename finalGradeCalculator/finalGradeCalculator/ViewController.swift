//
//  ViewController.swift
//  finalGradeCalculator
//
//  Created by Bennett, Christopher on 12/9/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
// THESE ARE THE LABELS THAT DO NOTHING
    @IBOutlet weak var requiredScoreLabel: UILabel!
    @IBOutlet weak var extraCreditLabel: UILabel!
    @IBOutlet weak var letterSegment: UISegmentedControl!
    @IBOutlet weak var pickerViewerGrade: UIPickerView!
    
    
// Text Fields where numbers are entered
    @IBOutlet weak var currentGrade: UITextField!
    @IBOutlet weak var desiredGrade: UITextField!
    @IBOutlet weak var percentageWorth: UITextField!
    let letter = [String](arrayLiteral: "A", "B", "C", "D")


    

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerViewerGrade.delegate = self
        pickerViewerGrade.dataSource = self

    }

    @IBAction func calculateButtonTapped(_ sender: Any) {
        // Get the values from the text fields and convert them to doubles
        guard let currentGrade = Double(currentGrade.text ?? "0"),
            let desiredGrade = Double(desiredGrade.text ?? "0"),
            let examWeight = Double(percentageWorth.text ?? "0") else {
                return
        }

        // Calculate the required score on the final exam
        let requiredScore = (desiredGrade - currentGrade * (1 - examWeight / 100)) / (examWeight / 100)
        // Update the labels with the input values and the calculated result
        requiredScoreLabel.text = "\(requiredScore)%"
        
        if requiredScore == 100 {
            // If the required score is under 100 make the phones background color green
            self.view.backgroundColor = UIColor.red
        } else {
            self.view.backgroundColor = UIColor.gray
            
        }
        
        if desiredGrade >= 101 {
            extraCreditLabel.text = "Ask the teacher for extra credit"
        }
    }
    
    @IBAction func letterGradeSegment(_ sender: UISegmentedControl) {
        switch letterSegment.selectedSegmentIndex {
        case 0:
            desiredGrade.text = "90"
        case 1:
            desiredGrade.text = "80"
        case 2:
            desiredGrade.text = "70"
        case 3:
            desiredGrade.text = "60"
        default:
            break
        }
    }
    
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            // Return the number of columns in the picker view
            return 1
        }
    
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // Return the number of rows in the picker view
            return letter.count
        }

        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            // Return the title for the row in the picker view
            return letter[row]
        }
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedTitle = letter[row]
        if selectedTitle == "A" {
            desiredGrade.text = "90"
        } else if selectedTitle == "B" {
            desiredGrade.text = "80"
        } else if selectedTitle == "C" {
            desiredGrade.text = "70"
        } else if selectedTitle == "D" {
            desiredGrade.text = "60"
        }
    }
}
