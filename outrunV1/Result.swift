//
//  Places.swift
//  outrunV1
//
//  Created by Mohona Sengupta on 11/7/19.
//  Copyright © 2019 Mohona Sengupta. All rights reserved.
//

import Foundation


struct Welcome0: Decodable {
    let nextPageToken: String
    let results: [Result]
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case nextPageToken = "next_page_token"
        case results, status
    }
}

// MARK: - Result
struct Result: Decodable {
    let geometry: Geometry
    let id, name: String
    
    enum CodingKeys: String, CodingKey {
        case geometry, id, name
    }
}

// MARK: - Geometry
struct Geometry: Decodable {
    let location: Location
}

 //MARK: - Location
struct Location: Decodable {
    let lat, lng: Double
}

