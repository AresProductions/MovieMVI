//
//  File.swift
//  MovieMVI
//
//  Created by Ares Ceka on 27/5/22.
//

import Combine
import Foundation

protocol AddMovieFavoriteInteractor {
    func execute(id: Int) -> AnyPublisher<Void, InteractorError>
}

struct AddMovieFavoriteDefaultInteractor: AddMovieFavoriteInteractor {
    func execute(id: Int) -> AnyPublisher<Void, InteractorError> {
        FAVORITE_IDS.update(with: id)
        return Just(())
            .setFailureType(to: InteractorError.self)
            .eraseToAnyPublisher()
    }
}
