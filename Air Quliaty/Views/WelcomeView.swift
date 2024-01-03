//
//  WelcomeView.swift
//  Air Quliaty
//
//  Created by kwon eunji on 11/14/23.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 20){
                Image(systemName: "wind.circle.fill")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundColor(.blue)
                
                Text("Check Air Quolity")
                    .bold().font(.title)
                
                Text("Please share your current location to get the air qulity in your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
