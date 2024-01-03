//
//  AirManager.swift
//  Air Quliaty
//
//  Created by kwon eunji on 11/14/23.
//

import Foundation
import CoreLocation

class AirManager {
    
    private let apiKey = ""
    
    func getCurrentAirQuality(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws  -> ResponseBody {
        guard let url = URL(string: "https://api.airvisual.com/v2/nearest_city?lat=\(latitude)&lon=\(longitude)&key=\(apiKey)")
        else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data")}
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
    
    
}

struct ResponseBody: Decodable {
        let status: String
        let data: DataClass

    // MARK: - DataClass
    struct DataClass: Decodable {
        let city, state, country: String
        let current: Current
    }

    // MARK: - Current
    struct Current: Decodable {
        let pollution: Pollution
        let weather: Weather
    }

    // MARK: - Pollution
    struct Pollution: Decodable {
        let ts: String
        let aqius: Int
        let mainus: String
        let aqicn: Int
        let maincn: String
    }

    // MARK: - Weather
    struct Weather: Decodable {
        let ts: String
        let tp, pr, hu: Int
        let ws: Double
        let wd: Int
        let ic: String
    }
    
}
