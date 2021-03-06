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
    private(set) var filteredWords = [String]()
    
    init() {
        guard let path = Bundle.main.path(forResource: "plays", ofType: "txt") else { return }
        guard let plays = try? String(contentsOfFile: path) else { return }
        
        allWords = plays.components(separatedBy: CharacterSet.alphanumerics.inverted)
        allWords = allWords.filter { $0 != "" }
        
        wordCounts = NSCountedSet(array: allWords)
        let sorted = wordCounts.allObjects.sorted {
            wordCounts.count(for: $0) > wordCounts.count(for: $1)
        }
        allWords = sorted as! [String]
        
//        filteredWords = allWords
        applyUserFilter("swift")
    }
    
    func applyUserFilter(_ input: String) {
        if let userNumber = Int(input) {
            applyFilter { self.wordCounts.count(for: $0) >= userNumber }
        }
        else {
            applyFilter { $0.range(of: input, options: .caseInsensitive) != nil }
        }
    }
    
    func applyFilter(_ filter: (String) -> Bool) {
        filteredWords = allWords.filter(filter)
    }
}
