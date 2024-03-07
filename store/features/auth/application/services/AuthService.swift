import Foundation
import Combine

class AuthService {
    private let baseURL = URL(string: "https://arrow.acidjelly.com/dj-rest-auth/")!
    
    func signIn(email: String, password1: String, password2: String) -> AnyPublisher<UserAccountResponseModel, Error> {
        let signInURL = baseURL.appendingPathComponent("registration/")
        let body = ["email": email.lowercased(), "password1": password1, "password2": password2]
        return requestWithJSONBody(url: signInURL, method: "POST", body: body)
    }
    
    func loginUser(email: String, password: String) -> AnyPublisher<UserAccountResponseModel, Error> {
        let loginURL = baseURL.appendingPathComponent("login/")
        let body = ["email": email.lowercased(), "password": password]
        return requestWithJSONBody(url: loginURL, method: "POST", body: body)
    }
    
    func verifyEmail(email: String) -> AnyPublisher<UserAccountResponseModel, Error> {
        let verifyEmailURL = baseURL.appendingPathComponent("verify-email/")
        let body = ["email": email.lowercased()]
        return requestWithJSONBody(url: verifyEmailURL, method: "POST", body: body)
    }
    
    func resendEmail(email: String) -> AnyPublisher<UserAccountResponseModel, Error> {
        let resendEmailURL = baseURL.appendingPathComponent("verify-email/")
        let body = ["email": email.lowercased()]
        return requestWithJSONBody(url: resendEmailURL, method: "POST", body: body)
    }
    
    func putUserAccount(data: UserAccountRequestModel) -> AnyPublisher<UserAccountResponseModel, Error> {
        let putURL = baseURL.appendingPathComponent("user/")
        return requestWithJSONBody(url: putURL, method: "PUT", body: data)
    }
    
    func updateUserAccount(data: UserAccountRequestModel) -> AnyPublisher<UserAccountResponseModel, Error> {
        let updateURL = baseURL.appendingPathComponent("user/")
        return requestWithJSONBody(url: updateURL, method: "PATCH", body: data)
    }
    
    func deleteUserAccount(data: UserAccountRequestModel) -> AnyPublisher<UserAccountResponseModel, Error> {
        let deleteURL = baseURL.appendingPathComponent("user/")
        return requestWithJSONBody(url: deleteURL, method: "DELETE", body: data)
    }
    
    func getUserAccount(data: UserAccountRequestModel) -> AnyPublisher<UserAccountResponseModel, Error> {
        let getURL = baseURL.appendingPathComponent("user/")
        return requestWithJSONBody(url: getURL, method: "GET", body: data)
    }
    
    func verifyUserAccount() -> AnyPublisher<UserAccountResponseModel, Error> {
        let verifyURL = baseURL.appendingPathComponent("token/verify/")
        let token = UserDefaults.standard.string(forKey: "access") ?? ""
        let body = ["token": token]
        return requestWithJSONBody(url: verifyURL, method: "POST", body: body)
    }
    
    func refreshUserAccount() -> AnyPublisher<UserAccountResponseModel, Error> {
        let refreshURL = baseURL.appendingPathComponent("token/refresh/")
        
        let body = ["message": "welcome"]
        return requestWithJSONBody(url: refreshURL, method: "POST", body: body)
    }
    
    func logoutUserAccount() -> AnyPublisher<UserAccountResponseModel, Error> {
        let logoutURL = baseURL.appendingPathComponent("logout/")
        let body = ["message": "welcome"]
        return requestWithJSONBody(url: logoutURL, method: "POST", body: body)
    }
    
    private func requestWithJSONBody<T: Encodable>(url: URL, method: String, body: T?)
    -> AnyPublisher<UserAccountResponseModel, Error>
    {
        
        let configuration = URLSessionConfiguration.default
        configuration.httpCookieAcceptPolicy = .always
        configuration.httpShouldSetCookies = true
        
        let session = URLSession(configuration:configuration)
        
        var request = URLRequest(url: url)
        
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let body = body {
            request.httpBody = try? JSONEncoder().encode(body)
        }
            
        return session.dataTaskPublisher(for: request)
        .tryMap { data, response -> Data in
            guard let httpResponse = response as? HTTPURLResponse, (200...300).contains(httpResponse.statusCode) else {
                if let errorResponse = try? JSONDecoder().decode(UserAccountErrorResponse.self, from: data) {
                    throw UserAccountError.serverError(message: "No se ha podido identificarte", response:errorResponse)
                } else {
                    throw CustomError.unknownError
                }
            }
            
            return data
        }
        .decode(type: UserAccountResponseModel.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
   }
}
