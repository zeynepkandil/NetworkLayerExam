//
//  API.swift
//  NetworkLayerExam
//
//  Created by Kafein on 24.06.2022.
//

import Moya

enum API {
    case getMostPlayedSongs
}

extension API : TargetType {
    var baseURL: URL {
        switch self {
        default:
            return URL(string: String(format: UrlConstants.baseUrl, "api/v2"))!
        }
    }
    
    var path: String {
        switch self {
        case .getMostPlayedSongs:
            return "/us/music/most-played/10/songs.json"
        }
    }
    
    var method: Method {
        switch self {
        case .getMostPlayedSongs:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getMostPlayedSongs:
            return .requestPlain

        }
    }
    
    var headers: [String : String]? {
        let header : [String : String] = [
            "Content-Type" : "application/json"
        ]
        return header
    }
    
    
}
