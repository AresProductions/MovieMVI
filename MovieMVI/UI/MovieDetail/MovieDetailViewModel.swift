//
//  MovieDetailViewModel.swift
//  MovieMVI
//
//  Created by Ares Ceka on 5/5/22.
//

import Combine
import Foundation

class MovieDetailViewModel: ObservableObject {
    private var cancelables = [AnyCancellable]()
    private let getMovieDetailInteractor: GetMovieDetailInteractor
    
    private let movieId: Int

    init(movieId: Int) {
        print("MovieDetailsVM inited")
        self.getMovieDetailInteractor = GetMovieDetailDefaultInteractor()
        self.movieId = movieId
    }
    
    deinit {
        print("MovieDetailsVM denited")
    }

    @Published var viewState: MovieDetailViewState = .loading

    func onAction(_ action: MovieDetailAction) {
        switch action {
        case .refresh:
            getMovies()
        }
    }

    private func getMovies() {
        viewState = .loading
        getMovieDetailInteractor.execute(id: movieId)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure:
                    self?.viewState = .error
                }
            }, receiveValue: { [weak self] movie in
                self?.viewState = .content(detail: movie)
            }).store(in: &cancelables)
    }
}
