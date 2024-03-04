//
//  WeatherDetails.swift
//  Weather
//
//  Created by Archibbald on 03.03.2024.
//

import SwiftUI

struct WeatherDetails: View {
    let weather: WeatherData
    
    var body: some View {
        HStack {
            let wind = weather.wind.speed * 3.6
            let humidity = weather.main.humidity
            let temperature = weather.main.feels_like - 273.15
            
            Detail(
                "\(wind, specifier: "%.0f") км/ч",
                image: .init(systemName: "wind")
            )
                        
            DividerView()
            
            Detail(
                "\(humidity, specifier: "%.0f") %",
                image: .init(systemName: "drop")
            )
            
            DividerView()
            
            Detail(
                "\(temperature, specifier: "%.0f")°",
                image: .init(systemName: "thermometer")
            )
        }
        .padding()
        .aspectRatio(3.5, contentMode: .fit)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white, lineWidth: 2)
        )
    }
    
    @ViewBuilder
    private func DividerView() -> some View {
        Rectangle()
            .frame(maxWidth: 2, maxHeight: .infinity)
            .foregroundColor(.white)
    }
    
    @ViewBuilder
    private func Detail(_ text: LocalizedStringKey, image: Image) -> some View {
        VStack{
            Text(text)
                .font(.custom("Archangelsk", size: 20))
                .foregroundColor(.white)
            
            image
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 30, maxHeight: 30)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview("Weather detail", traits: .sizeThatFitsLayout) {
    WeatherDetails(weather: .preview)
        .padding()
        .background {
            Image("background")
                .ignoresSafeArea()
        }
}
