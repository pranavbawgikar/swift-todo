//
//  ViewController.swift
//  Demo1
//
//  Created by Pranav Bawgikar on 12/06/26.
//

import UIKit

class ViewController: UIViewController {
    
    let secondChildVC = SecondChildVC()
    
    enum Segues {
        static let toFirstChild = "ToFirstChild" // Should match the segue ID in Storyboard
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addSecondChildVC()
    }
    
    func addSecondChildVC() {
        addChild(secondChildVC) // Step 1: Notify the parent
        view.addSubview(secondChildVC.view) // Step 2: Add child's view to the hierarchy
        secondChildVC.view.backgroundColor = .darkGray
        secondChildVC.didMove(toParent: self) // Step 3: Notify the child it was moved
        setSecondChildVCConstraints()
    }
    
    func setSecondChildVCConstraints() {
        secondChildVC.view.translatesAutoresizingMaskIntoConstraints = false // Required whenever manual constraints are applied
        secondChildVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        secondChildVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        secondChildVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        secondChildVC.view.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.toFirstChild {
            let destinationVC = segue.destination as! FirstChildVC
            destinationVC.view.backgroundColor = .blue
        }
    }
}

