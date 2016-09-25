//
//  BetterSegmentedControlSegment.swift
//  Pods
//
//  Created by George Marmaridis on 25/09/2016.
//
//

import Foundation

public protocol BetterSegmentedControlSegment {
    var normalView: UIView { get }
    var selectedView: UIView { get }
}

@IBDesignable open class BetterSegmentedControlLabelSegment: UILabel {
    private struct DefaultValues {
        static let normalBackgroundColor: UIColor = .black
        static let normalFont: UIFont = UILabel().font
        static let normalTextColor: UIColor = .white
        static let selectedBackgroundColor: UIColor = .white
        static let selectedFont: UIFont = UILabel().font
        static let selectedTextColor: UIColor = .black
    }
    
    public var normalBackgroundColor: UIColor
    public var normalFont: UIFont
    public var normalTextColor: UIColor
    public var selectedBackgroundColor: UIColor
    public var selectedFont: UIFont
    public var selectedTextColor: UIColor
    
    convenience init() {
        self.init(normalBackgroundColor: DefaultValues.normalBackgroundColor,
        normalFont: DefaultValues.normalFont,
        normalTextColor: DefaultValues.normalTextColor,
        selectedBackgroundColor: DefaultValues.selectedBackgroundColor,
        selectedFont: DefaultValues.selectedFont,
        selectedTextColor: DefaultValues.selectedTextColor)
    }
    
    init(normalBackgroundColor: UIColor,
         normalFont: UIFont,
         normalTextColor: UIColor,
         selectedBackgroundColor: UIColor,
         selectedFont: UIFont,
         selectedTextColor: UIColor) {
        self.normalBackgroundColor = normalBackgroundColor
        self.normalFont = normalFont
        self.normalTextColor = normalTextColor
        self.selectedBackgroundColor = selectedBackgroundColor
        self.selectedFont = selectedFont
        self.selectedTextColor = selectedTextColor
        super.init(frame: CGRect.zero)
        completeInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.normalBackgroundColor = DefaultValues.normalBackgroundColor
        self.normalFont = DefaultValues.normalFont
        self.normalTextColor = DefaultValues.normalTextColor
        self.selectedBackgroundColor = DefaultValues.selectedBackgroundColor
        self.selectedFont = DefaultValues.selectedFont
        self.selectedTextColor = DefaultValues.selectedTextColor
        super.init(coder: aDecoder)
        completeInit()
    }
    
    convenience override public init(frame: CGRect) {
        self.init(normalBackgroundColor: DefaultValues.normalBackgroundColor,
        normalFont: DefaultValues.normalFont,
        normalTextColor: DefaultValues.normalTextColor,
        selectedBackgroundColor: DefaultValues.selectedBackgroundColor,
        selectedFont: DefaultValues.selectedFont,
        selectedTextColor: DefaultValues.selectedTextColor)
    }
    
    private func completeInit() {
        textColor = normalBackgroundColor
        font = normalFont
        lineBreakMode = .byTruncatingTail
        textAlignment = .center
    }
}

// MARK:- BetterSegmentedControlSegment
extension BetterSegmentedControlLabelSegment: BetterSegmentedControlSegment {
    public var normalView: UIView {
        backgroundColor = normalBackgroundColor
        font = normalFont
        textColor = normalTextColor
        return self
    }
    
    public var selectedView: UIView {
        backgroundColor = selectedBackgroundColor
        font = selectedFont
        textColor = selectedTextColor
        return self
    }
}
