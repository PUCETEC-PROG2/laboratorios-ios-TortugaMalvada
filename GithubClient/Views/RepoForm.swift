//
//  RepoForm.swift
//  GithubClient
//
//  Created by Usuario invitado on 7/7/26.
//

import SwiftUI

struct RepoForm: View {
    @State private var repoName: String = ""
    @State private var repoDescripcion: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                TextField("",
                          text: $repoName,
                          prompt: Text("Nombre del repositorio")
                            .foregroundStyle(.black.opacity(0.4))
                )
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                
                TextField("",
                          text: $repoDescripcion,
                          prompt: Text("Descripcion del repositorio")
                            .foregroundStyle(.black.opacity(0.4))
                )
                .textFieldStyle(.roundedBorder)
                .lineLimit(3...6)
                .padding(.vertical)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        print("Boton presionado")
                    }) {
                        Label("Guardar", systemImage: "square.and.arrow.down")
                            .padding(.all, 5)
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button(action: {
                        print("Boton presionado")
                    }) {
                        Label("Cancelar",
                              systemImage: "xmark.circle")
                            .foregroundStyle(.red)
                            .padding(.all, 5)
                    }
                    .buttonStyle(.bordered)
                    .padding(.horizontal, 4)
                }
            } // Cierre del VStack
            .navigationTitle("Formulario del Repopsitorio")
            .navigationBarTitleDisplayMode(.inline)
        } // Cierre del NavigationStack
    }
}

#Preview {
    RepoForm()
}
