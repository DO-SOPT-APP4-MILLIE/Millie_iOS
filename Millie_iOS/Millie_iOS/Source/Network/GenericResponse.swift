//
//  GenericResponse.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/29/23.
//

import Foundation

struct GenericResponse<T: Codable>: Codable {
    var code: Int
    var msg: String?
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case code, msg, data
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = (try? values.decode(Int.self, forKey: .code)) ?? 0
        msg = (try? values.decode(String.self, forKey: .msg)) ?? ""
        data = (try? values.decode(T.self, forKey: .data)) ?? nil
    }
}
