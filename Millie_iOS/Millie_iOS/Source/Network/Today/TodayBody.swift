//
//  TodayBody.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/28/23.
//

import Foundation

struct Todays: Codable {
    let code: Int
    let msg: String
    let data: [TodayData]
}

struct TodayData: Codable {
    let id: Int
    let title: String
    let thumbnail: String
    let author: String
    let completionRate: Int
    let readingTime: Int
    let rankChange : Int?
}
