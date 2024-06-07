//
//  PostDetailsViewModel.swift
//  Flickr
//
//  Created by Eduardo Fornari on 07/06/24.
//

import SwiftUI

struct PostsGridView: View {

    // MARK: - Internal Properties

    let models: [Post]
    @Binding var selectedItem: Post?

    // MARK: - Private Properties

    private let items = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 0)
    ]

    var body: some View {
        LazyVGrid(columns: items, spacing: 1) {
            ForEach(models) { model in
                PostCell(model: model)
                    .onTapGesture { selectedItem = model }
            }
        }
    }
}

struct PostGridViewMock {
    @State var selectedItem: Post?
    let images = PreviewProvider.postsData.items
}

#Preview {
    PostsGridView(models: PostGridViewMock().images, selectedItem: PostGridViewMock().$selectedItem)
}
