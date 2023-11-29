//
//  DetailBody.swift
//  Millie_iOS
//
//  Created by 변상우 on 11/29/23.
//

import Foundation

struct Details: Codable {
    let code: Int
    let msg: String
    let data: DetailData
}

struct DetailData: Codable {
    let id: Int
    let title: String
    let author: String
    let thumbnail: String
    let archivedCount: Int
    let postCount: Int
    let reviewCount: Int
    let Description: String
}
