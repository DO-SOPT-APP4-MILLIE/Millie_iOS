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
        rootView.todayTableView.register(TodayHeaderView.self, forHeaderFooterViewReuseIdentifier: TodayHeaderView.identifier)
        rootView.todayTableView.register(TodayTableViewCell.self, forCellReuseIdentifier: TodayTableViewCell.identifier)
        rootView.todayTableView.register(TodayFooterView.self, forHeaderFooterViewReuseIdentifier: TodayFooterView.identifier)
    }
    
    private func delegate() {
        rootView.todayTableView.delegate = self
        rootView.todayTableView.dataSource = self
    }
}

extension TodayViewController: UITableViewDelegate {
}

extension TodayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodayTableViewCell.identifier, for: indexPath) as? TodayTableViewCell else { return TodayTableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 3342.0.adjusted
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TodayHeaderView.identifier) as? TodayHeaderView else { return UIView()}
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let height = UIScreen.main.bounds.width
        return height
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: TodayFooterView.identifier) as? TodayFooterView else { return UIView()}
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 361.0.adjusted
    }
}
