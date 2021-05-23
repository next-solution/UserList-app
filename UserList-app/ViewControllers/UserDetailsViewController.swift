//
//  UserDetailsViewController.swift
//  UserList-app
//
//  Created by Marcin Makurat on 22/05/2021.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    private let viewModel: UserViewModel
    
    private let stackView = StackView()
    private let avatarImageView = ImageView()
    private let usernameLabel = LabelWithTextCentered()
    private let endpointLabel = LabelWithTextCentered()
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        endpointLabel.textColor = .darkGray
        
        fillData()
        setupLayout()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        setStackViewAxis()
    }
    
    private func fillData() {
        avatarImageView.image = viewModel.avatarImage.value
        usernameLabel.text = viewModel.name
        endpointLabel.text = viewModel.endpoint
    }
    
    private func setupLayout () {
        setStackViewAxis()
        
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(avatarImageView)
        stackView.addArrangedSubview(usernameLabel)
        stackView.addArrangedSubview(endpointLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    private func setStackViewAxis() {
        if UIDevice.current.orientation.isLandscape {
            stackView.axis = .horizontal
        } else {
            stackView.axis = .vertical
        }
    }
}
