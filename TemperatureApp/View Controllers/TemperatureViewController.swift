//
//  TemperatureViewController.swift
//  TemperatureApp
//
//  Created by Benjamin Tincher on 2/8/21.
//

import UIKit

class TemperatureViewController: UIViewController {
    
    //  MARK: OUTLETS
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var startingValueTextField: UITextField!
    @IBOutlet weak var startingUnitLabel: UILabel!
    @IBOutlet weak var resultValueLabel: UILabel!
    @IBOutlet weak var calcCtoFButton: TempButton!
    @IBOutlet weak var calcFtoCButton: TempButton!
    @IBOutlet weak var calculateButton: TempButton!
    @IBOutlet weak var resultStackView: UIStackView!
    @IBOutlet weak var startingStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //  MARK: PROPERTIES
    var isCelsiusStarting: Bool = false
    
    //  MARK: ACTION
    @IBAction func calcCtoFButtonTapped(_ sender: Any) {
        isCelsiusStarting = true
        
        startingValueTextField.text = "0"
        startingUnitLabel.text = "°C"
        resultValueLabel.text = "32°F"
        instructionLabel.text = "Enter the Temperature in Celsius:"
        startingValueTextField.text = ""
        startingValueTextField.becomeFirstResponder()
        
        startingStackView.backgroundColor = UIColor.tempPurple
        resultStackView.backgroundColor = UIColor.tempPeach
        
    }
    
    @IBAction func calcFtoCButtonTapped(_ sender: Any) {
        isCelsiusStarting = false
        
        calcFtoCButton.isHighlighted = true
        
        startingValueTextField.text = "32"
        resultValueLabel.text = "0°C"
        startingUnitLabel.text = "°F"
        instructionLabel.text = "Enter the Temperature in Fahrenheit:"
        startingValueTextField.text = ""
        startingValueTextField.becomeFirstResponder()
        
        startingStackView.backgroundColor = UIColor.tempPeach
        resultStackView.backgroundColor = UIColor.tempPurple
    }
    
    @IBAction func calculateButtonTapped(_ sender: Any) {
        calculate()
    }
    
    //  MARK: METHODS
    func setupView() {
        view.backgroundColor = UIColor.tempAqua
        
        startingStackView.backgroundColor = UIColor.tempPeach
        resultStackView.backgroundColor = UIColor.tempPurple
        startingStackView.layer.cornerRadius = 4
        resultStackView.layer.cornerRadius = 4
        
        calcFtoCButton.backgroundColor = UIColor.tempPeach
        calcFtoCButton.setTitleColor(.black, for: .normal)
        calcCtoFButton.backgroundColor = UIColor.tempPurple
        calcCtoFButton.setTitleColor(.black, for: .normal)
        
        calculateButton.backgroundColor = .systemBlue
        calculateButton.setTitleColor(.white, for: .normal)
        
    }
    
    func calculate() {
        
        guard let startingValueString = startingValueTextField.text,
              let startingValue = Double(startingValueString) else { return }
        
        if isCelsiusStarting {
            
            let resultValue = ( startingValue * 9 / 5 ) + 32
            resultValueLabel.text = String(format: "%.1f", resultValue) + "°F"
            
        } else {
            
            let resultValue = ( startingValue - 32 ) * 5 / 9
            resultValueLabel.text = String(format: "%.1f", resultValue) + "°C"
        }
    }
    
}
