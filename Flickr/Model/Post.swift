import Foundation

struct Post: Identifiable {
    let author: String
    let description: String
    let id: String = UUID().uuidString
    let media: Media
    let published: Date
    let title: String

    enum CodingKeys: String, CodingKey {
        case author
        case description
        case media
        case published
        case title
    }
}

extension Post: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.author = try container.decode(String.self, forKey: .author)
        self.description = try container.decode(String.self, forKey: .description)
        self.media = try container.decode(Media.self, forKey: .media)
        let stringDate = try container.decode(String.self, forKey: .published)
        if let date = stringDate.date(with: "YYYY-MM-DD'T'HH:mm:ss'Z'") {
            self.published = date
        } else {
            throw DecodingError.dataCorruptedError(
                forKey: .published,
                in: container,
                debugDescription: "Date string does not match expected format"
            )
        }
        self.title = try container.decode(String.self, forKey: .title)
    }
}
