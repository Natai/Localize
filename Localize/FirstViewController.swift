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
        
        let contenImageView = UIImageView(frame: CGRect(x: 0, y: 500, width: 150, height: 100))
        contenImageView.center.x = view.center.x
        contenImageView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin]
        /*
         需要国际化的图片必须使用在 Bundle.localized 中使用 contentsOfFile 调用,
         UIImage(named: <#T##String#>) 方法系统自带缓存，切换语言时没有 api 可以删除，所以无法切换图片资源
        */
        if let path = Bundle.localized.path(forResource: "setting_img_card_back", ofType: "png") {
            contenImageView.image = UIImage(contentsOfFile: path)
            view.addSubview(contenImageView)
        }
    }
    
    @objc private func rightItemTapped() {
        let controller = SecondViewController()
        show(controller, sender: nil)
    }
}
