//
//  MovieListViewModel.swift
//  MovieMVI
//
//  Created by Ares Ceka on 2/5/22.
//

import Combine
import Foundation

class MovieListViewModel: ObservableObject {
    private var cancelables = [AnyCancellable]()
    private let getMoviesInteractor: GetMoviesInteractor

    init() {
        self.getMoviesInteractor = GetMoviesDefaultInteractor()
    }

    @Published var viewState: MovieListViewState = .loading

    func onAction(_ action: MovieListAction) {
        switch action {
        case .refresh:
            getMovies()
        }
    }

    private func getMovies() {
        viewState = .loading
        getMoviesInteractor.execute()
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure:
                    self?.viewState = .error
                }
            }, receiveValue: { [weak self] movies in
                self?.viewState = .content(list: movies)
            }).store(in: &cancelables)
    }
}
