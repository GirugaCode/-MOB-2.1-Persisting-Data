//
//  ViewController.swift
//  Plist-Exercise
//
//  Created by Ryan Nguyen on 4/3/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    var tableView = UITableView()
    
    var scoresArray = [[String : Any]]()
    
    var scores = [Scores]()
    
    private let tableViewCellId = "CustomTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupTableView()
        setupScoreData()
        userDefaults()
    }
    
    private func setupScoreData() {
        if let readPlist = Plist(name: "FinalScores") {
            let nameAndScores = readPlist.getMutablePlistFile() as! [String: Any]
            scoresArray = nameAndScores["Scores"] as! [[String : Any]]
            
            for item in scoresArray {
                scores.append(Scores(name: String(describing: item["Name"]!), score: String(describing: item["Score"]!)))
            }
        }
    }
    
    private func userDefaults() {
        Defaults.saveToken("RyanToken")
        let newToken = Defaults.getToken()
        if let unwrapped = newToken.token {
            print(unwrapped)
        }
        
        Defaults.clearUserData()
        let noToken = Defaults.getToken()
        if let unwrappedNil = noToken.token {
            print(unwrappedNil)
        }
    }
    
    private func setupTableView() {
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        tableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        
        self.title = "Scores"
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: tableViewCellId)
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
    }

}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId) as! CustomTableViewCell
        let result = scores[indexPath.row]
        cell.nameLabel.text = result.name
        cell.scoreLabel.text = result.score
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Highest Scores 🚀"
    }

}

