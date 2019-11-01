//
//  cell.swift
//  Conway-game-of-life
//
//  Created by iago salomon on 31/10/19.
//  Copyright © 2019 iago salomon. All rights reserved.
//

import Foundation

class Cell {
    
    
    init() {
    }
    
    private var  status  = false
    
    
    func isAlive() -> Bool{
        if status == true{
            return true
        }
        return false
    }
    func kill(){
        status = false
    }
    func revive(){
        status = true
    }
}

