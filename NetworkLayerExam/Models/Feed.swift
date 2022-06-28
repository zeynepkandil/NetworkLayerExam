//
//  Feed.swift
//  NetworkLayerExam
//
//  Created by Kafein on 24.06.2022.
//

import Foundation

struct Feed: Codable {

    let title: String?
    let id: String?
    let author: Author?
    let links: [Links]?
    let copyright: String?
    let country: String?
    let icon: String?
    let updated: String?
    let results: [Results]?

    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case id = "id"
        case author = "author"
        case links = "links"
        case copyright = "copyright"
        case country = "country"
        case icon = "icon"
        case updated = "updated"
        case results = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        author = try values.decodeIfPresent(Author.self, forKey: .author)
        links = try values.decodeIfPresent([Links].self, forKey: .links)
        copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        updated = try values.decodeIfPresent(String.self, forKey: .updated)
        results = try values.decodeIfPresent([Results].self, forKey: .results)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(author, forKey: .author)
        try container.encodeIfPresent(links, forKey: .links)
        try container.encodeIfPresent(copyright, forKey: .copyright)
        try container.encodeIfPresent(country, forKey: .country)
        try container.encodeIfPresent(icon, forKey: .icon)
        try container.encodeIfPresent(updated, forKey: .updated)
        try container.encodeIfPresent(results, forKey: .results)
    }

}
