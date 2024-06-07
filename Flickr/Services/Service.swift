//
//  Service.swift
//  Flickr
//
//  Created by Eduardo Fornari on 07/06/24.
//

import Foundation

final class Service: ServiceProtocol {
    func fetchPosts(searchText: String) async -> Result<Posts, Error> {
        let urlString = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=\(searchText)"
        guard let url = URL(string: urlString) else {
            return .failure(AppError.url)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let model = try JSONDecoder().decode(Posts.self, from: data)
            return .success(model)
        } catch {
            return .failure(AppError.decode)
        }
    }
}
