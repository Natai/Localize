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
        title = NSLocalizedString("排行%d视图", comment: "第几个视图").localizedFormat(1)
        
        let rightTitle = NSLocalizedString("语言", comment: "语言设置")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: rightTitle, style: .plain, target: self, action: #selector(rightItemTapped))

        /*
         需要国际化的图片必须使用在 Bundle.localized 中使用 contentsOfFile 调用,
         UIImage(named: <#T##String#>) 方法系统自带缓存，切换语言时没有 api 可以删除，所以无法切换图片资源
        */
        if let path = Bundle.localized.path(forResource: "setting_img_card_back", ofType: "png") {
            let contenImageView = UIImageView()
            view.addSubview(contenImageView)
            contenImageView.image = UIImage(contentsOfFile: path)
            contenImageView.snp.makeConstraints { (make) in
                make.top.equalToSuperview().inset(400)
                make.centerX.equalToSuperview()
                make.width.equalTo(150)
                make.height.equalTo(100)
            }
        }
    }
    
    @objc private func rightItemTapped() {
        let controller = SecondViewController()
        show(controller, sender: nil)
    }
}
