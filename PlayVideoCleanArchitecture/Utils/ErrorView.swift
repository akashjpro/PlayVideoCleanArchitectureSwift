//
//  ErrorView.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/18/22.
//

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject private var appControl: AppControl
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.6)
            VStack {
                Spacer()
                Text(appControl.title)
                    .foregroundColor(.white)
                    .font(.system(size: 28,weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(20)
                Text(appControl.message)
                    .foregroundColor(.white)
                    .font(.system(size: 20,weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,100)
                    .padding(.bottom,50)
                Button(action: {
                    AppControl.shared.hideError()
                }) {
                    VStack {
                        Text("OK")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .background(Color.black)
                .border(.white, width: 1)
                
                Spacer()
            }
        }
    }
}
