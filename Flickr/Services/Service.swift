import Foundation

final class Service {

    // MARK: - Static Properties

    static let shared = Service()

    // MARK: - Initializers

    private init() { }

    func loadData(
        searchText: String,
        result: @escaping (_ failureMsg: Result<ImagesData, Error>) -> Void) {
            let urlString = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=\(searchText)"
            Task {
                guard let url = URL(string: urlString) else {
                    result(.failure(AppError.url))
                    return
                }
                do {
                    let (data, _) = try await URLSession.shared.data(from: url)
                    let model = try JSONDecoder().decode(ImagesData.self, from: data)
                    result(.success(model))
                } catch {
                    result(.failure(AppError.generic))
                }
            }
        }
}
