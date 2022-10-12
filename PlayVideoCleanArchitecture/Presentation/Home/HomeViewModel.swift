//
//  HomeViewModel.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/12/22.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var videos: [Video] = []
    
    var limit: Int = 20
    var page: Int = 0
    
    func loadVideo() {
        print("loadVideo")
    }
    
    func loadMore() {
        print("loadMore")
    }
    
    func refresh() {
        print("refresh")
    }
    
    
}
