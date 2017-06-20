//
//  SettingTableViewController.swift
//  GitHubSearchRepository
//
//  Created by 藤田哲史 on 2017/06/20.
//  Copyright © 2017年 Akifumi Fujita. All rights reserved.
//

import UIKit


class SettingTableViewController: UITableViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var sortTextField: UITextField!
    @IBOutlet weak var orderTextField: UITextField!
    
    let sortList = ["none", "starts", "forks", "updated"]
    let orderList = ["asc", "desc"]
    
    let sortPickerView = UIPickerView()
    let orderPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sortTextField.delegate = self
        orderTextField.delegate = self
        let screenWidth = self.view.frame.width
        sortTextField.frame = CGRect(x: screenWidth - 205, y: 9, width: 200, height: 40)
        orderTextField.frame = CGRect(x: screenWidth - 205, y: 9, width: 200, height: 40)
        
        sortTextField.text = "none"
        orderTextField.text = "desc"
        
        let toolBar = setUpToolBar()
        let rect: CGRect = CGRect(x: 0, y: 0, width: screenWidth, height: sortPickerView.bounds.size.height)
        
        sortPickerView.delegate = self
        sortPickerView.dataSource = self
        sortPickerView.frame = rect
        let sortView = UIView(frame: sortPickerView.bounds)
        sortView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        sortView.addSubview(sortPickerView)
        sortTextField.inputView = sortView
        sortTextField.inputAccessoryView = toolBar
        
        orderPickerView.delegate = self
        orderPickerView.dataSource = self
        let orderView = UIView(frame: orderPickerView.bounds)
        orderView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        orderView.addSubview(orderPickerView)
        orderTextField.inputView = orderView
        orderTextField.inputAccessoryView = toolBar
        
    }
    
    func setUpToolBar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.donePressed))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelPressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        return toolBar
    }
    
    func donePressed() {
        view.endEditing(true)
    }
    func cancelPressed() {
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case sortPickerView:
            return sortList.count
        case orderPickerView:
            return orderList.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case sortPickerView:
            return sortList[row]
        case orderPickerView:
            return orderList[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case sortPickerView:
            sortTextField.text = sortList[row]
        case orderPickerView:
            orderTextField.text = orderList[row]
        default:
            return
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
