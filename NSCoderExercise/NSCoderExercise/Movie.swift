//
//  Movie.swift
//  NSCoderExercise
//
//  Created by Ryan Nguyen on 4/11/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import Foundation

class Movie: NSObject, NSCoding {
    var title: String
    var duration: Int
    
    init(title: String, duration: Int) {
        self.title = title
        self.duration = duration
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let title = aDecoder.decodeObject(forKey: "title") as? String
            else { return nil }
        let duration = aDecoder.decodeInteger(forKey: "duration")
        
        self.init(title: title, duration: duration)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.title, forKey: "title")
        aCoder.encode(self.duration, forKey: "duration")
    }
}
