//
//  BestViewController.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/21/23.
//

import UIKit

final class BestViewController: UIViewController {
    
    private let rootView = BestView()
    
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
        rootView.backButton.addTarget(self,
                             action: #selector(backButtonDidTap),
                             for: .touchUpInside)
        
        rootView.upButton.addTarget(self,
                             action: #selector(upButtonDidTap),
                             for: .touchUpInside)
    }
    
    private func register() {
        rootView.tableView.register(BestTableViewCell.self, forCellReuseIdentifier: BestTableViewCell.identifier)
    }
    
    private func delegate() {
        rootView.tableView.dataSource = self
    }
    
    private func setupStyle() {
        view.backgroundColor = .white
        
        navigationItem.title = "지금! 서점 베스트"
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: rootView.backButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rootView.heartButton)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.millieHeader3]
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    }
    
    @objc func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func upButtonDidTap() {
        rootView.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
}

extension BestViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rootView.booksList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: BestTableViewCell.identifier,
            for: indexPath
        ) as? BestTableViewCell else {return UITableViewCell()}
        
        cell.selectionStyle = .none
        cell.bindData(index: indexPath.row, book: rootView.booksList[indexPath.row])
        return cell
    }
}
