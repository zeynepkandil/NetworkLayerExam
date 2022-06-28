//
//  Author.swift
//  NetworkLayerExam
//
//  Created by Kafein on 24.06.2022.
//

import Foundation

struct Author: Codable {

    let name: String?
    let url: String?

    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(url, forKey: .url)
    }

}
