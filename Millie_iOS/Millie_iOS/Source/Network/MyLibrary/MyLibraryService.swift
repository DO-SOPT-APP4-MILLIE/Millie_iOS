//
//  MyLibraryService.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/30/23.
//

import Foundation
import Moya

enum MyLibraryService {
    case getMyCollection(userId: Int)
}

extension MyLibraryService: TargetType {
    
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getMyCollection:
            return URLs.collectionsBook
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMyCollection:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getMyCollection:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getMyCollection(let userId):
            return [
                "Content-Type": "application/json",
                "X-AUTH-ID": "\(userId)"
            ]
        }
    }
}
