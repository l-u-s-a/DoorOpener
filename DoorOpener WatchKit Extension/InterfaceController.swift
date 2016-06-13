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
    @IBOutlet var button: WKInterfaceButton!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
    }

    override func willActivate() {
        _clearUI()
        _updateUI()
        super.willActivate()
    }

    private func updateUIForOutOfRoomState() {
        let image = UIImage(named: "entranceButton")
        button.setBackgroundImage(image)
        button.setEnabled(true)
        animateWithDuration(0.3) { 
            self.button.setAlpha(1)
        }
        print("out of room state")
    }

    private func updateUIForInRoomState() {
        let image = UIImage(named: "leaveButton")
        button.setBackgroundImage(image)
        button.setEnabled(true)
        animateWithDuration(0.3) {
            self.button.setAlpha(1)
        }
        print("in room state")
    }

    private func _clearUI() {
        button.setEnabled(false)
        button.setBackgroundImage(nil)
        button.setAlpha(0)
    }

    private func _clearUIAnimated() {
        button.setEnabled(false)
        animateWithDuration(0.3) {
            self.button.setAlpha(0)
        }
    }

    private func _updateUI() {
        guard WCSession.isSupported() else {
            return
        }

        let session = WCSession.defaultSession()
        let messageKey = "UserCurrentRoom"
        session.sendMessage([messageKey : ""], replyHandler: { response in
            guard let state = response[messageKey] as? String else {
                return
            }
            switch state {
            case "OutOfRoom":
                self.updateUIForOutOfRoomState()
            case "InRoom":
                self.updateUIForInRoomState()
            default:
                break
            }
            }, errorHandler: { error in
                print(error.localizedDescription)
        })
    }

    @IBAction func buttonTouched() {
        _clearUIAnimated()
        _updateUI()
    }
}
