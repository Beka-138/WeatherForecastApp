//
//  WeatherDataView.swift
//  Weather
//
//  Created by Archibbald on 03.03.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct WeatherDataView: View {
    let weather: WeatherData
    
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                Text(weather.name)
                    .font(.custom("Archangelsk", size: 60))
                    .foregroundColor(.white)
                
                Text("\(Int(weather.main.temp - 273.15))°")
                    .font(.custom("Archangelsk", size: 140))
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            VStack{
                ForEach(weather.weather) { weather in
                    WebImage(url: URL(string: "https://openweathermap.org/img/wn/\(weather.icon).png"))
                }
                .background(Color.white.opacity(0.5))
                .cornerRadius(10)
                
                ForEach(weather.weather) { content in
                    Text(content.description)
                }
                .font(.custom("Archangelsk", size: 20))
                .foregroundColor(.white)
            }
        }
        .frame(maxHeight: 250)
    }
}

#Preview("Weather data", traits: .sizeThatFitsLayout) {
    WeatherDataView(weather: .preview)
}
