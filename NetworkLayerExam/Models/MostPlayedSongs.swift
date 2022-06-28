//
//  MostPlayedSongs.swift
//  NetworkLayerExam
//
//  Created by Kafein on 24.06.2022.
//

import Foundation

struct MostPlayedSongs: Codable {

    let feed: Feed?

    private enum CodingKeys: String, CodingKey {
        case feed = "feed"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        feed = try values.decodeIfPresent(Feed.self, forKey: .feed)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(feed, forKey: .feed)
    }

}
