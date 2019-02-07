//
//  ProcessVC.swift
//  RupeSoKeyboardV1
//
//  Created by Leela Prasad on 03/05/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit

class ProcessVC: UIViewController {
    
    var nextButton: UIButton!
    var titleLabel: UILabel!
    lazy var amountTF: UITextField = {
        
        let  tf = UITextField.init()
        tf.placeholder = "Enter Amount"
        tf.textAlignment = .center
        tf.layer.cornerRadius = 5
        tf.layer.masksToBounds = true
        tf.backgroundColor = #colorLiteral(red: 0.9353293978, green: 0.9258805951, blue: 1, alpha: 1)
        return tf
    }()
    
    var vc2: ResultVC!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayHeader()
        createUI()
    }
    
    func createUI() {
        view.addSubview(amountTF)
        amountTF.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            amountTF.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            amountTF.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            amountTF.widthAnchor.constraint(equalToConstant: 150),
            amountTF.heightAnchor.constraint(equalToConstant: 40)
            
            ])
        
        self.nextButton = UIButton.init(type: .system)
        self.nextButton.setTitle("Proceed", for: .normal)
        self.nextButton.setTitleColor(.white, for: .normal)
        self.nextButton.layer.cornerRadius = 5
        self.nextButton.layer.masksToBounds = true
        self.nextButton.backgroundColor = .black
        self.nextButton.addTarget(self, action: #selector(onNext(sender:)), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            
            nextButton.topAnchor.constraint(equalTo: amountTF.bottomAnchor, constant: 16),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            nextButton.widthAnchor.constraint(equalToConstant: 85),
            nextButton.heightAnchor.constraint(equalToConstant: 40)
            
            ])
    }
    
    
    func displayHeader() {
        
        titleLabel = UILabel.init()
        titleLabel.text = "Enter Amount To Send"
        titleLabel.backgroundColor = .black
        titleLabel.textColor = .white
        view.addSubview(titleLabel)
        
        view.addConstraintsWithFormatString(formate: "H:|[v0]|", views: titleLabel)
        view.addConstraintsWithFormatString(formate: "V:|[v0(35)]", views: titleLabel)
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Make Text nil, as it is appeaaring first time...
        vc2 = ResultVC()
        
        NotificationCenter.default.post(name: .textProxyNilNotification, object: nil)
        NotificationCenter.default.post(name: .childVCInformation, object: self)
        //self.view.backgroundColor = #colorLiteral(red: 1, green: 0.8980991223, blue: 0.8880640628, alpha: 1)
        NotificationCenter.default.addObserver(self, selector: #selector(handleText(notf:)), name: .textProxyForContainer, object: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.amountTF.becomeFirstResponder()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: .textProxyNilNotification, object: nil)
        self.removeViewControllerAsChildViewController(childViewController: vc2)
        
    }
    
    
    
    
    @objc func handleText(notf: Notification) {
        
        if let txttttt = notf.userInfo?["txt"] as? String {
            self.amountTF.text = txttttt
        }
        
    }
    
    
    @objc func onNext(sender: UIButton) {
        
        //self.view.addSubview(vc2.view)
        self.addViewControllerAsChildViewController(childViewController: vc2)
        
    }
    
    private func addViewControllerAsChildViewController(childViewController: UIViewController) {
        
        addChild(childViewController)
        view.addSubview(childViewController.view)
        childViewController.view.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childViewController.didMove(toParent: self)
        
    }
    
    private func removeViewControllerAsChildViewController(childViewController: UIViewController) {
        
        childViewController.willMove(toParent: nil)
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParent()
        
    }
    
    
}
