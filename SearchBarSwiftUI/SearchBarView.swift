//
//  SearchBarView.swift
//  SearchBarSwiftUI
//
//  Created by Zülfü Akgüneş on 29.01.2024.
//

import SwiftUI

struct SearchBarView: View {
    @StateObject private var viewModel: SearchBarViewModel = SearchBarViewModel()
    @State var searchText = ""
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.filteredItems, id: \.self) { item in
                    Text(item)
                    Spacer()
                                    Image(systemName: item.isFavorite ? "star.fill" : "star")
                                        .foregroundColor(item.isFavorite ? .yellow : .gray)
                                        .onTapGesture {
                                            item.isFavorite.toggle()
                                        }
                }
                .onDelete {indexSet in
                    withAnimation {
                        viewModel.deleteItems(at: indexSet)
                    }
                }
            }// Silme özelliğini ekleyin
        }
         .searchable(text: $searchText, prompt: "Ara")  // Searchable modifier'ını ekleyin
        .onChange(of: searchText) { newValue in
            filterItems()  // searchText değiştiğinde öğeleri filtreleyin
        }
        .navigationTitle("Öğeler")
        .onAppear{
            filterItems()
        }  // View yüklendiğinde ilk öğeleri filtreleyin
    }
    
    
    func filterItems() {
        if searchText.isEmpty {
            viewModel.filteredItems = viewModel.items
        } else {
            viewModel.filteredItems = viewModel.items.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

