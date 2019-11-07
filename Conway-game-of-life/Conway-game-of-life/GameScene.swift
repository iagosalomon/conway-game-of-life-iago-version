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
    var columNumbers = 20
    var rowNumbers = 20
    var colors  = [UIColor.blue, UIColor.red,UIColor.green,UIColor.purple]
    var grid = Grid(colum: 20,row: 20)
    var manager = Manager()
    var nodesReferences :[SCNNode] = []
    var boxDemensions = SCNBox(width: 0.6 , height: 0.6,
                               length: 0.6, chamferRadius: 0.005)
    var elevate :CGFloat = 0
    var level :CGFloat = 0
    
    override init() {
        super.init()
        
        let geometry = boxDemensions
        geometry.firstMaterial?.diffuse.contents = UIColor.red
        geometry.firstMaterial?.specular.contents = UIColor.white
        geometry.firstMaterial?.emission.contents = UIColor.blue
        let boxnode = SCNNode(geometry: geometry)
        let offset: Int = 16
        
        for xIndex:Int in 0...rowNumbers {
            for yIndex:Int in 0...columNumbers {
                
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
    
    
    
    
    func rebuild() {
        level += 1
        grid.setUpNextGrid()
//        rootNode.enumerateChildNodes { (node, stop) in
//            node.removeFromParentNode()
//        }
        let geometry = boxDemensions
        geometry.firstMaterial?.diffuse.contents = UIColor.blue
        geometry.firstMaterial?.specular.contents = UIColor.white
        geometry.firstMaterial?.emission.contents = UIColor.blue
        let boxnode = SCNNode(geometry: geometry)
        boxnode.geometry?.firstMaterial?.diffuse.contents = generateRandomColor()
        let offset: Int = 16
        // era 16
        
        for xIndex:Int in 0...rowNumbers {
            for yIndex:Int in 0...columNumbers {
                
                let boxCopy = boxnode.copy() as! SCNNode
//                boxCopy.geometry?.materials.first?.diffuse.contents  = generateRandomColor()
                boxCopy.position.x = Float(xIndex - offset)
                boxCopy.position.y = Float(yIndex - offset)
                boxCopy.position.z = Float(0.6 * level)
                if !grid.grid[xIndex][yIndex].isAlive(){
                    boxCopy.isHidden  = true
                }
                self.rootNode.addChildNode(boxCopy)
            }
        }
    }
    func rebuild2() {
        level += 1
        grid.setUpNextGrid()
        //        rootNode.enumerateChildNodes { (node, stop) in
        //            node.removeFromParentNode()
        //        }
        let geometry = boxDemensions
        geometry.firstMaterial?.diffuse.contents = UIColor.blue
        geometry.firstMaterial?.specular.contents = UIColor.white
        geometry.firstMaterial?.emission.contents = UIColor.blue
        let boxnode = SCNNode(geometry: geometry)
        boxnode.geometry?.firstMaterial?.diffuse.contents = generateRandomColor()
        let offset: Int = Int.random(in: 0...16)
        // era 16
        
        for xIndex:Int in 0...rowNumbers {
            for yIndex:Int in 0...columNumbers {
                
                let boxCopy = boxnode.copy() as! SCNNode
                //                boxCopy.geometry?.materials.first?.diffuse.contents  = generateRandomColor()
                boxCopy.position.x = Float(xIndex - offset)
                boxCopy.position.y = Float(yIndex - offset)
                boxCopy.position.z = Float(0.6 * level * -1)
                if grid.grid[xIndex][yIndex].isAlive(){
                    self.rootNode.addChildNode(boxCopy)
                }
                
            }
        }
    }
    
    
    func generateRandomColor() -> UIColor {
      let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
      let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
      let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
            
      return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
}
