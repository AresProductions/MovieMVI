//
//  GetMoviesInteractor.swift
//  MovieMVI
//
//  Created by Ares Ceka on 2/5/22.
//

import Combine
import Foundation

struct InteractorError: Error {}

protocol GetMoviesInteractor {
    func execute() -> AnyPublisher<[Movie], InteractorError>
}

struct GetMoviesDefaultInteractor: GetMoviesInteractor {
    func execute() -> AnyPublisher<[Movie], InteractorError> {
        if Bool.random() {
            return Fail<[Movie], InteractorError>(error: InteractorError()).delay(for: 2, scheduler: RunLoop.main).eraseToAnyPublisher()
        }
        var movies: [Movie] = []
        for index in 1...50 {
            movies.append(Movie(id: index, name: "Movie \(index)", year: 2000 + index))
        }
        return Just(movies).setFailureType(to: InteractorError.self).delay(for: 2, scheduler: RunLoop.main).eraseToAnyPublisher()
    }
}

