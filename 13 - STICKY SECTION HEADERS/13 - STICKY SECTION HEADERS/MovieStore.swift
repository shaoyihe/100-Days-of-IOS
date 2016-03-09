//
//  MovieStore.swift
//  12 - ADD NEW ITEM
//
//  Created by heshaoyi on 3/9/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class MovieStore {
    
    var moviesDic = [String : [Movie]]()
    var movieIndex = [Int : String]()
    
    init(){
        ["Iron Man", "Spider Man", "Jaws", "7 Years", "America history x", "Alies", "Java", "Ruby", "Swift", "IOS", "Node", "C#","Python"].forEach{
            let nameIndex = $0.startIndex
            let movieIndex = $0.substringToIndex(nameIndex.successor())
            if let _ = moviesDic[movieIndex]{
                moviesDic[movieIndex]?.append(Movie($0))
            }else{
                moviesDic[movieIndex] = [Movie($0)]
            }
        }
        
        for(i , v) in moviesDic.keys.sort({return $0 <= $1}).enumerate() {
            movieIndex[i] = v
        }
        
    }
    
    
}
