//
//  ContentView.swift
//  Weatherforecast
//
//  Created by Beka Akramov on 23.02.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherModel =  WeatherFetchingViewModel()
    
    var body: some View {
        if let weather = weatherModel.weather {
            VStack {
                
                WeatherDataView(weather: weather)
                                                
                Spacer()                                
                
                WeatherDetails(weather: weather)
            }
            .padding()
            .background(
                Image("background")
                    .ignoresSafeArea()
            )
            
        } else {
            HStack{
                Text("Loading...")
                
                ProgressView()
            }
            .task {
                await weatherModel.fetch()
            }
        }
    }
}


#Preview {
    ContentView()
}

