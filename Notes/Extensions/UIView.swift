//
//  UIView.swift
//  Notes
//
//  Created by Grigoriy Zaliva on 4/24/19.
//  Copyright © 2019 ZalStd. All rights reserved.
//
//

import UIKit
import AVFoundation

extension UIView {
    
    func addConstaintsToPinHorizontalEdgesToSuperView(padding: CGFloat = 0) {
        prepareForConstraints()
        self.superview!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(padding)-[view]-(padding)-|",
                                                                      options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                      metrics: ["padding":padding],
                                                                      views: ["view":self]))
    }
    
    func addConstaintsToPinVerticalEdgesToSuperView(padding: CGFloat = 0) {
        prepareForConstraints()
        self.superview!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(padding)-[view]-(padding)-|",
                                                                      options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                      metrics: ["padding":padding],
                                                                      views: ["view":self]))
    }
    
    func addConstaintsToFillSuperviewWithPadding(padding: CGFloat = 0) {
        prepareForConstraints()
        addConstaintsToPinHorizontalEdgesToSuperView(padding: padding)
        addConstaintsToPinVerticalEdgesToSuperView(padding: padding)
    }
    
    private func prepareForConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        if superview == nil {
            assert(false, "You need to have a superview before you can add contraints")
        }
    }

}
