//
//  DetailPopupViewController.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/25/23.
//

import UIKit

final class DetailPopupViewController: UIViewController {
    
    weak var delegate: PopupDelegate?
    
    public var bookId: Int = 0
    
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
        archiveBook(bookId: bookId, userId: 1) {
            self.dismiss(animated: true) {
                self.delegate?.showToastMessage()
            }
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
    
    private func archiveBook(bookId: Int, userId: Int, completion: @escaping() -> Void) {
        DetailAPI.shared.archiveBook(bookId: bookId, userId: userId, completion: { (response) in
            switch response {
            case .success(let code):
                print("success", code)
                completion()
            case .requestErr(let code):
                print("requestErr", code)
                completion()
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print("serverErr")
            case .networkErr:
                print("networkErr")
            }
        })
    }
}
