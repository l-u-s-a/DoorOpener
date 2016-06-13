//
//  PresenterInterface.swift
//  Door Opener
//
//  Created by Luka Usalj on 5/15/16
//  Copyright (c) 2016 FER. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Base presenter interface -
protocol PresenterInterface {
    func viewDidLoad()
    func viewWillAppear(animated: Bool)
    func viewDidAppear(animated: Bool)
    func viewWillDisappear(animated: Bool)
    func viewDidDisappear(animated: Bool)
}

// MARK: - Base presenter interface default implementation -
extension PresenterInterface {
    func viewDidLoad() {
        fatalError("Implementation pending...")
    }
    
    func viewWillAppear(animated: Bool) {
        fatalError("Implementation pending...")
    }
    
    func viewDidAppear(animated: Bool) {
        fatalError("Implementation pending...")
    }
    
    func viewWillDisappear(animated: Bool) {
        fatalError("Implementation pending...")
    }
    
    func viewDidDisappear(animated: Bool) {
        fatalError("Implementation pending...")
    }
}
