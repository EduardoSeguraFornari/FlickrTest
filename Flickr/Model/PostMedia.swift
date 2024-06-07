//
//  PostMedia.swift
//  Flickr
//
//  Created by Eduardo Fornari on 07/06/24.
//

import Foundation

struct PostMedia {
    let url: String

    private enum CodingKeys: String, CodingKey {
        case url = "m"
    }
}

extension PostMedia: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decode(String.self, forKey: .url)
    }
}
