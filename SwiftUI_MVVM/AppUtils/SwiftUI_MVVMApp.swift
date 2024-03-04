//
//  SwiftUI_MVVMApp.swift
//  SwiftUI_MVVM
//
//  Created by A'zamjon Abdumuxtorov on 02/03/24.
//

import SwiftUI


@main
struct SwiftUI_MVVMApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
    
   
}
