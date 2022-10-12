//
//  MoviesEndpoint.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/11/22.
//

import Foundation

//enum MoviesEndpoint {
//    case topRated
//    case movieDetail(id: Int)
//}
//
//extension MoviesEndpoint: Endpoint {
//    var path: String {
//        switch self {
//        case .topRated:
//            return "/3/movie/top_rated"
//        case .movieDetail(let id):
//            return "/3/movie/\(id)"
//        }
//    }
//
//    var method: RequestMethod {
//        switch self {
//        case .topRated, .movieDetail:
//            return .get
//        }
//    }
//
//    var header: [String: String]? {
//        // Access Token to use in Bearer header
//        let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMGFjYTRkMjZjNTA0MmFiMTIxN2I1Yjc3NDQ1ZTc1ZSIsInN1YiI6IjVkYTQyNzQ2Y2IzMDg0MDAxMzkzODI0NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3r-XYRoQUwdOiDo-MtkZrLWyzMLhSXsKdPEECgZ8r7Y"
//        switch self {
//        case .topRated, .movieDetail:
//            return [
//                "Authorization": "Bearer \(accessToken)",
//                "Content-Type": "application/json;charset=utf-8"
//            ]
//        }
//    }
//    
//    var body: [String: String]? {
//        switch self {
//        case .topRated, .movieDetail:
//            return nil
//        }
//    }
//}
