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
    var wordCounts = [String: Int]()
    
    init() {
        guard let path = Bundle.main.path(forResource: "plays", ofType: "txt") else { return }
        guard let plays = try? String(contentsOfFile: path) else { return }
        
        allWords = plays.components(separatedBy: CharacterSet.alphanumerics.inverted)
        allWords = allWords.filter { $0 != "" }
        
        for word in allWords {
            if wordCounts[word] == nil {
                wordCounts[word] = 0
            }
            
            wordCounts[word]! += 1
        }
        
        allWords = Array(wordCounts.keys)
    }
}
