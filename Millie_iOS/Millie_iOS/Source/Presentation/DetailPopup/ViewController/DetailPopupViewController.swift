//
//  DetailPopupViewController.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/25/23.
//

import UIKit

final class DetailPopupViewController: UIViewController {
    
    private let rootView = DetailPopupView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupStyle()
    }
    
    private func setupStyle() {
        view.backgroundColor = .black.withAlphaComponent(0.4)
    }
}
