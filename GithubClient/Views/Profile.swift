//
//  Profile.swift
//  GithubClient
//
//  Created by Usuario invitado on 7/7/26.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        NavigationStack{
            VStack (alignment: .leading){
                Text("TortugaMalvada")
                    .font(.title)
                Image(uiImage: .githublogo)
                    .resizable()
                    .scaledToFit()
                Text("Una Tortuga Malvadisima")
                    .font(.headline)
                    .padding(.vertical)
                Text("Una Tortuga Malvadisima y muy Perrona")
                    .font(.caption)
            }
            .padding()
            .navigationTitle("Perfil")
        }
    }
}
#Preview {
    Profile()
}
