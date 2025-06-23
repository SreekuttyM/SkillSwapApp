//
//  AppState.swift
//  SkillSwapApp
//
//  Created by Sreekutty Maya on 19/06/2025.
//


import Foundation
@Observable
class AppState {
    
    private(set) var isUserAuthorized: Bool {
        didSet {
            UserDefaults.isUserAuthorized = isUserAuthorized
        }
    }
    
    private(set) var showHome: Bool  {
        didSet {
            UserDefaults.showHome = showHome
        }
    }
    
    init(isUserAuthorized: Bool = UserDefaults.isUserAuthorized, showHome: Bool = UserDefaults.showHome)  {
        self.isUserAuthorized = isUserAuthorized
        self.showHome = showHome
    }
    
    func updateShowHomeScreen(showHome : Bool) {
        self.showHome = showHome
    }

    func updateIsUserAuthorized(isUserLoggedIn : Bool) {
        self.isUserAuthorized = isUserLoggedIn
        self.showHome = true
    }

}

extension UserDefaults {
    private struct Keys {
        static let showHome = "showHome"
        static let isUserAuthorized = "userLoggedIn"
    }
    
   static var showHome : Bool {
        set {
            standard.set(newValue, forKey: Keys.showHome)

        }
        get {
            standard.bool(forKey: Keys.showHome)
        }
    }
    
    static var isUserAuthorized : Bool {
         set {
             standard.set(newValue, forKey: Keys.isUserAuthorized)
         }
         get {
             standard.bool(forKey: Keys.isUserAuthorized)
         }
     }
}


