//
//  MovieStore.swift
//  14 - JUMPBAR
//
//  Created by heshaoyi on 4/2/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class MovieStore {
    var movies = [Character:[Movie]]()
    var movieIndex = [Int: Character]()
    
    init(_ count: Int = 3){
        let startingValue = Int(("A" as UnicodeScalar).value) // 65
        for i in 0 ..< 26 {
            let key = Character(UnicodeScalar(i + startingValue));
            movieIndex[i] = key
            
            movies[key] = [Movie]()
            for c in 0 ..< count {
                movies[key]?.append(Movie("Test \(key) \(c)"))
            }
        }
    }
    
}