//
//  Movie.swift
//  MovieMVI
//
//  Created by Ares Ceka on 2/5/22.
//

import Foundation

struct Movie: Identifiable { // I would make this a ViewState model
    let id: Int
    let name: String
    let year: Int
}
