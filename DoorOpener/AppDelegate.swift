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
    private var roomStatusInteractor = RoomStatusInteractor()
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

        let tabBarController = UITabBarController()
        tabBarController.view.backgroundColor = UIColor.whiteColor()
        tabBarController.tabBar.hidden = true
        tabBarController.setViewControllers([rootViewController], animated: true)

        window?.rootViewController = tabBarController

        wireframe.tabBarController = tabBarController

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
        let messageKey = "UserCurrentRoom"
        guard TokenManager.userHasToken else {
            replyHandler([messageKey: "NoToken"])
            return
        }

        let token = TokenManager.token

        roomStatusInteractor.getRoomStatusForUserWithToken(token, success: { roomID in [replyHandler]
            if roomID == nil {
                replyHandler([messageKey : "OutOfRoom"])
            } else {
                replyHandler([messageKey : "InRoom"])
            }
        }) { (error) in
            replyHandler([messageKey : error])
        }
    }
}

