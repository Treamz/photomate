//
//  ContentViewModel.swift
//  photomate
//
//  Created by Иван Чернокнижников on 07.06.2024.
//

import Foundation
import Firebase
import Combine


@MainActor
class ContentViewModel: ObservableObject {
    private let service = AuthService.shared
    
    private var cancallabels = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?

    init() {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancallabels)
        
        service.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancallabels)
    }
}
