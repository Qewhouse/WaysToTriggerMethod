//
//  MainViewController.swift
//  WaysToTriggerMethod
//
//  Created by Alexander Altman on 28.04.2023.
//

import UIKit

let backgroundColorNotificationKey = "key"

class SlaveViewController: UIViewController {
    
    let greenColor = Notification.Name(rawValue: backgroundColorNotificationKey)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    lazy var chooseColorButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 12
        button.setTitleColor(.yellow, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.setTitle("Choose background color", for: .normal)
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setConstraints()
        createObserver()
    }
    
    func createObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(SlaveViewController.changeBackgroundColor(notification:)), name: greenColor, object: nil)
    }
    
    @objc func changeBackgroundColor(notification: NSNotification) {
        view.backgroundColor = .green
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        let vc = MasterViewController()
        vc.modalPresentationStyle = .fullScreen
        // for delegate
        vc.delegate = self
        // for closure
        vc.completion = { [weak self] color in
            guard let self = self else { return }
            view.backgroundColor = color
        }
        self.present(vc, animated: true, completion: nil)
    }
}

extension SlaveViewController {
    private func setLayout() {
        view.addSubview(chooseColorButton)
    }
}

extension SlaveViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            chooseColorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chooseColorButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            chooseColorButton.widthAnchor.constraint(equalToConstant: view.frame.width * 2/3),
            chooseColorButton.heightAnchor.constraint(equalToConstant: view.frame.width * 1/10)
        ])
    }
}

extension SlaveViewController: ColorChangeDelegate {
    func backgroundColorChange(color: UIColor) {
        view.backgroundColor = color
    }
}

extension SlaveViewController: ColorChangeResponder {
    func changeToYellow(_sender: MasterViewController) {
        view.backgroundColor = .yellow
    }
}
