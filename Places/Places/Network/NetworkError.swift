//
//  NetworkError.swift
//  Places
//
//  Created by Ahmed Moncer on 25/08/2024.
//

enum NetworkError: Error {
    case invalidURL
    case unknown
    case decode
    case statusNotOk
    case serialization
}
