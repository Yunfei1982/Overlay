//
//  LayoutCustomizable.swift
//  Overlay
//
//  Created by Justin Jia on 8/23/16.
//  Copyright © 2016 TintPoint. MIT license.
//

import UIKit

public protocol LayoutCustomizable: ViewCustomizable {

    func customizeLayout(using nib: UINib)
    
}

extension UIView: LayoutCustomizable {
    
    public func customizeLayout(using nib: UINib) {
        if let contentView = nib.instantiate(withOwner: self, options: nil).first as? UIView, !subviews.contains(contentView) {
            contentView.translatesAutoresizingMaskIntoConstraints = false
            insertSubview(contentView, at: 0)
            contentView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            contentView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            contentView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
            contentView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        }
    }
    
}