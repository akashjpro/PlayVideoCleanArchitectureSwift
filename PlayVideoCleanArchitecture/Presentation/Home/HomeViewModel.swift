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
            
            self.state = .isLoading
            
            loadVideo(param: ["searchTerm": selectedQuery.toString, "limit": self.limit, "page": self.page], completion: {(results, error) in
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
            })
        }
    }
    
    var limit: Int = 20
    var page: Int = 0
    
    
    var completionHandler: (() -> Void)?
    
    init() {
        self.state = .isLoading
        loadVideo(param: ["searchTerm": self.selectedQuery.toString, "limit": self.limit, "page": self.page], completion: {(results, error) in
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
        })
    }
    
    
    func setClickCompletion(completionHandler: @escaping (() -> Void)){
        self.completionHandler = completionHandler
    }
    
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
        self.state = .isLoading
        loadVideo(param: ["searchTerm": self.selectedQuery.toString, "limit": self.limit, "page": self.page], completion: {(results, error) in
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
        })
    }
    
    func refresh() {
        print("refresh")
    }    
    
}
