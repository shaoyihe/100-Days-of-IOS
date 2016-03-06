//
//  ItemStore.swift
//  PROJECT 11 - DELETING AND REARRANGING
//
//  Created by heshaoyi on 3/6/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import Foundation

class ItemStore {
    var items = [Item]()
    
    init(){
        ["Milk", "Apples", "Ham", "Eggs"].forEach{items.append(Item($0))}
    }
    
    func move(from: Int, to: Int){
        let item = items.removeAtIndex(from)
        items.insert(item, atIndex: to)
    }
}