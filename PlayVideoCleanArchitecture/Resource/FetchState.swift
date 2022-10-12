//
//  FetchState.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/12/22.
//

import Foundation

enum FetchState: Comparable {
    case good
    case isLoading
    case loadedAll
    case noResults
    case error(String)
}
