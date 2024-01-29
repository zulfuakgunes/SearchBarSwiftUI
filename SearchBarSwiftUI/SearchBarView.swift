//
//  SearchBarView.swift
//  SearchBarSwiftUI
//
//  Created by Zülfü Akgüneş on 29.01.2024.
//

import SwiftUI

struct SearchBarView: View {
    @State private var searchText = ""
    @State private var items = ["Elma", "Armut", "Muz", "Portakal"]  // Örnek liste öğeleri
    @State private var filteredItems = [String]()
    
    var body: some View {
        NavigationView {
            List(filteredItems, id: \.self) { item in
                Text(item)
            }
            .searchable(text: $searchText, prompt: "Ara")  // Searchable modifier'ını ekleyin
            .onChange(of: searchText) { newValue in
                filterItems()  // searchText değiştiğinde öğeleri filtreleyin
            }
            .navigationTitle("Öğeler")
            .onAppear(perform: filterItems)  // View yüklendiğinde ilk öğeleri filtreleyin
        }
    }
    

    func filterItems() {
            if searchText.isEmpty {
                filteredItems = items
            } else {
                filteredItems = items.filter { $0.localizedCaseInsensitiveContains(searchText) }
            }
        }
}
