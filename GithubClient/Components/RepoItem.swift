import SwiftUI

struct RepoItem: View {
    let repository: Repository
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: URL(string: repository.owner.avatarUrl ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Image(uiImage: .githublogo)
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 6) {
                Text(repository.name)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.primary)
                
                if let description = repository.description {
                    Text(description)
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                }
                
                if let language = repository.language {
                    HStack {
                        Text("Lenguaje:")
                            .font(.caption)
                            .bold()
                        Text(language)
                            .font(.caption)
                    }
                    .foregroundStyle(.secondary)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}
