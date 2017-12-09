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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        var result = name.lowercased()
        result.remove(at: result.startIndex)
        return result
    }
    
    func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
        let result = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName).replacingOccurrences(of: "<SHORT_NAME>", with: shortNameFromName(fullName))
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
