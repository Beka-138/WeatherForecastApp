//
//  Network.swift
//  Weather
//
//  Created by Archibbald on 03.03.2024.
//

import Foundation
import Alamofire

extension DataRequest {
    func body<T: Decodable>(decoder: any DataDecoder = JSONDecoder()) async throws -> T {
        try await withCheckedThrowingContinuation { continuation in
            self
                .responseDecodable(of: T.self, decoder: decoder) { response in
                    continuation.resume(with: response.result)
                }
        }
    }
}
