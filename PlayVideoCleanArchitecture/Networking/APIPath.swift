//
//  APIPath.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/11/22.
//

import Foundation


#if DEBUG
let environment = APIEnvironment.development
#else
let environment = APIEnvironment.production
#endif

let baseURL = environment.baseURL()

struct APIPath {
    var gallary: String { return "\(baseURL)/search/photos"}
    
}



