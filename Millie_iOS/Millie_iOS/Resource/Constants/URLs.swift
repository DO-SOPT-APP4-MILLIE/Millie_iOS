//
//  URLs.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/28/23.
//

import Foundation

public enum URLs {
    
    //도서 베스트 List
    static let bestBook = "/api/books"
    
    //도서 Detail
    static let detailBook = "/api/books"

    //유저 도서 담기
    static let archiveBook = "/api/books/{bookId}/archive"
    
    //유저 담은 책 List
    static let collectionsBook = "/api/me/collections"
}
