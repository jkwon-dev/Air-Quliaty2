//
//  WeatherView.swift
//  Air Quliaty
//
//  Created by kwon eunji on 11/14/23.
//

import SwiftUI

struct WeatherView: View {
    var air: ResponseBody
    
    var body: some View {
        HStack(spacing: 30) {
            Image(systemName: Table(name: air.data.current.weather.ic))
            Text("\(air.data.current.weather.tp) º")
            
        }
        .font(.system(size: 40))
        .frame(minWidth: 300, minHeight: 30)
        .padding()
        .foregroundColor(.black)
    }
    
}

#Preview {
    WeatherView(air: previewAir)
        .background(.blue)
}


func Table(name: String)-> String {
    switch name {
        case "01d" :
            return "sun.max"
        case "01n" :
            return "moon.starts"
        case "02d", "02n", "03d", "03n", "04d", "04n" :
            return "cloud.fill"
        
        case "09d","09n", "10d" ,"10n" :
            return "cloud.rain.fill"

        case "11d", "11n" :
            return "cloud.bolt.fill"
        
        case "13d", "13n" :
            return "cloud.snow.fill"

        case "50d", "50n" :
            return "cloud.fog"
   
        default : 
         return "cloud"
    }
}
