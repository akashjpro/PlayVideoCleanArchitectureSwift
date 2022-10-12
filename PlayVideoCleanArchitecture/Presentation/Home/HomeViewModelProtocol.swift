//
//  HomeViewModelProtocol.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/12/22.
//

import Foundation

protocol HomeViewModelProtocol: ObservableObject {
    
    var videos: [Video] { get set }
    
    func loadVideo()
    func loadMore()
    func refresh()
}
