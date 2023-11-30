//
//  DetailViewController.swift
//  Millie_iOS
//
//  Created by 변상우 on 11/20/23.
//

import UIKit

import SnapKit
import Moya

protocol PopupDelegate: AnyObject {
    func showToastMessage()
}

class DetailViewController: UIViewController {
    
    let memberID: Int = 1
    
    private let rootView = DetailView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getBookDetail()
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
        vc.bookId = memberID
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
    
    private func getBookDetail() {
        let provider = MoyaProvider<DetailService>()
        provider.request(.getBookDetail(memberID)) { result in
            switch result {
            case let .success(response):
                let result = try? response.map(Details.self)
                if let data = result?.data {
                    self.bindData(title: data.title, author: data.author, thumbnail: data.thumbnail, archivedCount: data.archivedCount, postCount: data.postCount, reviewCount: data.reviewCount, description: data.Description)
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func bindData(title: String, author: String, thumbnail: String, archivedCount: Int, postCount: Int, reviewCount: Int, description: String) {
        rootView.detailBookDescriptionView.bookTitle.text = title
        rootView.detailBookDescriptionView.bookAuthors.text = author
        rootView.detailBookDescriptionView.bookImageView.kfSetImage(url: thumbnail)
        rootView.detailBookDescriptionView.archivedStackView.countLabel.text = convertToTenThousandFormat(archivedCount)
        rootView.detailBookDescriptionView.postStackView.countLabel.text = "\(postCount)개"
        rootView.detailBookDescriptionView.reviewStackView.countLabel.text = "\(reviewCount)개"
        rootView.detailWandokView.bookDescriptionLabel.text = description
        rootView.detailWandokView.bookDescriptionLabel.numberOfLines = 2
    }
    
    func convertToTenThousandFormat(_ number: Int) -> String {
        if number < 10000 {
            return "\(number)"
        } else {
            let tenThousandCount = Double(number) / 10000.0
            
            return String(format: "%.1f만 개+", tenThousandCount)
        }
    }
}

extension DetailViewController: PopupDelegate {
    func showToastMessage() {
        showGoToMyLibraryToastMessage()
    }
}
