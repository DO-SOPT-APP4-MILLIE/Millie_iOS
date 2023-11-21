//
//  DetailViewController.swift
//  Millie_iOS
//
//  Created by 변상우 on 11/20/23.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigtion()
    }
    
    private func setupNavigtion() {
        let leftBackButton = UIBarButtonItem(image: UIImage(named: "ic_arrow_left_line"), style: .plain, target: self, action: #selector(leftBackButtonTap))
        self.navigationItem.leftBarButtonItem = leftBackButton
        
        let rightStarButton = UIBarButtonItem(image: UIImage(named: "ic_star_slim_line"), style: .plain, target: self, action: #selector(rightStarButtonTap))
        
        let rightSettingButton = UIBarButtonItem(image: UIImage(named: "ic_menu_kebab"), style: .plain, target: self, action: #selector(rightSettingButtonTap))
        
        self.navigationItem.rightBarButtonItems = [rightSettingButton, rightStarButton]
        self.navigationController?.navigationBar.tintColor = .black
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
}
