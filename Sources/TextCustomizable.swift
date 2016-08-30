//
//  TextCustomizable.swift
//  Overlay
//
//  Created by Justin Jia on 8/29/16.
//  Copyright © 2016 TintPoint. MIT license.
//

import UIKit

/// A protocol that describes a view that its placeholder can be customized.
public protocol PlaceholderCustomizable: TextStyleExpressible {

    /// Customizes the placeholder.
    /// - Parameter style: A `TextStyle` that describes the placeholder.
    func customizePlaceholder(using style: TextStyle)

}

/// A protocol that describes a view that its prompt can be customized.
public protocol PromptCustomizable: TextStyleExpressible {

    /// Customizes the prompt.
    /// - Parameter style: A `TextStyle` that describes the prompt.
    func customizePrompt(using style: TextStyle)

}

/// A protocol that describes a view that its titles of the segments can be customized.
public protocol SegmentTitlesCustomizable: TextStyleExpressible {

    /// Customizes the titles of the segments.
    /// - Parameter styles: An array of `TextStyle` that describes the titles of the segments.
    func customizeSegmentTitles(using styles: [TextStyle])

}

/// A protocol that describes a view that its titles of the scope buttons can be customized.
public protocol ScopeButtonTitlesCustomizable: TextStyleExpressible {

    /// Customizes the titles of the scope buttons.
    /// - Parameter styles: An array of `TextStyle` that describes the titles of the scope buttons.
    func customizeScopeButtonTitles(using styles: [TextStyle])

}

/// A protocol that describes a view that its text can be customized.
public protocol TextCustomizable: TextStyleExpressible {

    /// Customizes the text.
    /// - Parameter style: A `TextStyle` that describes the text.
    func customizeText(using style: TextStyle)

}

/// A protocol that describes a view that its title can be customized.
public protocol TitleCustomizable: TextStyleExpressible {

    /// Customizes the title.
    /// - Parameter style: A `TextStyle` that describes the title.
    func customizeTitle(using style: TextStyle)

}

extension UIBarButtonItem: TitleCustomizable {

    public func customizeTitle(using style: TextStyle) {
        title = selectedText(from: style)
    }

}

extension UITabBarItem: TitleCustomizable {

    public func customizeTitle(using style: TextStyle) {
        title = selectedText(from: style)
    }

}

extension UIButton: TitleCustomizable {

    public func customizeTitle(using style: TextStyle) {
        customizeText(using: style, through: setTitle)
    }

}

extension UISegmentedControl: SegmentTitlesCustomizable {

    public func customizeSegmentTitles(using styles: [TextStyle]) {
        for (index, style) in styles.enumerated() where index < numberOfSegments {
            setTitle(selectedText(from: style), forSegmentAt: index)
        }
    }

}

extension UITextField: TextCustomizable, PlaceholderCustomizable {

    public func customizeText(using style: TextStyle) {
        text = selectedText(from: style)
    }

    public func customizePlaceholder(using style: TextStyle) {
        placeholder = selectedText(from: style)
    }

}

extension UILabel: TextCustomizable {

    public func customizeText(using style: TextStyle) {
        text = selectedText(from: style)
    }

}

extension UITextView: TextCustomizable {

    public func customizeText(using style: TextStyle) {
        text = selectedText(from: style)
    }

}

extension UISearchBar: TextCustomizable, PlaceholderCustomizable, PromptCustomizable, ScopeButtonTitlesCustomizable {

    public func customizeText(using style: TextStyle) {
        text = selectedText(from: style)
    }

    public func customizePlaceholder(using style: TextStyle) {
        placeholder = selectedText(from: style)
    }

    public func customizePrompt(using style: TextStyle) {
        prompt = selectedText(from: style)
    }

    public func customizeScopeButtonTitles(using styles: [TextStyle]) {
        scopeButtonTitles = styles.map { selectedText(from: $0) ?? $0.normal() }
    }

}