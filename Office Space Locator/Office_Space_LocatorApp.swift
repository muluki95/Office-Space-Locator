//
//  Office_Space_LocatorApp.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/2/25.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct YourApp: App {
    
    @StateObject var viewModel = OfficeViewModel()
    @StateObject var favoriteViewModel = FavoritesViewModel()
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    

  var body: some Scene {
    WindowGroup {
      NavigationView {
       HomeView()
              .environmentObject(viewModel)
              .environmentObject(favoriteViewModel)
          
              .onAppear {
                                  favoriteViewModel.fetchFavorites()   
                              }
      }
    }
  }
}
