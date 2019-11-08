//
//  Places.swift
//  outrunV1
//
//  Created by Mohona Sengupta on 11/7/19.
//  Copyright © 2019 Mohona Sengupta. All rights reserved.
//

import Foundation

class RoutesViewModel {
    let routes: [Route]

    init(routes: Route) {
        self.routes = [routes]
    }
    
    func getLegs() -> [[Leg]] {
        var legs: [[Leg]] = []
        for route in routes {
            legs.append(route.legs)
        }
        return legs
    }
    
}
