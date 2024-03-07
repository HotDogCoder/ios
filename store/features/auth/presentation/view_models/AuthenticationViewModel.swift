import SwiftUI
import Combine

class AuthenticationViewModel: ObservableObject {
    private let auth_service: AuthService = AuthService()
    private var cancellables = Set<AnyCancellable>()
    @Published var errorMessage: String?
    @Published var access: String?
    @Published var refresh: String?
    @Published var user_name: String?
    @Published var user_email: String?
    @Published var message: String?
    @Published var detail: String?
    
    func login(email: String, password: String) {
        auth_service.loginUser(email: email, password: password)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.handleError(error)
                }
            }, receiveValue: { [weak self] userResponse in
                // Update Profile properties directly
                self?.message = userResponse.message
                self?.access = userResponse.access
                self?.refresh = userResponse.refresh
                self?.user_name = userResponse.user?.name
                self?.user_email = userResponse.user?.email
                
                UserDefaults.standard.set(userResponse.access, forKey: "access")
                UserDefaults.standard.set(userResponse.refresh, forKey: "refresh")
                UserDefaults.standard.set(userResponse.user?.name, forKey: "user_name")
                UserDefaults.standard.set(userResponse.user?.name, forKey: "user_email")
            })
            .store(in: &cancellables)
    }
    
    func sign_in(email: String, password1: String, password2: String) {
        auth_service.signIn(email: email, password1: password1, password2: password2)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.handleError(error)
                }
            }, receiveValue: { [weak self] userResponse in
                // Update Profile properties directly
                self?.message = userResponse.message
                self?.detail = userResponse.detail
                self?.errorMessage = nil
            })
            .store(in: &cancellables)
    }
        
    private func handleError(_ error: Error) {
        if let userAccountError = error as? UserAccountError {
            switch userAccountError {
            case .serverError(let message, let response):
                // Check which fields have error messages
                var errorMessage = ""
                if let emailErrors = response.email {
                    errorMessage += "Email: \(emailErrors.joined(separator: ", "))\n"
                }
                if let passwordErrors = response.password {
                    errorMessage += "Password: \(passwordErrors.joined(separator: ", "))\n"
                }
                if let passwordErrors = response.password1 {
                    errorMessage += "Password: \(passwordErrors.joined(separator: ", "))\n"
                }
                if let passwordErrors = response.password2 {
                    errorMessage += "Password: \(passwordErrors.joined(separator: ", "))\n"
                }
                if let nonFieldErrors = response.non_field_errors {
                    errorMessage += "Other Errors: \(nonFieldErrors.joined(separator: ", "))"
                }
                self.errorMessage = errorMessage
            case .unknownError:
                self.errorMessage = "An unknown error occurred."
            }
        } else {
            self.errorMessage = error.localizedDescription
        }
    }
    
}
