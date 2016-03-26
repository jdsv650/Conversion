//
//  DecimalToInchesViewController.swift
//  Conversion2
//
//  Created by James on 11/19/15.
//  Copyright © 2015 James. All rights reserved.
//

import UIKit

class DecimalToInchesViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    @IBOutlet weak var num1Picker: UIPickerView!
    @IBOutlet weak var num2Picker: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var FeetAndInchesLabel: UILabel!
    
     var whole = [["0","1","2","3","4","5","6","7","8","9"],
                   ["0","1","2","3","4","5","6","7","8","9"],
                   ["0","1","2","3","4","5","6","7","8","9"],
                   ["."],
                   ["0","1","2","3","4","5","6","7","8","9"],
                   ["0","1","2","3","4","5","6","7","8","9"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        num1Picker.selectRow(6, inComponent: 0, animated: true)
        num1Picker.selectRow(2, inComponent: 1, animated: true)
        num1Picker.selectRow(9, inComponent: 2, animated: true)
        num1Picker.selectRow(9, inComponent: 4, animated: true)
        num1Picker.selectRow(5, inComponent: 5, animated: true)

        
        // Do any additional setup after loading the view.
        num2Picker.selectRow(6, inComponent: 0, animated: true)
        num2Picker.selectRow(2, inComponent: 1, animated: true)
        num2Picker.selectRow(8, inComponent: 2, animated: true)
        num2Picker.selectRow(4, inComponent: 4, animated: true)
        num2Picker.selectRow(5, inComponent: 5, animated: true)

        
        //get the part after . decimalPicker.selectedRowInComponent(4)
    }
    
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
            return whole.count
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return whole[component].count
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return whole[component][row]
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        var decimal1AsString: String = ""
        var decimal2AsString: String = ""
        
        
        let number1AsString = whole[0][num1Picker.selectedRowInComponent(0)] + whole[1][num1Picker.selectedRowInComponent(1)] + whole[2][num1Picker.selectedRowInComponent(2)]
            
      //  let number1AsInteger = (number1AsString as NSString).integerValue
            decimal1AsString = "\(number1AsString).\(num1Picker.selectedRowInComponent(4))\(num1Picker.selectedRowInComponent(5))"
     
            let number2AsString = whole[0][num2Picker.selectedRowInComponent(0)] + whole[1][num2Picker.selectedRowInComponent(1)] + whole[2][num2Picker.selectedRowInComponent(2)]
        
           // let number2AsInteger = (number2AsString as NSString).integerValue
              decimal2AsString = "\(number2AsString).\(num2Picker.selectedRowInComponent(4))\(num2Picker.selectedRowInComponent(5))"
    
        
        let num1AsDouble = (decimal1AsString as NSString).doubleValue
        let num2AsDouble = (decimal2AsString as NSString).doubleValue

        let result = num1AsDouble - num2AsDouble
        
        let rounded = roundToPlaces(result, places: 5)
        
        resultLabel.text = "\(rounded)"
        displayInFeetAndInches(rounded)

    }
    
    
    func displayInFeetAndInches(result :Double)
    {
        
        let feet = Int(result)
        let inchesAsDecimal = result - Double(feet)
        
        
        FeetAndInchesLabel.text = "Feet = \(feet) Inches = \(inchesAsDecimal * 12)"
        
    }
    

    func roundToPlaces(value:Double, places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(value * divisor) / divisor
    }
    

}
