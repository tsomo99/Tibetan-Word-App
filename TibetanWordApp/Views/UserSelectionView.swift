import SwiftUI
import Foundation
import CoreData

struct UserSelectionView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: UserEntity.entity(), sortDescriptors: []) var users: FetchedResults<UserEntity>
    @StateObject var userManager = UserManager()

    var body: some View {
        VStack {
            List {
                ForEach(users) { user in
                    Button(user.username) {
                        userManager.switchToUser(user)
                    }
                }
            }

            Button("添加新用户") {
                userManager.createUser(name: "新用户", context: context)
            }
        }
    }
}
