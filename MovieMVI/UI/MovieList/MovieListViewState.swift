//
//  MovieListViewState.swift
//  MovieMVI
//
//  Created by Ares Ceka on 2/5/22.
//

import Foundation

enum MovieListViewState: ViewState {
    case content(list: [Movie])
    case loading
    case error
}
