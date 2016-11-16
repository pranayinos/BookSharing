//
//  AppDelegate.swift
//  AppX
//
//  Created by Pranay Kumar on 04/07/16.
//  Copyright © 2016 Pranay Kumar. All rights reserved.
//

import UIKit
import SideMenuController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var splashTimer:Timer?
    var storyboard:UIStoryboard?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions : [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        
        SideMenuController.preferences.drawing.menuButtonImage = UIImage(named: "menu")
        SideMenuController.preferences.drawing.sidePanelPosition = .underCenterPanelLeft
        SideMenuController.preferences.drawing.sidePanelWidth = 300
        SideMenuController.preferences.drawing.centerPanelShadow = true
        SideMenuController.preferences.animating.statusBarBehaviour = .horizontalPan
        SideMenuController.preferences.animating.transitionAnimator = FadeAnimator.self
        
        
        
        let launchScreen = getView(storyboardName: "LaunchScreen", storyboardIdentifier: "LaunchScr").view
        
        window?.makeKeyAndVisible()
        window?.addSubview(launchScreen!)
        window?.bringSubview(toFront: launchScreen!)
        
        let loginController = getView(storyboardName: "Login", storyboardIdentifier: "LoginView") as! LoginViewController
        
        window?.rootViewController?.present(loginController, animated: false, completion:{
            
            loginController.status = LoginViewStatus.signingIn
            
            UIView.animate(withDuration: 1, animations: {launchScreen?.alpha=0}, completion: { (Bool) -> Void  in
                
                launchScreen?.removeFromSuperview();
                
                let user = self.loginUsingStoredCredentials()
                if user != nil{
                    loginController.dismiss(animated: false, completion: nil)
                }
                else{
                    loginController.status = LoginViewStatus.loginView
                    loginController.displayLoginScreen()
                }
                return
            })
        })
        return true
    }
    
    func loginUsingStoredCredentials() -> String?{
        let keyChain = KeychainSwift()
        let loggedInUser = keyChain.get(Constants.DATA_KEY) ?? nil
        sleep(0)
        return loggedInUser
        
    }
    
}
