//
//  BestService.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/29/23.
//

import Foundation
import Moya

enum BestService {
    case getBestBooks
}

extension BestService: TargetType {
    
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getBestBooks:
            return URLs.bestBook
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getBestBooks:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getBestBooks:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getBestBooks:
            return ["Content-Type": "application/json"]
        }
    }
}
