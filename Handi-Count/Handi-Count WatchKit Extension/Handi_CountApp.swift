//
//  Handi_CountApp.swift
//  Handi-Count WatchKit Extension
//
//  Created by 90304588 on 5/27/22.
//

import SwiftUI

@main
struct Handi_CountApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
