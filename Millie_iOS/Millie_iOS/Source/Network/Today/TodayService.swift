//
//  TodayService.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/28/23.
//

import Foundation

class TodayService {
    
    static let shared = TodayService()
    
    func getData(completion: @escaping (Todays?, Error?) -> Void) {
        
        let apiUrl = Config.baseURL + URLs.bestBook
        guard let url = URL(string: apiUrl) else {
            completion(nil, nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error : \(error)\n")
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, nil)
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(Todays.self, from: data)
                completion(decodedData, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
