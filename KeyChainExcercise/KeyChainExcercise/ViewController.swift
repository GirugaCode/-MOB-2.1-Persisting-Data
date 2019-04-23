//
//  ViewController.swift
//  KeyChainExcercise
//
//  Created by Ryan Nguyen on 4/10/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit
import KeychainSwift

class ViewController: UIViewController {
    @IBOutlet weak var inputMessage: UITextField!
    @IBOutlet weak var currentMessageResult: UILabel!
    @IBOutlet weak var iCloudSwitch: UISwitch!
    
    let keychain = KeychainSwift()
    let keyName = "my key"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        iCloudSync()
        currentMessageResult.text = keychain.get(keyName)
    }
    
    private func iCloudSync() {
        if iCloudSwitch.isOn {
            keychain.synchronizable = true
            print("on")
        }
        else {
            keychain.synchronizable = false
            print("off")
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        guard let inputText = inputMessage.text else { return }
        keychain.set(inputText, forKey: keyName)
        
        let savedText = keychain.get(keyName)
        currentMessageResult.text = savedText
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        keychain.delete(keyName)
        keychain.clear()
        currentMessageResult.text = keychain.get(keyName)
    }
    
}

