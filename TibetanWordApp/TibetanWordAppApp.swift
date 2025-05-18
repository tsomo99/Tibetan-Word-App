import SwiftUI

@main
struct TibetanWordAppApp: App {
    let persistenceController = PersistenceController.shared

    init() {
        CoreDataInitializer.importWordBooksIfNeeded(context: persistenceController.container.viewContext)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
