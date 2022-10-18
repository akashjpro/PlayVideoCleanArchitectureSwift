//
//  HomeView.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/11/22.
//

import SwiftUI


struct HomeView: View {
    
    @StateObject var homeVM: HomeViewModel = HomeViewModel()
    
    @State var srollViewOffset: CGFloat = 0
    @State var startOffset: CGFloat = 0
    
    let ID_SCROLL = "SCROLL_TO_TOP"
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ForEach(Query.allCases, id: \.self) { searchQuery in
                        QueryTag(query: searchQuery, isSelected: homeVM.selectedQuery == searchQuery)
                            .onTapGesture {
                                // When the user taps on a QueryTag, we'll change the selectedQuery from HomeViewModel
                                homeVM.selectedQuery = searchQuery
                                
                                homeVM.completionHandler?()
                            }
                    }
                }
                
                ScrollViewReader { proxyReader in
                    ScrollView {
                        if homeVM.videos.isEmpty {
                            ProgressView()
                        } else {
                            LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
                                ForEach(homeVM.videos, id: \.id) { video in
                                    NavigationLink {
                                        VideoView(video: video)
                                    } label: {
                                        VideoCard(video: video)
                                    }
                                }
                                
                                ListPlaceholderRowView(state: homeVM.state,
                                                       loadMore: homeVM.loadMore)
                            }
                            .padding()
                            .id(ID_SCROLL)
                            .overlay(
                                GeometryReader{proxy -> Color in
                                    
                                    
                                    DispatchQueue.main.async {
                                        if startOffset == 0 {
                                            self.startOffset = proxy.frame(in: .global).midY
                                        }
                                        
                                        let offset = proxy.frame(in: .global).midY
                                        self.srollViewOffset = offset - startOffset
                                    }
                                    
                                    return Color.clear
                                   
                                }
                                    .frame(width: 0, height: 0)
                            )
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .overlay(
                        Button(action: {
                            withAnimation(.spring()) {
                                proxyReader.scrollTo(ID_SCROLL, anchor: .top)
                            }
                        }, label: {
                            
                            Image(systemName: "arrow.up")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("red"))
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.09), radius: 5, x: 5, y: 5)
                        })
                        .padding(.trailing)
                        .padding(.bottom, getSafeArea().bottom == 0 ? 12 : 0)
                        .opacity(-srollViewOffset > 450 ? 1 : 0)
                        .animation(.easeInOut)
                        , alignment: .bottomTrailing
                    )
                    .onAppear {
                        homeVM.setClickCompletion(completionHandler: {
                            proxyReader.scrollTo(ID_SCROLL, anchor: .top)
                        })
                        
                        homeVM.loadHome()
                    }
                
                }
            }
            .background(Color("AccentColor"))
            .navigationBarHidden(true)
        }
    }

}


extension View {
    
    func getSafeArea() -> UIEdgeInsets {
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
