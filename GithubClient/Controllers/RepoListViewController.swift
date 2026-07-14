//
//  RepoListViewController.swift
//  GithubClient
//
//  Created by Usuario invitado on 14/7/26.
//

import Foundation

@MainActor
class RepoListViewController: ObservableObject {
    @Published var repositories: [Repository] = []
    @Published var isLoading: Bool = false
    @Published var errorMsg: String?
    
    private let githubServices: GithubServices
    
    init(service: GithubServices = .shared){
        self.githubServices = service
    }
    func loadRepositories() async {
        isLoading = true
        do {
            repositories = try await githubServices.getRepositories()
        } catch {
            errorMsg = error.localizedDescription
        }
        isLoading = false
    }
}
