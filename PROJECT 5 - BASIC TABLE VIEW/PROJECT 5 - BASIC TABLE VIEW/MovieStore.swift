//
//  MovieStore.swift
//  PROJECT 5 - BASIC TABLE VIEW
//
//  Created by heshaoyi on 3/5/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class MovieStore{
    var moives = [Movie]()
    
    init(){
        self.moives.append(Movie("Iron Man"))
        self.moives.append(Movie("SpiderMan"))
        self.moives.append(Movie("BatMan"))
    }
}
