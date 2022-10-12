//
//  HomeView.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/11/22.
//

import SwiftUI


struct HomeView: View {
    
    @StateObject var homeVM: HomeViewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            homeVM.loadVideo(param: ["searchTerm": "nature", "limit": 20, "page": 0], completion: {(model, error) in
                if let _ = error {
                   print("ERROR=====")
                } else {
                    if let modelUW = model {
                        self.homeVM.videos = modelUW.videos
                      
                    
                        print("Count: \(self.homeVM.videos.count)")
                    }
                }
                
            })
        }
    }

}
