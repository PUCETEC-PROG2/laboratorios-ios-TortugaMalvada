import Foundation

@MainActor
class RepoFormViewController: ObservableObject {
    @Published var repoName: String = ""
    @Published var repoDescription: String = ""
    @Published var repository: Repository? = nil
    @Published var isLoading: Bool = false
    @Published var errorMsg: String?
    
    private let githubService: GithubServices
    
    init(service: GithubServices = .shared) {
        self.githubService = service
    }
    
    func createRepository() async {
        isLoading = true
        errorMsg = nil
        
        do {
            let newRepo = try await githubService.createRepositories(name: repoName, desc: repoDescription)
            self.repository = newRepo
            clearForm()
        } catch {
            errorMsg = error.localizedDescription
        }
        
        isLoading = false
    }
    
    func clearForm() {
        self.repoName = ""
        self.repoDescription = ""
        self.errorMsg = nil
    }
}
