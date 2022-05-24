//
//  MovieListViewState.swift
//  MovieMVI
//
//  Created by Ares Ceka on 2/5/22.
//

import Foundation

enum MovieListViewState: ViewState {
    case content(list: [Movie], navigation: MovieListViewModel.Navigation?)
    case loading
    case error
}
