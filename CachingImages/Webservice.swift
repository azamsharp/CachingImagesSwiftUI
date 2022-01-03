//
//  Webservice.swift
//  CachingImages
//
//  Created by Mohammad Azam on 1/3/22.
//

import Foundation


class Webservice {
    
    func getPhotos() async throws -> [Photo] {
        
        let (data, _) = try await URLSession.shared.data(from: URL(string: "https://jsonplaceholder.typicode.com/photos")!)
        return try JSONDecoder().decode([Photo].self, from: data)
    }
    
}
