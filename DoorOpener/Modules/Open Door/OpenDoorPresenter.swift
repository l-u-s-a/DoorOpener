//
//  OpenDoorPresenter.swift
//  Door Opener
//
//  Created by Luka Usalj on 16/05/16.
//  Copyright (c) 2016 FER. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class OpenDoorPresenter: NSObject {
    
    // MARK: - Private properties -
    private weak var _view: OpenDoorViewInterface?
    private var _interactor: OpenDoorInteractorInterface
    private var _wireframe: OpenDoorWireframeInterface
    
    // MARK: - Lifecycle -
    init (wireframe: OpenDoorWireframeInterface, view: OpenDoorViewInterface, interactor: OpenDoorInteractorInterface) {
        self._wireframe = wireframe
        self._view = view
        self._interactor = interactor
    }
    
}

extension OpenDoorPresenter: OpenDoorViewDelegateInterface {
    func didTouchEnterRoomButton() {
        
        self._view?.showSpinner()
        
        _interactor.openRoomWithID(roomID, token: TokenManager.token, success: { [weak self] in
            self?._view?.hideSpinner()
            self?._wireframe.performNavigationAction(OpenDoorNavigationAction.EnterRoom)
            }) { (error) in
                print(error)
        }
    }
}
