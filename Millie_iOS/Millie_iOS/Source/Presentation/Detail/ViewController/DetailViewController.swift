//
//  DetailViewController.swift
//  Millie_iOS
//
//  Created by 변상우 on 11/20/23.
//

import UIKit

import SnapKit

protocol PopupDelegate: AnyObject {
    func showToastMessage()
}

class DetailViewController: UIViewController {
    
    private let rootView = DetailView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        rootView.detailBookDescriptionView.bookInfoDividerView.layer.addBorder([.right, .left], color: .lightGrey04, width: 1)
        
        rootView.detailBottomView.layer.addBorder([.top], color: .lightGrey05, width: 1)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
        
        setupNavigtion()
        setupStyle()
    }
    
    private func target() {
        rootView.detailBottomView.saveButton.addTarget(self,
                                                       action: #selector(saveButtonTap),
                                                       for: .touchUpInside)
        
        rootView.detailBottomView.readButton.addTarget(self,
                                                       action: #selector(readButtonTap),
                                                       for: .touchUpInside)
        
        rootView.detailToastMessageView.goToMyLibraryButton.addTarget(self,
                                                                      action: #selector(goToMyLibraryButtonTap), for: .touchUpInside)
    }
    
    private func setupNavigtion() {
        let leftBackButton = UIBarButtonItem(image: UIImage(named: "ic_arrow_left_line"), style: .plain, target: self, action: #selector(leftBackButtonTap))
        self.navigationItem.leftBarButtonItem = leftBackButton
        
        let rightStarButton = UIBarButtonItem(image: UIImage(named: "detail_ic_star_line"), style: .plain, target: self, action: #selector(rightStarButtonTap))
        
        let rightSettingButton = UIBarButtonItem(image: UIImage(named: "ic_menu_kebab"), style: .plain, target: self, action: #selector(rightSettingButtonTap))
        
        self.navigationItem.rightBarButtonItems = [rightSettingButton, rightStarButton]
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    private func setupStyle() {
        bindData()
    }
    
    @objc
    private func leftBackButtonTap() {
        print("네비게이션 POP")
    }
    
    @objc
    private func rightStarButtonTap() {
        
    }
    
    @objc
    private func rightSettingButtonTap() {
        
    }
    
    @objc
    private func saveButtonTap() {
        print("saveButtonTap")
        let vc = DetailPopupViewController()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        vc.delegate = self
        
        self.present(vc, animated: true)
    }
    
    @objc
    private func readButtonTap() {
        
    }
    
    @objc
    private func goToMyLibraryButtonTap() {
        let vc = MyLibraryViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showGoToMyLibraryToastMessage() {
        view.bringSubviewToFront(rootView.detailToastMessageView)
        self.rootView.detailToastMessageView.alpha = 0.0
        self.rootView.detailToastMessageView.isHidden = false
        
        UIView.animate(withDuration: 0.3) {
            self.rootView.detailToastMessageView.alpha = 1.0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            UIView.animate(withDuration: 0.5, animations: {
                self.rootView.detailToastMessageView.alpha = 0.0
            }) { _ in
                self.rootView.detailToastMessageView.isHidden = true
            }
        }
    }
    
    private func bindData() {
        rootView.detailBookDescriptionView.archivedStackView.countLabel.text = "2.6만 개+"
        rootView.detailBookDescriptionView.postStackView.countLabel.text = "4개"
        rootView.detailBookDescriptionView.reviewStackView.countLabel.text = "29개"
    }
}

extension DetailViewController: PopupDelegate {
    func showToastMessage() {
        showGoToMyLibraryToastMessage()
    }
}
