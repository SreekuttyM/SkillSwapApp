//
//  SignUpViewModel.swift
//  SkillSwapApp
//
//  Created by Sreekutty Maya on 23/06/2025.
//


import Combine
import Foundation

enum Gender  : String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case Male
    case Female
}

class SignUpViewModel : ObservableObject {
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var fullName : String = ""
    @Published var gender : Gender = .Male
    @Published var isFormValid: Bool = false

    private var publishers = Set<AnyCancellable>()

    init() {
        Publishers.CombineLatest3($email, $password,$fullName)
            .map { email, password,fullName in
                self.isValidEmail() && password.count >= 6 && !fullName.isEmpty
            }
            .assign(to: &$isFormValid)
    }
    
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
}
