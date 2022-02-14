//
//  APIManager.swift
//  ScoopMovies
//
//  Created by Aakash Sinha on 24/06/21.
//

import Foundation


class APIManager: ObservableObject {
    
    @Published var results = [Movie]()
    

    
    init() {
        // json decoding simulation

            guard let url = URL(string: "https://stagingsw.scoopwhoop.com/uns/api/v1/all_shows/") else { return }
            URLSession.shared.dataTask(with: url) { (data, resp, err) in
                // check response status and err
                guard let data = data else { return }
                do {
                    let moviesList = try JSONDecoder().decode(MovieResponse.self, from: data)
                    print(moviesList)
                    
                    DispatchQueue.main.async {
                        self.results = moviesList.data
                    }
                   
                } catch {
                    print("Failed to decode: \(error)")
                }
            }.resume()
        
        
       
    }
    
   

}
