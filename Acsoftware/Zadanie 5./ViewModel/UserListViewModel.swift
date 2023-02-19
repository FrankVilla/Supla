//
//  UserListViewModel.swift
//  Zadanie 5.
//
//  Created by KOVIGROUP on 19/02/2023.
//

import Foundation

class UserListViewModel {
    var users: [User] = []

    func fetchUsers() {
        users = [
            User(name: "Juan", email: "juan@example.com"),
            User(name: "Pedro", email: "pedro@example.com"),
            User(name: "Luisa", email: "luisa@example.com"),
            User(name: "María", email: "maria@example.com"),
            User(name: "Carlos", email: "carlos@example.com")
        ]
    }
}
