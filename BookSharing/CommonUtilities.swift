//
//  CommonUtilities.swift
//  AppX
//
//  Created by Pranay Kumar on 05/07/16.
//  Copyright © 2016 Pranay Kumar. All rights reserved.
//

import UIKit

func showAlert(title: String = "Alert", message: String, currentView: UIViewController, style: UIAlertControllerStyle = .alert, actions : UIAlertAction...) {
    let ac : UIAlertController = UIAlertController(title: title, message: message, preferredStyle: style)
    for action in actions{
        ac.addAction(action)
    }
    currentView.present(ac, animated: true, completion: nil)
}


func getView(storyboardName storyboard : String, storyboardIdentifier : String) -> UIViewController{
    let storyboard = UIStoryboard(name: storyboard, bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: storyboardIdentifier)
    return viewController
}

func configureGradientBackground(currentViewController: UIViewController, colors:CGColor...){
    
    let gradient: CAGradientLayer = CAGradientLayer()
    let maxWidth = max(currentViewController.view.bounds.size.height,currentViewController.view.bounds.size.width)
    let squareFrame = CGRect(origin: currentViewController.view.bounds.origin, size: CGSize(width: maxWidth,height: maxWidth))
    gradient.frame = squareFrame
    
    gradient.colors = colors
    currentViewController.view.layer.insertSublayer(gradient, at: 0)
}

func setUserCredentialsToKeyChain(authenticationToken : String){
    let keyChain = KeychainSwift()
    keyChain.set(authenticationToken, forKey: Constants.AUTH_TOKEN)
}
