//
//  MovieCellView.swift
//  ScoopMovies
//
//  Created by Aakash Sinha on 24/06/21.
//

import SwiftUI
import Kingfisher

struct MovieCellView: View  {
    
    let res : Movie
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            
            KFImage(URL(string: res.featureImgPort!))
                .resizable()
                .scaledToFit()
                
                .overlay(ZStack {
                    Text(res.topicName ?? "topic")
                        .font(.system(size: 18, weight:.semibold))
                        .foregroundColor(Color.white)
                        .padding(.top, 4)
                }
                .opacity(1)
                
                .padding(),
                alignment: .bottomLeading)

        }
        .cornerRadius(5.0)
        
        .shadow(color: .black, radius: 2)
        
    }
}



