//
//  PostDetailsViewModel.swift
//  Flickr
//
//  Created by Eduardo Fornari on 07/06/24.
//

import Foundation

struct PostDetailsViewModel {

    // MARK: - Private Properties

    private let model: Post

    let authorTitle = "Author: "
    var authorValue: String {
        model.author.extractAuthor()
    }
    var description: String {
        print(model.description)
        print()
        print()
        print()
        return model.description.extractDescription()
    }
    let imageDimensionsTitle = "Image dimensions: "
    var imageDimensionsValue: String {
        model.description.extractDimensions().string
    }
    let navigationTitle = "Post"
    let publicationDateTitle = "Published at: "
    var publicationDateValue: String {
        model.published.string()
    }
    var title: String {
        model.title.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    var imageUrl: URL? {
        URL(string: model.media.url)
    }

    // MARK: - Initializers

    init(model: Post) {
        self.model = model
    }
}
