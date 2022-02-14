//
//  MovieResponse.swift
//  ScoopMovies
//
//  Created by Aakash Sinha on 23/06/21.
//

import Foundation

struct MovieResponse: Codable {
 
    var data: [Movie]
}

struct Movie: Codable, Identifiable, Hashable {
    
    var id: String?
    var featureImgPort: String?
    var topicName: String?
    var topicSlug: String?
    
    enum CodingKeys: String, CodingKey {
            case featureImgPort = "feature_img_port"
            case topicName = "topic_name"
            case topicSlug = "topic_slug"
    }
    
}
