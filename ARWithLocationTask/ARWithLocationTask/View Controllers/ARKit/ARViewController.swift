//
//  SurroundingARViewController.swift
//  ARWithLocationTask
//
//  Created by admin on 19/02/18.
//  Copyright © 2018 Aj. All rights reserved.
//

import UIKit
import SceneKit
import MapKit
import ARKit

@available(iOS 11.0, *)
class SurroundingARViewController: UIViewController, MKMapViewDelegate, SceneLocationViewDelegate {
    let sceneLocationView = SceneLocationView()
    
    let closeButton = UIButton()
    var userTappedLocation:CLLocationCoordinate2D?
    var scale = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneLocationView.locationDelegate = self
        
//        let debugOptions: SCNDebugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
//        sceneLocationView.debugOptions = debugOptions
        
        
        let locations =  CoreConfig.sharedInstance.collections
        for item in locations {
            
            let pinCoordinate = CLLocationCoordinate2D(latitude: Double(item.lat!)!, longitude: Double(item.long!)!)
            let pinLocation = CLLocation(coordinate: pinCoordinate, altitude: 1)
            let pinImage = #imageLiteral(resourceName: "blue-dot")//UIImage(named: "mcdonalds")! // Change To See Bigger Object After scaling 3D object might get small
            let pinLocationNode = LocationAnnotationNode(location: pinLocation, image: pinImage)
            pinLocationNode.scaleRelativeToDistance = scale
            sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: pinLocationNode)
        }
        
        
        // TEST For Locations
        /*
        let pinCoordinate3 = CLLocationCoordinate2D(latitude: 23.0367, longitude: 72.5164)
        let pinLocation3 = CLLocation(coordinate: pinCoordinate3, altitude: 11)
        let pinImage3 = UIImage(named: "starbucks")!
        let pinLocationNode3 = LocationAnnotationNode(location: pinLocation3, image: pinImage3)
        pinLocationNode3.scaleRelativeToDistance = true

        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: pinLocationNode3)
        
        
        let pinCoordinate = CLLocationCoordinate2D(latitude: 1.2790314, longitude: 103.8514261)
        let pinLocation = CLLocation(coordinate: pinCoordinate, altitude: 200)
        let pinImage = UIImage(named: "starbucks")!
        let pinLocationNode = LocationAnnotationNode(location: pinLocation, image: pinImage)
        pinLocationNode.scaleRelativeToDistance = true
        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: pinLocationNode)
        
        let pinCoordinate2 = CLLocationCoordinate2D(latitude: 1.281947, longitude: 103.858973)
        let pinLocation2 = CLLocation(coordinate: pinCoordinate2, altitude: 1)
        let pinImage2 = UIImage(named: "mcdonalds")!
         pinLocationNode.scaleRelativeToDistance = false
        let pinLocationNode2 = LocationAnnotationNode(location: pinLocation2, image: pinImage2)
        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: pinLocationNode2)
    */
        closeButton.setTitle("Close", for: .normal)
        closeButton.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
        sceneLocationView.addSubview(closeButton)
        
        view.addSubview(sceneLocationView)
    }
    
    @objc func closeScreen(button: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal // Plane Detection
        configuration.isLightEstimationEnabled = true // light estimation
        configuration.worldAlignment = .gravityAndHeading
        
        sceneLocationView.session.run(configuration)
        sceneLocationView.run()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneLocationView.pause()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        sceneLocationView.frame = CGRect(
            x: 0,
            y: 0,
            width: self.view.frame.size.width,
            height: self.view.frame.size.height)
        
        closeButton.frame = CGRect(x: (self.view.frame.size.width - 150) / 2, y: self.view.frame.size.height - 60, width: 150, height: 50)
    }
    
    //MARK: SceneLocationViewDelegate
    
    func sceneLocationViewDidAddSceneLocationEstimate(sceneLocationView: SceneLocationView, position: SCNVector3, location: CLLocation) {
        print("\(location)")
    }
    
    func sceneLocationViewDidRemoveSceneLocationEstimate(sceneLocationView: SceneLocationView, position: SCNVector3, location: CLLocation) {
        print("\(location)")
    }
    
    func sceneLocationViewDidConfirmLocationOfNode(sceneLocationView: SceneLocationView, node: LocationNode) {
        print("\(node.location)")
    }
    
    func sceneLocationViewDidSetupSceneNode(sceneLocationView: SceneLocationView, sceneNode: SCNNode) {
        
    }
    
    func sceneLocationViewDidUpdateLocationAndScaleOfLocationNode(sceneLocationView: SceneLocationView, locationNode: LocationNode) {
        
    }
}

extension DispatchQueue {
    func asyncAfter(timeInterval: TimeInterval, execute: @escaping () -> Void) {
        self.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(timeInterval * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: execute)
    }
}

