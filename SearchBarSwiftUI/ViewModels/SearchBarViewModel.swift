//
//  SearchBarViewModel.swift
//  SearchBarSwiftUI
//
//  Created by Zülfü Akgüneş on 2.02.2024.
//

import Foundation

class SearchBarViewModel: ObservableObject {
    let service = APIService()
    
    @Published var items = [Post]()//["Elma", "Armut", "Muz", "Portakal"]  // Örnek liste öğeleri
    @Published var filteredItems = [Post]()
    
    func deleteItems(at offsets: IndexSet) {
        // İlk olarak, filteredItems'dan silin.
        filteredItems.remove(atOffsets: offsets)
        
        // Daha sonra, items'dan da silin. Bu işlemi, filtrelenmiş öğelerin indexlerini orijinal listeye çevirerek yapın.
        let deletedItems = offsets.map { filteredItems[$0] }
        items = items.filter { !deletedItems.contains($0) }
    }

    func fetchItems() {
        guard let url = URL(string: Constants.baseURL + "/posts") else { return }
            var request = URLRequest(url: url)
        request.httpMethod = HTTP.Method.get.rawValue
        
        service.makeRequest(with: request) { (items: [Post]?, error: APIError?) in
            DispatchQueue.main.async {
                if let error {
                    print(error)
                }
                else if let items {
                    
                }
            }

        }
    }
}
