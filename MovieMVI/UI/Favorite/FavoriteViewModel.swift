//
//  FavoriteViewModel.swift
//  MovieMVI
//
//  Created by Ares Ceka on 27/5/22.
//

import Combine
import Foundation

class FavoriteViewModel: ObservableObject {
    private var cancelables = [AnyCancellable]()
    private let getMovieFavoriteInteractor: GetMovieFavoriteInteractor
    private let addMovieFavoriteInteractor: AddMovieFavoriteInteractor
    private let deleteMovieFavoriteInteractor: DeleteMovieFavoriteInteractor
    private let movieId: Int

    init(movieId: Int) {
        self.getMovieFavoriteInteractor = GetMovieFavoriteDefaultInteractor()
        self.addMovieFavoriteInteractor = AddMovieFavoriteDefaultInteractor()
        self.deleteMovieFavoriteInteractor = DeleteMovieFavoriteDefaultInteractor()
        self.movieId = movieId
        
        getMovieFavoriteInteractor.execute(id: movieId).sink(receiveCompletion: { _ in }) { [weak self] isFavourited in
            if isFavourited {
                self?.viewState = .favorite
            } else {
                self?.viewState = .unfavorite
            }
        }.store(in: &cancelables)
    }

    @Published var viewState: FavoriteViewState = .loading

    func onAction(_ action: FavoriteAction) {
        switch action {
        case .favorite:
            addMovieFavoriteInteractor.execute(id: movieId)
                .sink(receiveCompletion: { _ in },
                      receiveValue: { [weak self] in
                          self?.viewState = .favorite
                      }).store(in: &cancelables)
        case .unfavorite:
            deleteMovieFavoriteInteractor.execute(id: movieId)
                .sink(receiveCompletion: { _ in },
                      receiveValue: { [weak self] in
                          self?.viewState = .unfavorite
                      }).store(in: &cancelables)
        }
    }
}
