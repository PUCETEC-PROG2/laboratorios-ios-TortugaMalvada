import SwiftUI

struct RepoForm: View {
    @StateObject private var viewController = RepoFormViewController()
    var onSaveSuccess: () -> Void
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                TextField("",
                          text: $viewController.repoName,
                          prompt: Text("Nombre del repositorio")
                            .foregroundStyle(.black.opacity(0.4))
                )
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                
                TextField("",
                          text: $viewController.repoDescription,
                          prompt: Text("Descripcion del repositorio")
                            .foregroundStyle(.black.opacity(0.4)),
                          axis: .vertical
                )
                .textFieldStyle(.roundedBorder)
                .lineLimit(3...6)
                .padding(.vertical)
                
                if let errorMsg = viewController.errorMsg {
                    Text(errorMsg)
                        .foregroundStyle(.red)
                        .font(.caption)
                        .padding(.bottom)
                }
                
                Spacer()
                
                HStack {
                    Button(action: {
                        Task {
                            await viewController.createRepository()
                            if viewController.errorMsg == nil {
                                viewController.clearForm() 
                                onSaveSuccess()
                            }
                        }
                    }) {
                        if viewController.isLoading {
                            ProgressView()
                                .padding(.all, 5)
                        } else {
                            Label("Guardar", systemImage: "square.and.arrow.down")
                                .padding(.all, 5)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(viewController.isLoading || viewController.repoName.isEmpty)
                }
            }
            .padding()
            .navigationTitle("Formulario del Repositorio")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RepoForm(onSaveSuccess: {})
}
