//
//  HomeViewModel.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/12/22.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var videos: [Video] = []
    
    var limit: Int = 20
    var page: Int = 0
    
    func loadVideo(param: [String: Any], completion: @escaping (ResponseBody?, ServiceError?) -> ()) {
        print("loadVideo")
        
        let request = VideoAPI()
        
        let apiLoader = APILoader(apiHandler: request)
        apiLoader.loadAPIRequest(requestData: param) { (model, error) in
            if let _ = error {
                completion(nil, error)
            } else {
                completion(model, nil)
            }
        }
    }
    
    func loadMore() {
        print("loadMore")
    }
    
    func refresh() {
        print("refresh")
    }    
    
}
