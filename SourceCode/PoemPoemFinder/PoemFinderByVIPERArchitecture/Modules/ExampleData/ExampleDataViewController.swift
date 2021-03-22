//
//  ExampleDataViewController.swift
//  PoemFinderByVIPERArchitecture
//
//  Created by Tuan Truong Quang on 2/24/21.
//  
//

import TTBaseUIKit

class ExampleDataViewController: BaseUITableViewController {
    
    override var navType: TTBaseUIViewController<TTBaseUIView>.NAV_STYLE { get { return .NO_VIEW}}
    
    // MARK: - Properties
    var presenter: ViewToPresenterExampleDataProtocol?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.presenter?.viewDidLoad()
    }

    private func setupUI(){
        self.tableView.register(TTTextIconTableViewCell.self)
        self.tableView.register(TTEmptyTableHeaderViewCell.self)
        self.tableView.dataSource = self
    }
    
}

// TODO: Implement View Output Methods
extension ExampleDataViewController: PresenterToViewExampleDataProtocol{
    func onFetchSuccess() {
        self.tableView.reloadData()
    }
}



extension ExampleDataViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfRowsInSection() ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TTTextIconTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.titleLabel.setMutilLine(numberOfLine: 4, textAlignment: .left)
        cell.titleLabel.setText(text: self.presenter?.textLabelText(indexPath: indexPath) ?? "")
        cell.imageRight.isHidden = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let empty:TTEmptyTableHeaderViewCell = tableView.dequeueReusableHeaderFooterCell()
        return empty
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let empty:TTEmptyTableHeaderViewCell = tableView.dequeueReusableHeaderFooterCell()
        return empty
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.didSelectRowAt(index: indexPath.row)
    }
    
}
