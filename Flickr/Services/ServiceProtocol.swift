//
//  ServiceProtocol.swift
//  Flickr
//
//  Created by Eduardo Fornari on 07/06/24.
//

protocol ServiceProtocol {
    func fetchPosts(searchText: String) async -> Result<Posts, Error>
}
