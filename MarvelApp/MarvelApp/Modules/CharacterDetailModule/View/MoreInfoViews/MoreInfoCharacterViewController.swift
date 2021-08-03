//
//  MoreInfoCharacterViewController.swift
//  MarvelApp
//
//  Created by David López Quindos on 3/8/21.
//

import UIKit
import PanModal

class ResizableUITableView : UITableView {
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}

class MoreInfoCharacterViewController: UITableViewController {
    
    var resource: [Resource] = [] {
        didSet { self.tableView.reloadData() }
    }
    let headerView = HeaderTableView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Setup Table
    
    func setupTableView() {
        self.tableView = ResizableUITableView()
        let nib = UINib(nibName: "MoreInfoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: UINames.MoreInfoCharacterCell)
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UINames.MoreInfoCharacterCell, for: indexPath) as! MoreInfoTableViewCell
        cell.setCell(resource: self.resource[indexPath.row])
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headerView.configure(resources: self.resource)
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - PanModalPresentable

extension MoreInfoCharacterViewController: PanModalPresentable {
    
    var panScrollable: UIScrollView? { return tableView }
    var cornerRadius: CGFloat { return 9.0 }
    var showDragIndicator: Bool { return true }
    var shortFormHeight: PanModalHeight { return .contentHeight(300.0) }
    var longFormHeight: PanModalHeight { .contentHeight(getTotalHeight()) }
    
    private func getTotalHeight() -> CGFloat {
        return tableView.intrinsicContentSize.height + 54.0
    }
}
