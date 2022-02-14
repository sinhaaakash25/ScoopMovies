//
//  VideoResponse.swift
//  ScoopMovies
//
//  Created by Aakash Sinha on 23/06/21.
//

import Foundation

struct VideoResponse: Codable {
    
    var showDetails: ShowDetails
    var data: [Datum]
    var nextOffset: Int?
    
    enum CodingKeys: String, CodingKey {
        case nextOffset = "next_offset"
        case showDetails = "show_details"
        case data
    }
}

struct Datum: Codable, Identifiable, Hashable {
   
    
    var id: String?
    
    
    var  title: String?
    var featureImg: String?
    
    enum CodingKeys: String, CodingKey {
        case featureImg = "feature_img"
        
        case title
    }
}


struct ShowDetails: Codable, Identifiable, Hashable {
    var totalVideos: Int?
    var id: String?
    var topicName: String?
    
    var topicDesc: String?
    var featureImgLand: String?
    
    
    enum CodingKeys: String, CodingKey {
        
        case topicName = "topic_name"
        case totalVideos = "total_videos"
        case topicDesc = "topic_desc"
        
        case featureImgLand = "feature_img_land"
        
    }
}
