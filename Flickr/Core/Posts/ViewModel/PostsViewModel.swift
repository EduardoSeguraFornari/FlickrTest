import Foundation

@MainActor
final class PostsViewModel: ObservableObject {

    // MARK: - Internal Properties
    // Inputs
    @Published var searchText: String = "" {
        didSet {
            Task {
                await loadData()
            }
        }
    }
    // Outputs
    @Published var models = [Post]()
    let navigationTitle = "Posts"

    // MARK: - Private Properties

    private let service: ServiceProtocol

    // MARK: - Initializers

    init(service: ServiceProtocol) {
        self.service = service
        Task {
            await loadData()
        }
    }

    private func loadData() async {
        var searchText = searchText
        searchText = searchText.replacingOccurrences(of: " ", with: ",")
        searchText = searchText.removeMultipleChar(char: ",")
        let result = await service.fetchPosts(searchText: searchText.replacingOccurrences(of: " ", with: ","))
        switch result {
        case let .success(model):
            models = model.items
        case let .failure(error):
            print(error.localizedDescription)
        }
    }
}
