//
//  NetworkResult.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/28/23.
//

import Foundation

enum NetworkResult<T> {
    case success(T)  
    case requestErr(T)
    case pathErr
    case serverErr
    case networkErr
}
