//
//  UrlConstants.swift
//  NetworkLayerExam
//
//  Created by Kafein on 24.06.2022.
//

import Foundation

class UrlConstants : NSObject {
    static var baseUrl: String {
        #if DEBUG
        return "https://rss.applemarketingtools.com/%@"
        #else
        return "https://rss.applemarketingtools.com/%@"
        #endif
    }
}
