//
//  GHUserDetailViewController.swift
//  MVPPractice
//
//  Created by Vanessa Flores on 8/23/22.
//

import UIKit

class GHUserDetailViewController: UIViewController {
    
    private var presenter: GHUserDetailPresenter?
    private var user: GHUser
    
    init(with user: GHUser) {
        self.user = user
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = user.username
        
        configurePresenter()
    }

    private func configurePresenter() {
        presenter = GHUserDetailPresenter(with: self)
    }

}

extension GHUserDetailViewController: GHUserDetailPresenterDelegate {}
