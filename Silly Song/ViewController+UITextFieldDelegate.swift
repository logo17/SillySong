//
//  ViewController+UITextFieldDelegate.swift
//  Silly Song
//
//  Created by Heriberto Ureña madrigal on 12/7/17.
//  Copyright © 2017 Heriberto Ureña Madrigal. All rights reserved.
//

import UIKit

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
