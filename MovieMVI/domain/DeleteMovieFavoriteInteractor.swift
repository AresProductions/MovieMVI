//
//  DeleteMovieFavoriteInteractor.swift
//  MovieMVI
//
//  Created by Ares Ceka on 27/5/22.
//

import Combine
import Foundation

protocol DeleteMovieFavoriteInteractor {
    func execute(id: Int) -> AnyPublisher<Void, InteractorError>
}

struct DeleteMovieFavoriteDefaultInteractor: DeleteMovieFavoriteInteractor {
    func execute(id: Int) -> AnyPublisher<Void, InteractorError> {
        FAVORITE_IDS.remove(id)
        return Just(())
            .setFailureType(to: InteractorError.self)
            .eraseToAnyPublisher()
    }
}
