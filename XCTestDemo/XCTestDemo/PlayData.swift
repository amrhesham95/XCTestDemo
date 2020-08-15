//
//  PlayData.swift
//  XCTestDemo
//
//  Created by Amr Hesham on 8/15/20.
//  Copyright © 2020 Amr Hesham. All rights reserved.
//

import Foundation
class PlayData {
    var allWords = [String]()
    var wordCounts = [String: Int]()

    
    init() {
        if let path = Bundle.main.path(forResource: "plays", ofType: "txt") {
            if let plays = try? String(contentsOfFile: path) {
                //to convert a string into an array, but this time the method is different because we pass in a character set rather than string. This new method splits a string by any number of characters rather than a single string, which is important because we want to split on periods, question marks, exclamation marks, quote marks and more.
                allWords = plays.components(separatedBy: CharacterSet.alphanumerics.inverted)
                allWords = allWords.filter({
                    $0 != ""
                })
                
                for word in allWords{
                    wordCounts[word, default:0] += 1
                }
                
                allWords = Array(wordCounts.keys)
            }
        }
    }
}