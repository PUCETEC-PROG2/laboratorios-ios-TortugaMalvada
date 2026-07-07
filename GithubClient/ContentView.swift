import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RepoList()
                .tabItem {
                    Label("Repositorios", systemImage: "arrow.trianglehead.branch")
                }
            
            RepoForm()
                .tabItem {
                    Label("Crear Repositorios", systemImage: "plus")
                }
            
            Profile()
                .tabItem {
                    Label("Perfil", systemImage: "person.crop.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
