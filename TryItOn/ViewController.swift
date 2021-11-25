//
//  ViewController.swift
//  arDetector
//
//  Created by snoopy on 20/07/2021.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
//        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        //Object detection
        configuration.detectionObjects = ARReferenceObject.referenceObjects(inGroupNamed: "footObject", bundle: Bundle.main)!

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        
        if let objectAnchor = anchor as? ARObjectAnchor{
            print("yes")
            let shoeScene = SCNScene(named: "art.scnassets/nike4.scn")!
            let shoeNode = shoeScene.rootNode.childNode(withName: "nike", recursively: true)
            shoeNode?.transform = SCNMatrix4Translate(SCNMatrix4MakeScale(1, -1, 1), 0, 1, 0)
            
            let ScaleX = objectAnchor.referenceObject.extent.x * 7
            
            let ScaleY = objectAnchor.referenceObject.extent.y * 7
            
            let Scalez = objectAnchor.referenceObject.extent.z * 7
            
            shoeNode?.scale = SCNVector3(ScaleX,ScaleY,Scalez)
            
            shoeNode?.position = SCNVector3(x: objectAnchor.referenceObject.center.x , y: objectAnchor.referenceObject.center.y - 0.35, z: objectAnchor.referenceObject.center.z - 0.35)
            
            self.sceneView.scene.rootNode.addChildNode(shoeNode!)
        }
        return node
    }
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
