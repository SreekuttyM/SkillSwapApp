//
//  AppState.swift
//  SkillSwapApp
//
//  Created by Sreekutty Maya on 19/06/2025.
//


import Foundation
@Observable
class AppState {
    private(set) var showHome: Bool  {
        didSet {
            UserDefaults.showHome = showHome
        }
    }
    
    init(showHome: Bool = UserDefaults.showHome) {
        self.showHome = showHome
    }
    
    func updateShowHomeScreen(showHome : Bool) {
        self.showHome = showHome
    }

}

extension UserDefaults {
    private struct Keys {
        static let showHome = "showHome"
    }
    
   static var showHome : Bool {
        set {
            standard.set(newValue, forKey: Keys.showHome)
        }
        get {
            standard.bool(forKey: Keys.showHome)
        }
    }
}


