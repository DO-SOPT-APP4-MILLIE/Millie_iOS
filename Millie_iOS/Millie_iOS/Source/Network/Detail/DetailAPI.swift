//
//  DetailAPI.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/30/23.
//

import Foundation
import Moya

final class DetailAPI {
    
    static let shared = DetailAPI()
    var detailProvider = MoyaProvider<DetailService>(plugins: [MoyaLoggerPlugin()])
    
    public init() { }
    
    func archiveBook(bookId: Int, userId: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        detailProvider.request(.archiveBook(bookId: bookId, userId: userId)) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data)
                completion(networkResult)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200:
            return .success(statusCode)
        case 400..<500:
            return .requestErr(statusCode)
        case 500:
            return .serverErr
        default:
            return .networkErr
        }
    }
}
