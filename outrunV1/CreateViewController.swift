//
//  CreateViewController.swift
//  OUTRUNscreens
//
//  Created by Mohona Sengupta on 11/1/19.
//  Copyright © 2019 Mohona Sengupta. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class CreateViewController: UIViewController, CLLocationManagerDelegate{
    
    let route = Route()
    
    let locationManager = CLLocationManager()
    var userCurrentLat = 0.0
    var userCurrentLong = 0.0
    var chosenDirections : [String:[String]] = [:]
    
    @IBOutlet weak var labelDistance: UILabel!
    @IBOutlet weak var halfMileButton: UIButton!
    @IBOutlet weak var oneMileButton: UIButton!
    @IBOutlet weak var mileHalfButton: UIButton!
    
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var fiveMinuteButton: UIButton!
    @IBOutlet weak var tenMinuteButton: UIButton!
    @IBOutlet weak var fifteenMinuteButton: UIButton!
    
    @IBAction func fiveMinutesPressed(_ sender: Any) {
        route.userTime = 5
        route.userRadius = 0

        //change button to reflect click
        fiveMinuteButton.backgroundColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8)
        fiveMinuteButton.setTitleColor(UIColor.black, for: .normal)


        // Set other button's background color.
        tenMinuteButton.backgroundColor = UIColor.black
        fifteenMinuteButton.backgroundColor = UIColor.black

        // Set other button's title color.
        tenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        fifteenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)


        //set distance buttons
        halfMileButton.backgroundColor = UIColor.black
        oneMileButton.backgroundColor = UIColor.black
        mileHalfButton.backgroundColor = UIColor.black
        // Set distance button's title color.
        halfMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        oneMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        mileHalfButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        // Set distance button's border color.
        halfMileButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor
        oneMileButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha:0.25).cgColor
        mileHalfButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor

        labelDistance.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.25)
        labelTime.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
    }
    
    @IBAction func tenMinutesPressed(_ sender: Any) {
        route.userTime = 5
        route.userRadius = 0

        //change button to reflect click
        tenMinuteButton.backgroundColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8)
        tenMinuteButton.setTitleColor(UIColor.black, for: .normal)


        // Set other button's background color.
        fiveMinuteButton.backgroundColor = UIColor.black
        fifteenMinuteButton.backgroundColor = UIColor.black

        // Set other button's title color.
        fiveMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        fifteenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)


        //set distance buttons
        halfMileButton.backgroundColor = UIColor.black
        oneMileButton.backgroundColor = UIColor.black
        mileHalfButton.backgroundColor = UIColor.black
        // Set distance button's title color.
        halfMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        oneMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        mileHalfButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        // Set distance button's border color.
        halfMileButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor
        oneMileButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha:0.25).cgColor
        mileHalfButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor

        labelDistance.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.25)
        labelTime.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
    }
    
    @IBAction func fifteenMinutesPressed(_ sender: Any) {
        route.userTime = 5
        route.userRadius = 0

        //change button to reflect click
        fifteenMinuteButton.backgroundColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8)
        fifteenMinuteButton.setTitleColor(UIColor.black, for: .normal)


        // Set other button's background color.
        fiveMinuteButton.backgroundColor = UIColor.black
        tenMinuteButton.backgroundColor = UIColor.black

        // Set other button's title color.
        fiveMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        tenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)


        //set distance buttons
        halfMileButton.backgroundColor = UIColor.black
        oneMileButton.backgroundColor = UIColor.black
        mileHalfButton.backgroundColor = UIColor.black
        // Set distance button's title color.
        halfMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        oneMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        mileHalfButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        // Set distance button's border color.
        halfMileButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor
        oneMileButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha:0.25).cgColor
        mileHalfButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor

        labelDistance.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.25)
        labelTime.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
    }
    
    @IBAction func halfMilePressed(_ sender: Any) {
        route.userRadius = 1609.34
        route.userTime = 0
        
        //change button to reflect click
        halfMileButton.backgroundColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8)
        halfMileButton.setTitleColor(UIColor.black, for: .normal)

        // Set other button's background color.
        oneMileButton.backgroundColor = UIColor.black
        mileHalfButton.backgroundColor = UIColor.black

        // Set other button's title color.
        oneMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        mileHalfButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        
        //set distance buttons
        fiveMinuteButton.backgroundColor = UIColor.black
        tenMinuteButton.backgroundColor = UIColor.black
        fifteenMinuteButton.backgroundColor = UIColor.black
        // Set distance button's title color.
        fiveMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        tenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        fifteenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        // Set distance button's border color.
        fiveMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor
        tenMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha:0.25).cgColor
        fifteenMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor

        labelDistance.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        labelTime.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.25)
    }
    
    @IBAction func oneMilePressed(_ sender: Any) {
        route.userRadius = 4828.03
        route.userTime = 0
        
        //change button to reflect click
        oneMileButton.backgroundColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8)
        oneMileButton.setTitleColor(UIColor.black, for: .normal)
        
        // Set other button's background color.
        halfMileButton.backgroundColor = UIColor.black
        mileHalfButton.backgroundColor = UIColor.black
        
        // Set other button's title color.
        halfMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        mileHalfButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        
        //set distance buttons
        fiveMinuteButton.backgroundColor = UIColor.black
        tenMinuteButton.backgroundColor = UIColor.black
        fifteenMinuteButton.backgroundColor = UIColor.black
        // Set distance button's title color.
        fiveMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        tenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        fifteenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        // Set distance button's border color.
        fiveMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor
        tenMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha:0.25).cgColor
        fifteenMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor

        labelDistance.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        labelTime.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.25)
    }
    
    @IBAction func mileHalfPressed(_ sender: Any) {
        route.userRadius = 8046.72
        route.userTime = 0

        //change button to reflect click
        mileHalfButton.backgroundColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8)
        mileHalfButton.setTitleColor(UIColor.black, for: .normal)

        // Set other button's background color.
        halfMileButton.backgroundColor = UIColor.black
        oneMileButton.backgroundColor = UIColor.black

        // Set other button's title color.
        halfMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        oneMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        
        //set distance buttons
        fiveMinuteButton.backgroundColor = UIColor.black
        tenMinuteButton.backgroundColor = UIColor.black
        fifteenMinuteButton.backgroundColor = UIColor.black
        // Set distance button's title color.
        fiveMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        tenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        fifteenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        // Set distance button's border color.
        fiveMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor
        tenMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha:0.25).cgColor
        fifteenMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor

        labelDistance.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        labelTime.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.25)
    }
    
    @IBAction func createWorkout(_ sender: Any) {
        routeCreation()
        print("______")
        print(route.directions)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        // Set time button's title color.
        fiveMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        tenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        fifteenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        
        // Set time button's corner radius.
        fiveMinuteButton.layer.cornerRadius = 30
        tenMinuteButton.layer.cornerRadius = 30
        fifteenMinuteButton.layer.cornerRadius = 30
        
        // Set time button's border width.
        fiveMinuteButton.layer.borderWidth = 1
        tenMinuteButton.layer.borderWidth = 1
        fifteenMinuteButton.layer.borderWidth = 1
        
        // Set time button's border color.
        fiveMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8).cgColor
        tenMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8).cgColor
        fifteenMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8).cgColor
        
        //timeLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        
        
        // Set distance button's background color.
        halfMileButton.backgroundColor = UIColor.black
        oneMileButton.backgroundColor = UIColor.black
        mileHalfButton.backgroundColor = UIColor.black
        
        // Set distance button's title color.
        halfMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        oneMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        mileHalfButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        
        // Set distance button's corner radius.
        halfMileButton.layer.cornerRadius = 30
        oneMileButton.layer.cornerRadius = 30
        mileHalfButton.layer.cornerRadius = 30
        
        // Set distance button's border width.
        halfMileButton.layer.borderWidth = 1
        oneMileButton.layer.borderWidth = 1
        mileHalfButton.layer.borderWidth = 1
        
        // Set distance button's border color.
        halfMileButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor
        oneMileButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha:0.25).cgColor
        mileHalfButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor
        
        labelDistance.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.25)
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        userCurrentLat = locValue.latitude
        userCurrentLong = locValue.longitude
        //print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    func routeCreation() {
        //route.createHalfPoint(userCurrentLat, userCurrentLong, route.userRadius)
        route.createRoute(userCurrentLat, userCurrentLong, route.userRadius)
        chosenDirections = route.directions
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is MapViewController
        {
            let vc = segue.destination as? MapViewController
            vc?.directions = chosenDirections
        }
    }
    
}

