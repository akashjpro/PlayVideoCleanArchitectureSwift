//
//  PlayVideoCleanArchitectureApp.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/11/22.
//

import SwiftUI

@main
struct PlayVideoCleanArchitectureApp: App {
    @StateObject private var appControl = AppControl.shared
    @State private var showingAlert = false
    

    var body: some Scene {
        WindowGroup {
            HomeView()
                .alert("No internet!", isPresented: $appControl.showingAlert) {
                            Button("OK", role: .cancel) { }
                        }
                .onAppear {
                    ConnectCheckUtil.shared.startMonitoring()
                }
        }
    }
}
