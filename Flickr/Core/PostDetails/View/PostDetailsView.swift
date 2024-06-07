//
//  PostDetailsView.swift
//  Flickr
//
//  Created by Eduardo Fornari on 07/06/24.
//

import SwiftUI
import AVKit

struct PostDetailsView: View {

    // MARK: - Private Initializers

    private let viewModel: PostDetailsViewModel

    // MARK: - Initializers

    init(with viewModel: PostDetailsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    AsyncImage(url: viewModel.imageUrl) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                            .controlSize(.large)
                    }
                    .padding(.bottom, 10)
                    VStack(alignment: .leading) {
                        if !viewModel.title.isEmpty {
                            Text(viewModel.title)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.bottom, 10)
                        }
                        if !viewModel.description.isEmpty {
                            Text(viewModel.description)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .padding(.bottom, 10)
                        }
                        (Text(viewModel.authorTitle).fontWeight(.bold) +
                        Text(viewModel.authorValue))
                            .font(.caption)
                            .padding(.bottom, 5)
                        (Text(viewModel.publicationDateTitle).fontWeight(.bold) +
                        Text(viewModel.publicationDateValue))
                            .font(.caption)
                            .padding(.bottom, 5)
                        (Text(viewModel.imageDimensionsTitle).fontWeight(.bold) +
                         Text(viewModel.imageDimensionsValue))
                            .font(.caption)
                    }
                }
                .padding()
            }
            .navigationTitle(viewModel.navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    PostDetailsView(with: PostDetailsViewModel(model: PreviewProvider.post))
}
