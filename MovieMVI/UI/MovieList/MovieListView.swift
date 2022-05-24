//
//  MovieListView.swift
//  MovieMVI
//
//  Created by Ares Ceka on 2/5/22.
//

import SwiftUI

struct MovieListView: View {
    @StateObject var viewModel: MovieListViewModel
    @State private var navigation: MovieListViewModel.Navigation?

    var body: some View {
        NavigationView {
            ZStack {
                switch viewModel.viewState {
                case .loading: renderLoading()
                case .error: renderError()
                case .content(let movies, let navigation):
                    renderContent(movies: movies)
                    navigationLinks(navigation: navigation)
                        .onAppear {
                            self.navigation = navigation
                        }
                }
            }.onAppear {
                viewModel.onAction(.refresh)
            }
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
                    MovieItemView(movie: movie).onTapGesture {
                        viewModel.onAction(.movieSelected(movie.id))
                    }
                }
                Spacer()
            }
        }.padding()
    }

    @ViewBuilder
    private func navigationLinks(navigation: MovieListViewModel.Navigation?) -> some View {
        switch navigation {
        case .movieSelected(let movieId):
            NavigationLink(destination: MovieDetailView(viewModel: MovieDetailViewModel(movieId: movieId)),
                           tag: MovieListViewModel.Navigation.movieSelected(movieId),
                           selection: $navigation,
                           label: { EmptyView() })

        default: EmptyView()
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(viewModel: MovieListViewModel())
    }
}
