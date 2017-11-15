//
//  PlayData.swift
//  iOS-Experiments
//
//  Created by Adland Lee on 11/14/17.
//  Copyright © 2017 4MFD. All rights reserved.
//

import Foundation

class PlayData {
    var allWords = [String]()
    var wordCounts: NSCountedSet!
    
    init() {
        guard let path = Bundle.main.path(forResource: "plays", ofType: "txt") else { return }
        guard let plays = try? String(contentsOfFile: path) else { return }
        
        allWords = plays.components(separatedBy: CharacterSet.alphanumerics.inverted)
        allWords = allWords.filter { $0 != "" }
        
        wordCounts = NSCountedSet(array: allWords)
        allWords = wordCounts.allObjects as! [String]
    }
}
