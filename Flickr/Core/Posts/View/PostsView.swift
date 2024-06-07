import SwiftUI

struct PostsView: View {

    // MARK: - Private Properties

    @State private var selectedItem: Post?
    @StateObject private var viewModel: PostsViewModel

    // MARK: - Private Initializers

    init(with viewModel: PostsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    ImageGridView(images: viewModel.models, selectedItem: $selectedItem)
                }
            }
            .navigationTitle(viewModel.navigationTitle)
        }
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .sheet(item: $selectedItem) { item in
            PostDetailsView(with: PostDetailsViewModel(model: item))
        }
    }
}

#Preview {
    PostsView(with: PostsViewModel(service: ServiceMock()))
}
