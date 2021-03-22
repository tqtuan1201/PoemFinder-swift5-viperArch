//
//  BaseUIViewController.swift
//  PoemFinderByVIPERArchitecture
//
//  Created by Tuan Truong Quang on 2/22/21.
//

import TTBaseUIKit

class BaseUIViewController: TTBaseUIViewController<DarkBaseUIView> {
    
    override var navType: TTBaseUIViewController<DarkBaseUIView>.NAV_STYLE { get { return .NO_VIEW } }
    
}


// MARK: For base funcs
extension BaseUIViewController {
    
    func setShowNav() {
        self.statusBar.isHidden = false
        self.navBar.isHidden = false
    }
    
    func setHiddenNav() {
        self.statusBar.isHidden = true
        self.navBar.isHidden = true
    }
    
    
    func setDarkBgColor() {
        self.view.backgroundColor = UIColor.getColorFromHex.init(netHex: 0xF9F9F9)
    }
    
}

// MARK: Skeleton animations
extension BaseUIViewController {
    
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
