//
//  MovieListView.swift
//  MovieMVI
//
//  Created by Ares Ceka on 2/5/22.
//

import SwiftUI

struct MovieListView: View {
    @StateObject var viewModel: MovieListViewModel

    var body: some View {
        NavigationView {
            ZStack {
                switch viewModel.viewState {
                case .loading: renderLoading()
                case .error: renderError()
                case .content(let movies): renderContent(movies: movies)
                }
            }.onAppear(perform: {
                viewModel.onAction(.refresh)
            })
        }
    }

    private func renderLoading() -> some View {
        ProgressView()
    }

    private func renderError() -> some View {
        Button("Retry") {
            viewModel.onAction(.refresh)
        }
    }

    private func renderContent(movies: [Movie]) -> some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(movies) { movie in
                    NavigationLink(destination: MovieDetailView(viewModel: MovieDetailViewModel(movieId: movie.id))) {
                        MovieItemView(movie: movie)
                    }.isDetailLink(false)
                }
                Spacer()
            }
        }.padding()
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(viewModel: MovieListViewModel())
    }
}
