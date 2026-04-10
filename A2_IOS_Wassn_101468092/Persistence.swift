import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "ProductModel 2")

        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data failed to load: \(error)")
            }
        }

        seedProductsIfNeeded()
    }

    private func seedProductsIfNeeded() {
        let context = container.viewContext
        let request: NSFetchRequest<Product> = Product.fetchRequest()

        do {
            let count = try context.count(for: request)

            if count == 0 {
                let sampleProducts = [
                    ("P001", "iPhone Case", "Protective silicone case for iPhone", 19.99, "Apple Accessories"),
                    ("P002", "Wireless Mouse", "Ergonomic wireless mouse with USB receiver", 24.99, "Logitech"),
                    ("P003", "USB-C Charger", "Fast charging USB-C wall adapter", 29.99, "Anker"),
                    ("P004", "Mechanical Keyboard", "RGB mechanical keyboard with blue switches", 79.99, "Keychron"),
                    ("P005", "Laptop Stand", "Adjustable aluminum stand for laptops", 34.99, "Nulaxy"),
                    ("P006", "Bluetooth Speaker", "Portable waterproof Bluetooth speaker", 49.99, "JBL"),
                    ("P007", "Monitor", "24-inch Full HD monitor", 149.99, "Samsung"),
                    ("P008", "Noise Cancelling Headphones", "Over-ear wireless headphones", 199.99, "Sony"),
                    ("P009", "Webcam", "1080p HD webcam for video calls", 59.99, "Logitech"),
                    ("P010", "Power Bank", "10000mAh portable charger", 39.99, "INIU")
                ]

                for product in sampleProducts {
                    let newProduct = Product(context: context)
                    newProduct.productID = product.0
                    newProduct.name = product.1
                    newProduct.productDescription = product.2
                    newProduct.price = product.3
                    newProduct.provider = product.4
                }

                try context.save()
            }
        } catch {
            print("Failed to seed products: \(error)")
        }
    }
}
