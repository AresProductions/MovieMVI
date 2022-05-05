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
        VStack {
            Text(movie.name)
            Text(String(movie.year))
        }
    }
}
