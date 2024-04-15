//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by onur yılmaz on 10.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Sancaktepe, TR")
                
                MainWeatherStatusView(imageName:isNight ? "moon.stars.fill" : "cloud.fill", temperature: 24)
                HStack(spacing: 20){
                    WeatherDayView(dayofWeek: "FRI", imageName: "sun.max.fill", temperature: 26)
                    WeatherDayView(dayofWeek: "SAT", imageName: "wind", temperature: 19)
                    WeatherDayView(dayofWeek: "SUN", imageName: "wind", temperature: 22)
                    WeatherDayView(dayofWeek: "MON", imageName: "wind", temperature: 22)
                    WeatherDayView(dayofWeek: "TUE", imageName: "cloud.sun.fill", temperature: 22)
                    WeatherDayView(dayofWeek: "WED", imageName: "cloud.sun.fill", temperature: 22)
                    
                }
            Spacer()
                
                Button{
                    isNight.toggle()
                    
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                    
                }
                
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayofWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack{
            Text(dayofWeek)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text(" \(temperature)°")
                .font(.system(size: 25, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
   
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View{
    var cityName: String
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default ))
            .foregroundColor(.white)
            .padding()
    }
}
struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text(" \(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
            
            
        }
        .padding(.bottom, 40)
    }
}



