//
//  SearchBarView.swift
//  SearchBarSwiftUI
//
//  Created by Zülfü Akgüneş on 29.01.2024.
//

import SwiftUI

struct SearchBarView: View {
    let service = APIService()
    
    @State private var searchText = ""
    @State private var items = ["Elma", "Armut", "Muz", "Portakal"]  // Örnek liste öğeleri
    @State private var filteredItems = [String]()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredItems, id: \.self) { item in
                    Text(item)
                }
                .onDelete(perform: deleteItems)  // Silme özelliğini ekleyin
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
    }
    
    
    func filterItems() {
        if searchText.isEmpty {
            filteredItems = items
        } else {
            filteredItems = items.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        withAnimation {
            // İlk olarak, filteredItems'dan silin.
            filteredItems.remove(atOffsets: offsets)
            
            // Daha sonra, items'dan da silin. Bu işlemi, filtrelenmiş öğelerin indexlerini orijinal listeye çevirerek yapın.
            let deletedItems = offsets.map { filteredItems[$0] }
            items = items.filter { !deletedItems.contains($0) }
        }
    }
}
