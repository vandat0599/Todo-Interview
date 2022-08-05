//
//  BaseViewController.swift
//  Todo-Interview
//
//  Created by Dat Van on 05/08/2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    var activityIndicator: UIActivityIndicatorView?
    
    func showActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator?.center = view.center
        view.addSubview(activityIndicator!)
        activityIndicator?.startAnimating()
    }
    
    func hideActivityIndicator() {
        activityIndicator?.stopAnimating()
    }
}
