//
//  LoadVideoAPIRespository.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/18/22.
//

import Foundation

protocol LoadVideoAPIRespository {
    func loadVideoAPIRespository(params: [String: Any], completion: @escaping (ResponseBody?, ServiceError?) -> ())
}
