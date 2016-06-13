//
//  InterfaceController.swift
//  DoorOpener WatchKit Extension
//
//  Created by Luka Usalj on 13/06/16.
//  Copyright © 2016 FER. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        openDoor()
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBAction func openDoorButtonTouched() {
        openDoor()
    }

    private func openDoor() {
        guard WCSession.isSupported() else {
            return
        }

        let session = WCSession.defaultSession()
        session.sendMessage(["UserCurrentRoom" : ""], replyHandler: { response in
            print("response")
            }, errorHandler: { error in
                print("error")
        })
    }

}
