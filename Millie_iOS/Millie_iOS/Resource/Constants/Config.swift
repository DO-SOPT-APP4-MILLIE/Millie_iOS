//
//  Config.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/28/23.
//

import Foundation

struct Config {
    static var baseURL = Bundle.main.infoDictionary?["BASE_URL"] as! String
}
