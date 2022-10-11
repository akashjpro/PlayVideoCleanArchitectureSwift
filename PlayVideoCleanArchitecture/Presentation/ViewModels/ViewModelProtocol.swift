//
//  ViewModelProtocol.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/11/22.
//

import Foundation
protocol ViewModelProtocol: ObservableObject {
    
    var value: Int { get set }
    var isCounterStarted: Bool { get set }
    
    func reset()
}
