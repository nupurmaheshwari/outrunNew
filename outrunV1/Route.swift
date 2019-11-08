
// MARK: - Welcome
struct Welcome: Decodable {
    let geocodedWaypoints: [GeocodedWaypoint]
    let routes: [Route]
    let status: String

    enum CodingKeys: String, CodingKey {
        case geocodedWaypoints = "geocoded_waypoints"
        case routes
        case status
    }
}

// MARK: - GeocodedWaypoint
struct GeocodedWaypoint: Decodable {
    let geocoderStatus, placeID: String
    let types: [String]

    enum CodingKeys: String, CodingKey {
        case geocoderStatus = "geocoder_status"
        case placeID = "place_id"
        case types
    }
}

// MARK: - Route
struct Route: Decodable {
    let bounds: Bounds
    let copyrights: String
    let legs: [Leg]
    let overviewPolyline: Polyline
    let summary: String
    let warnings: [String]
//    let waypointOrder: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case bounds, copyrights, legs
        case overviewPolyline = "overview_polyline"
        case summary, warnings
//        case waypointOrder = "waypoint_order"
    }
}

// MARK: - Bounds
struct Bounds: Decodable {
    let northeast, southwest: Northeast
}

// MARK: - Northeast
struct Northeast: Decodable {
    let lat, lng: Double
}

// MARK: - Leg
struct Leg: Decodable {
    let distance, duration: Distance
    let endAddress: String
    let endLocation: Northeast
    let startAddress: String
    let startLocation: Northeast
    let steps: [Step]
//    let trafficSpeedEntry, viaWaypoint: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case distance, duration
        case endAddress = "end_address"
        case endLocation = "end_location"
        case startAddress = "start_address"
        case startLocation = "start_location"
        case steps
//        case trafficSpeedEntry = "traffic_speed_entry"
//        case viaWaypoint = "via_waypoint"
    }
}

// MARK: - Distance
struct Distance: Decodable {
    let text: String
    let value: Int
}

// MARK: - Step
struct Step: Decodable {
    let distance, duration: Distance
    let endLocation: Northeast
    let htmlInstructions: String
    let polyline: Polyline
    let startLocation: Northeast
    let travelMode: String
    let maneuver: String?

    enum CodingKeys: String, CodingKey {
        case distance, duration
        case endLocation = "end_location"
        case htmlInstructions = "html_instructions"
        case polyline
        case startLocation = "start_location"
        case travelMode = "travel_mode"
        case maneuver
    }
}

// MARK: - Polyline
struct Polyline: Decodable {
    let points: String
}
