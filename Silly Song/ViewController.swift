//
//  ViewController.swift
//  Silly Song
//
//  Created by Heriberto Ureña madrigal on 12/7/17.
//  Copyright © 2017 Heriberto Ureña Madrigal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"].joined(separator: "\n")

    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        nameField.returnKeyType = UIReturnKeyType.done
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    
    @IBAction func displayLyrics(_ sender: Any) {
        nameField.text = nameField.text?.capitalizingFirstLetter()
        lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text ?? "")
    }
    
    func shortNameFromName(_ name: String) -> String {
        var result = ""
        if !name.isEmpty {
            let vowels : [Character] = ["a", "e", "i", "o", "u"]
            result = name.lowercased()
            for character in result {
                if vowels.contains(character) {
                    if let auxIndex = result.index(of: character) {
                        result = String(result[auxIndex...])
                        break
                    }
                }
            }
        }
        return result
    }
    
    func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
        var result = ""
        if !fullName.isEmpty {
            result = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName).replacingOccurrences(of: "<SHORT_NAME>", with: shortNameFromName(fullName))
        }
        return result
    }
    
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
