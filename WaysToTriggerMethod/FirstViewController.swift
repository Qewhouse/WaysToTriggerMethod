//
//  FirstViewController.swift
//  WaysToTriggerMethod
//
//  Created by Alexander Altman on 28.04.2023.
//

import UIKit

class FirstViewController: UIViewController {

    private let buttonsStack: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var backButton1: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 12
        button.setTitleColor(.yellow, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.setTitle("Delegate", for: .normal)
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToSecondVC1), for: .touchUpInside)
        return button
    }()
    
    lazy var backButton2: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 12
        button.setTitleColor(.yellow, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.setTitle("Notification", for: .normal)
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var backButton3: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 12
        button.setTitleColor(.yellow, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.setTitle("Назад", for: .normal)
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setConstraints()
    }


    
    
    
    @objc private func goToSecondVC1() {
        print("Rules")
        let vc = SecondViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func goToSecondVC2() {
        print("Rules")
        let vc = SecondViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func goToSecondVC3() {
        print("Rules")
        let vc = SecondViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension FirstViewController {
    private func setLayout() {
        view.backgroundColor = .cyan
        view.addSubview(buttonsStack)
        buttonsStack.addArrangedSubview(backButton1)
        buttonsStack.addArrangedSubview(backButton2)
        buttonsStack.addArrangedSubview(backButton3)
    }
}

extension FirstViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            buttonsStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStack.widthAnchor.constraint(equalToConstant: view.frame.width * 2/3)
        
        
        
        
        ])
    }
}

