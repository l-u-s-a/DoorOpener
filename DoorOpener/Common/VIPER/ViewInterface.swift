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
    func showLoading()
    func hideLoading()
    func showErrorMessage(errorMessage: String)
    func showErrorMessage(errorMessage: String, completionHandler: (() -> ()))
}

// MARK: - Base view interface default implementation -
extension ViewInterface where Self: UIViewController {
    func showLoading() {
        let blurView = UIVisualEffectView(frame: view.frame)
        view.addSubview(blurView)

        UIView.animateWithDuration(0.3, animations: { 
            blurView.effect = UIBlurEffect(style: .Light)
            }) { _ in
                let spinner = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
                spinner.frame = self.view.frame
                self.view.addSubview(spinner)
                spinner.startAnimating()
        }
    }

    func hideLoading() {
        for subview in view.subviews {
            if subview is UIVisualEffectView || subview is UIActivityIndicatorView {
                removeFromSuperview(subview: subview)
            }
        }
    }

    private func removeFromSuperview(subview subview: UIView) {
        UIView.animateWithDuration(0.3, animations: {
            subview.alpha = 0
            }, completion: { _ in
                subview.removeFromSuperview()
        })
    }
}
