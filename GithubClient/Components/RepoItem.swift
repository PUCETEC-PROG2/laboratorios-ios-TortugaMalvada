import SwiftUI

struct RepoItem: View {
    var body: some View {
        HStack {
            Image(uiImage: .githublogo)
                .resizable()
                .frame(width: 80, height: 80)
            
            VStack(alignment: .leading) {
                Text("Nombre del repositorio")
                    .font(.title2)
                    .foregroundStyle(.black)
                Text("Descripciòn del repositorio")
                HStack {
                    Text("Lenguaje")
                        .font(.caption)
                    Text("Swift")
                        .font(.caption)
                }
            }
        }
        .padding()
    }
}

#Preview {
    RepoItem()
}
