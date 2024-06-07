//
//  PostCell.swift
//  Flickr
//
//  Created by Eduardo Fornari on 07/06/24.
//

import SwiftUI

struct PostCell: View {

    // MARK: - Internal Properties

    let model: Post

    // MARK: - Private Properties

    private let width = (UIScreen.main.bounds.width / 2) - 1

    var body: some View {
        AsyncImage(url: URL(string: model.media.url)) { image in
            image.resizable().scaledToFill()
        } placeholder: {
            ProgressView()
                .controlSize(.large)
        }
        .frame(width: width, height: width)
        .clipShape(.rect(cornerRadius: 5))
        .foregroundStyle(Color(.systemGray))
    }
}

#Preview {
    PostCell(model: PreviewProvider.post)
}
