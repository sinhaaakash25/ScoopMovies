//
//  ShowCellView.swift
//  ScoopMovies
//
//  Created by Aakash Sinha on 24/06/21.
//

import SwiftUI
import Kingfisher

struct ShowCellView: View {
    

    let response : Datum
    
   
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            
            KFImage(URL(string: response.featureImg!))
                .resizable()
      
                .scaledToFit()
                .overlay(ZStack {
                    Text(response.title ?? "topic")
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


