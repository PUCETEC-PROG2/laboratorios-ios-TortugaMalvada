import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0
    @StateObject private var listViewController = RepoListViewController()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            RepoList(viewController: listViewController)
                .tabItem {
                    Label("Repositorios", systemImage: "arrow.trianglehead.branch")
                }
                .tag(0)
            
            RepoForm(onSaveSuccess: {
                selectedTab = 0
                Task {
                    await listViewController.loadRepositories()
                }
            })
            .tabItem {
                Label("Crear Repositorios", systemImage: "plus")
            }
            .tag(1)
            
            Profile()
                .tabItem {
                    Label("Perfil", systemImage: "person.crop.circle")
                }
                .tag(2)
        }
    }
}

#Preview {
    ContentView()
}
