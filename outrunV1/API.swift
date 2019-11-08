import Foundation


//Step 1: user is at morewood ave and wants to go on a 1 mile walk
//Step 2: give google starting location, radius 0.5 miles -- nearby Places search
//Step 3: feed starting location and random place (destination) into api call below
//Step 4: call opposite route back home
//url0 - api call to Places

func places(_ apicall: String, userCompletionHandler: @escaping (Array<[String]>?, Error?) -> Void) {
    
    var locations: [[String]] = [[]]
    
    struct Welcome0: Decodable {
        let nextPageToken: String
        let results: [Result]
        let status: String
        
        enum CodingKeys: String, CodingKey {
            case nextPageToken = "next_page_token"
            case results, status
        }
    }

    //testing if mohona can add things
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

    let url = URL(string: apicall)!
    let task0 = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in

        guard let data = data else { return }
        do {
            guard let welcome0 = try? JSONDecoder().decode(Welcome0.self, from: data) else {
                print("Error: Couldn't decode data into a result")
                return
            }
            
            for result in welcome0.results {
                var singleLocation : [String] = []
                singleLocation.append(String(result.geometry.location.lat))
                singleLocation.append(String(result.geometry.location.lng))
                singleLocation.append(result.name)
                locations.append(singleLocation)
                }
        
            userCompletionHandler(locations, nil)
          
            }
      })
      task0.resume()
    }


func maps(_ url: String, userCompletionHandler: @escaping (Dictionary<String, [String]>?, Error?) -> Void) {

    //url - api call to Maps
    let url = URL(string: url)!


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


    //verify that data is valid
    let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
        guard let data = data else {return}

        do {
            guard let welcome = try? JSONDecoder().decode(Welcome.self, from: data) else {
                print("Error: Couldn't decode data into a result")
                return
            }
            var routeInfo : [String: [String]] = [:]
            for route in welcome.routes {
                for leg in route.legs {
                    routeInfo["Duration"] = [leg.duration.text]
                    routeInfo["Distance"] = [leg.distance.text]
                    var coordinates:[String] = []
                    var instructions:[String] = []
                    var distances:[String] = []
                    for step in leg.steps {
                        instructions.append(String(step.htmlInstructions))
                        distances.append(String(step.distance.text))
                        coordinates.append(String(step.endLocation.lat))
                        coordinates.append(String(step.endLocation.lng))
                    }
                    routeInfo["Coordinates"] = coordinates
                    routeInfo["Instructions"] = instructions
                    routeInfo["Distances"] = distances
                 }
            }
            userCompletionHandler(routeInfo, nil)
        }
    })

    task.resume()

}
