//
//  ContentView.swift
//  Air Quliaty
//
//  Created by kwon eunji on 11/14/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var airManager = AirManager()
    @State var air: ResponseBody?
    
    
    var body: some View {
        VStack(alignment: .center) {
            if let location = locationManager.location {
                if let air = air {
                    AirView(air: air)
                } else {
                    LoadingView()
                        .task {
                            do {
                                 air = try await airManager.getCurrentAirQuality(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


