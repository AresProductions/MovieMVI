//
//  MovieDetailViewState.swift
//  MovieMVI
//
//  Created by Ares Ceka on 5/5/22.
//

import Foundation

enum MovieDetailViewState: ViewState {
    case content(detail: Movie)
    case loading
    case error
}
