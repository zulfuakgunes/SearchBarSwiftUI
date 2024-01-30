//
//  HTTP.swift
//  SearchBarSwiftUI
//
//  Created by Zülfü Akgüneş on 30.01.2024.
//

import Foundation

enum HTTP {
        
    enum Method: String {
        case get = "GET"
        case post = "POST"
    }
    
    enum Headers {
        
        enum Key: String {
            case contentType = "Content-Type"
        }
        
        enum Value: String {
            case applicationJson = "application/json"
        }
    }
    
}
