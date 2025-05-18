//
//  UserManager.swift
//  TibetanWordApp
//
//  Created by de de on 2025/5/17.
//
import SwiftUI
import CoreData

class UserManager: ObservableObject {
    @Published var currentUser: UserEntity?

    func createUser(name: String, context: NSManagedObjectContext) {
        let newUser = UserEntity(context: context)
        newUser.id = UUID()
        newUser.username = name
        try? context.save()
        currentUser = newUser
    }

    func switchToUser(_ user: UserEntity) {
        currentUser = user
    }
}
