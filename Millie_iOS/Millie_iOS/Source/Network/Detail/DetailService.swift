//
//  DetailService.swift
//  Millie_iOS
//
//  Created by 변상우 on 11/29/23.
//

import Foundation

import Moya

enum DetailAPI {
    case getBookDetail(Int)
}

extension DetailAPI: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getBookDetail(let memberID):
            return URLs.detailBook + "/\(memberID)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getBookDetail:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getBookDetail:
            let params: [String: Any] = [:]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
