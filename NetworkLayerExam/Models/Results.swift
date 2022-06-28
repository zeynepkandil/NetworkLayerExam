//
//  Results.swift
//  NetworkLayerExam
//
//  Created by Kafein on 24.06.2022.
//

import Foundation

struct Results: Codable {

    let artistName: String?
    let id: String?
    let name: String?
    let releaseDate: String?
    let kind: String?
    let artistId: String?
    let artistUrl: String?
    let contentAdvisoryRating: String?
    let artworkUrl100: String?
    let genres: [Genres]?
    let url: String?

    private enum CodingKeys: String, CodingKey {
        case artistName = "artistName"
        case id = "id"
        case name = "name"
        case releaseDate = "releaseDate"
        case kind = "kind"
        case artistId = "artistId"
        case artistUrl = "artistUrl"
        case contentAdvisoryRating = "contentAdvisoryRating"
        case artworkUrl100 = "artworkUrl100"
        case genres = "genres"
        case url = "url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        artistName = try values.decodeIfPresent(String.self, forKey: .artistName)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        kind = try values.decodeIfPresent(String.self, forKey: .kind)
        artistId = try values.decodeIfPresent(String.self, forKey: .artistId)
        artistUrl = try values.decodeIfPresent(String.self, forKey: .artistUrl)
        contentAdvisoryRating = try values.decodeIfPresent(String.self, forKey: .contentAdvisoryRating)
        artworkUrl100 = try values.decodeIfPresent(String.self, forKey: .artworkUrl100)
        genres = try values.decodeIfPresent([Genres].self, forKey: .genres)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(artistName, forKey: .artistName)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(releaseDate, forKey: .releaseDate)
        try container.encodeIfPresent(kind, forKey: .kind)
        try container.encodeIfPresent(artistId, forKey: .artistId)
        try container.encodeIfPresent(artistUrl, forKey: .artistUrl)
        try container.encodeIfPresent(contentAdvisoryRating, forKey: .contentAdvisoryRating)
        try container.encodeIfPresent(artworkUrl100, forKey: .artworkUrl100)
        try container.encodeIfPresent(genres, forKey: .genres)
        try container.encodeIfPresent(url, forKey: .url)
    }

}
