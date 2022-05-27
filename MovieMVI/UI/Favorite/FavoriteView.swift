//
//  FavoriteView.swift
//  MovieMVI
//
//  Created by Ares Ceka on 27/5/22.
//

import SwiftUI

struct FavoriteView: View {
    @StateObject var viewModel: FavoriteViewModel

    var body: some View {
        switch viewModel.viewState {
        case .favorite:
            Image(systemName: "heart.fill")
                .foregroundColor(Color.red)
                .onTapGesture {
                    viewModel.onAction(.unfavorite)
                }
        case .unfavorite:
            Image(systemName: "heart")
                .foregroundColor(Color.red)
                .onTapGesture {
                    viewModel.onAction(.favorite)
                }
        case .loading:
            ProgressView()
        }
    }
}
