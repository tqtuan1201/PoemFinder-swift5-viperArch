//
//  PredictionViewController.swift
//  PoemFinderByVIPERArchitecture
//
//  Created by Tuan Truong Quang on 2/22/21.
//

import TTBaseUIKit

class PredictionViewController: BaseUIViewController {

    // MARK: - Properties
    var presenter: ViewToPresenterPredictionProtocol?
    
    fileprivate var headerView:HeaderView!
    fileprivate var tableView:TTBaseUITableView!
    
    override init() {
        self.headerView = ComponentFactory.createView(component: .HeaderView) as? HeaderView
        self.tableView =  ComponentFactory.createView(component: .TableView) as? TTBaseUITableView
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewCodable(with: [self.headerView, self.tableView])
        self.presenter?.viewDidLoad()
    }
}

//MARK://PresenterToViewPredictionProtocol
extension PredictionViewController : PresenterToViewPredictionProtocol {
    
    func onRefreshData() {
        self.tableView.reloadData()
        self.dismissKeyboard()
    }
    
    
    func onUpdateExamplePoem(poem: String) {
        self.headerView.noteTextView.setText(text: poem)
    }

    func onShowMessage(mess: String) {
        DispatchQueue.main.async {
            self.showNoticeView(body: mess)
        }
    }

}

//MARK://TTViewCodable
extension PredictionViewController :TTViewCodable {
    
    func bindComponents() {
        self.headerView.findButtonView.onTouchHandler = { _ in
            self.presenter?.onPredict(withText: self.headerView.noteTextView.text)
        }
        
        self.headerView.imageAuthor.setActiveOnTouchHandle().onTouchHandler = { _ in
            self.presenter?.onShowChoosePoemExample()
        }
        
        self.headerView.didSelectedTaggerType = { taggerType in
            self.presenter?.onUpdateTaggerUnit(type: taggerType)
        }
        
    }
    
    func setupData() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(TTTextSubtextIconTableViewCell.self)
        self.tableView.register(ResultTableViewCell.self)
        self.tableView.register(TTEmptyTableHeaderViewCell.self)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.isScrollEnabled = true
        
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.showsHorizontalScrollIndicator = false
        
        self.tableView.setContentInset(inset: UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0))
        
    }
    
    func setupConstraints() {
        self.headerView.setLeadingAnchor(constant: 0).setTrailingAnchor(constant: 0)
            .topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
        self.tableView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: 10).isActive = true
        self.tableView.setLeadingAnchor(constant: 10).setTrailingAnchor(constant: 10).setBottomAnchor(constant: 10, isMarginsGuide: true)
        
    }
}

//MARK:// UITableViewDataSource, UITableViewDelegate
extension PredictionViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfRowsInSection() ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ResultTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        guard let poemAuth = self.presenter?.getAuthorProbabilityModel(indexPath: indexPath) else { return cell }
        cell.configureCell(poemAuth)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let hisView:TTEmptyTableHeaderViewCell = tableView.dequeueReusableHeaderFooterCell()
        return hisView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let emptyView:TTEmptyTableHeaderViewCell = tableView.dequeueReusableHeaderFooterCell()
        return emptyView
    }
    
}


