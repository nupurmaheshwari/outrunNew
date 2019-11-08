//
//  Routes.swift
//  OUTRUNscreens
//
//  Created by Mohona Sengupta on 11/2/19.
//  Copyright © 2019 Mohona Sengupta. All rights reserved.
//

import Foundation

class Route {
    var userTime: Int = 0
    var userRadius: Float = 0
    var apiKey = "AIzaSyD2sEnjE9LViaXMgvguCboMgDiaml1wdVY"
    var possibleHalfPoints: [String] = []
    var chosenHalfPoint: [String] = []
    var directions: [String:[String]] = [:]

    func createHalfPoint(_ userLocationLat: Double, _ userLocationLong: Double, _ userRadius: Float){
        
        let first = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=" + String(userLocationLat) + ","
        
        let second = String(userLocationLong) + "&radius="
        
        let third = String(userRadius/2) + "&key=" + apiKey
        
        let apicall = (first + second + third)
        
        places(apicall, userCompletionHandler: { results, error in
            if let results = results {
                
                //FOR NOW - random halfpoint
                let randNumber = Int.random(in: 0 ..< results.count)
                self.chosenHalfPoint = results[randNumber]
                }
            })
        

        }
    
    func createRoute (_ userLocationLat: Double, _ userLocationLong: Double, _ userRadius: Float) {
        createHalfPoint(userLocationLat, userLocationLong, userRadius)
        if self.chosenHalfPoint.count > 0 {
            let first = "https://maps.googleapis.com/maps/api/directions/json?origin="  + String(userLocationLat) + "," + String(userLocationLong)
            let second = "&destination=" + String(self.chosenHalfPoint[0]) + "," + String(self.chosenHalfPoint[1])
            let third  = "&avoid=highways&mode=walking&key=AIzaSyD2sEnjE9LViaXMgvguCboMgDiaml1wdVY"
            
            let apicall = (first + second + third)
            
            maps(apicall, userCompletionHandler: {results, error in
                if let results = results {
                    self.directions = results
                }
                })
            }
        
        }
    
    }
    
