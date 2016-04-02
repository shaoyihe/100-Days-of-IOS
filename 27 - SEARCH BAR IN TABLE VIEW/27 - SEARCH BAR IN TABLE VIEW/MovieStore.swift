//
//  MovieStore.swift
//  27 - SEARCH BAR IN TABLE VIEW
//
//  Created by heshaoyi on 4/2/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class MovieStore {
    var movies = [Movie]()
    
    init(){
        ["Iron Man", "Spider Man", "Jaws", "7 Years", "America history x", "Alies", "Java", "Ruby", "Swift", "IOS", "Node", "C#","Python"].forEach{
            movies.append(Movie(name: $0))
        }
        movies = movies.sort()
    }
    
    private static var m = MovieStore();
    class func get()-> MovieStore{
        return m
    }
}
