//
//  HTTPClient.swift
//  SkillSwapApp
//
//  Created by Sreekutty Maya on 06/07/2025.
//

import Foundation

protocol HTTPClient {
    func postRequest(url: String) async throws -> Data
}
