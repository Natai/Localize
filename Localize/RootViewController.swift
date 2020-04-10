//
//  RootViewController.swift
//
//  Created by natai on 2020/4/2.
//  
//  Copyright © 2020 bibr. All rights reserved.
//
    

import UIKit
import SnapKit

class BaseLabel: UILabel {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        print(1111)
    }
}

class RootViewController: UIViewController {
    
    let label4 = BaseLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("根视图", comment: "根视图")
        
        let label1 = UILabel()
        view.addSubview(label1)
        label1.text = NSLocalizedString("code system color", comment: "")
        label1.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(80)
            make.centerX.equalToSuperview()
        }
        
        let label2 = UILabel()
        view.addSubview(label2)
        label2.text = NSLocalizedString("code custom color", comment: "")
        label2.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(110)
            make.centerX.equalToSuperview()
        }
        if #available(iOS 13.0, *) {
            label2.textColor = UIColor(dynamicProvider: { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(hex: 0x666666)
                } else {
                    return UIColor(hex: 0x444444)
                }
            })
        } else {
            label2.textColor = UIColor(hex: 0x333333)
        }
        
        let label3 = UILabel()
        view.addSubview(label3)
        label3.text = NSLocalizedString("code assets color", comment: "")
        label3.textColor = UIColor(named: "AssetColor")
        label3.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(140)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(label4)
        label4.text = NSLocalizedString("layer cgcolor", comment: "")
        label4.layer.borderWidth = 2
        if #available(iOS 13.0, *) {
            label4.layer.borderColor = UIColor.label.resolvedColor(with: traitCollection).cgColor
        } else {
            // Fallback on earlier versions
        }
        label4.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(170)
            make.centerX.equalToSuperview()
        }
        
        let imageView = UIImageView()
        view.addSubview(imageView)
        imageView.image = UIImage(named: "assets_img_invest")
        imageView.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if #available(iOS 13.0, *) {
            /*
             https://developer.apple.com/documentation/xcode/supporting_dark_mode_in_your_interface?language=objc
             可以在上面链接提到的几个方法中设置 cgColor，并且必须 resolvedColor
             */
            label4.layer.borderColor = UIColor.label.resolvedColor(with: traitCollection).cgColor
        }
    }
    
    @IBAction func pushFirst(_ sender: Any) {
        let controller = FirstViewController()
        show(controller, sender: nil)
    }
}
