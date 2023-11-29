//
//  BestModel.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/21/23.
//

import Foundation

struct BestModel: Codable {
    let id: Int
    let title: String
    let thumbnail: String
    let author: String
    let completionRate: Int
    let readingTime: Int
    let rankChange: Int?
}
