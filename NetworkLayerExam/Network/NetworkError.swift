//
//  NetworkError.swift
//  NetworkLayerExam
//
//  Created by Kafein on 24.06.2022.
//

import Foundation

public enum NetworkError: Error {
    case serializationError(internal: Error)
    case networkError(internal: Error)
}
