//
//  HomeViewModel.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/12/22.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var state: FetchState = .good
    @Published var videos: [Video] = []
    
    @Published var selectedQuery: Query = Query.nature {
        // Once the selectedQuery variable is set, we'll call the API again
        didSet {
            self.videos = []
            limit = 20
            page = 0
            
            loadHome()
        }
    }
    
    private var limit: Int = 20
    private var page: Int = 0
    
    private let loadVideoAPIUseCase: LoadVideoAPIUseCase = LoadVideoAPIUseCase()
    
    var completionHandler: (() -> Void)?
    
    func setClickCompletion(completionHandler: @escaping (() -> Void)){
        self.completionHandler = completionHandler
    }
    
    func loadHome() {
        self.state = .isLoading
        loadVideo(params: ["searchTerm": self.selectedQuery.toString, "limit": self.limit, "page": self.page], completion: {(results, error) in
            DispatchQueue.main.async {
                if let error = error {
                   print("ERROR=====")
                    self.state = .error(error.localizedDescription)
                } else {
                    if let resultsUnwrap = results {
                        for video in resultsUnwrap.videos {
                            self.videos.append(video)
                        }
                        
                        self.page += 1
                        self.state = (resultsUnwrap.videos.count == self.limit) ? .good : .loadedAll
                    }
                }
            }
        })
    }
    
    func loadVideo(params: [String: Any], completion: @escaping (ResponseBody?, ServiceError?) -> ()) {
        print("loadVideo")
        
        loadVideoAPIUseCase.call(params: params, completion: completion)
    }
    
    func loadMore() {
        print("loadMore")
        loadHome()
    }
    
    func refresh() {
        print("refresh")
    }    
    
}
