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
        
        target()
        register()
        delegate()

        setupStyle()
    }
    
    private func target() {
        
    }
    
    private func register() {
        
    }
    
    private func delegate() {
        
    }
    
    private func setupStyle() {
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: rootView.hamburgerButton),
                                              UIBarButtonItem(customView: rootView.addButton)]
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    }
}
