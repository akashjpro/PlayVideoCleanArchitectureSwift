//
//  VideoAPI.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/12/22.
//

import Foundation

struct VideoAPI: APIHandler {
    
    func makeRequest(from param: [String: Any]) -> URLRequest? {
        let searchTerm: String = param["searchTerm"] as! String
        let limit: Int = param["limit"] as! Int
        let page: Int = param["page"] as! Int
        
        let urlString = "https://api.pexels.com/videos/search?query=\(searchTerm)&per_page=\(limit)&page=\(page)&orientation=portrait"
        
        if var url = URL(string: urlString) {
//            if param.count > 0 && param.contains(where: { param in param.key == "empty"}) {
//                url = setQueryParams(parameters: param, url: url)
//            }
            var urlRequest = URLRequest(url: url)
            // Setting the Authorization header of the HTTP request - replace YOUR_API_KEY by your own API key
            urlRequest.setValue("563492ad6f917000010000019dc3ad8da26c40369ec181388d819b7b", forHTTPHeaderField: "Authorization")
            setDefaultHeaders(request: &urlRequest)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            return urlRequest
        }
        return nil
    }
    
    func parseResponse(data: Data, response: HTTPURLResponse) throws -> ResponseBody {
        return try defaultParseResponse(data: data, response: response)
    }
}
