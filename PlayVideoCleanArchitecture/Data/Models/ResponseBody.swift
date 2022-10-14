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
        
        func toUserEntity(id: Int, name: String, url: String) -> VideoEntity.UserEntity {
            return VideoEntity.UserEntity(id: id, name: name, url: url)
        }
    }
    
    struct VideoFile: Identifiable, Codable {
        var id: Int
        var quality: String
        var fileType: String
        var link: String
        
        func toVideoFileEntity(id: Int, quality: String, fileType: String, link: String) -> VideoEntity.VideoFileEntity {
            return VideoEntity.VideoFileEntity(id: id, quality: quality, fileType: fileType, link: link)
        }
        
        //        enum CodingKeys: String, CodingKey {
        //               case id, quality, link
        //               // Map the JSON key "url" to the Swift property name "htmlLink"
        //               case fileType = "file_type"
        //           }
    }
    
    func toVideoEntity(id: Int, image: String, duration: Int, user: User, videoFiles: [VideoFile]) -> VideoEntity {
        return VideoEntity(id: id, image: image, duration: duration, user: user.toUserEntity(id: user.id, name: user.name, url: user.url), videoFiles: videoFiles.map { e in e.toVideoFileEntity(id: e.id, quality: e.quality, fileType: e.fileType, link: e.link) })
    }
}
