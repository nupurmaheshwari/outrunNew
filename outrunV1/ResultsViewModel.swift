//
//  Places.swift
//  outrunV1
//
//  Created by Mohona Sengupta on 11/7/19.
//  Copyright © 2019 Mohona Sengupta. All rights reserved.
//

import Foundation

class ResultsViewModel {
    let results: [Result]
    var possibleLocations: [Geometry] = []

    init(results: Result) {
        self.results = [results]
    }
    
    func loadIntoArray() {
        for result in results {
            possibleLocations.append(result.geometry)
        }
    }
    
    func chooseLocation() -> Geometry {
        return possibleLocations[0]
    }
    
}

