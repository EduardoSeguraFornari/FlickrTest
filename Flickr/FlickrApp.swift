//
//  FlickrApp.swift
//  Flickr
//
//  Created by Eduardo Fornari on 06/06/24.
//

import SwiftUI

@main
struct FlickrApp: App {
    var body: some Scene {
        WindowGroup {
            PostsView(with: PostsViewModel(service: Service()))
        }
    }
}
