//
//  MovieItemView.swift
//  MovieMVI
//
//  Created by Ares Ceka on 2/5/22.
//

import SwiftUI

struct MovieItemView: View {
    let movie: Movie

    var body: some View {
        HStack {
            FavoriteView(viewModel: FavoriteViewModel(movieId: movie.id))
            Text(movie.name)
            Text(String(movie.year))
        }
    }
}
