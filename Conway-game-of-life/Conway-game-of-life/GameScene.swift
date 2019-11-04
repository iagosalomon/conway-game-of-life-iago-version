//
//  GameScene.swift
//  Conway-game-of-life
//
//  Created by iago salomon on 01/11/19.
//  Copyright © 2019 iago salomon. All rights reserved.
//

import Foundation
import SceneKit

class GameScene: SCNScene {
    
    var grid = Grid(colum: 32,row: 32)
    var manager = Manager()
    var nodesReferences :[SCNNode] = []
    
    override init() {
        super.init()
        
        let geometry = SCNBox(width: 0.6 , height: 0.6,
                              length: 0.1, chamferRadius: 0.005)
        geometry.firstMaterial?.diffuse.contents = UIColor.red
        geometry.firstMaterial?.specular.contents = UIColor.white
        geometry.firstMaterial?.emission.contents = UIColor.blue
        let boxnode = SCNNode(geometry: geometry)
        let offset: Int = 16
        
        for xIndex:Int in 0...32 {
            for yIndex:Int in 0...32 {
                
                let boxCopy = boxnode.copy() as! SCNNode
                boxCopy.position.x = Float(xIndex - offset)
                boxCopy.position.y = Float(yIndex - offset)
                if !grid.grid[xIndex][yIndex].isAlive(){
                    //                    boxCopy.geometry?.firstMaterial?.emission.contents = UIColor.black
                    boxCopy.isHidden  = true
                }
                self.nodesReferences.append(boxCopy)
//                self.rootNode.addChildNode(boxCopy)
            }
        }
        for node in nodesReferences{
            self.rootNode.addChildNode(node)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func setUpNextGrid(){
        for i in 0 ... 32 {
            for  j in 0  ... 32 {
                Manager.julgamento(grid: grid, x: i, y: j)
                
            }
        }
    }
    
    func rebuild() {
        setUpNextGrid()
        grid.updateGrid()
        rootNode.enumerateChildNodes { (node, stop) in
            node.removeFromParentNode()
        }
        let geometry = SCNBox(width: 0.6 , height: 0.6,
                              length: 0.1, chamferRadius: 0.005)
        geometry.firstMaterial?.diffuse.contents = UIColor.red
        geometry.firstMaterial?.specular.contents = UIColor.white
        geometry.firstMaterial?.emission.contents = UIColor.blue
        let boxnode = SCNNode(geometry: geometry)
        let offset: Int = 16
        
        for xIndex:Int in 0...32 {
            for yIndex:Int in 0...32 {
                
                let boxCopy = boxnode.copy() as! SCNNode
                boxCopy.position.x = Float(xIndex - offset)
                boxCopy.position.y = Float(yIndex - offset)
                if !grid.grid[xIndex][yIndex].isAlive(){
                    //                    boxCopy.geometry?.firstMaterial?.emission.contents = UIColor.black
                    boxCopy.isHidden  = true
                }
                self.rootNode.addChildNode(boxCopy)
            }
        }
    }
}
