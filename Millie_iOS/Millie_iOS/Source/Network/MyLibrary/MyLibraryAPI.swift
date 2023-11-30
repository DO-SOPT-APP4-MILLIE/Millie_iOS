//
//  MyLibraryAPI.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/30/23.
//

import Foundation
import Moya

final class MyLibraryAPI {
    
    static let shared = MyLibraryAPI()
    var myLibraryProvider = MoyaProvider<MyLibraryService>(plugins: [MoyaLoggerPlugin()])
    
    public init() { }
    
    func getMyCollection(userId: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        myLibraryProvider.request(.getMyCollection(userId: userId)) { (result) in
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
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<[MyLibraryModel]>.self, from: data)
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
