//
//  MovieMVIApp.swift
//  MovieMVI
//
//  Created by Ares Ceka on 2/5/22.
//

import SwiftUI

@main
struct MovieMVIApp: App {
    var body: some Scene {
        WindowGroup {
            MovieListView(viewModel: MovieListViewModel())
        }
    }
}
