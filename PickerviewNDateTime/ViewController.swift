//
//  ViewController.swift
//  PickerviewNDateTime
//
//  Created by PASHA on 06/08/18.
//  Copyright © 2018 Pasha. All rights reserved.
//

import UIKit

class ViewController:  UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var timeLbl: UILabel!
    
    @IBOutlet weak var myTF: UITextField!
    
    let items = ["Normal","Medium","Large"]
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerView()
        dissmissToolbar()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func whiteTap(_ sender: Any) {
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
    @IBAction func redTap(_ sender: Any) {
        
        UIApplication.shared.statusBarStyle = .default
    }
    
    var timer = Timer()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTime(){
        
        let timeFormater = DateFormatter()
        timeFormater.dateStyle = .medium
        timeFormater.timeStyle = .medium
        let timeStr = timeFormater.string(from: Date() as Date)
        
        timeLbl.text = timeStr
        
    }
    func createPickerView(){
        
        let pickerView = UIPickerView()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        myTF.inputView = pickerView
    }
    
    func dissmissToolbar()
    {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dissmissTF))
        let dones = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: #selector(dissmissTF))
        toolbar.setItems([dones,done], animated: true)
        toolbar.isUserInteractionEnabled = true
        myTF.inputAccessoryView = toolbar
        
    }
    
    @objc  func dissmissTF(){
        
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myTF.text = items[row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

