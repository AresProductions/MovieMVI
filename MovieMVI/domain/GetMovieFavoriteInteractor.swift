//
//  GetMovieFavoriteInteractor.swift
//  Mov/Users/aresceka/Desktop/MobileJazz/MovieMVI/MovieMVI/domainieMVI
//
//  Created by Ares Ceka on 27/5/22.
//

import Combine
import Foundation

protocol GetMovieFavoriteInteractor {
    func execute(id: Int) -> AnyPublisher<Bool, InteractorError>
}

var FAVORITE_IDS: Set<Int> = []

struct GetMovieFavoriteDefaultInteractor: GetMovieFavoriteInteractor {
    func execute(id: Int) -> AnyPublisher<Bool, InteractorError> {
        return Just(isFavoriteMovie(movieId: id))
            .setFailureType(to: InteractorError.self)
            .delay(for: 0.5, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }

    private func isFavoriteMovie(movieId: Int) -> Bool {
        return FAVORITE_IDS.contains(where: { id in id == movieId })
    }
}
