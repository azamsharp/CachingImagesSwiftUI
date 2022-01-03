//
//  PhotoListViewModel.swift
//  CachingImages
//
//  Created by Mohammad Azam on 1/3/22.
//

import Foundation

@MainActor 
class PhotoListViewModel: ObservableObject {
    
    @Published var photos: [PhotoViewModel] = []
    
    func populatePhotos() async {
        
        do {
            let photos = try await Webservice().getPhotos()
            self.photos = photos.map(PhotoViewModel.init)
            
        } catch {
            print(error)
        }
        
    }
}

struct PhotoViewModel: Identifiable {
    
    private var photo: Photo
    
    init(photo: Photo) {
        self.photo = photo
    }
    
    let id = UUID()
    
    var title: String {
        photo.title
    }
    
    var thumbnailUrl: URL? {
        URL(string: photo.thumbnailUrl)
    }
    
}
