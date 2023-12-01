//
//  DetailService.swift
//  Millie_iOS
//
//  Created by 변상우 on 11/29/23.
//

import Foundation

import Moya

enum DetailService {
    case getBookDetail(Int)
    case archiveBook(bookId: Int, userId: Int)
}

extension DetailService: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getBookDetail(let memberID):
            return URLs.detailBook + "/\(memberID)"
        case .archiveBook(let bookId, _):
            return URLs.detailBook + "/\(bookId)/archive"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getBookDetail:
            return .get
        case .archiveBook:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getBookDetail:
            let params: [String: Any] = [:]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        case .archiveBook:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getBookDetail:
            return ["Content-Type": "application/json"]
        case .archiveBook(_, let userId):
            return ["X-AUTH-ID": "\(userId)"]
        }
    }
}
