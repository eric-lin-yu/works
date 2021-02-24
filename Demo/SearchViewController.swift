//
//  SearchViewController.swift
//  Demo
//
//  Created by 則佑林 on 2021/2/23.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var searchButton: UIButton! {
        didSet {
            searchButton.backgroundColor = UIColor.gray
        }
    }
    
    //MARK: 視圖生命週期
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchButton.isEnabled = false
        searchField.addTarget(self, action: #selector(enterName), for:.editingChanged)
        
        
    }
    
    
    //MARK: textField設定
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == searchField {
            numberField.becomeFirstResponder()
        } else {
            textField.endEditing(true)
        }
        return true
    }
    
    @objc func enterName(_ sender: UITextField) {
        //若textField內為空字串，則按鈕無法被選取
        if (searchField.text == "") && (numberField.text == "") {
            searchButton.isEnabled = false
            searchButton.backgroundColor = UIColor.gray
        } else {
            searchButton.isEnabled = true
            searchButton.backgroundColor = UIColor.blue
        }
    }
        
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let search = searchField.text
            let number = numberField.text
            let flickrSrarchVC = segue.destination as! FlickrSearchViewController
            flickrSrarchVC.searchs = search!
            flickrSrarchVC.numbers = number!
            
        }
    }
}
