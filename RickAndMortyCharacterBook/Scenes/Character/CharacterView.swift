//
//  CharacterView.swift
//  RickAndMortyCharacterBook
//
//  Created by Matvey Garbuzov on 14.06.2022.
//

import Foundation
import SwiftUI

struct CharacterView: View {
    @State var data: CharacterModel
    
    var body: some View {
        ScrollView {
            VStack{
                AsyncImage(url: data.image)
                    .clipShape(Rectangle())
                    .cornerRadius(10)
                HStack{
                    Text(data.name)
                        .fontWeight(.bold)
                        .font(Font.title)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image("Favourite_button_u")
                    })
                    
                }.padding()
                VStack(alignment: .leading) {
                    Text("Status")
                        .foregroundColor(Color(UIColor.secondary))
                        .fontWeight(.semibold)
                    Text(data.status)
                        .foregroundColor(Color(UIColor.main))
                        .fontWeight(.semibold)
                    Divider()
                }
                VStack(alignment: .leading) {
                    Text("Species")
                        .foregroundColor(Color(UIColor.secondary))
                        .fontWeight(.semibold)
                    Text(data.species)
                        .foregroundColor(Color(UIColor.main))
                        .fontWeight(.semibold)
                    Divider()
                }
                VStack(alignment: .leading) {
                    Text("Gender")
                        .foregroundColor(Color(UIColor.secondary))
                        .fontWeight(.semibold)
                    Text(data.gender)
                        .foregroundColor(Color(UIColor.main))
                        .fontWeight(.semibold)
                    Divider()
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

