//
//  MovieGridView.swift
//  ScoopMovies
//
//  Created by Aakash Sinha on 24/06/21.
//

import SwiftUI
import Kingfisher


struct MoviesView: View {
   

    @ObservedObject var api = APIManager()
    @ObservedObject var showApi = APIShowManager()
    
    
    var body: some View {
        
        NavigationView {
    
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: [
                
                GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .top),
                GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16),
            ], alignment: .leading, spacing: 16, content: {
                ForEach(api.results, id: \.self) { res in
                    
                    NavigationLink(destination: ShowDetailsView(show: res.topicSlug!)
                 
                    ,label: {
                        MovieCellView(res: res)
                        
                                })
                    
                   
                }
               
            })
            .padding(.top, 15)
            .padding(.horizontal, 2)
            
        }
        .background(Color(#colorLiteral(red: 0.09784125612, green: 0.1059348661, blue: 0.117692871, alpha: 1)))
        .navigationBarTitle("Top Shows")
        
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarColor(backgroundColor: .black, tintColor: .white)
        .navigationBarBackButtonHidden(false)
        .navigationBarItems(leading:
                    Button(action: {
                       
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                           
                        }
                })
            
           
        
    }
        
        
    }
    
   
}

    



struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
