//
//  FinalVC.swift
//  RupeSoKeyboardV1
//
//  Created by Leela Prasad on 03/05/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit

class FinalVC: UIViewController {
    
    var titleLabel: UILabel!
    var resultLabel: UILabel!
    var okButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        displayHeader()
        createUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.post(name: .textProxyNilNotification, object: nil)
        NotificationCenter.default.post(name: .childVCInformation, object: self)
        
    }
    
    
    func displayHeader() {
        
        titleLabel = UILabel.init()
        titleLabel.text = "Payment Status:"
        titleLabel.backgroundColor = .black
        titleLabel.textColor = .white
        view.addSubview(titleLabel)
        
        view.addConstraintsWithFormatString(formate: "H:|[v0]|", views: titleLabel)
        view.addConstraintsWithFormatString(formate: "V:|[v0(35)]", views: titleLabel)
        
    }
    
    
    func createUI() {
        
        self.resultLabel = UILabel.init()
        resultLabel.text = "Successfully Sent!"
        view.addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            resultLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            resultLabel.widthAnchor.constraint(equalToConstant: 150),
            resultLabel.heightAnchor.constraint(equalToConstant: 40)
            
            ])
        
        self.okButton = UIButton.init(type: .system)
        self.okButton.setTitle("OKay", for: .normal)
        self.okButton.setTitleColor(.white, for: .normal)
        self.okButton.layer.cornerRadius = 5
        self.okButton.layer.masksToBounds = true
        self.okButton.backgroundColor = .black
        self.okButton.addTarget(self, action: #selector(onOkayPressed(sender:)), for: .touchUpInside)
        okButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(okButton)
        
        NSLayoutConstraint.activate([
            
            okButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 16),
            okButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            okButton.widthAnchor.constraint(equalToConstant: 85),
            okButton.heightAnchor.constraint(equalToConstant: 40)
            
            ])
    }
    
    @objc func onOkayPressed(sender: UIButton) {
        
        NotificationCenter.default.post(name: .containerShowAndHideNotification, object: nil)
        
        
    }
    
    
    
    
}
