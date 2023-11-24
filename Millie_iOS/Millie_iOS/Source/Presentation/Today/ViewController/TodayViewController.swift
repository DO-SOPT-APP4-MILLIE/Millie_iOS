//
//  ViewController.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/20/23.
//

import UIKit

final class TodayViewController: UIViewController {
    
    private let rootView = TodayView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        register()
        delegate()
    }
    
    private func register() {
        rootView.todayTableView.register(TodayTableViewCell.self, forCellReuseIdentifier: TodayTableViewCell.identifier)
    }
    
    private func delegate() {
        rootView.todayTableView.delegate = self
        rootView.todayTableView.dataSource = self
    }
}

extension TodayViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 4165.0 //수정예정
    }
}

extension TodayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodayTableViewCell.identifier, for: indexPath) as? TodayTableViewCell else { return TodayTableViewCell() }
        return cell
    }
}
