//
//  GHUserDetailPresenter.swift
//  MVPPractice
//
//  Created by Vanessa Flores on 8/23/22.
//

import Foundation
import UIKit

protocol GHUserDetailPresenterDelegate: AnyObject {}

class GHUserDetailPresenter {
    typealias PresenterDelegate = GHUserDetailPresenterDelegate & UIViewController
    
    weak var delegate: PresenterDelegate?
    
    init(with delegate: PresenterDelegate) {
        self.delegate = delegate
    }
}
