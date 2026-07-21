import SwiftUI

struct RepoList: View {
    @ObservedObject var viewController: RepoListViewController
    
    var body: some View {
        NavigationStack {
            Group {
                if viewController.isLoading {
                    ProgressView("Cargando Repositorios...")
                } else if let errorMsg = viewController.errorMsg {
                    Text(errorMsg)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List(viewController.repositories) { repo in
                        RepoItem(repository: repo)
                    }
                    .refreshable {
                        await viewController.loadRepositories()
                    }
                }
            }
            .navigationTitle("Repositorios")
        }
        .task {
            await viewController.loadRepositories()
        }
    }
}

#Preview {
    RepoList(viewController: RepoListViewController())
}
