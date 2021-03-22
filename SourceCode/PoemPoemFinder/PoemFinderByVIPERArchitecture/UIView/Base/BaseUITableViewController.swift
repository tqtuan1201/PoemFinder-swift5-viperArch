//
//  BaseUITableViewController.swift
//  PoemFinderByVIPERArchitecture
//
//  Created by Tuan Truong Quang on 2/22/21.
//


import TTBaseUIKit

class BaseUITableViewController: TTBaseUITableViewController {
    
    fileprivate var titleString:String = "POEM FINDER"
    override var navType: TTBaseUIViewController<TTBaseUIView>.NAV_STYLE { get { return .NO_VIEW}}
    
    var P_VIEW:CGFloat { get { return XSize.P_CONS_DEF } }
    var P_DEF:CGFloat { get { return XSize.P_CONS_DEF } }
    

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        DispatchQueue.main.async { [weak self] in guard let strongSelf = self else { return }
            guard let headerView = strongSelf.tableView.tableHeaderView else { return }
            headerView.layoutIfNeeded()
            let header = strongSelf.tableView.tableHeaderView
            strongSelf.tableView.tableHeaderView = header
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
}

extension BaseUITableViewController {
    
    func setDarkBgColor() {
        self.view.backgroundColor = UIColor.getColorFromHex.init(netHex: 0xF9F9F9)
    }
    
    func setTitleNav(_ text:String) {
        self.titleString = text
        self.navBar.setTitle(title: text)
    }
    
    func setShowNav() {
        self.statusBar.isHidden = false
        self.navBar.isHidden = false
    }
    
    func setHiddenNav() {
        self.statusBar.isHidden = true
        self.navBar.isHidden = true
    }
    
    func setScrollToTop() {
        let firstIndex = IndexPath(row: 0, section: 0)
        if let _ = self.tableView.cellForRow(at: firstIndex) {
            self.tableView.scrollToRow(at: firstIndex, at: .top, animated: true)
        }
    }
}


// MARK: Skeleton animations
extension BaseUITableViewController {
    
    func onShowSkeletonAnimation() {
        DispatchQueue.main.async { [weak self] in
            self?.setSkeletonAnimation().onStartSkeletonAnimation()
            self?.navBar.subviews.forEach({$0.onStopSkeletonCustomViewAnimation()})
        }
    }
    
    func onRemoveSkeletonAnimation() {
        DispatchQueue.main.async { [weak self] in
            self?.onStopSkeletonAnimation()
        }
    }
}
