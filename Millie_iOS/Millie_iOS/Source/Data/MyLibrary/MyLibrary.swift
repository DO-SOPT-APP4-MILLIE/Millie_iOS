//
//  MyLibrary.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/23/23.
//

import Foundation

struct MyLibrary {
    let category: String
    let books: [MyLibraryBook]
    
    init(category: String, books: [MyLibraryBook]) {
        self.category = category
        self.books = books
    }
}

struct MyLibraryBook {
    let id: Int
    let imageUrl: String
    
    init(id: Int, imageUrl: String) {
        self.id = id
        self.imageUrl = imageUrl
    }
}
