//
//  LoadVideoAPIUseCase.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/18/22.
//

import Foundation

class LoadVideoAPIUseCase {
    
    private let loadVideoAPIRespository: LoadVideoAPIRespository = LoadVideoAPIRespositoryImpl()
    
    func call(params: [String: Any], completion: @escaping (ResponseBody?, ServiceError?) -> ()) {
        loadVideoAPIRespository.loadVideoAPIRespository(params: params, completion: completion)
    }
}
