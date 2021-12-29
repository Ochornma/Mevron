//
//  ViewController.swift
//  Mevron Test
//
//  Created by GIGL iOS on 29/12/2021.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var activeButton: UIButton!
    @IBOutlet weak var inActiveButton: UIButton!
    @IBOutlet weak var resendButton: UIButton!
    @IBOutlet weak var incorrectButton: UIButton!
    @IBOutlet weak var otp1: UITextField!
    @IBOutlet weak var otp2: UITextField!
    @IBOutlet weak var otp3: UITextField!
    @IBOutlet weak var otp4: UITextField!
    @IBOutlet weak var otp5: UITextField!
    @IBOutlet weak var otp6: UITextField!
    
    
    @IBOutlet weak var otp1View: UIView!
    @IBOutlet weak var otp2View: UIView!
    @IBOutlet weak var otp3View: UIView!
    @IBOutlet weak var otp4View: UIView!
    @IBOutlet weak var otp5View: UIView!
    @IBOutlet weak var otp6View: UIView!
    
    var currentTextField: UITextField!
    
    var token = ""{
        didSet{
            checkToken()
           
        }
    }
    
    var timer: Timer?
    var timeleft = 60
    
    var textFieldActiceColor = UIColor(displayP3Red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
    var textFieldInacticeColor = UIColor(displayP3Red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)
    var textFieldIncorrectColor = UIColor(displayP3Red: 224/255, green: 30/255, blue: 30/255, alpha: 1.0)
    var resendActiceColor = UIColor(displayP3Red: 245/255, green: 117/255, blue: 25/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        otp1.addTarget(self, action: #selector(textEntered(textField:)), for: .editingChanged)
        otp2.addTarget(self, action: #selector(textEntered(textField:)), for: .editingChanged)
        otp3.addTarget(self, action: #selector(textEntered(textField:)), for: .editingChanged)
        otp4.addTarget(self, action: #selector(textEntered(textField:)), for: .editingChanged)
        otp5.addTarget(self, action: #selector(textEntered(textField:)), for: .editingChanged)
        otp6.addTarget(self, action: #selector(textEntered(textField:)), for: .editingChanged)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timedown), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @objc func timedown(){
           // print(timeleft.asString())
            timeleft -= 1
            let timerText1 = "\(secondTomin(second: timeleft))"
           // timerLabel.text = "0:\(timerText1)"
        resendButton.setTitle("Resend Code in \(timerText1)", for: .normal)
            if timeleft <= 0 {
                timer?.invalidate()
                timer = nil
                resendButton.setTitleColor(resendActiceColor, for: .normal)
                resendButton.tintColor = resendActiceColor
                resendButton.setImage(UIImage(named: "retry2"), for: .normal)
            }
        }
    
    
    
    func secondTomin(second: Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        let formattdString = formatter.string(from: TimeInterval(second))!
        return formattdString
    }
    
    
    
    @objc func textEntered(textField: UITextField){
        
        if textField.text!.utf16.count == 1{
            switch textField{
            case otp1:
              
                otp2.becomeFirstResponder()
            case otp2:
           
                otp3.becomeFirstResponder()
            case otp3:
             
                otp4.becomeFirstResponder()
            case otp4:
            
                otp5.becomeFirstResponder()
            case otp5:
              
                otp6.becomeFirstResponder()
            case otp6:
                token = "\(otp1.text!)\(otp2.text!)\(otp3.text!)\(otp4.text!)\(otp5.text!)\(otp6.text!)"
                
            default:
                print("")
            }
        }else if (textField.text!.isEmpty){
            switch textField{
            case otp6:
              
                otp5.becomeFirstResponder()
            case otp5:
           
                otp4.becomeFirstResponder()
            case otp4:
             
                otp3.becomeFirstResponder()
            case otp3:
            
                otp2.becomeFirstResponder()
            case otp2:
              
                otp1.becomeFirstResponder()
            case otp1:
                token = "\(otp1.text!)\(otp2.text!)\(otp3.text!)\(otp4.text!)\(otp5.text!)\(otp6.text!)"
                
            default:
                print("")
            }
        }
    }
    
    func checkToken(){
        if token.count == 6 {
            if token == "123456" {
                activeButton.isHidden = false
                inActiveButton.isHidden = true
                incorrectButton.isHidden = true
            }else{
                activeButton.isHidden = true
                inActiveButton.isHidden = false
                incorrectButton.isHidden = false
                otp1View.backgroundColor = textFieldIncorrectColor
                otp2View.backgroundColor = textFieldIncorrectColor
                otp3View.backgroundColor = textFieldIncorrectColor
                otp4View.backgroundColor = textFieldIncorrectColor
                otp5View.backgroundColor = textFieldIncorrectColor
                otp6View.backgroundColor = textFieldIncorrectColor
                
                otp1.textColor = textFieldIncorrectColor
                otp2.textColor = textFieldIncorrectColor
                otp3.textColor = textFieldIncorrectColor
                otp4.textColor = textFieldIncorrectColor
                otp5.textColor = textFieldIncorrectColor
                otp6.textColor = textFieldIncorrectColor
            }
        }else{
            activeButton.isHidden = true
            inActiveButton.isHidden = false
            incorrectButton.isHidden = true
            
            placeActiveColor(textField: currentTextField)
            
            otp1.textColor = textFieldActiceColor
            otp2.textColor = textFieldActiceColor
            otp3.textColor = textFieldActiceColor
            otp4.textColor = textFieldActiceColor
            otp5.textColor = textFieldActiceColor
            otp6.textColor = textFieldActiceColor
        }
 
    }
    
    func placeActiveColor(textField: UITextField){
        switch textField{
        case otp1:
            otp1View.backgroundColor = textFieldActiceColor
            otp2View.backgroundColor = textFieldInacticeColor
            otp3View.backgroundColor = textFieldInacticeColor
            otp4View.backgroundColor = textFieldInacticeColor
            otp5View.backgroundColor = textFieldInacticeColor
            otp6View.backgroundColor = textFieldInacticeColor
            
        case otp2:
            otp2View.backgroundColor = textFieldActiceColor
            otp1View.backgroundColor = textFieldInacticeColor
            otp3View.backgroundColor = textFieldInacticeColor
            otp4View.backgroundColor = textFieldInacticeColor
            otp5View.backgroundColor = textFieldInacticeColor
            otp6View.backgroundColor = textFieldInacticeColor
        case otp3:
            otp3View.backgroundColor = textFieldActiceColor
            otp2View.backgroundColor = textFieldInacticeColor
            otp1View.backgroundColor = textFieldInacticeColor
            otp4View.backgroundColor = textFieldInacticeColor
            otp5View.backgroundColor = textFieldInacticeColor
            otp6View.backgroundColor = textFieldInacticeColor
        case otp4:
            otp4View.backgroundColor = textFieldActiceColor
            otp2View.backgroundColor = textFieldInacticeColor
            otp3View.backgroundColor = textFieldInacticeColor
            otp1View.backgroundColor = textFieldInacticeColor
            otp5View.backgroundColor = textFieldInacticeColor
            otp6View.backgroundColor = textFieldInacticeColor
        case otp5:
            otp5View.backgroundColor = textFieldActiceColor
            otp2View.backgroundColor = textFieldInacticeColor
            otp3View.backgroundColor = textFieldInacticeColor
            otp4View.backgroundColor = textFieldInacticeColor
            otp1View.backgroundColor = textFieldInacticeColor
            otp6View.backgroundColor = textFieldInacticeColor
        case otp6:
            otp6View.backgroundColor = textFieldActiceColor
            otp2View.backgroundColor = textFieldInacticeColor
            otp3View.backgroundColor = textFieldInacticeColor
            otp4View.backgroundColor = textFieldInacticeColor
            otp5View.backgroundColor = textFieldInacticeColor
            otp1View.backgroundColor = textFieldInacticeColor
        default:
            print("")
        }
    }


}

extension ViewController: UITextFieldDelegate{
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text!.utf16.count == 1 && !string.isEmpty {
            switch textField{
            case otp1:
                otp2.text = string
                otp2.becomeFirstResponder()
            case otp2:
                otp3.text = string
                otp3.becomeFirstResponder()
            case otp3:
                otp4.text = string
                otp4.becomeFirstResponder()
            case otp4:
                otp5.text = string
                otp5.becomeFirstResponder()
            case otp5:
                otp6.text = string
                otp6.becomeFirstResponder()
                
            default:
                print("")
            }
            token = "\(otp1.text!)\(otp2.text!)\(otp3.text!)\(otp4.text!)\(otp5.text!)\(otp6.text!)"
            print("token is \(token)")
            return false
        }else{
            return true
        }
    }
    
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextField = textField
    placeActiveColor(textField: currentTextField)
        
        token = "\(otp1.text!)\(otp2.text!)\(otp3.text!)\(otp4.text!)\(otp5.text!)\(otp6.text!)"
        print("token2 is \(token)")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField{
        case otp1:
            otp1View.backgroundColor = textFieldInacticeColor
        case otp2:
            otp2View.backgroundColor = textFieldInacticeColor
        case otp3:
            otp3View.backgroundColor = textFieldInacticeColor
        case otp4:
            otp4View.backgroundColor = textFieldInacticeColor
        case otp5:
            otp5View.backgroundColor = textFieldInacticeColor
        case otp6:
            otp6View.backgroundColor = textFieldInacticeColor
        default:
            print("")
        }
        token = "\(otp1.text!)\(otp2.text!)\(otp3.text!)\(otp4.text!)\(otp5.text!)\(otp6.text!)"
        print("token3 is \(token)")
    }
}

