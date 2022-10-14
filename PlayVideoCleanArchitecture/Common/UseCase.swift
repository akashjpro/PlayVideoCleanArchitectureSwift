//
//  UseCase.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/14/22.
//

import Foundation

public protocol UseCase {
    
    associatedtype T
    
    func call(url: String?, params: [String: Any], completion: @escaping(T) -> Void)
}
