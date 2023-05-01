//
//  Network.swift
//  VideoPlayerApp
//
//  Created by bora ateş on 1.05.2023.
//

import Foundation

struct Network {
    static var reachability: Reachability!
    enum Status: String {
        case unreachable, wifi, wwan
    }
    enum Error: Swift.Error {
        case failedToSetCallout
        case failedToSetDispatchQueue
        case failedToCreateWith(String)
        case failedToInitializeWith(sockaddr_in)
    }
}

struct ReachabilityResponse {
    let isConnected: Bool
    let status : String
    
}
