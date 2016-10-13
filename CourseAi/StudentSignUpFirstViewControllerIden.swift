//
//  ProfSignUpViewController.swift
//  course.io
//
//  Created by Xie kesong on 10/10/16.
//  Copyright © 2016 ___KesongXie___. All rights reserved.
//

import UIKit

class StudentSignUpFirstViewController: UIViewController {

    @IBOutlet weak var fullNameTextField: UITextField!
    
    @IBOutlet weak var universityPickerView: UIPickerView!
    
    @IBAction func rightCornerClose(_ sender: UIButton) {
        self.view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func nextBtnTapped(_ sender: UIButton) {
        if  let fullname = fullNameTextField.text{
            if !fullname.isEmpty{
                if let studentSignUpSecondVC = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIden.StudentSignUpSecondViewControllerIden) as? StudentSignUpSecondViewController{
                    let selectedUniversityIndex = universityPickerView.selectedRow(inComponent: 0)
                    studentSignUpSecondVC.emailExtension = UniversityDataSource.university[selectedUniversityIndex].emailExtension
                    studentSignUpSecondVC.greetingMessageText = fullname.components(separatedBy: CharacterSet.whitespacesAndNewlines).first!
                    self.navigationController?.pushViewController(studentSignUpSecondVC, animated: true)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullNameTextField.delegate = self
        universityPickerView.delegate = self
        universityPickerView.dataSource = self
        let viewTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.viewTapped(gesture:)))
        self.view.addGestureRecognizer(viewTapGesture)
        self.navigationController?.navigationBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    func closeBtnTapped(gesture: UIGestureRecognizer){
        self.view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func viewTapped(gesture: UIGestureRecognizer){
        self.view.endEditing(true)
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

extension StudentSignUpFirstViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension StudentSignUpFirstViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }

    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return UniversityDataSource.university.count
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let optionLabel = UILabel()
        optionLabel.font = UIFont(name: "Avenir-Heavy", size: 16)
        optionLabel.frame.size = CGSize(width: self.view.bounds.size.width, height: 40)
        optionLabel.textAlignment = .center
        optionLabel.text = UniversityDataSource.university[row].name
        optionLabel.textColor = UIColor.white
        return optionLabel
    }
    
}






