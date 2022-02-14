//
//  ShowDetailsView.swift
//  ScoopMovies
//
//  Created by Aakash Sinha on 24/06/21.
//

import SwiftUI
import Kingfisher

struct ShowDetailsView: View {
    
    let show: String
    
    @ObservedObject var showApi = APIShowManager()
    
    
    var body: some View {
        
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack {
                KFImage(URL(string: showApi.showDetailsArray.featureImgLand ?? "pic1"))
                    .placeholder {
                        Image("placeholder")
                            .resizable()
                        
                        
                    }
                    .resizable()
                    
                    .frame(height: 420)
                
                
                
                VStack(alignment: .leading, spacing: 8){
                    
                    Text(showApi.showDetailsArray.topicName ?? "sdad")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
          
                    
                    Text(showApi.showDetailsArray.topicDesc ?? "sdad")
                        .font(.system(size: 16))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                }
                .padding(.vertical, 8)
                
                Divider()
                    .background(Color.white)
                    .padding(.horizontal, 2)
                
            }
            
            
           
            
            
            LazyVGrid(columns: [
                
                GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .top),
                GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16),
            ], alignment: .leading, spacing: 16, content: {
                ForEach(showApi.showDescriptionArray, id: \.self) { res in
                    
                    ShowCellView(response: res)
                        
      
                }
                
               
                
               
                
            })
            .onAppear(perform: {
                showApi.getShowDetails(filterSlug: show)
            })
            .padding(.top, 15)
            .padding(.horizontal, 2)
            
        }
        .background(Color(#colorLiteral(red: 0.09784125612, green: 0.1059348661, blue: 0.117692871, alpha: 1)))
        .navigationBarTitle("Show Details")
        }
    }
    



