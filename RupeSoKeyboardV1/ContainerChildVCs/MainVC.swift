//
//  MainVC.swift
//  RupeSoKeyboardV1
//
//  Created by Leela Prasad on 03/05/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit

protocol SelectProtocol {
    
    func didSelectedOrProceeded(itemAtRow: Int?, walletId: Int?)
}



class MainVC: UIViewController {
    
    
    
    
    lazy var segmntedContrl: UISegmentedControl = {
        let sgContrl = UISegmentedControl.init(items: ["Contacts","Wallet IDs"])
        sgContrl.tintColor = .black
        sgContrl.backgroundColor = #colorLiteral(red: 0.9069530312, green: 1, blue: 0.8290516931, alpha: 1)
        sgContrl.selectedSegmentIndex = 0
        return sgContrl
    }()
    
    lazy var childVCsArray: [UIViewController] = {
        
        let contactsVC = ContactsVC()
        let walletIdVC = WalletIDVC()
        contactsVC.selDelegate = self
        walletIdVC.selDelegate = self
        return [contactsVC,walletIdVC]
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createSegmentedControl()
        self.addViewControllerAsChildViewControllerrrr(childViewController: childVCsArray.first!)
        self.removeViewControllerAsChildViewControllerrrr(childViewController: childVCsArray.last!)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        self.removeViewControllerAsChildViewControllerrrr(childViewController: self)

    }
    
    
    
    func createSegmentedControl() {
        self.segmntedContrl.addTarget(self, action: #selector(onChangeOfSegments(segmntedControl:)), for: .valueChanged)
        self.view.addSubview(segmntedContrl)
        self.view.addConstraintsWithFormatString(formate: "H:|[v0]|", views: segmntedContrl)
        self.view.addConstraintsWithFormatString(formate: "V:|[v0(35)]", views: segmntedContrl)
    }
    
    @objc func onChangeOfSegments(segmntedControl: UISegmentedControl) {
        
        switch segmntedControl.selectedSegmentIndex {
        case 0:
            self.addViewControllerAsChildViewControllerrrr(childViewController: childVCsArray.first!)
            self.removeViewControllerAsChildViewControllerrrr(childViewController: childVCsArray.last!)
        default:
            self.addViewControllerAsChildViewControllerrrr(childViewController: childVCsArray.last!)
            self.removeViewControllerAsChildViewControllerrrr(childViewController: childVCsArray.first!)
        }
        
    }
    
    
    
    private func addViewControllerAsChildViewControllerrrr(childViewController: UIViewController) {
        
        addChildViewController(childViewController)
        view.addSubview(childViewController.view)
        childViewController.view.frame = CGRect.init(x: 0, y: 35, width: self.view.frame.width, height: self.view.frame.height-35)
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childViewController.didMove(toParentViewController: self)
        
    }
    
    private func removeViewControllerAsChildViewControllerrrr(childViewController: UIViewController) {
        
        childViewController.willMove(toParentViewController: nil)
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParentViewController()
        
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

extension MainVC: SelectProtocol {
    
    
    func didSelectedOrProceeded(itemAtRow: Int?, walletId: Int?) {
        
        for vc in childVCsArray {
            self.removeViewControllerAsChildViewControllerrrr(childViewController: vc)
        }
        
        if itemAtRow != nil {
            // On contact selection...
            
            
        } else {
            // on Wallet Id...
            
            
        }
        
        let vc1 = ProcessVC()
        self.view.addSubview(vc1.view)
        self.addViewControllerAsChildViewController(childViewController: vc1)
        
    }
    
    
}
