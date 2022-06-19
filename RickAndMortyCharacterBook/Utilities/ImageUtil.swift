//
//  ImageUtil.swift
//  RickAndMortyCharacterBook
//
//  Created by Matvey Garbuzov on 19.06.2022.
//

import Foundation

final class ImageUtil{
    static func getImageURLbyID(_ id: Int) -> URL? {
        return URL(string:"https://rickandmortyapi.com/api/character/avatar/\(id).jpeg")
    }

    static func getCharacterURLbyID(_ id: Int) -> URL? {
        return URL(string: "https://rickandmortyapi.com/api/character/\(id)"  )
    }
}
