//
//  BestAPI.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/29/23.
//

import Foundation
import Moya

final class BestAPI {
    
    static let shared = BestAPI()
    var bestProvider = MoyaProvider<BestService>(plugins: [MoyaLoggerPlugin()])
    
    public init() { }
    
    func getBestBooks(completion: @escaping (NetworkResult<Any>) -> Void) {
        bestProvider.request(.getBestBooks) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeIsAnsweredStatus(by: statusCode, data)
                completion(networkResult)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func judgeIsAnsweredStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<[BestModel]>.self, from: data)
        else {
            return .pathErr
        }
        switch statusCode {
        case 200:
            return .success(decodedData.data ?? "success")
        case 400..<500:
            return .requestErr(decodedData.code)
        case 500:
            return .serverErr
        default:
            return .networkErr
        }
    }
}
