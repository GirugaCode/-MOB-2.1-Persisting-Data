//
//  ViewController.swift
//  UnitTestingPractice
//
//  Created by Ryan Nguyen on 4/8/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(testTextField)
        self.title = "This is a test title"
        self.testTextField.placeholder = "This is a test placeholder"
        _ = vowelsInAString(string: "GoCrazyahahahahahahah")
        _ = makeTitle(string: "the most epic title")
        
    }
    
    func vowelsInAString(string: String) -> Int {
        let vowels: [Character] = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        var numberOfVowels = 0
        for character in string {
            if vowels.contains(character) {
                numberOfVowels +=  1
            }
        }
        return numberOfVowels
    }
    
    func makeTitle(string: String) -> String {
        let words = string.components(separatedBy: " ")
        
        var headline = ""
        for var word in words {
            let firstCharacter = word.remove(at:word.startIndex)
            headline += "\(String(firstCharacter).uppercased())\(word) "
        }
        
//        headline.remove(at:headline.endIndex)
        return String(headline.dropLast())
    }
}

