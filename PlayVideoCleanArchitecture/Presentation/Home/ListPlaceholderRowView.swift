//
//  ListPlaceholderRowView.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/17/22.
//

import SwiftUI

struct ListPlaceholderRowView: View {
    
    let state: FetchState
    let loadMore: () -> Void
    
    var body: some View {
        switch state {
        case .good:
            Color.clear
                .onAppear {
                    loadMore()
                }
        case .isLoading:
            ProgressView()
                .progressViewStyle(.circular)
                .frame(maxWidth: .infinity, alignment: .center)
        case .loadedAll:
            EmptyView()
        case .noResults:
            Text("Sorry Could not find anything.")
        case .error(let message):
            Text(message).foregroundColor(.pink)
        }
    }
}

struct ListPlaceholderRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListPlaceholderRowView(state: .noResults,
                               loadMore: { })
    }
}

