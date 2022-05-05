//
//  GetMovieDetailInteractor.swift
//  MovieMVI
//
//  Created by Ares Ceka on 5/5/22.
//

import Foundation

import Combine
import Foundation

protocol GetMovieDetailInteractor {
    func execute(id: Int) -> AnyPublisher<Movie, InteractorError>
}

struct GetMovieDetailDefaultInteractor: GetMovieDetailInteractor {
    func execute(id: Int) -> AnyPublisher<Movie, InteractorError> {
        if Bool.random() {
            return Fail<Movie, InteractorError>(error: InteractorError()).delay(for: 2, scheduler: RunLoop.main).eraseToAnyPublisher()
        }
        let movie: Movie = Movie(id: id, name: "Movie \(id)", year: 2000 + id)
        return Just(movie).setFailureType(to: InteractorError.self).delay(for: 2, scheduler: RunLoop.main).eraseToAnyPublisher()
    }
}

