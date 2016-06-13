//
//  AppDelegate.swift
//  DoorOpener
//
//  Created by Luka Usalj on 13/06/16.
//  Copyright © 2016 FER. All rights reserved.
//

import UIKit
import WatchConnectivity

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        _setupWireframe()
        _setupWatchConnectivitySession()
        return true
    }

    private func _setupWireframe() {
        window = UIWindow()

        var wireframe: WireframeInterface

        wireframe = TokenManager.userHasToken ? OpenDoorWireframe() : LoginWireframe()

        let rootViewController = wireframe.instantiateAndConfigureModule()

        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBarHidden = true

        window?.rootViewController = navigationController

        wireframe.navigationController = navigationController

        window?.makeKeyAndVisible()
    }

    private func _setupWatchConnectivitySession() {
        guard WCSession.isSupported() else {
            return
        }
        let session = WCSession.defaultSession()
        session.delegate = self
        session.activateSession()
    }
}

extension AppDelegate: WCSessionDelegate {
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        replyHandler([:])
        print("heea")
    }
}

