//
//  MyLibraryModel.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/23/23.
//

import Foundation

struct MyLibraryModel {
    let category: String
    let books: [MyLibraryBookModel]
    
    init(category: String, books: [MyLibraryBookModel]) {
        self.category = category
        self.books = books
    }
}

struct MyLibraryBookModel {
    let id: Int
    let imageUrl: String
    
    init(id: Int, imageUrl: String) {
        self.id = id
        self.imageUrl = imageUrl
    }
}
