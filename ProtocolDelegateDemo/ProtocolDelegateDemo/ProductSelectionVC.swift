//
//  ProductSelectionVC.swift
//  ProtocolDelegateDemo
//
//  Created by Pranav Bawgikar on 08/06/26.
//
import UIKit

protocol ProtocolSelectionDelegate {
    func didSelectProduct(name: String, imageName: String)
}

class ProductSelectionVC: UIViewController {
    let iPhoneButton = UIButton()
    let iPadButton = UIButton()
    let macBookButton = UIButton()
    
    var delegate: ProtocolSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    @objc func iPhoneButtonTapped() {
        delegate?.didSelectProduct(name: "iPhone 17", imageName: "iphone")
        dismiss(animated: true)
    }
    
    @objc func iPadButtonTapped() {
        delegate?.didSelectProduct(name: "iPad Air", imageName: "ipad")
        dismiss(animated: true)
    }
    
    @objc func macBookButtonTapped() {
        delegate?.didSelectProduct(name: "MacBook Pro", imageName: "mac")
        dismiss(animated: true)
    }
    
    func setupUI() {
        view.addSubview(iPhoneButton)
        view.addSubview(iPadButton)
        view.addSubview(macBookButton)
        
        iPhoneButton.translatesAutoresizingMaskIntoConstraints = false
        iPadButton.translatesAutoresizingMaskIntoConstraints = false
        macBookButton.translatesAutoresizingMaskIntoConstraints = false
        
        iPhoneButton.configuration = .tinted()
        iPhoneButton.configuration?.title = "iPhone"
        iPhoneButton.configuration?.image = UIImage(systemName: "iphone")
        iPhoneButton.configuration?.imagePadding = 8
        iPhoneButton.configuration?.baseBackgroundColor = .systemBlue
        iPhoneButton.configuration?.baseForegroundColor = .systemBlue
        iPhoneButton.addTarget(self, action: #selector(iPhoneButtonTapped), for: .touchUpInside)
        
        iPadButton.configuration = .tinted()
        iPadButton.configuration?.title = "iPad"
        iPadButton.configuration?.image = UIImage(systemName: "ipad")
        iPadButton.configuration?.imagePadding = 8
        iPadButton.configuration?.baseBackgroundColor = .systemTeal
        iPadButton.configuration?.baseForegroundColor = .systemTeal
        iPadButton.addTarget(self, action: #selector(iPadButtonTapped), for: .touchUpInside)
        
        macBookButton.configuration = .tinted()
        macBookButton.configuration?.title = "MacBook Pro"
        macBookButton.configuration?.image = UIImage(systemName: "laptopcomputer")
        macBookButton.configuration?.imagePadding = 8
        macBookButton.configuration?.baseBackgroundColor = .systemIndigo
        macBookButton.configuration?.baseForegroundColor = .systemIndigo
        macBookButton.addTarget(self, action: #selector(macBookButtonTapped), for: .touchUpInside)
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            iPadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iPadButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            iPadButton.heightAnchor.constraint(equalToConstant: 50),
            iPadButton.widthAnchor.constraint(equalToConstant: 280),
            
            iPhoneButton.bottomAnchor.constraint(equalTo: iPadButton.topAnchor, constant: -padding),
            iPhoneButton.heightAnchor.constraint(equalToConstant: 50),
            iPhoneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iPhoneButton.widthAnchor.constraint(equalToConstant: 280),
            
            macBookButton.topAnchor.constraint(equalTo: iPadButton.bottomAnchor, constant: padding),
            macBookButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            macBookButton.heightAnchor.constraint(equalToConstant: 50),
            macBookButton.widthAnchor.constraint(equalToConstant: 280),
        ])
    }
}
