//
//  BestModel.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/21/23.
//

import Foundation

struct BestModel {
    let id: Int
    let title: String
    let imageUrl: String
    let author: String
    let completionRate: Int
    let readingTime: Int
    
    init(id: Int, title: String, imageUrl: String, author: String, completionRate: Int, readingTime: Int) {
        self.id = id
        self.title = title
        self.imageUrl = imageUrl
        self.author = author
        self.completionRate = completionRate
        self.readingTime = readingTime
    }
}
