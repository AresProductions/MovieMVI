//
//  MovieDetailView.swift
//  MovieMVI
//
//  Created by Ares Ceka on 5/5/22.
//

import SwiftUI

struct MovieDetailView: View {
    @StateObject var viewModel: MovieDetailViewModel

    var body: some View {
        ZStack {
            switch viewModel.viewState {
            case .content(let movie):
                renderContent(movie: movie)
            case .loading:
                renderLoading()
            case .error:
                renderError()
            }
        }.onAppear(perform: {
            viewModel.onAction(.refresh)
        }).navigationTitle(Text("Movie Detail"))
    }

    private func renderLoading() -> some View {
        ProgressView()
    }

    private func renderError() -> some View {
        Button("Retry") {
            viewModel.onAction(.refresh)
        }
    }

    private func renderContent(movie: Movie) -> some View {
        VStack {
            Text("Movie Title: \(movie.name)")
            Text("Year: \(movie.year)")
            FavoriteView(viewModel: FavoriteViewModel(movieId: movie.id))
        }.padding()
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(viewModel: MovieDetailViewModel(movieId: 10))
    }
}
