//
//  FyeryApp.swift
//  Fyery
//
//  Created by Fery Lancz on 26.12.22.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
//        UINavigationBar.appearance().backIndicatorImage = UIImage(systemName: "chevron.left")
//        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(systemName: "chevron.left")
//        UINavigationBar.appearance().tintColor = UIColor(named: "PrimaryColor")
//        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(named: "PrimaryColor") ?? UIColor.black], for: .normal)
        return true
    }
}

@main
struct FyeryApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var user = SalesPartner(generateTestData: true)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(user)
        }
    }
}
