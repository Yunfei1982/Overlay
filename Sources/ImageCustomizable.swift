//
//  ImageCustomizable.swift
//  Overlay
//
//  Created by Justin Jia on 8/22/16.
//  Copyright © 2016 TintPoint. MIT license.
//

import UIKit

public protocol BackgroundImageCustomizable: ViewCustomizable {
    
    func customizeBackgroundImage(using style: ImageStyle)
    
}

public protocol DecrementImageCustomizable: ViewCustomizable {
    
    func customizeDecrementImage(using style: ImageStyle)
    
}

public protocol HighlightedImageCustomizable: ViewCustomizable {
    
    func customizeHighlightedImage(using style: ImageStyle)
    
}

public protocol ImageCustomizable: ViewCustomizable {
    
    func customizeImage(using style: ImageStyle)
    
}

public protocol IncrementImageCustomizable: ViewCustomizable {
    
    func customizeIncrementImage(using style: ImageStyle)
    
}

public protocol LandscapeImagePhoneCustomizable: ViewCustomizable {
    
    func customizeLandscapeImagePhone(using style: ImageStyle)
    
}

public protocol MaximumTrackImageCustomizable: ViewCustomizable {
    
    func customizeMaximumTrackImage(using style: ImageStyle)
    
}

public protocol MaximumValueImageCustomizable: ViewCustomizable {
    
    func customizeMaximumValueImage(using style: ImageStyle)
    
}

public protocol MinimumTrackImageCustomizable: ViewCustomizable {
    
    func customizeMinimumTrackImage(using style: ImageStyle)
    
}

public protocol MinimumValueImageCustomizable: ViewCustomizable {
    
    func customizeMinimumValueImage(using style: ImageStyle)
    
}

public protocol OffImageCustomizable: ViewCustomizable {
    
    func customizeOffImage(using style: ImageStyle)
    
}

public protocol OnImageCustomizable: ViewCustomizable {
    
    func customizeOnImage(using style: ImageStyle)
    
}

public protocol ProgressImageCustomizable: ViewCustomizable {
    
    func customizeProgressImage(using style: ImageStyle)
    
}

public protocol ScopeBarButtonBackgroundImageCustomizable: ViewCustomizable {
    
    func customizeScopeBarButtonBackgroundImage(using style: ImageStyle)
    
}

public protocol SearchFieldBackgroundImageCustomizable: ViewCustomizable {
    
    func customizeSearchFieldBackgroundImage(using style: ImageStyle)
    
}

public protocol SelectedImageCustomizable: ViewCustomizable {
    
    func customizeSelectedImage(using style: ImageStyle)
    
}

public protocol ShadowImageCustomizable: ViewCustomizable {
    
    func customizeShadowImage(using style: ImageStyle)
    
}

public protocol ThumbImageCustomizable: ViewCustomizable {
    
    func customizeThumbImage(using style: ImageStyle)
    
}

public protocol TrackImageCustomizable: ViewCustomizable {
    
    func customizeTrackImage(using style: ImageStyle)
    
}

extension ViewCustomizable {
    
    func selected(_ style: ImageStyle, except states: [UIControlState] = []) -> UIImage? {
        guard let styleGroup = style as? ImageStyleGroup else {
            return style.normal()
        }
        
        if let view = self as? ViewHighlightable, view.isHighlighted, !states.contains(.highlighted) {
            return styleGroup.highlighted()
        } else if let view = self as? ViewSelectable, view.isSelected, !states.contains(.selected) {
            return styleGroup.selected()
        } else if let view = self as? ViewDisable, !view.isEnabled, !states.contains(.disabled) {
            return styleGroup.disabled()
        } else if let view = self as? ViewFocusable, view.isFocused, !states.contains(.focused) {
            return styleGroup.focused()
        } else {
            return styleGroup.normal()
        }
    }
    
    func setImage(_ style: ImageStyle, for setter: (UIImage?, UIControlState) -> ()) {
        setter(style.normal(), .normal)
        if let styleGroup = style as? ImageStyleGroup {
            setter(styleGroup.highlighted(), .highlighted)
            setter(styleGroup.disabled(), .disabled)
            setter(styleGroup.selected(), .selected)
            setter(styleGroup.focused(), .focused)
        }
    }
    
}

