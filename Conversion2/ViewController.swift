//
//  ViewController.swift
//  Conversion2
//
//  Created by James on 7/7/15.
//  Copyright (c) 2015 James. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {


    @IBOutlet weak var inchesPicker: UIPickerView!
    @IBOutlet weak var ftTF: UITextField!
    @IBOutlet weak var total: UILabel!
    var footSpecified = 40   // default to 40ft per in
    var fractionSpecified = 0
    
    var inches = [["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19", "20"],["0","1/16","1/8","3/16","1/4","5/16", "3/8", "7/16", "1/2", "9/16", "5/8", "11/16", "3/4", "13/16", "7/8", "15/16"]]
    
    var decimals = [0, 0.0625, 0.125, 0.1875, 0.25, 0.3125, 0.375, 0.4375, 0.5, 0.5625, 0.625, 0.6875, 0.75, 0.8125, 0.875, 0.9375]
    
    
    @IBAction func changedFtPerInch(_ sender: UITextField)
    {
        if let newScale = Int(sender.text!)
        {
            footSpecified = newScale
            calculateAndDisplayTotal()
        }
        else
        {
            sender.text = ""
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        ftTF.resignFirstResponder()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }


    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return inches.count
    }
    
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
    return inches[component].count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return inches[component][row]

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        calculateAndDisplayTotal()
    }
    
    func calculateAndDisplayTotal()
    {
        var theTotal = 0.0
        let wholeRow = inchesPicker.selectedRow(inComponent: 0)  // selected whole part
        let fractionRow = inchesPicker.selectedRow(inComponent: 1)  // selected fraction
        
        let wholePart = Double(footSpecified * Int(inches[0][wholeRow])!)
        theTotal += wholePart
        
        let fractionAsNum = Double(footSpecified) * decimals[fractionRow]
        theTotal += fractionAsNum
        
        total.text = "\(theTotal) ft"
    }
    
}

