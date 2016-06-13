//
//  RoomStatusInteractor.swift
//  DoorOpener
//
//  Created by Luka Usalj on 13/06/16.
//  Copyright © 2016 FER. All rights reserved.
//

import UIKit
import Alamofire

final class RoomStatusInteractor: NSObject {
    func getRoomStatusForUserWithToken(token: String, success: (roomID: String?) -> (), failure: (error: String) -> ()) {
        Alamofire.request(.GET, baseURL + "/mobile/status", parameters: nil, encoding: .JSON, headers: ["Content-Type": "application/json", "Authorization": "Bearer " + token]).responseJSON { (response) in
            switch response.result {
            case .Failure(let error):
                failure(error: error.localizedDescription)
            case .Success(let responseObject):
                print(responseObject)
                guard let responseDictionary = responseObject as? NSDictionary else {
                    failure(error: "response is not returned in dictionary")
                    break
                }

                let roomID = responseDictionary.objectForKey("roomId")

                if roomID is NSNull {
                    success(roomID: nil)
                } else {
                    success(roomID: roomID as? String)
                }
            }
        }
    }
}
