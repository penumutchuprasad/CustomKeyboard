//
//  ResultVC.swift
//  RupeSoKeyboardV1
//
//  Created by Leela Prasad on 03/05/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {
    
    var titleLabel: UILabel!
    
    lazy var passCodeTF: UITextField = {
        
        let  tf = UITextField.init()
        tf.placeholder = "Enter Passcode"
        tf.textAlignment = .center
        tf.layer.cornerRadius = 5
        tf.layer.masksToBounds = true
        tf.backgroundColor = #colorLiteral(red: 0.9353293978, green: 0.9258805951, blue: 1, alpha: 1)
        return tf
    }()
    
    var payButton: UIButton!
    
    var originalPassCode: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayHeader()
        createUI()
    }
    
    func displayHeader() {
        
        titleLabel = UILabel.init()
        titleLabel.text = "Enter your 4 digit PIN:"
        titleLabel.backgroundColor = .black
        titleLabel.textColor = .white
        view.addSubview(titleLabel)
        
        view.addConstraintsWithFormatString(formate: "H:|[v0]|", views: titleLabel)
        view.addConstraintsWithFormatString(formate: "V:|[v0(35)]", views: titleLabel)
        
    }
    
    func createUI() {
        view.addSubview(passCodeTF)
        passCodeTF.translatesAutoresizingMaskIntoConstraints = false
        passCodeTF.backgroundColor = .red
        NSLayoutConstraint.activate([
            
            passCodeTF.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            passCodeTF.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            passCodeTF.widthAnchor.constraint(equalToConstant: 150),
            passCodeTF.heightAnchor.constraint(equalToConstant: 40)
            
            ])
        
        self.payButton = UIButton.init(type: .system)
        self.payButton.setTitle("Proceed", for: .normal)
        self.payButton.setTitleColor(.white, for: .normal)
        self.payButton.layer.cornerRadius = 5
        self.payButton.layer.masksToBounds = true
        self.payButton.backgroundColor = .black
        self.payButton.addTarget(self, action: #selector(onPay(sender:)), for: .touchUpInside)
        payButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(payButton)
        
        NSLayoutConstraint.activate([
            
            payButton.topAnchor.constraint(equalTo: passCodeTF.bottomAnchor, constant: 16),
            payButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            payButton.widthAnchor.constraint(equalToConstant: 85),
            payButton.heightAnchor.constraint(equalToConstant: 40)
            
            ])
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.post(name: .textProxyNilNotification, object: nil)
        NotificationCenter.default.post(name: .childVCInformation, object: self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleText(notf:)), name: .textProxyForContainer, object: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.passCodeTF.becomeFirstResponder()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: .textProxyNilNotification, object: nil)
        
    }
    
    var passcode = ""
    
    @objc func handleText(notf: Notification) {
        
        if let txttttt = notf.userInfo?["txt"] as? String {
            
            self.originalPassCode = txttttt
            
            passcode.removeAll()
            
            for _ in self.originalPassCode {
                
                passcode.append("*")
            }
            self.passCodeTF.text = passcode
            
        }
        
    }
    
    @objc func onPay(sender: UIButton) {
        // Write logic for Payment Validation:
        
        print("Your PassCode is: \(originalPassCode)")
        self.addViewControllerAsChildViewController(childViewController: FinalVC())
        
    }
    
    private func addViewControllerAsChildViewController(childViewController: UIViewController) {
        
        addChildViewController(childViewController)
        view.addSubview(childViewController.view)
        childViewController.view.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childViewController.didMove(toParentViewController: self)
        
    }
    
    private func removeViewControllerAsChildViewController(childViewController: UIViewController) {
        
        childViewController.willMove(toParentViewController: nil)
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParentViewController()
        
    }
    
}
