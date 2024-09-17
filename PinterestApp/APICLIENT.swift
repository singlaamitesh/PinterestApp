import Foundation

// Model for Unsplash Image
struct ImageModel: Decodable {
    let id: String
    let urls: ImageURLs
}

struct ImageURLs: Decodable {
    let small: String
}

class APIClient {
    static let shared = APIClient()

    func fetchImages(searchTerm: String, completion: @escaping ([ImageModel]) -> Void) {
        // Construct the API URL
        let urlString = "\(Constants.searchEndpoint)?query=\(searchTerm)&per_page=20"
        guard let url = URL(string: urlString) else { return }

        // Set up the URL request with API key for authorization
        var request = URLRequest(url: url)
        request.setValue("Client-ID \(Constants.apiKey)", forHTTPHeaderField: "Authorization")

        // Perform the network request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching images: \(error)")
                completion([])
                return
            }

            // Ensure we received data
            guard let data = data else { return }

            // Decode the JSON response
            do {
                let result = try JSONDecoder().decode(UnsplashResponse.self, from: data)
                completion(result.results)
            } catch {
                print("Error decoding JSON: \(error)")
                completion([])
            }
        }.resume()
    }
}

// Model for the Unsplash API response
struct UnsplashResponse: Decodable {
    let results: [ImageModel]
}
