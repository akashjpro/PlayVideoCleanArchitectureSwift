//
//  AppControl.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/18/22.
//

import Foundation

class AppControl: ObservableObject {
    
    static let shared = AppControl()
    
    @Published var showingAlert = false
    
    @Published var LoadingzIndex: Double = 0.0
    @Published var ErrorzIndex: Double = 0.0
    
    @Published var message: String = ""
    @Published var title: String = ""
    
    func setTitle(title: String) {
        self.title = title
    }
    
    func setMessage(message: String) {
        self.message = message
    }
    
    
    func showLoading() {
        LoadingzIndex = 1.0
    }
    
    func hideLoading() {
        LoadingzIndex = 0.0
    }
    
    func showError() {
        ErrorzIndex = 1.0
    }
    
    func hideError() {
        ErrorzIndex = 0.0
    }
}
