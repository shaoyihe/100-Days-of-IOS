//
//  MovieStore.swift
//  12 - ADD NEW ITEM
//
//  Created by heshaoyi on 3/9/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class MovieStore {
    
    var movies = [Movie]()
    
    init(){
        ["Iron Man", "Spider Man"].forEach{ movies.append(Movie($0)) }
    }
    
    
}
