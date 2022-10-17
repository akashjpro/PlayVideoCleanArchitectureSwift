//
//  Query.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/12/22.
//

import Foundation

// An enumeration of the tags query our app offers
enum Query: String, CaseIterable {
    case nature, animals, people, ocean, food
    
    var toString: String {
        switch self {
        case .nature :
            return "nature"
        case .animals :
            return "animals"
        case .people :
            return "people"
        case .ocean :
            return "ocean"
        case .food :
            return "food"
        }
    }
}
