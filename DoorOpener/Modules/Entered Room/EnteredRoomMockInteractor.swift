//
//  EnteredRoomMockInteractor.swift
//  Door Opener
//
//  Created by Luka Usalj on 17/05/16.
//  Copyright © 2016 FER. All rights reserved.
//

import UIKit

final class EnteredRoomMockInteractor: NSObject, EnteredRoomInteractorInterface {
    func leaveRoomWithID(roomID: String, token: String, success: () -> (), failure: (error: String) -> ()) {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            success()
        }
    }
}
