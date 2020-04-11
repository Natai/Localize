//
//  FirstViewController.swift
//
//  Created by natai on 2020/4/2.
//  
//  Copyright © 2020 bibr. All rights reserved.
//
    

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("视图%d", comment: "第2个视图").localizedFormat(2)
        
        let rightTitle = NSLocalizedString("语言", comment: "语言设置")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: rightTitle, style: .plain, target: self, action: #selector(rightItemTapped))

        /*
         需要国际化的图片必须使用在 Bundle.localized 中使用 contentsOfFile 调用,
         UIImage(named: <#T##String#>) 方法系统自带缓存，切换语言时没有 api 可以删除，所以无法切换图片资源
        */
        guard let path = Bundle.localized.path(forResource: "setting_img_card_back", ofType: "png") else {
            return
        }
        let bundleImageView = UIImageView()
        view.addSubview(bundleImageView)
        bundleImageView.image = UIImage(contentsOfFile: path)
        bundleImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(400)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(100)
        }
        
        let label = UILabel()
        view.addSubview(label)
        label.text = NSLocalizedString("bundle图片的国际化", comment: "")
        label.snp.makeConstraints { (make) in
            make.top.equalTo(bundleImageView.snp.bottom).offset(20)
            make.centerX.equalTo(bundleImageView)
        }
    }
    
    @objc private func rightItemTapped() {
        let controller = SecondViewController()
        show(controller, sender: nil)
    }
}
