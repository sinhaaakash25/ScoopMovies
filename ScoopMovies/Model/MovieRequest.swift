//
//  MovieRequest.swift
//  ScoopMovies
//
//  Created by Aakash Sinha on 23/06/21.
//

import Foundation

struct MovieRequest: Codable {
    var filterType: String
    var filterSlug: String
    
    enum CodingKeys: String, CodingKey {
        
        case filterType = "filter_type"
        case filterSlug = "filter_slug"
    }
    
    init(filterType: String, filterSlug: String) {
        self.filterType = filterType
        self.filterSlug = filterSlug
    }
}
