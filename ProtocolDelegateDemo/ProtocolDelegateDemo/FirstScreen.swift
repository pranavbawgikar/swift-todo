//
//  ViewController.swift
//  ProtocolDelegateDemo
//
//  Created by Pranav Bawgikar on 08/06/26.
//

import UIKit

class FirstScreen: UIViewController {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        view.backgroundColor = .systemBackground
        title = "Main"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupButton() {
        view.addSubview(button) // Equivalent of dragging and droppig a button element in Storyboard
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = .systemGreen
        button.configuration?.title = "Button"
        button.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false // This property needs to be set to false for every UI element
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func goToNextScreen() {
        let nextScreen = SecondScreen()
        nextScreen.title = "Second"
        navigationController?.pushViewController(nextScreen, animated: true)
    }
}

