//
//  ViewController.swift
//  NSCoderExercise
//
//  Created by Ryan Nguyen on 4/11/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
//    var movie = DataStore.shared
    
    @IBOutlet weak var movieTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDuration: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)

    }
    
    @IBAction func saveButton(_ sender: Any) {
        guard let movieText = movieTextField.text else { return }
        guard let durationValue = durationTextField.text else { return }
        let defaults = UserDefaults.standard
        
        do {
            let movieData = try NSKeyedArchiver.archivedData(withRootObject: Movie(title: movieText, duration: Int(durationValue)!), requiringSecureCoding: false)
            defaults.set(movieData, forKey: "movie")
        } catch {
            print("Could not write file")
        }
    }
    

    @IBAction func listMovies(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        do {
            guard let movieData = defaults.object(forKey: "movie") as? Data else { return }
            guard let movie = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(movieData) as? Movie else {return}
            movieTitle.text = movie.title
            movieDuration.text = String(movie.duration)
        } catch {
            print("Could not read file")
        }
    }
    
}

