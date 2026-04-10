import SwiftUI
import CoreData

struct ProductListView: View {
    
    @FetchRequest(
        entity: Product.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.name, ascending: true)]
    ) var products: FetchedResults<Product>
    
    var body: some View {
        List {
            ForEach(products, id: \.objectID) { product in
                VStack(alignment: .leading, spacing: 4) {
                    Text(product.name ?? "No Name")
                        .font(.headline)
                    
                    Text(product.productDescription ?? "No Description")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
        .navigationTitle("All Products")
    }
}
