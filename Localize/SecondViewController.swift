//
//  SecondViewController.swift
//
//  Created by natai on 2020/4/3.
//  
//  Copyright © 2020 bibr. All rights reserved.
//
    

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView = UITableView()
    lazy var languages = Localize.availableLanguages()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.tableFooterView = UIView()
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")!
        cell.textLabel?.text = Localize.displayNameForLanguage(languages[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let language = languages[indexPath.row]
        Localize.setCurrentLanguage(language)
    }
}
