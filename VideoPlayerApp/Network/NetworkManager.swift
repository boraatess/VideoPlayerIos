//
//  NetworkManager.swift
//  VideoPlayerApp
//
//  Created by bora ateş on 25.04.2023.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    func request<T: Decodable>(type: T.Type, url: String, method: HTTPMethods, completion: @escaping((Result<T,ErrorTypes>)-> ())) {
               
        let session = URLSession.shared
        if let url = URL(string: url) {
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            
            let dataTask = session.dataTask(with: request) { data, response, error in
                if let _ = error {
                    completion(.failure(.generalError))
                }
                else if let data = data {
                    if let dataString = String(data: data, encoding: .utf8) {
                        print(dataString)
                    }
                    guard let httpResponse = response as? HTTPURLResponse else { return }
                    print("statusCode: \(httpResponse.statusCode)")

                    self.handleResponse(data: data) { response in
                        completion(response)
                    }
                }
                else if let httpResponse = response as? HTTPURLResponse {
                     print("statusCode: \(httpResponse.statusCode)")
                 }
                else {
                    completion(.failure(.invalidUrl))
                }
            }
            dataTask.resume()
            
        }
        
    }
    
    private func handleResponse<T: Decodable>(data: Data, completion: @escaping((Result<T,ErrorTypes>)-> ())) {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        } catch  {
            completion(.failure(.invalidData))
        }
    }
    
}
