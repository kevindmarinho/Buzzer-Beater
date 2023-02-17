//
//  ARView.swift
//  BuzzerBeater
//
//  Created by Gabriel Maciel on 16/02/23.
//

import ARKit
import SwiftUI
import RealityKit
import FocusEntity

struct ARViewContainer: UIViewRepresentable {
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView()
        
        let session = arView.session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.vertical, .horizontal]
        session.run(config)
        
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.session = session
        coachingOverlay.goal = .verticalPlane
        arView.addSubview(coachingOverlay)
        
        context.coordinator.view = arView
        session.delegate = context.coordinator
        
        arView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: context.coordinator,
                action: #selector(Coordinator.handleTap)
            )
        )
        
        return arView
    }
    
    func makeCoordinator() -> Coordinator { Coordinator() }
}
