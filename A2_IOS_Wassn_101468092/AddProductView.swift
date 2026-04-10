import SwiftUI
import CoreData

struct AddProductView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var productID = ""
    @State private var name = ""
    @State private var productDescription = ""
    @State private var price = ""
    @State private var provider = ""
    
    var body: some View {
        Form {
            TextField("Product ID", text: $productID)
            TextField("Product Name", text: $name)
            TextField("Product Description", text: $productDescription)
            TextField("Price", text: $price)
                .keyboardType(.decimalPad)
            TextField("Provider", text: $provider)
            
            Button("Save Product") {
                let newProduct = Product(context: viewContext)
                newProduct.productID = productID
                newProduct.name = name
                newProduct.productDescription = productDescription
                newProduct.price = Double(price) ?? 0.0
                newProduct.provider = provider
                
                do {
                    try viewContext.save()
                    dismiss()
                } catch {
                    print("Failed to save product: \(error)")
                }
            }
        }
        .navigationTitle("Add Product")
    }
}
