//
//  CharacterModel.swift
//  RickAndMortyCharacterBook
//
//  Created by Matvey Garbuzov on 19.06.2022.
//


import Foundation
import Combine

struct CharacterModel {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: URL
}
