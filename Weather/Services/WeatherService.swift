//
//  WeatherService.swift
//  WeatherForecast
//
//  Created by Beka Akramov on 24.02.2024.
//

import Foundation
import Alamofire

final class WeatherService {
    
    static let shared = WeatherService(); private init() { }
    
    let apiKey = "cd0e81cc1f6a93e7ed36ef31f38f9178"
    let latitude = "56.1325"
    let longitude = "101.614166"
    
    func getWeather() async throws -> WeatherData {
        let url = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&lang=ru&appid=\(apiKey)"
        
        return try await AF.request(url)
            .validate()
            .body()
    }
}


