//
//  CellMovieModel.swift
//  M18Homework
//
//  Created by Евгений Бурдюжа on 12.01.2022.
//

import Foundation
import UIKit

protocol CellMovieProtocol {
    var title: String? { get set }
    var description: String? { get set }
    var image: UIImage? { get set }
}

struct CellMovieModel: CellMovieProtocol {
    var title: String?
    var description: String?
    var image: UIImage?
}
