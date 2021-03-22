//
//  BaseUISegmentedControlNew.swift
//  PoemFinderByVIPERArchitecture
//
//  Created by Tuan Truong Quang on 2/25/21.
//

import TTBaseUIKit

class BaseUISegmentedControlNew: TTBaseUISegmentedControl {
    
    override var selectedColor: UIColor { return XView.labelBgWar}
    override var textColor: UIColor { return .white}
    override var textSelectedColor: UIColor { return .white}
    override var borderHeight: CGFloat { return 0}
    override var borderColor: UIColor {return .clear}
    override var bgDefStyleColor: UIColor { return UIColor.getColorFromHex(netHex: 0x3E7FB9)}
    override var bgLineStyleColor: UIColor { return UIColor.getColorFromHex(netHex: 0x3E7FB9) }
    // Update UI
    override func updateUI() {
        super.updateUI()
        self.setConerRadius(with: 0)
        self.clipsToBounds = false
        
    }
}
