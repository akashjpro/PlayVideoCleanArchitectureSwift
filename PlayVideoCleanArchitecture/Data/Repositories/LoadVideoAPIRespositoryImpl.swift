//
//  LoadVideoAPIRespositoryImpl.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/18/22.
//

import Foundation

class LoadVideoAPIRespositoryImpl: LoadVideoAPIRespository {
    func loadVideoAPIRespository(params: [String : Any], completion: @escaping (ResponseBody?, ServiceError?) -> ()) {
        if ConnectCheckUtil.shared.isReachable {
            let request = VideoAPI()
            
            let apiLoader = APILoader(apiHandler: request)
            apiLoader.loadAPIRequest(requestData: params) { (model, error) in
                if let _ = error {
                    completion(nil, error)
                } else {
                    completion(model, nil)
                }
            }
        } else {
            AppControl.shared.showingAlert = true
        }
    }
    
}
