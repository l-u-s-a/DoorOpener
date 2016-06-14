//
//  LoginWireframe.swift
//  Door Opener
//
//  Created by Luka Usalj on 16/05/16.
//  Copyright (c) 2016 FER. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import UIKit

struct LoginContext {
}

final class LoginWireframe: NSObject {
    
    // MARK: - Private properties -
    private var _context: LoginContext?
    private let _storyboard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
    
    // MARK: - Public properties -
    weak var tabBarController: UITabBarController?
    weak var navigationController: UINavigationController?
    weak var viewController: UIViewController?
    
    // MARK: - Init -
    private override init() {}

    init(context: LoginContext? = nil, navigationController: UINavigationController? = nil) {
        super.init()
        self._context = context
        self.navigationController = navigationController
    }
    
    // MARK: - Module setup -
    func instantiateAndConfigureModule() -> UIViewController {
        let moduleViewController = _storyboard.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
        configureModuleWith(moduleViewController)
        viewController = moduleViewController
        return moduleViewController
    }
    
    func configureModuleWith(viewController: LoginViewController) {
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(wireframe: self, view: viewController, interactor: interactor)
        viewController.presenter = presenter
    }
}

// MARK: - Login Wireframe Interface Requirements -
extension LoginWireframe: LoginWireframeInterface {
    func performNavigationAction(action: LoginNavigationAction) {
        switch action {
        case .GoToDoorOpening:
            let openDoorWireframe = OpenDoorWireframe()
            openDoorWireframe.tabBarController = tabBarController
            openDoorWireframe.setViewInTabBarController()

        case .GoToEnteredRoom:
            let enteredRoomWireframe = EnteredRoomWireframe()
            enteredRoomWireframe.tabBarController = tabBarController
            enteredRoomWireframe.setViewInTabBarController()
        }
    }
}