extension UIBarButtonItem: ImageCustomizable, LandscapeImagePhoneCustomizable {
    
    public func customizeImage(using style: ImageStyle) {
        image = selected(style)
    }
    
    public func customizeLandscapeImagePhone(using style: ImageStyle) {
        landscapeImagePhone = selected(style)
    }
    
}

extension UITabBarItem: ImageCustomizable, SelectedImageCustomizable {
    
    public func customizeImage(using style: ImageStyle) {
        image = selected(style)
    }
    
    public func customizeSelectedImage(using style: ImageStyle) {
        selectedImage = selected(style)
    }
    
}

extension UIButton: ImageCustomizable, BackgroundImageCustomizable {
    
    public func customizeImage(using style: ImageStyle) {
        setImage(style, for: setImage)
    }
    
    public func customizeBackgroundImage(using style: ImageStyle) {
        setImage(style, for: setBackgroundImage)
    }
    
}

extension UISlider: MinimumValueImageCustomizable, MaximumValueImageCustomizable, MinimumTrackImageCustomizable, MaximumTrackImageCustomizable, ThumbImageCustomizable {
    
    public func customizeMinimumValueImage(using style: ImageStyle) {
        minimumValueImage = selected(style)
    }
    
    public func customizeMaximumValueImage(using style: ImageStyle) {
        maximumValueImage = selected(style)
    }
    
    public func customizeMinimumTrackImage(using style: ImageStyle) {
        setImage(style, for: setMinimumTrackImage)
    }
    
    public func customizeMaximumTrackImage(using style: ImageStyle) {
        setImage(style, for: setMaximumTrackImage)
    }
    
    public func customizeThumbImage(using style: ImageStyle) {
        setImage(style, for: setThumbImage)
    }
    
}

extension UIStepper: BackgroundImageCustomizable, DecrementImageCustomizable, IncrementImageCustomizable {
    
    public func customizeBackgroundImage(using style: ImageStyle) {
        setImage(style, for: setBackgroundImage)
    }
    
    public func customizeDecrementImage(using style: ImageStyle) {
        setImage(style, for: setDecrementImage)
    }
    
    public func customizeIncrementImage(using style: ImageStyle) {
        setImage(style, for: setIncrementImage)
    }
    
}

extension UISwitch: OffImageCustomizable, OnImageCustomizable {
    
    public func customizeOffImage(using style: ImageStyle) {
        offImage = selected(style)
    }
    
    public func customizeOnImage(using style: ImageStyle) {
        onImage = selected(style)
    }
    
}

extension UIImageView: ImageCustomizable, HighlightedImageCustomizable {
    
    public func customizeImage(using style: ImageStyle) {
        image = selected(style)
    }
    
    public func customizeHighlightedImage(using style: ImageStyle) {
        highlightedImage = selected(style)
    }
    
}

extension UINavigationBar: ShadowImageCustomizable {
    
    public func customizeShadowImage(using style: ImageStyle) {
        shadowImage = selected(style)
    }
    
}

extension UIProgressView: ProgressImageCustomizable, TrackImageCustomizable {
    
    public func customizeProgressImage(using style: ImageStyle) {
        progressImage = selected(style)
    }
    
    public func customizeTrackImage(using style: ImageStyle) {
        trackImage = selected(style)
    }
    
}

extension UISearchBar: BackgroundImageCustomizable, SearchFieldBackgroundImageCustomizable, ScopeBarButtonBackgroundImageCustomizable {
    
    public func customizeBackgroundImage(using style: ImageStyle) {
        backgroundImage = selected(style)
    }
    
    public func customizeSearchFieldBackgroundImage(using style: ImageStyle) {
        setImage(style, for: setSearchFieldBackgroundImage)
    }
    
    public func customizeScopeBarButtonBackgroundImage(using style: ImageStyle) {
        setImage(style, for: setScopeBarButtonBackgroundImage)
    }
    
}

extension UITabBar: BackgroundImageCustomizable, ShadowImageCustomizable {
    
    public func customizeBackgroundImage(using style: ImageStyle) {
        backgroundImage = selected(style)
    }
    
    public func customizeShadowImage(using style: ImageStyle) {
        shadowImage = selected(style)
    }

}
