//
//  WeatherResponse.swift
//  WeatherForecast
//
//  Created by Beka Akramov on 24.02.2024.
//

import Foundation

// ЭТО СЕРИАЛИЗАЦИЯ!!! - когда от сервера приходит json, и надо преобразовать в структуру swift
struct WeatherData: Decodable {
    var coord: Coord
    var weather: [Weather]
    var main: Main
    var wind: Wind
    var name: String
    
    // Структура для координат местоположения
    struct Coord: Decodable {
        var lon: Double // Долгота
        var lat: Double // Широта
    }
    
    // Структура для информации о погоде
    struct Weather: Decodable, Identifiable {
        var id: Int
        var icon: String
        var description: String
    }
    
    // Структура для основных метеорологических данных
    struct Main: Decodable {
        var temp: Double // Температура
        var feels_like: Double // Ощущаемая температура
        var humidity: Double // Влажность
    }
    
    // Структура для данных о ветре
    struct Wind: Decodable {
        var speed: Double // Скорость ветра
    }
}

extension WeatherData {
    static let preview =  WeatherData(
        coord: WeatherData.Coord(lon: 37.62, lat: 55.75),
        weather: [
            .init(id: 800, icon: "01d", description: "Пасмурно")
        ],
        main: WeatherData.Main(temp: 20.5 + 273.15, feels_like: 22.3, humidity: 65.0),
        wind: WeatherData.Wind(speed: 3.5),
        name: "Москва"
    )
}
