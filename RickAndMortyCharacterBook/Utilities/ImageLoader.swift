//
//  ImageLoader.swift
//  RickAndMortyCharacterBook
//
//  Created by Matvey Garbuzov on 19.06.2022.
//

import Foundation
import UIKit
import Combine

class ImageLoader {
    func getImage(from url: URL) async throws -> UIImage? {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return UIImage (data: data)
    }
}
