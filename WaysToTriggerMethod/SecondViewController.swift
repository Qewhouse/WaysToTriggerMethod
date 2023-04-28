//
//  SecondViewController.swift
//  WaysToTriggerMethod
//
//  Created by Alexander Altman on 28.04.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setConstraints()
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 12
        button.setTitleColor(.yellow, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.setTitle("Назад", for: .normal)
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    
    func backgroundChange1() {
        view.backgroundColor = .blue
    }
    
    func backgroundChange2() {
        view.backgroundColor = .yellow
    }
    
    func backgroundChange3() {
        view.backgroundColor = .brown
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SecondViewController {
    private func setLayout() {
        view.addSubview(backButton)
    }
}

extension SecondViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: view.frame.width * 2/3),
            backButton.heightAnchor.constraint(equalToConstant: view.frame.width * 1/10)
        ])
    }
}
