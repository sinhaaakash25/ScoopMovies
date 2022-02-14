//
//  APIShowManager.swift
//  ScoopMovies
//
//  Created by Aakash Sinha on 24/06/21.
//

import Foundation
import SwiftUI

class APIShowManager: ObservableObject {
    

    
    
    @Published var showDetailsArray = ShowDetails()
    @Published var showDescriptionArray = [Datum]()
    
    
    
    func getShowDetails(filterSlug: String?) {
    
        print(filterSlug!)
        
       let filter = createPercentageEncodedString(from: filterSlug!)

        guard let url = URL(string: ("https://stagingsw.scoopwhoop.com/uns/api/v1/videos/?filter_type=show&filter_slug=\(filter!)&offset=20")) else { return }
             
        
       

        print(url)
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            // check response status and err
            guard let data = data else { return }
            do {
                let showList = try JSONDecoder().decode(VideoResponse.self, from: data)
                

                DispatchQueue.main.async {
                    
                    self.showDescriptionArray.append(contentsOf: showList.data)
                    self.showDetailsArray = showList.showDetails
                  
                }

            } catch {
                print("Failed to decode: \(error)")
            }
        }.resume()
    }
    
    func createPercentageEncodedString(from value: String) -> String? {
        return value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
    
    



}
