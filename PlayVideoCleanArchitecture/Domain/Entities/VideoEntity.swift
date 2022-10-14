//
//  VideoEntity.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/14/22.
//

import Foundation

struct VideoEntity: Identifiable, Codable {
    var id: Int
    var image: String
    var duration: Int
    var user: UserEntity
    var videoFiles: [VideoFileEntity]

    struct UserEntity: Identifiable, Codable {
        var id: Int
        var name: String
        var url: String

        func toUser(id: Int, name: String, url: String) -> Video.User {
            return Video.User(id: id, name: name, url: url)
        }
    }

    struct VideoFileEntity: Identifiable, Codable {
        var id: Int
        var quality: String
        var fileType: String
        var link: String

        func toVideoFile(id: Int, quality: String, fileType: String, link: String) -> Video.VideoFile {
            return Video.VideoFile(id: id, quality: quality, fileType: fileType, link: link)
        }
    }

    func toVideo(id: Int, image: String, duration: Int, user: UserEntity, videoFiles: [VideoFileEntity]) -> Video {
        return Video(id: id, image: image, duration: duration, user: user.toUser(id: user.id, name: user.name, url: user.url), videoFiles: videoFiles.map { e in e.toVideoFile(id: e.id, quality: e.quality, fileType: e.fileType, link: e.link) })
    }
}
