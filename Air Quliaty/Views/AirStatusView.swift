//
//  AirStatusView.swift
//  Air Quliaty
//
//  Created by kwon eunji on 11/14/23.
//

import SwiftUI

struct AirStatusView: View {
    var air: ResponseBody
    var aqiLevel: String {
        AqiLevel(status: air.data.current.pollution.aqius)
    }
    
    var aqiColor: Color {
        AqiColor(status: air.data.current.pollution.aqius)
        
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                VStack() {
                    HStack() {
                        Image(systemName: "aqi.medium")
                            .foregroundColor(.white)
                        Text("AIR QIALITY")
                            .foregroundColor(.white)
                    }
                    .fontWeight(.bold)
                    
                    
                    VStack(alignment: .center){
                        Text("\(air.data.current.pollution.aqius)")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        
                        Text(aqiLevel)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                }
                .background(
                    Circle()
                        .frame(width: 360, height: 360)
                        .foregroundColor(aqiColor)
                )
            }
        }
    }
}

#Preview {
    AirStatusView(air: previewAir)
}

func AqiLevel(status: Int) -> String{
    switch status {
    case 0...50:
        return "Good"
        
    case 51...100:
        return "Moderate"
        
    case 101...150:
        return "Unhealthy for sensitive groups"
        
    case 151...200:
        return "Unhealthy"
        
    case 201...300:
        return "Very unhealthy"
        
    case 301...500:
        return "Hazardous"
        
    case 501...1000:
        return "Very Hazardous"
        
    default :
        return "Not Good"
        
    }
}

func AqiColor(status: Int) -> Color{
    switch status {
    case 0...50:
        return .green
        
    case 51...100:
        return .yellow
        
    case 101...150:
        return .orange
        
    case 151...200:
        return .red
        
    case 201...300:
        return .purple
        
    case 301...500:
        return .purple
        
    case 501...1000:
        return .brown
        
    default :
        return .gray
        
    }
}



