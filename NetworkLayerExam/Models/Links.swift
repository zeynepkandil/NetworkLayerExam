//
//  Links.swift
//  NetworkLayerExam
//
//  Created by Kafein on 24.06.2022.
//

import Foundation

struct Links: Codable {

    let selfField: String?

    private enum CodingKeys: String, CodingKey {
        case selfField = "self"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        selfField = try values.decodeIfPresent(String.self, forKey: .selfField)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(selfField, forKey: .selfField)
    }

}
