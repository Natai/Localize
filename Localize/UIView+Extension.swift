//
//  UIView+Extension.swift
//
//  Created by natai on 2020/4/9.
//  
//  Copyright © 2020 bibr. All rights reserved.
//
    

import UIKit

private var interfaceCallbacksKey = "interfaceCallbacksKey"

extension UIView {
    typealias InterfaceCallback = () -> Void
    
    static func swizzlingInterfaceCallback() {
        _ = self.swizzleMethod
    }
    
    @objc func bibr_traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        bibr_traitCollectionDidChange(previousTraitCollection)
        if #available(iOS 12.0, *) {
            if  previousTraitCollection?.userInterfaceStyle == traitCollection.userInterfaceStyle {
                return
            }
            // 对一个视图来说，只有当它有子视图时，traitCollectionDidChange 方法才会被系统调用。所以此处写法不会消耗多少性能
            subviews.forEach { (subview) in
                subview.interfaceCallbacks?.forEach { (item) in
                    guard let callback = item as? InterfaceCallback else { return }
                    callback()
                }
            }
        }
    }
    
    private static let swizzleMethod: Void = {
        if #available(iOS 13.0, *) {
            let original = #selector(traitCollectionDidChange(_:))
            let swizzled = #selector(bibr_traitCollectionDidChange(_:))
            swizzlingForClass(UIView.self, originalSelector: original, swizzledSelector: swizzled)
        }
    }()
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var viewBorderColor: UIColor? {
        get {
            if let borderColor = layer.borderColor {
                return UIColor(cgColor: borderColor)
            }
            return nil
        }
        set {
            if #available(iOS 13.0, *) {
                layer.borderColor = newValue?.resolvedColor(with: traitCollection).cgColor
                addInterfaceStyleChangedCallback { [unowned self] in
                    self.layer.borderColor = newValue?.resolvedColor(with: self.traitCollection).cgColor
                }
            } else {
                layer.borderColor = newValue?.cgColor
            }
        }
    }
    
    @IBInspectable var viewShadowColor: UIColor? {
        get {
            if let shadowColor = layer.shadowColor {
                return UIColor(cgColor: shadowColor)
            }
            return nil
        }
        set {
            if #available(iOS 13.0, *) {
                layer.shadowColor = newValue?.resolvedColor(with: traitCollection).cgColor
                addInterfaceStyleChangedCallback { [unowned self] in
                    self.layer.shadowColor = newValue?.resolvedColor(with: self.traitCollection).cgColor
                }
            } else {
                layer.shadowColor = newValue?.cgColor
            }
        }
    }
    
    private var interfaceCallbacks: NSMutableArray? {
        get {
            return objc_getAssociatedObject(self, &interfaceCallbacksKey) as? NSMutableArray
        }
        set {
            objc_setAssociatedObject(self, &interfaceCallbacksKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    

    func addInterfaceStyleChangedCallback(_ callback: @escaping InterfaceCallback) {
        if interfaceCallbacks == nil {
            interfaceCallbacks = NSMutableArray()
        }
        interfaceCallbacks?.add(callback)
    }
}
