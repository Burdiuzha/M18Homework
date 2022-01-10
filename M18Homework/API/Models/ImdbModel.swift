//
//  ImdbModel.swift
//  M18Homework
//
//  Created by Евгений Бурдюжа on 09.01.2022.
//

import Foundation

// MARK: - Imdb
struct Imdb: Codable {
    let searchType, expression: String
    let results: [Result]
    let errorMessage: String
}

// MARK: - Result
struct Result: Codable {
    let id, resultType: String
    let image: String
    let title, resultDescription: String

    enum CodingKeys: String, CodingKey {
        case id, resultType, image, title
        case resultDescription = "description"
    }
}
