import SwiftUI
import CoreData

struct SearchProductView: View {
    
    @FetchRequest(
        entity: Product.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.name, ascending: true)]
    ) var products: FetchedResults<Product>
    
    @State private var searchText = ""
    
    var filteredProducts: [Product] {
        if searchText.isEmpty {
            return Array(products)
        } else {
            return products.filter {
                ($0.name ?? "").localizedCaseInsensitiveContains(searchText) ||
                ($0.productDescription ?? "").localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        List {
            ForEach(filteredProducts, id: \.objectID) { product in
                VStack(alignment: .leading, spacing: 4) {
                    Text(product.name ?? "No Name")
                        .font(.headline)
                    
                    Text(product.productDescription ?? "No Description")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
        .searchable(text: $searchText, prompt: "Search by name or description")
        .navigationTitle("Search Products")
    }
}
