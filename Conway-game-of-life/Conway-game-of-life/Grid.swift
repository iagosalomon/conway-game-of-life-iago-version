//
//  Grid.swift
//  Conway-game-of-life
//
//  Created by iago salomon on 31/10/19.
//  Copyright © 2019 iago salomon. All rights reserved.
//

import Foundation
import SceneKit
class Grid {
    
    
    var grid : [[Cell]] = []
    var newGrid : [[Cell]] = []
    var manager = Manager()
    
    var x: Int =  0
    var y: Int  = 0
    
    init (colum: Int , row : Int){
        y =  colum
        x = row
        for _ in 0 ... row{
            var acc: [Cell] = []
            for _  in 0 ... colum{
                let i = Int.random(in: 0...20)
                let cell = Cell()
                if i  < 2{
                    cell.revive()
                }else{
                    cell.kill()
                }
                acc.append(cell)
            }
            self.grid.append(acc)
            self.newGrid.append(acc)
        }
    }
    
    

    func updateGrid(){
        grid = newGrid
    }

    func setUpNextGrid(){
        for i in 0 ... x {
            for  j in 0  ... y {
                Manager.julgamento(grid: self, x: i, y: j)
                
            }
        }
        updateGrid()
    }
    
    
}
   
