//
//  ARViewCoordinator.swift
//  BuzzerBeater
//
//  Created by Gabriel Maciel on 16/02/23.
//

import ARKit
import SwiftUI
import RealityKit
import FocusEntity

class Coordinator: NSObject, ARSessionDelegate {
    weak var view: ARView?
    var focusEntity: FocusEntity?
    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        guard let view = self.view else { return }
        debugPrint("Anchors added to the scene: ", anchors)
        self.focusEntity = FocusEntity(on: view, style: .classic(color: .yellow))
    }
    
    @objc func handleTap() {
        guard let view = self.view, let focusEntity = self.focusEntity else { return }
        
        let anchor = AnchorEntity()
        view.scene.anchors.append(anchor)
        
        let ghostEntity = try! ModelEntity.loadModel(named: "BasketballHoop")
        ghostEntity.scale = [0.0007, 0.0007, 0.0007]
        ghostEntity.position = focusEntity.position
        
        anchor.addChild(ghostEntity)
        
        for animation in ghostEntity.availableAnimations {
            ghostEntity.playAnimation(animation.repeat(duration: .infinity), transitionDuration: 1.25, startsPaused: false)
        }
    }
}
