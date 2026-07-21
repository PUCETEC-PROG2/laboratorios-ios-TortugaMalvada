import Foundation
import Alamofire

class GithubServices {
    static let shared = GithubServices()
    private let baseUrl = AppConfig.apiBaseURL
    
    private init() {}
    
    private var headers: HTTPHeaders {
        [
            "Authorization": "Bearer \(AppConfig.apiToken)",
            "Accept": "application/vnd.github+json"
        ]
    }
    
    func getRepositories() async throws -> [Repository] {
        return try await AF.request(
            "\(baseUrl)/user/repos",
            method: .get,
            parameters: [
                "sort": "created",
                "direction": "desc",
                "per_page": 100,
                "affiliation": "owner"
            ],
            headers: headers
        )
        .validate(statusCode: 200..<300)
        .serializingDecodable([Repository].self)
        .value
    }
    
    func createRepositories(name: String, desc: String) async throws -> Repository {
        let response = await AF.request(
            "\(baseUrl)/user/repos",
            method: .post,
            parameters: [
                "name": name,
                "description": desc
            ],
            encoding: JSONEncoding.default,
            headers: headers
        )
        .validate(contentType: ["application/json", "application/vnd.github+json"])
        .serializingDecodable(Repository.self)
        .response
        
        if let data = response.data, let json = String(data: data, encoding: .utf8) {
            print("Response Body:")
            print(json)
        }
        
        switch response.result {
        case .success(let repo):
            return repo
        case .failure(let error):
            print("=== Alamofire Error ===")
            print(error)
            throw error
        }
    }
}
