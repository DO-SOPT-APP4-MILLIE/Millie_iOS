//
//  DetailPopupViewController.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/25/23.
//

import UIKit

final class DetailPopupViewController: UIViewController {
    
    weak var delegate: PopupDelegate?
    
    private let rootView = DetailPopupView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()

        setupStyle()
    }
    
    private func target() {
        rootView.addButton.addTarget(self,
                             action: #selector(addButtonDidTap),
                             for: .touchUpInside)
        
        let myFavoriteViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.myFavoriteViewDidTap))
        rootView.myFavoriteView.addGestureRecognizer(myFavoriteViewTapGesture)
    }
    
    private func setupStyle() {
        view.backgroundColor = .black.withAlphaComponent(0.4)
    }
    
    @objc func addButtonDidTap() {
        self.dismiss(animated: true) {
            self.delegate?.showToastMessage()
        }
    }
    
    @objc func myFavoriteViewDidTap() {
        if rootView.myFavoriteView.isSelected {
            rootView.myFavoriteView.selectedView.layer.borderColor = UIColor.lightGrey03.cgColor
            rootView.myFavoriteView.selectedView.layer.borderWidth = 1.8
            rootView.myFavoriteView.isSelected = false
        } else {
            rootView.myFavoriteView.selectedView.layer.borderColor = UIColor.darkGrey03.cgColor
            rootView.myFavoriteView.selectedView.layer.borderWidth = 4
            rootView.myFavoriteView.isSelected = true
        }
    }
}
