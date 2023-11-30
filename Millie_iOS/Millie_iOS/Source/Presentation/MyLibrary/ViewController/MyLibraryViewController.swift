//
//  MyLibraryViewController.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/23/23.
//

import UIKit

final class MyLibraryViewController: UIViewController {
    
    private let rootView = MyLibraryView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupStyle()
        
        getMyCollection(userId: 1)
    }
    
    private func setupStyle() {
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: rootView.hamburgerButton),
                                              UIBarButtonItem(customView: rootView.addButton)]
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    }
    
    private func getMyCollection(userId: Int) {
        MyLibraryAPI.shared.getMyCollection(userId: userId, completion: { (response) in
            switch response {
            case .success(let data):
                if let data = data as? [MyLibraryModel] {
                    self.rootView.shelfCategoryStackView.myLibraryList = data
                    self.rootView.shelfCategoryStackView.setupHierarchy()
                    var myLibraryCount: Int = 0
                    for myLibrary in data {
                        myLibraryCount += myLibrary.book.count
                    }
                    self.rootView.totalCountButton.setButtonAttributedTitle(text: "전체 \(myLibraryCount)권",
                                                                            font: .millieSubHeader7,
                                                                            color: .darkGrey01)
                }
            case .requestErr(let code):
                print("requestErr", code)
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
