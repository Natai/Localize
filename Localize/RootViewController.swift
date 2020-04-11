//
//  RootViewController.swift
//
//  Created by natai on 2020/4/2.
//  
//  Copyright © 2020 bibr. All rights reserved.
//
    

import UIKit
import SnapKit

class RootViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("视图%d", comment: "第1个视图").localizedFormat(1)
        
        let versionLabelColor: UIColor
        let customColor: UIColor
        let assetColor = UIColor(named: "AssetsColor")
        if #available(iOS 13.0, *) {
            versionLabelColor = .label
            customColor = UIColor(dynamicProvider: { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(hex: 0x00ff00)
                } else {
                    return UIColor(hex: 0xff0000)
                }
            })
        } else {
            versionLabelColor = .black
            customColor = UIColor(hex: 0xff0000)
        }
        
        let label1 = UILabel()
        view.addSubview(label1)
        label1.text = NSLocalizedString("code custom color", comment: "")
        label1.textColor = customColor
        label1.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(110)
            make.centerX.equalToSuperview()
        }
        
        let label2 = UILabel()
        view.addSubview(label2)
        label2.text = NSLocalizedString("code system color", comment: "")
        label2.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(140)
            make.centerX.equalToSuperview()
        }
        
        let label3 = UILabel()
        view.addSubview(label3)
        label3.text = NSLocalizedString("code assets color", comment: "")
        label3.textColor = assetColor
        label3.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(170)
            make.centerX.equalToSuperview()
        }
        
        let label4 = UILabel()
        view.addSubview(label4)
        label4.text = NSLocalizedString("code layer cgcolor", comment: "")
        label4.layer.borderWidth = 2
        label4.layer.shadowOpacity = 1
        label4.viewBorderColor = versionLabelColor
        label4.viewShadowColor = assetColor
        label4.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(200)
            make.centerX.equalToSuperview()
        }
        
        let imageView = UIImageView()
        view.addSubview(imageView)
        imageView.image = UIImage(named: "assets_img_invest")
        imageView.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        let label6 = UILabel()
        view.addSubview(label6)
        label6.text = NSLocalizedString("code darkMode assets", comment: "")
        label6.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(10)
            make.centerX.equalToSuperview()
        }
    }
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        if #available(iOS 13.0, *) {
//            /*
//             https://developer.apple.com/documentation/xcode/supporting_dark_mode_in_your_interface?language=objc
//             可以在上面链接提到的几个方法中设置 cgColor，并且必须 resolvedColor
//             */
//            label4.layer.borderColor = UIColor.label.resolvedColor(with: traitCollection).cgColor
//        }
//    }
    
    @IBAction func pushFirst(_ sender: Any) {
        let controller = FirstViewController()
        show(controller, sender: nil)
    }
}
