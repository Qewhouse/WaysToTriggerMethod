//
//  FirstViewController.swift
//  WaysToTriggerMethod
//
//  Created by Alexander Altman on 28.04.2023.
//

import UIKit

protocol ColorChangeDelegate: AnyObject {
    func backgroundColorChange(color: UIColor)
}

@objc protocol ColorChangeResponder: AnyObject {
    func changeToYellow(_sender: MasterViewController)
}

class MasterViewController: UIViewController {
    
    weak var delegate: ColorChangeDelegate?
    
    var completion: ((UIColor?) -> ())?
    
    private let buttonsStack: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 12
        button.setTitleColor(.yellow, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.setTitle("Blue Delegate", for: .normal)
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goBackWithDelegate), for: .touchUpInside)
        return button
    }()
    
    lazy var backButton1: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 12
        button.setTitleColor(.yellow, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.setTitle("Green Notification", for: .normal)
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goBackWithNotification), for: .touchUpInside)
        return button
    }()
    
    lazy var backButton2: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 12
        button.setTitleColor(.yellow, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.setTitle("Yellow Responder Chain", for: .normal)
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(goBackWithResponder), for: .touchUpInside)
        return button
    }()
    
    lazy var backButton3: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 12
        button.setTitleColor(.yellow, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.setTitle("Red Closure", for: .normal)
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goBackWithClosure), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setConstraints()
    }
    
    @objc func goBackWithDelegate() {
        delegate?.backgroundColorChange(color: .blue)
        dismiss(animated: true)
    }
    
    @objc func goBackWithNotification() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: backgroundColorNotificationKey), object: nil)
        dismiss(animated: true)
    }
    
    @objc func goBackWithResponder(_sender: UIButton) {
        UIApplication.shared.sendAction(#selector(ColorChangeResponder.changeToYellow(_sender:)), to: nil, from: self, for: nil)
        dismiss(animated: true)
    }
    
    @objc func goBackWithClosure(_sender: UIButton) {
        completion?(.red)
        dismiss(animated: true)
    }
    
}

extension MasterViewController {
    private func setLayout() {
        view.backgroundColor = .cyan
        view.addSubview(buttonsStack)
        buttonsStack.addArrangedSubview(backButton)
        buttonsStack.addArrangedSubview(backButton1)
        buttonsStack.addArrangedSubview(backButton2)
        buttonsStack.addArrangedSubview(backButton3)
    }
}

extension MasterViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            buttonsStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStack.widthAnchor.constraint(equalToConstant: view.frame.width * 2/3)
        ])
    }
}
