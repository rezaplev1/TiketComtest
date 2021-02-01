//
//  ServiceConfig.swift
//  TiketComtest
//
//  Created by reza pahlevi on 30/01/21.
//

import Foundation
import Alamofire

private let SERVICE_HERO_STATS = "/api/herostats"

enum ServiceConfig {
    case getHeroStats
}

extension ServiceConfig: URLRequestConvertible {
    var baseURL: String {
        switch self {
        case .getHeroStats:
            return Constants.BASE_URL
        }
    }
    
    var path: String {
        switch self {
        case .getHeroStats:
            return SERVICE_HERO_STATS
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getHeroStats:
            return .get
  
        }
    }
    
    func createURLEncoding(url: URL, param: [String: Any] = [:]) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        
        do {
            urlRequest.httpMethod = method.rawValue
            urlRequest.timeoutInterval = TimeInterval(30)
            urlRequest = try URLEncoding.default.encode(urlRequest, with: param)
        } catch {
            print("ERROR ENCODE URL REQUEST")
        }
        
        return urlRequest
    }
    
    func createJSONEncoding(url: URL, param: [String: Any]) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        
        do {
            urlRequest.httpMethod = method.rawValue
            urlRequest.timeoutInterval = TimeInterval(30)
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: param)
        } catch {
            print("ERROR ENCODE URL REQUEST")
        }
        
        return urlRequest
    }
    
    public func asURLRequest() throws -> URLRequest {
        switch self {
        
        case .getHeroStats:
            let link = "\(baseURL)\(path)"
            let url = URL(string: link)!
            let urlRequest = createURLEncoding(url: url)
            return urlRequest
        }
    }
}
