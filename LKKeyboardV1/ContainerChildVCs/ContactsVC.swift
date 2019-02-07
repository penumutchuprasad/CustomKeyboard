//
//  ContactsVC.swift
//  RupeSoKeyboardV1
//
//  Created by Leela Prasad on 03/05/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit

class ContactsVC: UIViewController {
    
    var contactsArray = ["Prasad","Praveen","Ram","NTR","NBK","Gowtham"]
    let cellId = "cellId"
    
    var selDelegate: SelectProtocol?
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func createTableView() {
        
        self.view.addSubview(tableView)
        self.view.addConstraintsWithFormatString(formate: "H:|[v0]|", views: tableView)
        self.view.addConstraintsWithFormatString(formate: "V:|[v0]|", views: tableView)
    }
    
}

extension ContactsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contactsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = contactsArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selDelegate?.didSelectedOrProceeded(itemAtRow: indexPath.row, walletId: nil)
        
    }
    
}
