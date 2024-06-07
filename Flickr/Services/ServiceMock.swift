//
//  ServiceMock.swift
//  Flickr
//
//  Created by Eduardo Fornari on 07/06/24.
//

final class ServiceMock: ServiceProtocol {
    func fetchPosts(searchText: String) async -> Result<Posts, Error> {
        return .success(PreviewProvider.postsData)
    }
}
