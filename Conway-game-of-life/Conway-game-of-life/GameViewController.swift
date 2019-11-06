//
//  GameViewController.swift
//  Conway-game-of-life
//
//  Created by iago salomon on 31/10/19.
//  Copyright © 2019 iago salomon. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController , SCNSceneRendererDelegate{
    var myTime: TimeInterval = 0
    var scene: GameScene = GameScene()
    var targetTIme: TimeInterval = 0.5

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new scene
//        let scene = GameScene()

        // retrieve the SCNView
        let scnView = self.view as! SCNView

        // set the scene to the view
        scnView.scene = scene
        scnView.pointOfView?.position = SCNVector3Make(0, 0, 100)
        scnView.loops = true
        scnView.isPlaying = true

        // allows the user to manipulate the camera
        scnView.allowsCameraControl = true

        // show statistics such as fps and timing information
        scnView.showsStatistics = true

        // configure the view
         scnView.backgroundColor = UIColor.black
        
          

        
        //camera
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        
        //position
        cameraNode.position =  SCNVector3(0, 0, 65)
        
        scnView.delegate = self
        setupLight(rootNode: scene.rootNode)
    
    }
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        if time > myTime{
//            if let sceneProtected =  self.scene {
//                sceneProtected.rebuild()s
//            }
            scene.rebuild()
            scene.rebuild2()
            
            myTime  =  time + targetTIme
            
        }
    }
        
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    

    func setupLight(rootNode: SCNNode) {
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: -100, z: -100)
        rootNode.addChildNode(lightNode)

        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = UIColor.gray
        rootNode.addChildNode(ambientLightNode)
    }

}
