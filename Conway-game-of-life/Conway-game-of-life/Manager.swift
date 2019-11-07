//
//  Manager.swift
//  Conway-game-of-life
//
//  Created by iago salomon on 31/10/19.
//  Copyright © 2019 iago salomon. All rights reserved.
//

import Foundation

class Manager {
    init(){
    }
    
    static func julgamento(grid: Grid, x: Int  , y: Int){
        let neighbours = calcularNeighbours(grid: grid, x: x, y: y)
        
        if grid.grid[x][y].isAlive(){
            switch neighbours {
            case 0...1:
                grid.newGrid[x][y].kill()
            case 4...10:
                grid.newGrid[x][y].kill()
            case 2...3:
                grid.newGrid[x][y].revive()
            default:
                return
            }
            
        }
            
        else {
            if neighbours == 3{
                grid.newGrid[x][y].revive()
            }else{
                grid.newGrid[x][y] = grid.grid[x][y]
            }
        }
        
    }
    static func calcularNeighbours(grid: Grid, x: Int  , y: Int) -> Int{
        var sum :Int = 0
        for i in -1 ... 1{
            for j in -1 ... 1{
                if x  + i >= 0 && x  + i  < grid.x + 1   && y  + j >= 0 && y  + j < grid.y + 1  {
                    if grid.grid[x  + i][y  + j].isAlive(){
                        if x +  i == x && y + j == y{
                            sum -= 1
                        }

                        sum  += 1
                    }
                    
                }
            }
        }
        return sum
    }
}
