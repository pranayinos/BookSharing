//
//  CustomSpinner.swift
//  AppX
//
//  Created by Pranay Kumar on 08/07/16.
//  Copyright © 2016 Pranay Kumar. All rights reserved.
//

import UIKit

class CustomSpinner: UIVisualEffectView {
    
    var text: String? {
        didSet {
            label.text = text
        }
    }
    let activityIndictor: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    let label: UILabel = UILabel()
    let blurEffect = UIBlurEffect(style: .dark)
    let vibrancyView: UIVisualEffectView
    
    init(text: String) {
        self.text = text
        self.vibrancyView = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: blurEffect))
        super.init(effect: blurEffect)
        self.setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        self.text = ""
        self.vibrancyView = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: blurEffect))
        super.init(coder: aDecoder)!
        self.setup()
        
    }
    
    func setup() {
        contentView.addSubview(vibrancyView)
        vibrancyView.contentView.addSubview(activityIndictor)
        vibrancyView.contentView.addSubview(label)
        activityIndictor.startAnimating()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if let superview = self.superview {
            
            let width:CGFloat = 110.0
            let height: CGFloat = 110.0
            self.frame = CGRect(x: superview.frame.size.width / 2 - width / 2,
                                    y: superview.frame.height / 2 - height / 2,
                                    width: width,
                                    height: height)
            vibrancyView.frame = self.bounds
            
            let activityIndicatorSize: CGFloat = 60
            activityIndictor.frame = CGRect(x: width / 2 - activityIndicatorSize/2, y: 20,
                                                width: activityIndicatorSize,
                                                height: activityIndicatorSize)
            
            layer.cornerRadius = 8.0
            layer.masksToBounds = true
            label.text = text
            label.textAlignment = NSTextAlignment.center
            label.frame = CGRect(x: 0, y: activityIndicatorSize + 10, width: width, height: height - activityIndicatorSize - 10)
            label.textColor = UIColor.gray
            label.font = UIFont.boldSystemFont(ofSize: 16)
        }
    }

    func show() {
        self.isHidden = false
    }
    
    func hide() {
        self.isHidden = true
    }
}
