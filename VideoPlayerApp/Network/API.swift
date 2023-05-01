//
//  API.swift
//  VideoPlayerApp
//
//  Created by bora ateş on 25.04.2023.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum ErrorTypes: String,Error {
    case invalidData = "invalid Data"
    case invalidUrl = "invalid Url"
    case generalError = "An error occured"
}
