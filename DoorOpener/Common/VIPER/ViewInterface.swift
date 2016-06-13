//
//  ViewInterface.swift
//  Door Opener
//
//  Created by Luka Usalj on 5/15/16
//  Copyright (c) 2016 FER. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Base view interface -
protocol ViewInterface: class {
    func showSpinner()
    func hideSpinner()
    func showErrorMessage(errorMessage: String)
    func showErrorMessage(errorMessage: String, completionHandler: (() -> ()))
}

// MARK: - Base view interface default implementation -
extension ViewInterface {
}
