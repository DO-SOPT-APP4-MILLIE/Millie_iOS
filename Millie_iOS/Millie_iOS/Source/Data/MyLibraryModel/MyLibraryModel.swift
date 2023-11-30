//
//  MyLibraryModel.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/23/23.
//

import Foundation

struct MyLibraryModel: Codable {
    let category: String
    let book: [MyLibraryBookModel]
}

struct MyLibraryBookModel: Codable {
    let id: Int
    let thumbnail: String
}
