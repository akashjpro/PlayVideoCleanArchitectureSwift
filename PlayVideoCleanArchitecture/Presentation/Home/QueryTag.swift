//
//  QueryTag.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/17/22.
//

import SwiftUI

struct QueryTag: View {
    var query: Query
    var isSelected: Bool
    
    var body: some View {
        Text(query.rawValue)
            .font(.caption)
            .bold()
            .foregroundColor(isSelected ? .black : .gray)
            .padding(10)
            .background(.thinMaterial)
            .cornerRadius(10)
    }
}

//struct QueryTag_Previews: PreviewProvider {
//    static var previews: some View {
//        QueryTag()
//    }
//}
