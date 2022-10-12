//
//  ResponseBody.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/12/22.
//

import Foundation

// ResponseBody structure that follow the JSON data we get from the API
// Note: We're not adding all the variables returned from the API since not all of them are used in the app
struct ResponseBody: Codable {
    var page: Int
    var perPage: Int
    var totalResults: Int
    var url: String
    var videos: [Video]
    
}

struct Video: Identifiable, Codable {
    var id: Int
    var image: String
    var duration: Int
    var user: User
    var videoFiles: [VideoFile]
    
//    enum CodingKeys: String, CodingKey {
//           case id, image, duration, user
//           // Map the JSON key "url" to the Swift property name "htmlLink"
//           case videoFiles = "video_files"
//       }
    
    struct User: Identifiable, Codable {
        var id: Int
        var name: String
        var url: String
    }
    
    struct VideoFile: Identifiable, Codable {
        var id: Int
        var quality: String
        var fileType: String
        var link: String
        
//        enum CodingKeys: String, CodingKey {
//               case id, quality, link
//               // Map the JSON key "url" to the Swift property name "htmlLink"
//               case fileType = "file_type"
//           }
    }
}
