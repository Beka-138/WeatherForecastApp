//
//  WeatherFetchingViewModel.swift
//  Weather
//
//  Created by Archibbald on 03.03.2024.
//

import Foundation
import OSLog

@MainActor
final class WeatherFetchingViewModel: ObservableObject {
    
    @Published private(set) var weather: WeatherData?
    
    func fetch() async {
        do {
            weather = try await WeatherService.shared.getWeather()
        } catch {
            os_log(.error, "\(error)")
        }
    }
}
