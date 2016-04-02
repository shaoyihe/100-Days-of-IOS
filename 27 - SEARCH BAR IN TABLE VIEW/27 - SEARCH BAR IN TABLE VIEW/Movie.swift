//
//  Movie.swift
//  27 - SEARCH BAR IN TABLE VIEW
//
//  Created by heshaoyi on 4/2/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class Movie: Equatable, Comparable {
    var name: String;
    
    init(name: String) {
        self.name = name
    }
    
}

func ==(lhs: Movie, rhs: Movie) -> Bool{
    return lhs.name == rhs.name
}

func <(lhs: Movie, rhs: Movie) -> Bool{
    return lhs.name < rhs.name
}