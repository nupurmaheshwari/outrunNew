//
//  SummaryViewController.swift
//  OUTRUNscreens
//
//  Created by Mohona Sengupta on 11/1/19.
//  Copyright © 2019 Mohona Sengupta. All rights reserved.
//


import UIKit
import Foundation
import CoreLocation
import RealityKit

class MapViewController: UIViewController {
    
    var points = 100
    
    @IBOutlet weak var arView: ARView!
    
    @IBOutlet weak var messageMap: UILabel!
    
    var directions: [String:[String]] = [:]
    
    let locationManager = CLLocationManager()
    var currentCoordinate: CLLocationCoordinate2D!
        
    var stepCounter = 0
    
    @IBAction func stepUp(_ sender: Any) {
        print("stepUpBro")
        currentCoordinate = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
        currentCoordinate = CLLocationCoordinate2D(latitude: 40.438520, longitude: -79.975420)
        stepCounter += 1
        getDirections()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.]
        
        print(directions , "in map view")
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.startUpdatingLocation()
        
        // Load the "Box" scene from the "Experience" Reality File
        let zombieScene = try! Zombie.loadZombieWalks()
        
        zombieScene.generateCollisionShapes(recursive: true)
        // Add the box anchor to the scene
        arView.scene.anchors.append(zombieScene)
        
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(onTap))

        arView.addGestureRecognizer(tapGesture)
        
        let boxScene = try! Zombie.loadBoxFlips()
                     
              // Add the box anchor to the scene
              arView.scene.anchors.append(boxScene)
              
        

        }
    
    func getDirections() {
        print("lololololololol")
        if let checkNil = directions["Instructions"] {
            self.locationManager.monitoredRegions.forEach({ self.locationManager.stopMonitoring(for: $0) })
                
                let instructions = directions["Instructions"]!
                let coordinates =  directions["Coordinates"]!
                let distances = directions["Distances"]!
            
                for i in 0 ..< instructions.count {
                    let coordinate2D = CLLocationCoordinate2D(latitude: Double(coordinates[i * 2])!, longitude: Double(coordinates[i * 2 + 1])!)
                    let region = CLCircularRegion(center: coordinate2D,
                                                  radius: 0.1,
                                                  identifier: "\(i)")
                    self.locationManager.startMonitoring(for: region)
                }
                
                var initialMessage = instructions[0]
                print("\nthis is the initial message", initialMessage)
                initialMessage = initialMessage.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
                stepCounter = 1
            self.messageMap.text = initialMessage.lowercased()
            }
    }
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        let tapLocation = sender.location(in: arView)
        
        if let zombieTapped = arView.entity(at: tapLocation) {

        print(zombieTapped.name)
        print("killing Zombie")
        points += 50
            
        }
        
        
        
    }
        
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.getDirections()
        manager.stopUpdatingLocation()
        guard let currentLocation = locations.first else { return }
        currentCoordinate = currentLocation.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        if stepCounter < directions["Instructions"]!.count {
            var currentStep = directions["Instructions"]![stepCounter]
            var distToPoint = "In " + directions["Distances"]![stepCounter - 1]
            currentStep = currentStep.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
            currentStep = currentStep.lowercased()
            messageMap.text = ""
            messageMap.text = distToPoint + " " + currentStep
            stepCounter += 1

            print("Step Counter ", stepCounter)
        }
        else {
            messageMap.text = "Arrived at destination"
            stepCounter = 0
            locationManager.monitoredRegions.forEach({ self.locationManager.stopMonitoring(for: $0) })
            
        }
    }
}
