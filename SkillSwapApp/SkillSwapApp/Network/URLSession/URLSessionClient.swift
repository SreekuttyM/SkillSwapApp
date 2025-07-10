//
//  URLSessionClient.swift
//  SkillSwapApp
//
//  Created by Sreekutty Maya on 23/06/2025.
//

import Foundation

class URLSessionClient : HTTPClient {
    private let session : URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func postRequest(url: String) async throws  -> Data {
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: URL(string: url)!))
        guard let responseCode = response as? HTTPURLResponse, responseCode.statusCode >= 200 && responseCode.statusCode <= 299 else {
            throw URLError(.badURL)
        }asdasf affnaf anfnf  snfnsf nnfsf mfd nf nff nsdndf nnfd sndf ndfnnf 
        return data
    }
    
    
}

