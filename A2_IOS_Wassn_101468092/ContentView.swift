import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: Product.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.productID, ascending: true)]
    ) var products: FetchedResults<Product>
    
    @State private var currentIndex: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Text("Product Viewer")
                    .font(.system(size: 34, weight: .bold))
                    .fontWeight(.bold)
                
                if products.isEmpty {
                    Text("No products found.")
                        .foregroundColor(.gray)
                } else {
                    let product = products[currentIndex]
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text(product.name ?? "No Name")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Product ID: \(product.productID ?? "")")
                        Text("Description: \(product.productDescription ?? "")")
                        Text(String(format: "Price: $%.2f", product.price))
                        Text("Provider: \(product.provider ?? "")")
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    HStack(spacing: 20) {
                        Button("Previous") {
                            if currentIndex > 0 {
                                currentIndex -= 1
                            }
                        }
                        .disabled(currentIndex == 0)
                        
                        Button("Next") {
                            if currentIndex < products.count - 1 {
                                currentIndex += 1
                            }
                        }
                        .disabled(currentIndex == products.count - 1)
                    }
                    .padding(.top, 10)
                }
                
                Spacer()
                
                NavigationLink("View All Products") {
                    ProductListView()
                }
                .padding(.bottom, 8)
                
                NavigationLink("Search Products") {
                    SearchProductView()
                }
                .padding(.bottom, 8)
                
                NavigationLink("Add New Product") {
                    AddProductView()
                }
                .padding(.bottom, 20)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
