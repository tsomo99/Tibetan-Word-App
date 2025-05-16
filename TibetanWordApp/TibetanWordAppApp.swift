import SwiftUI

@main
struct TibetanWordAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            WordListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
