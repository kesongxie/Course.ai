//
//  ProfessorSignUpSecondViewController.swift
//  course.io
//
//  Created by Xie kesong on 10/11/16.
//  Copyright © 2016 ___KesongXie___. All rights reserved.
//

import UIKit

class ProfessorSignUpSecondViewController: UIViewController {
    
    @IBAction func rightCornerClose(_ sender: UIButton) {
        self.view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var greetingMessageLabel: UILabel!
    
    @IBOutlet weak var extensionLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var professorIdTextField: UITextField!
    
    @IBOutlet weak var termOfUseCheckBox: UIButton!{
        didSet{
            termOfUseCheckBox.layer.borderColor = UIColor(colorLiteralRed: 220 / 255.0, green: 220 / 255.0, blue: 220 / 255.0, alpha: 1).cgColor
            termOfUseCheckBox.layer.borderWidth = 1.0
            termOfUseCheckBox.layer.cornerRadius = 4
        }
    }
    
    
    @IBAction func termOfUseTapped(_ sender: UIButton) {
        checkMarkImageView.isHidden = !checkMarkImageView.isHidden
    }
    
    @IBOutlet weak var checkMarkImageView: UIImageView!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var greetingMessageText: String?{
        didSet{
            self.greetingMessageLabel?.text = greetingMessageText
        }
    }
    
    var emailExtension: String?{
        didSet{
            self.extensionLabel?.text = emailExtension
        }
    }
    
    var activeTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //emailTextField.becomeFirstResponder()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        professorIdTextField.delegate = self
        
        let viewTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.viewTapped(gesture:)))
        self.view.addGestureRecognizer(viewTapGesture)
        if greetingMessageText != nil{
            self.greetingMessageLabel?.text = greetingMessageText
        }
        if emailExtension != nil{
            self.extensionLabel?.text = emailExtension
        }
        
        let keyboardDidShowName = Notification.Name("UIKeyboardDidShowNotification")
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow(notification:)), name: keyboardDidShowName, object: nil)
        
        let keyboardDidHideName = Notification.Name("UIKeyboardDidHideNotification")
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidHide(notification:)), name: keyboardDidHideName, object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    
    func viewTapped(gesture: UIGestureRecognizer){
        self.view.endEditing(true)
    }
    
    func keyboardDidShow(notification: Notification){
        if let keyboardFrameInfo = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
            let keyboardOriginY = keyboardFrameInfo.origin.y
            if activeTextField != nil{
                let activeTextFieldBottomY = activeTextField!.frame.origin.y + activeTextField!.frame.size.height
                if activeTextFieldBottomY - keyboardOriginY > 0{
                    let adjustScrollOffSet = activeTextFieldBottomY - keyboardOriginY + 10
                    UIView.animate(withDuration: 0.3, animations: {
                        self.scrollView.contentOffset.y = adjustScrollOffSet
                        
                    })
                }
            }
        }
    }
    
    func keyboardDidHide(notification: Notification){
        UIView.animate(withDuration: 0.3, animations: {
            self.scrollView.contentOffset.y = 0
        })
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension ProfessorSignUpSecondViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeTextField = textField
        return true
    }
    
    
}
