//
//  MovieListAction.swift
//  MovieMVI
//
//  Created by Ares Ceka on 2/5/22.
//

import Foundation

enum MovieListAction: Action {
    case refresh
    case movieSelected(Int)
}
