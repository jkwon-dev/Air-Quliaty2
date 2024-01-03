//
//  AirView.swift
//  Air Quliaty
//
//  Created by kwon eunji on 11/14/23.
//

import SwiftUI

struct AirView: View {
    var air: ResponseBody
    
    var body: some View {
        ZStack {
            VStack(alignment: .center){
                    Spacer()
                VStack() {
                    Text("\(air.data.city)")
                        .font(.system(size: 46))
                        .fontWeight(.bold)
                    Text(" \(Date().formatted(.dateTime.month().day().hour().minute()))")
                    }
                    .foregroundColor(.gray)
                    .font(.footnote)
                    Spacer()
                    AirStatusView(air: air)
                    Spacer()
                    Spacer()
            }
        }
    }
}

#Preview {
    AirView(air: previewAir)
        //.preferredColorScheme(.dark)
}




