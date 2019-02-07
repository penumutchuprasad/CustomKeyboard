//
//  WalletIDVC.swift
//  RupeSoKeyboardV1
//
//  Created by Leela Prasad on 03/05/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit

class WalletIDVC: UIViewController {
    
    
    var selDelegate: SelectProtocol?
    
    
    lazy var walletIdTF: UITextField = {
        
        let  tf = UITextField.init()
        tf.placeholder = "Enter Wallet ID"
        tf.textAlignment = .center
        tf.layer.cornerRadius = 5
        tf.layer.masksToBounds = true
        tf.backgroundColor = #colorLiteral(red: 0.9353293978, green: 0.9258805951, blue: 1, alpha: 1)
        return tf
    }()
    
    var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        createUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.post(name: .textProxyNilNotification, object: nil)
        NotificationCenter.default.post(name: .childVCInformation, object: self)
        NotificationCenter.default.addObserver(self, selector: #selector(handleText(notf:)), name: .textProxyForContainer, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: .textProxyNilNotification, object: nil)
        
    }
    
    @objc func handleText(notf: Notification) {
        
        if let txttttt = notf.userInfo?["txt"] as? String {
            self.walletIdTF.text = txttttt
        }
        
    }
    
    
    func createUI() {
        
        view.addSubview(walletIdTF)
        walletIdTF.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            walletIdTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
            walletIdTF.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            walletIdTF.widthAnchor.constraint(equalToConstant: 150),
            walletIdTF.heightAnchor.constraint(equalToConstant: 40)
            
            ])
        
        self.nextButton = UIButton.init(type: .system)
        self.nextButton.setTitle("Proceed", for: .normal)
        self.nextButton.setTitleColor(.white, for: .normal)
        self.nextButton.layer.cornerRadius = 5
        self.nextButton.layer.masksToBounds = true
        self.nextButton.backgroundColor = .black
        self.nextButton.addTarget(self, action: #selector(onNextAction_TouchupInside), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            
            nextButton.topAnchor.constraint(equalTo: walletIdTF.bottomAnchor, constant: 16),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            nextButton.widthAnchor.constraint(equalToConstant: 85),
            nextButton.heightAnchor.constraint(equalToConstant: 40)
            
            ])
        
        //        view.addConstraintsWithFormatString(formate: "H:[v0(75)]-8-|", views: nextButton)
        //        view.addConstraintsWithFormatString(formate: "V:[v0(45)]-8-|", views: nextButton)
    }
    
    @objc func onNextAction_TouchupInside() {
        
        selDelegate?.didSelectedOrProceeded(itemAtRow: nil, walletId: Int(walletIdTF.text ?? "3564"))
    }
    
    
}
